<?php

class dhrGenerateReleaseTask extends sfBaseTask
{  
	protected function configure()
	{
		$this->namespace = 'dhr';
		$this->name = 'release';
		$this->briefDescription = 'Generates a new release';
		$this->detailedDescription = '';
    	
    	$this->addArguments(array(
	    	new sfCommandArgument('directory', sfCommandArgument::REQUIRED, 'Path to directory holding WAV files'),
	    	new sfCommandArgument('sku', sfCommandArgument::REQUIRED, 'Release SKU'),
    	));
	}

	protected function execute($arguments = array(), $options = array())
	{
		// Init database
		$databaseManager = new sfDatabaseManager($this->configuration);

		$release = Doctrine_Core::getTable('Release')->findOneBySku($arguments['sku']);

		// Vars
		$releaseDir = sprintf('%s/releases/%s', sfConfig::get('sf_web_dir'), $release->slug);

		// Sanity checks
		if (!is_readable($arguments['directory'])) {
			throw new InvalidArgumentException(sprintf('Directory %s is not readable', $arguments['directory']));
		}

		if (!$release) {
			throw new InvalidArgumentException(sprintf('Release %s does not exist', $arguments['sku']));
		}

		$this->logSection('release', sprintf('Generating release %s from %s', $arguments['sku'], $arguments['directory']));

		// Grab tracks
		$tracksWav = glob(sprintf('%s/*.wav', $arguments['directory']));
		if (!count($tracksWav)) {
			throw new RuntimeException('No WAV file found in directory');
		}
		mkdir($releaseDir);
		$this->logSection('release', sprintf('Found %d WAV files :', count($tracksWav)));

		// Grab pics
		$pics = glob(sprintf('%s/*.png', $arguments['directory']));

		// Build tracks structure
		$tracks = array();
		Doctrine_Core::getTable('Track')->createQuery()->delete()->where('release_id = ?', $release['id'])->execute();
		foreach ($tracksWav as $trackFilepath) {
			$matches = array();
			preg_match('/^(\d+) - (.*).wav$/', basename($trackFilepath), $matches);
			$track = array(
				'number' => $matches[1],
				'title'  => $matches[2],
				'path'   => $trackFilepath
			);
			$tracks[] = $track;

			// Create track in database
			$trackDb = new Track();
			$trackDb->number = $track['number'];
			$trackDb->title = $track['title'];
			$trackDb->release_id = $release['id'];
			$trackDb->save();

			// Generate streamable track
			$command = sprintf('/usr/bin/ffmpeg -y -i \'%s\' -ab 128k \'%s/releases/%s/%s_%s.mp3\'', $track['path'], sfConfig::get('sf_web_dir'), $release->slug, $track['number'], $trackDb->slug);
			exec($command);

			$this->logSection('release', sprintf('  %s - %s', $track['number'], $track['title']));
		}

		// Generate archives
		$profiles = array(
			array(
				'name' => 'mp3_320',
				'commandConvert' => '/usr/bin/ffmpeg -i \'%s\' -ab 320k -metadata title="%s" -metadata artist="%s" -metadata album="%s" -metadata tracknumber="%s" \'%s.mp3\'',
				'extension' => 'mp3'
			),
			array(
				'name' => 'ogg',
				'commandConvert' => 'ffmpeg -i \'%s\' -metadata title="%s" -metadata artist="%s" -metadata album="%s" -metadata tracknumber="%s" \'%s.ogg\'',
				'extension' => 'ogg'
			),
			array(
				'name' => 'flac',
				'commandConvert' => 'ffmpeg -i \'%s\' -metadata title="%s" -metadata artist="%s" -metadata album="%s" -metadata tracknumber="%s" \'%s.flac\'',
				'extension' => 'flac'
			)
		);
		$workspacePath = sprintf('/tmp/%s', uniqid('dhr_'));
		mkdir($workspacePath);
		$this->logSection('release', sprintf('Creating workspace %s', $workspacePath));
		foreach ($profiles as $profile) {
			$workspacePathProfile = sprintf('%s/%s', $workspacePath, $profile['name']);
			mkdir($workspacePathProfile);
			$this->logSection('release', sprintf('Generating release for profile %s', $profile['name']));

			// Transform and tag tracks
			foreach ($tracks as $track) {
				// Transform
				$command = sprintf($profile['commandConvert'], $track['path'], $track['title'], $release->getArtist()->getName(), $release->title, $track['number'], sprintf('%s/%s', $workspacePathProfile, basename($track['path'], '.wav')));
				exec($command);
			}
	
			foreach ($pics as $pic) {
				copy($pic, $workspacePathProfile.'/'.basename($pic));
			}

			// Create archive
			$zipPath = sprintf('%s/%s_%s.zip', $releaseDir, $release->slug, $profile['name']);
			$commandZip = sprintf('zip -rj %s %s', $zipPath, $workspacePathProfile);
			exec($commandZip);
			$this->logSection('release', sprintf('Generated release for profile %s in %s', $profile['name'], $zipPath));
		}
	}

	protected function tagMp3_320(array $profile, Release $release, array $tracks, $trackGenerated, array $track) {
		$commandTag = sprintf($profile['commandTag'], $release->getArtist()->getName(), $release->title, $track['title'], 'http://www.daheardit-records.net', $track['number'], count($tracks), $trackGenerated);
		exec($commandTag);
	}
}