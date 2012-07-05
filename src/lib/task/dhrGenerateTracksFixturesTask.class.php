<?php

class dhrGenerateTracksFixturesTask extends sfBaseTask
{
    protected function configure()
    {
        // Task configuration
        $this->namespace = 'dhr';
        $this->name = 'generate-tracks-fixtures';
        $this->briefDescription = 'Generates tracks fixtures from legacy website';
        $this->detailedDescription = '';

    }

    protected function execute($arguments = array(), $options = array())
    {
        require_once sfConfig::get('sf_lib_dir').'/vendor/goutte.phar';
        $client = new \Goutte\Client();

        $numbers = range(1, 17);
        $urlTemplate = 'http://www.daheardit-records.net/fr/discographie/dhr%s/';
        $yml = array('Track:');
        foreach ($numbers as $number) {
            if ($number < 10) {
                $number = '0'.$number;
            }
            $url = sprintf($urlTemplate, $number);
            $crawler = $client->request('GET', $url);
            $nodes = $crawler->filter('#tracklist li');
            $i = 1;
            foreach ($nodes as $node) {
                $title = trim(str_replace('VIDÉO', '', $node->textContent));
                $yml[] = sprintf('  dhr%s_track%s:', $number, $i);
                $yml[] = sprintf('    title: "%s"', $title);
                $yml[] = sprintf('    number: %s', $i);
                $yml[] = sprintf('    Release: dhr%s', $number);
                $i++;
            }
        }
        echo implode("\n", $yml);
    }
}