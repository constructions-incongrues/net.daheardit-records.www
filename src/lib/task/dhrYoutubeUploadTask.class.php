<?php

class dhrYoutubeUploadTask extends sfBaseTask
{
    protected function configure()
    {
        // TODO : TAGS as options

        // Task configuration
        $this->namespace = 'dhr';
        $this->name = 'release-youtube';
        $this->briefDescription = 'Creates a Youtube playlist for a release';
        $this->detailedDescription = '';

        $this->addArguments(array(
            new sfCommandArgument('directory', sfCommandArgument::REQUIRED, 'Path to directory holding source files'),
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
        $workspacePath = sprintf('%s/%s', $options['workspace'], uniqid('dhr_'));
        mkdir($workspacePath);
        $this->logSection('release-youtube', sprintf('Creating workspace %s', $workspacePath));

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

        $this->logSection('release-youtube', sprintf('Uploading release %s from %s', $arguments['slug'], $arguments['directory']));

        // Grab tracks
        $tracksSource = glob(sprintf('%s/*.%s', $arguments['directory'], $options['sourceExtension']));
        if (!count($tracksSource)) {
            throw new RuntimeException(sprintf('No .%s files found in directory', $options['sourceExtension']));
        }

        $this->logSection('release-youtube', sprintf('Found %d .%s files', count($tracksSource), $options['sourceExtension']));

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
                "ffmpeg -loop 1 -i '%s/assets/releases/%s/images/%s_1.png' -i '%s' -c:v libx264 -tune stillimage -c:a aac -b:a 320k -pix_fmt yuv444p -shortest '%s/%s.mp4'",
                sfConfig::get('sf_web_dir'),
                $release->slug,
                $release->slug,
                $trackFilePath,
                $workspacePath,
                basename($trackFilePath, '.'.$options['sourceExtension'])
            );
            var_dump($command);
            exec($command);

            // Generate description
            $tpl = <<<EOT
► Free Download, Streaming & CD/TAPE/K7 : https://www.daheardit-records.net/en/discography/%s#release
%s

► Label : http://www.daheardit-records.net
► Free Music Archive : http://freemusicarchive.org/label/Da__Heard_It_Records/
► Facebook : https://www.facebook.com/dahearditrecords/
► Twitter : https://twitter.com/daheardit
EOT;
            file_put_contents(sprintf('%s/description.txt', $workspacePath), sprintf($tpl, $release->slug, $release->getPresentation()));

            // Upload videos
            $command = sprintf(
                "youtube-upload ".
                " --client-secrets=/vagrant/etc/pastishosting/client_secret.json".
                " --credentials-file=/vagrant/etc/pastishosting/youtube_credentials.json".
                " --title='%s - %s - %s [%s]'".
                " --category=Music".
                " --description-file=%s/description.txt".
                " --privacy=private".
                " --thumbnail=%s/assets/releases/%s/images/%s_1.png".
                " --playlist='%s - %s [%s] (Full Album)'".
                " '%s/%s.mp4'",
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
                $workspacePath,
                basename($trackFilePath, '.'.$options['sourceExtension'])
            );
            var_dump($command);
            exec($command);
        }
    }
}
