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

		// Vars
		$releaseDir = sprintf('%s/releases/%s', sfConfig::get('sf_web_dir'), $release->slug);

		// Sanity checks
		if (!is_readable($arguments['directory'])) {
			throw new InvalidArgumentException(sprintf('Directory %s is not readable', $arguments['directory']));
		}

		$release = Doctrine_Core::getTable('Release')->findOneBySku($arguments['sku']);
		if (!$release) {
			throw new InvalidArgumentException(sprintf('Release %s does not exist', $arguments['sku']));
		}

		$this->logSection('release', sprintf('Generating release %s from %s', $arguments['sku'], $arguments['directory']));

		// Grab tracks
		$tracksWav = glob(sprintf('%s/*.wav', $arguments['directory']));
		if (!count($tracksWav)) {
			throw new RuntimeException('No WAV file found in directory');
		}
		$this->logSection('release', sprintf('Found %d WAV files :', count($tracksWav)));

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
			$command = sprintf('/usr/bin/ffmpeg -ab 320000 -i \'%s\' \'%s/releases/%s/%s_%s.mp3\'', $track['path'], sfConfig::get('sf_web_dir'), $release->slug, $track['number'], $trackDb->slug);
			exec($command);

			$this->logSection('release', sprintf('  %s - %s', $track['number'], $track['title']));
		}

		// Generate archives
		mkdir($releaseDir);
		$profiles = array(
			array(
				'name' => 'mp3_320',
				'commandConvert' => '/usr/bin/ffmpeg -ab 320000 -i \'%s\' \'%s.mp3\'',
				'commandTag' => "/usr/bin/id3v2 --artist \"%s\" --album \"%s\" --song \"%s\" --comment \"%s\" --track '%d/%d' \"%s\"",
				'extension' => 'mp3'
			),
			array(
				'name' => 'ogg',
				'commandConvert' => 'ffmpeg -i \'%s\' \'%s.ogg\'',
				'commandTag' => '',
				'extension' => 'ogg'
			),
			array(
				'name' => 'flac',
				'commandConvert' => 'ffmpeg -i \'%s\' \'%s.flac\'',
				'commandTag' => '',
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

			// Transform tracks
			foreach ($tracks as $track) {
				$command = sprintf($profile['commandConvert'], $track['path'], sprintf('%s/%s', $workspacePathProfile, basename($track['path'], '.wav')));
				exec($command);
			}

			// Create archive
			$zipPath = sprintf('%s/%s_%s.zip', $releaseDir, $release->slug, $profile['name']);
			$commandZip = sprintf('zip -rj %s %s', $zipPath, $workspacePathProfile);
			exec($commandZip);
			$this->logSection('release', sprintf('Generated release for profile %s in %s', $profile['name'], $zipPath));
		}
	}
}