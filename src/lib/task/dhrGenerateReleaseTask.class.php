<?php

class dhrGenerateReleaseTask extends sfBaseTask
{
	private $conversionProfiles = array();

	protected function configure()
	{
		// Conversion profiles
		$this->conversionProfiles = array(
			'mp3_320' => array(
				'name' => 'mp3_320',
				'commandConvert' => '/usr/bin/ffmpeg -i \'%s\' -ab 320k -metadata title="%s" -metadata artist="%s" -metadata album="%s" -metadata tracknumber="%s" \'%s.mp3\'',
				'extension' => 'mp3'
			),
			'ogg' => array(
				'name' => 'ogg',
				'commandConvert' => 'ffmpeg -i \'%s\' -metadata title="%s" -metadata artist="%s" -metadata album="%s" -metadata tracknumber="%s" \'%s.ogg\'',
				'extension' => 'ogg'
			),
			'flac' => array(
				'name' => 'flac',
				'commandConvert' => 'ffmpeg -i \'%s\' -metadata title="%s" -metadata artist="%s" -metadata album="%s" -metadata tracknumber="%s" \'%s.flac\'',
				'extension' => 'flac'
			)
		);

		// Task configuration
		$this->namespace = 'dhr';
		$this->name = 'release';
		$this->briefDescription = 'Generates a new release';
		$this->detailedDescription = '';
    	
    	$this->addArguments(array(
	    	new sfCommandArgument('directory', sfCommandArgument::REQUIRED, 'Path to directory holding source files'),
	    	new sfCommandArgument('sku', sfCommandArgument::REQUIRED, 'Release SKU'),
    	));

    	$this->addOptions(array(
    		new sfCommandOption('sourceExtension', null, sfCommandOption::PARAMETER_OPTIONAL, 'Extension of source files', 'flac'),
    		new sfCommandOption('profiles', null, sfCommandOption::PARAMETER_OPTIONAL, 'Conversion profiles', implode(',', $this->getDefaultConversionProfiles())),
    		new sfCommandOption('convert', null, sfCommandOption::PARAMETER_NONE, 'Convert source tracks ?'),
    	));
	}

	protected function execute($arguments = array(), $options = array())
	{
		// Init database
		$databaseManager = new sfDatabaseManager($this->configuration);

		// Fetch release
		$release = Doctrine_Core::getTable('Release')->findOneBySlug($arguments['sku']);

		// Vars
		$releaseDir = sprintf('%s/assets/%s', sfConfig::get('sf_web_dir'), $release->slug);

		// Sanity checks
		if (!is_readable($arguments['directory'])) {
			throw new InvalidArgumentException(sprintf('Directory %s is not readable', $arguments['directory']));
		}

		if (!$release) {
			throw new InvalidArgumentException(sprintf('Release %s does not exist', $arguments['sku']));
		}

		$this->logSection('release', sprintf('Generating release %s from %s', $arguments['sku'], $arguments['directory']));

		// Grab tracks
		$tracksSource = glob(sprintf('%s/*.%s', $arguments['directory'], $options['sourceExtension']));
		if (!count($tracksSource)) {
			throw new RuntimeException(sprintf('No .%s files found in directory', $options['sourceExtension']));
		}
		mkdir($releaseDir);
		$this->logSection('release', sprintf('Found %d .%s files :', count($tracksSource), $options['sourceExtension']));

		// Grab other files
		$pics = glob(sprintf('%s/*.png', $arguments['directory']));
		$pdfs = glob(sprintf('%s/*.pdf', $arguments['directory']));

		// Build tracks structure
		$tracks = array();
		Doctrine_Core::getTable('Track')->createQuery()->delete()->where('release_id = ?', $release['id'])->execute();
		foreach ($tracksSource as $trackFilepath) {
			$matches = array();
			preg_match(sprintf('/^(\d+) - (.*).%s$/', $options['sourceExtension']), basename($trackFilepath), $matches);
			if (count($matches) < 2) {
				$track = array(
					'number' => '0',
					'title'  => 'Unknown Title',
					'path'   => $trackFilepath
				);
			} else {
				$track = array(
					'number' => $matches[1],
					'title'  => $matches[2],
					'path'   => $trackFilepath
				);
			}
			$tracks[] = $track;

			// Create track in database
			$trackDb = new Track();
			$trackDb->number = $track['number'];
			$trackDb->title = $track['title'];
			$trackDb->release_id = $release['id'];
			$trackDb->save();

			// Generate streamable track
			if ($options['convert']) {
				$command = sprintf('/usr/bin/ffmpeg -y -i \'%s\' -ab 128k \'%s/assets/%s/tracks/%s_%s.mp3\'', $track['path'], sfConfig::get('sf_web_dir'), $release->slug, $track['number'], $trackDb->slug);
				exec($command);
			}

			$this->logSection('release', sprintf('  %s - %s', $track['number'], $track['title']));
		}

		// Generate archives
		if ($options['convert']) {
			$workspacePath = sprintf('%s/%s', sys_get_temp_dir(), uniqid('dhr_'));
			mkdir($workspacePath);
			$this->logSection('release', sprintf('Creating workspace %s', $workspacePath));
			$profiles = explode(',', $options['profiles']);
			foreach ($profiles as $profileName) {
				if (!isset($this->conversionProfiles[$profileName])) {
					throw new InvalidArgumentException(sprintf('Conversion profile "%s" does not exist', $profileName));
				}

				$profile = $this->conversionProfiles[$profileName];
				$workspacePathProfile = sprintf('%s/%s', $workspacePath, $profile['name']);
				mkdir($workspacePathProfile);
				$this->logSection('release', sprintf('Generating release for profile %s', $profile['name']));

				// Transform and tag tracks
				foreach ($tracks as $track) {
					// Transform
					$command = sprintf($profile['commandConvert'], $track['path'], $track['title'], $release->getArtist()->getName(), $release->title, $track['number'], sprintf('%s/%s', $workspacePathProfile, basename($track['path'], '.'.$options['sourceExtension'])));
					exec($command);
				}
		
				foreach ($pics as $pic) {
					copy($pic, $workspacePathProfile.'/'.basename($pic));
				}
				foreach ($pdfs as $pdf) {
					copy($pdf, $workspacePathProfile.'/'.basename($pdf));
				}

				// Create archive
				$zipPath = sprintf('%s/archives/%s_%s.zip', $releaseDir, $release->slug, $profile['name']);
				$commandZip = sprintf('zip -rj %s %s', $zipPath, $workspacePathProfile);
				exec($commandZip);
				$this->logSection('release', sprintf('Generated release for profile %s in %s', $profile['name'], $zipPath));
			}
		}
	}

	private function getDefaultConversionProfiles()
	{
		return array_keys($this->conversionProfiles);
	}
}