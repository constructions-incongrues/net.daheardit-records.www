<?php

class dhrGenerateReleaseTask extends sfBaseTask
{
    private $conversionProfiles = array();
    private $includeExtensions = array();

    protected function configure()
    {
        // Conversion profiles
        $this->conversionProfiles = array(
            'mp3_320' => array(
                'name' => 'mp3_320',
                'commandConvert' => '%s -loglevel warning -analyzeduration 100000000 -i %s -q:a 0 -metadata title=%s -metadata artist=%s -metadata album=%s -metadata track=%s -metadata year=%s %s',
                'extension' => 'mp3'
            ),
            'flac' => array(
                'name' => 'flac',
                'commandConvert' => '%s -loglevel warning -analyzeduration 100000000 -i %s -metadata title=%s -metadata artist=%s -metadata album=%s -metadata track=%s -metadata year=%s %s',
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
            new sfCommandArgument('slug', sfCommandArgument::REQUIRED, 'Release slug'),
        ));

        $this->addOptions(array(
            new sfCommandOption('sourceExtension', null, sfCommandOption::PARAMETER_OPTIONAL, 'Extension of source files', 'flac'),
            new sfCommandOption('profiles', null, sfCommandOption::PARAMETER_OPTIONAL, 'Conversion profiles', implode(',', $this->getDefaultConversionProfiles())),
            new sfCommandOption('archives', null, sfCommandOption::PARAMETER_NONE, 'Generates archives ?'),
            new sfCommandOption('db', null, sfCommandOption::PARAMETER_NONE, 'Create database records ? (CAREFUL : deletes existing data)'),
            new sfCommandOption('streamables', null, sfCommandOption::PARAMETER_NONE, 'Generate streamable MP3s ?'),
            new sfCommandOption('includeExtensions', null, sfCommandOption::PARAMETER_OPTIONAL, 'Non-audio extensions in source directory to be included in archives', 'jpg,png,txt'),
            new sfCommandOption('workspace', null, sfCommandOption::PARAMETER_OPTIONAL, 'Path to workspace directory', sys_get_temp_dir()),
            new sfCommandOption('encoder', null, sfCommandOption::PARAMETER_OPTIONAL, 'Encoder executable', 'avconv'),
        ));
    }

    protected function execute($arguments = array(), $options = array())
    {
        // Init database
        $databaseManager = new sfDatabaseManager($this->configuration);

        // Fetch release
        $release = Doctrine_Core::getTable('Release')->findOneBySlug($arguments['slug']);

        // Vars
        $releaseDir = sprintf('%s/assets/releases/%s', sfConfig::get('sf_web_dir'), $release->slug);

        // Sanity checks
        if (!is_readable($arguments['directory'])) {
            throw new InvalidArgumentException(sprintf('Directory %s is not readable', $arguments['directory']));
        }

        if (!$release) {
            throw new InvalidArgumentException(sprintf('Release %s does not exist', $arguments['slug']));
        }

        $this->logSection('release', sprintf('Generating release %s from %s', $arguments['slug'], $arguments['directory']));

        // Grab tracks
        $tracksSource = glob(sprintf('%s/*.%s', $arguments['directory'], $options['sourceExtension']));
        if (!count($tracksSource)) {
            throw new RuntimeException(sprintf('No .%s files found in directory', $options['sourceExtension']));
        }

        if (!is_dir($releaseDir)) {
            mkdir($releaseDir);
        }

        $this->logSection('release', sprintf('Found %d .%s files :', count($tracksSource), $options['sourceExtension']));

        // Grab other files
        $includedFiles = array();
        if ($options['includeExtensions']) {
            foreach (explode(',', $options['includeExtensions']) as $extension) {
                $this->logSection('release', sprintf('Including *.%s', $extension));
                $includedFiles[] = glob(sprintf('%s/*.%s', $arguments['directory'], $extension));
            }
        }

        if ($options['streamables']) {
            $dirStreamables = sprintf('%s/assets/releases/%s/tracks', sfConfig::get('sf_web_dir'), $release->slug);
            if (!is_dir($dirStreamables)) {
                mkdir($dirStreamables);
            }
        }

        // Build tracks structure
        $tracks = array();
        if ($options['db']) {
            Doctrine_Core::getTable('Track')->createQuery()->delete()->where('release_id = ?', $release['id'])->execute();
        }
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
            if ($options['db']) {
                $trackDb = new Track();
                $trackDb->number = $track['number'];
                $trackDb->title = $track['title'];
                $trackDb->release_id = $release['id'];
                $trackDb->save();
            }

            // Generate streamable track
            if ($options['streamables']) {
                // TODO : track naming is not consistent
                $command = sprintf(
                    '%s -loglevel warning -analyzeduration 100000000 -y -i %s -ab 128k \'%s/assets/releases/%s/tracks/%s_%s.mp3\'',
                    $options['encoder'],
                    escapeshellarg($track['path']),
                    sfConfig::get('sf_web_dir'),
                    $release->slug,
                    str_replace('-', '', $release->slug),
                    $track['number']
                );
                exec($command);
            }
            $this->logSection('release', sprintf('  %s - %s', $track['number'], $track['title']));
        }

        // Generate archives
        if ($options['archives']) {
            $workspacePath = sprintf('%s/%s', $options['workspace'], uniqid('dhr_'));
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
                    $command = sprintf(
                        $profile['commandConvert'],
                        $options['encoder'],
                        escapeshellarg($track['path']),
                        escapeshellarg($track['title']),
                        escapeshellarg($release->getArtist()->getName()),
                        escapeshellarg($release->title),
                        escapeshellarg($track['number']),
                        escapeshellarg(substr($release->getReleasedAt(), 0, 4)),
                        escapeshellarg(sprintf('%s/%s.%s', $workspacePathProfile, basename($track['path'], '.'.$options['sourceExtension']), $profile['extension']))
                    );
                    $this->logSection($profile['name'], sprintf('%s - %s', $track['number'], $track['title']));
                    exec($command);
                }

                foreach ($includedFiles as $files) {
                    foreach ($files as $file) {
                        $this->logSection($profile['name'], sprintf('Adding non-audio file : %s', $file));
                        copy($file, $workspacePathProfile.'/'.basename($file));
                    }
                }

                // Create archive
                if (!is_dir($releaseDir.'/archives')) {
                    mkdir($releaseDir.'/archives');
                }
                $zipPath = sprintf('%s/archives/%s_%s.zip', $releaseDir, $release->slug, $profile['name']);
                if (file_exists($zipPath)) {
                    unlink($zipPath);
                }
                $commandZip = sprintf('zip -rj -UN=n %s %s', $zipPath, $workspacePathProfile);
                $res = exec($commandZip);
                $this->logSection('release', sprintf('Generated release for profile %s in %s', $profile['name'], $zipPath));
            }
        }
    }

    private function getDefaultConversionProfiles()
    {
        return array_keys($this->conversionProfiles);
    }

    private function translit($text) {
        return iconv('utf-8', 'us-ascii//TRANSLIT', $text);
    }
}
