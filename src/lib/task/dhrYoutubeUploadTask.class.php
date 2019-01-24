<?php

class dhrYoutubeUploadTask extends sfBaseTask
{
    protected function configure()
    {
        // Task configuration
        $this->namespace = 'dhr';
        $this->name = 'youtube-upload';
        $this->briefDescription = 'Uploads videos to Youtube and puts them in a playlist';
        $this->detailedDescription = '';

        $this->addArguments(array(
            new sfCommandArgument('directory', sfCommandArgument::REQUIRED, 'Path to directory holding video files'),
            new sfCommandArgument('slug', sfCommandArgument::REQUIRED, 'Release slug'),
            new sfCommandArgument('clientSecret', sfCommandArgument::REQUIRED, 'Path to client secret JSON file'),
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

        $workspacePath = sprintf('%s/%s', $options['workspace'], uniqid('dhr_'));
        mkdir($workspacePath);
        $this->logSection('youtube-upload', sprintf('Creating workspace %s', $workspacePath));

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

        $this->logSection('youtube-upload', sprintf('Uploading release %s from %s', $arguments['slug'], $arguments['directory']));

        // Grab image files
        $imageSource = sprintf('%s/youtube.png', $arguments['directory']);
        if (!file_exists($imageSource)) {
            throw new RuntimeException('No youtube.png file found in directory');
        }

        $this->logSection('youtube-upload', 'Found youtube.png file');

        // Grab audio files
        $tracksSource = glob(sprintf('%s/*.%s', $arguments['directory'], 'mp4'));
        if (!count($tracksSource)) {
            throw new RuntimeException(sprintf('No .%s files found in directory', 'mp4'));
        }

        $this->logSection('youtube-upload', sprintf('Found %d .%s files', count($tracksSource), 'mp4'));

        $tracks = [];
        foreach ($tracksSource as $trackFilePath) {
            $matches = array();
            preg_match(sprintf('/^(\d+) - (.*).%s$/', 'mp4'), basename($trackFilePath), $matches);
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

            // Generate description
            $tpl = <<<EOT
► Free Download, Streaming & CD/TAPE/K7 : https://www.daheardit-records.net/en/discography/%s#release
%s

► Label : http://www.daheardit-records.net
► Free Music Archive : http://freemusicarchive.org/label/Da__Heard_It_Records/
► Facebook : https://www.facebook.com/dahearditrecords/
► Instagram : https://www.instagram.com/dahearditrecords/
► Twitter : https://twitter.com/daheardit
EOT;
            file_put_contents(sprintf('%s/description.txt', $workspacePath), sprintf($tpl, $release->slug, strip_tags($release->getPresentation())));

            // Upload videos
            $command = sprintf(
                'youtube-upload '.
                ' --client-secrets=%s'.
                ' --title="%s - %s - %s [%s]"'.
                ' --category=Music'.
                ' --description-file=%s/description.txt'.
                ' --privacy=private'.
                ' --thumbnail=%s/assets/releases/%s/images/%s_1.png'.
                ' --playlist="%s - %s [%s] (Full Album)"'.
                ' "%s/%s.mp4"',
                $arguments['clientSecret'],
                $track['number'],
                $release->getArtist()->getName(),
                $track['title'],
                $release->sku,
                $workspacePath,
                sfConfig::get('sf_web_dir'),
                $release->slug,
                $release->slug,
                $release->getArtist()->getName(),
                $release->title,
                $release->sku,
                $arguments['directory'],
                basename($trackFilePath, '.'.'mp4')
            );
            var_dump($command);
            exec($command);
        }
    }
}
