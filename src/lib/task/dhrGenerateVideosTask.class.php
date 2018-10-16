<?php

class dhrGenerateVideosTask extends sfBaseTask
{
    protected function configure()
    {
        // Task configuration
        $this->namespace = 'dhr';
        $this->name = 'generate-videos';
        $this->briefDescription = 'Generates Youtube-ready videos from release track';
        $this->detailedDescription = '';

        $this->addArguments(array(
            new sfCommandArgument('source-directory', sfCommandArgument::REQUIRED, 'Path to directory holding source files'),
            new sfCommandArgument('destination-directory', sfCommandArgument::REQUIRED, 'Path to destination directory for videos'),
            new sfCommandArgument('slug', sfCommandArgument::REQUIRED, 'Release slug'),
        ));

        $this->addOptions(array(
            new sfCommandOption('sourceExtension', null, sfCommandOption::PARAMETER_OPTIONAL, 'Extension of source files', 'flac'),
            new sfCommandOption('workspace', null, sfCommandOption::PARAMETER_OPTIONAL, 'Path to workspace directory', sys_get_temp_dir()),
        ));
    }

    protected function execute($arguments = array(), $options = array())
    {
        // Init database
        $databaseManager = new sfDatabaseManager($this->configuration);

        // Create workspace
        mkdir($arguments['destination-directory']);
        $this->logSection('generate-videos', sprintf('Creating workspace %s', $arguments['destination-directory']));

        // Fetch release
        $release = Doctrine_Core::getTable('Release')->findOneBySlug($arguments['slug']);

        // Vars
        $releaseDir = sprintf('%s/assets/releases/%s', sfConfig::get('sf_web_dir'), $release->slug);

        // Sanity checks
        if (!is_readable($arguments['source-directory'])) {
            throw new InvalidArgumentException(sprintf('Directory %s is not readable', $arguments['source-directory']));
        }

        if (!$release) {
            throw new InvalidArgumentException(sprintf('Release %s does not exist', $arguments['slug']));
        }

        $this->logSection('generate-videos', sprintf('Generating videos for %s from %s', $arguments['slug'], $arguments['source-directory']));

        // Grab image files
        $imageSource = sprintf('%s/youtube.png', $arguments['source-directory']);
        if (!file_exists($imageSource)) {
            throw new RuntimeException('No youtube.png file found in directory');
        }

        $this->logSection('generate-videos', 'Found youtube.png file');

        // Grab audio files
        $tracksSource = glob(sprintf('%s/*.%s', $arguments['source-directory'], $options['sourceExtension']));
        if (!count($tracksSource)) {
            throw new RuntimeException(sprintf('No .%s files found in directory', $options['sourceExtension']));
        }

        $this->logSection('generate-videos', sprintf('Found %d .%s files', count($tracksSource), $options['sourceExtension']));

        $tracks = [];
        foreach ($tracksSource as $trackFilePath) {
            $matches = array();
            preg_match(sprintf('/^(\d+) - (.*).%s$/', $options['sourceExtension']), basename($trackFilePath), $matches);
            if (count($matches) < 2) {
                $track = array(
                    'number' => '0',
                    'title'  => 'Unknown Title',
                    'path'   => $trackFilePath
                );
            } else {
                $track = array(
                    'number' => $matches[1],
                    'title'  => $matches[2],
                    'path'   => $trackFilePath
                );
            }
            $tracks[] = $track;

            // Generate videos
            $command = sprintf(
                'ffmpeg -loop 1 -i "%s/youtube.png" -i "%s" -c:v libx264 -tune stillimage -c:a aac -b:a 320k -pix_fmt yuv444p -shortest "%s/%s.mp4"',
                $arguments['source-directory'],
                $trackFilePath,
                $arguments['destination-directory'],
                basename($trackFilePath, '.'.$options['sourceExtension'])
            );
            var_dump($command);
            exec($command);
        }
    }
}