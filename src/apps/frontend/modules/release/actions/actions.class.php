<?php

/**
 * release actions.
 *
 * @package    net.daheardit-records.www
 * @subpackage release
 * @author     Constructions Incongrues <contact@constructions-incongrues.net>
 * @version    SVN: $Id: actions.class.php 23810 2009-11-12 11:07:44Z Kris.Wallsmith $
 */
class releaseActions extends sfActions
{
    public function executeShow(sfWebRequest $request)
    {
        // Fetch release
        $culture = $this->getUser()->getCulture();
        $release = Doctrine_Core::getTable('Release')->findOneBySlugAndCulture($request->getParameter('slug'), $culture);
        $this->forward404Unless($release);
        if (!$request->hasParameter('preview') && !$release->is_public) {
            $this->forward404();
        }

        // Fetch release tracks
        $q = Doctrine_Query::create()
            ->from('Track t')
            ->where('t.release_id = ?')
            ->orderBy('t.number');
        $tracks = $q->execute(array($release['id']), Doctrine_Core::HYDRATE_ARRAY);

        // Setup metadata
        $releaseArray = $release->toArray();
        $releaseArray['tracks'] = $tracks;
        $this->getResponse()->setTitle(sprintf('%s - %s', $releaseArray['Artist']['name'], $releaseArray['title']));

        // Extract prices informations
        $prices = [];
        foreach (explode("\n", $releaseArray['price']) as $priceInfo) {
            $partsPrice = explode(',', $priceInfo);
            $prices[] = [
                'format'    => $partsPrice[0],
                'price'     => isset($partsPrice[1]) ? $partsPrice[1] : null,
                'paypal_id' => isset($partsPrice[2]) ? $partsPrice[2] : null
            ];
        }
        $releaseArray['prices'] = $prices;

        // Archives
        $archives = array();
        $archivesPaths = glob(sprintf('%s/web/assets/releases/%s/archives/*.zip', sfConfig::get('sf_root_dir'), $release['slug']));
        foreach ($archivesPaths as $path) {
            $archives[] = array(
                'filename' => basename($path),
                'name' => trim(str_replace(array($release['slug'], '_'), array('', ' '), basename($path, '.zip')))
            );
        }

        // PDF press kits
        $presskits = array();
        $presskitsPaths = glob(sprintf('%s/web/assets/releases/%s/*.pdf', sfConfig::get('sf_root_dir'), $release['slug']));
        foreach ($presskitsPaths as $path) {
            $presskits[] = array(
                'name' => trim(str_replace(array('com-'.$release['slug'].'-', '_'), array('', ' '), basename($path, '.pdf'))),
                'url'  => $request->getRelativeUrlRoot().str_replace(sfConfig::get('sf_web_dir'), '', $path)
            );
        }

        $releaseArray['presskits'] = $presskits;

        // Press
        $releaseArray['press'] = array();

        // Find images scans
        $pathsScans = glob(sprintf('%s/assets/releases/%s/press/*', sfConfig::get('sf_web_dir'), $release['slug']));
        if (!is_array($pathsScans)) {
            $pathsScans = [];
        }
        foreach ($pathsScans as $path) {
            $releaseArray['press'][] = array(
                'title' => ucfirst(str_replace('_', ' ', basename($path, '.jpg'))),
                'url'  => $request->getRelativeUrlRoot().str_replace(sfConfig::get('sf_web_dir'), '', $path)
            );
        }

        // Web articles
        $urls = explode("\n", $releaseArray['links_press']);
        if ($urls[0]) {
            foreach ($urls as $url) {
                $releaseArray['press'][] = array(
                    'title' => ucfirst(str_replace('www.', '', parse_url($url, PHP_URL_HOST))),
                    'url'  => $url
                );
            }
        }

        // Press releases
        $pathsScans = glob(sprintf('%s/assets/releases/%s/press-releases/*', sfConfig::get('sf_web_dir'), $release['slug']));
        if (!is_array($pathsScans)) {
            $pathsScans = [];
        }
        foreach ($pathsScans as $path) {
            $releaseArray['press-releases'][] = array(
                'title' => ucfirst(str_replace('_', ' ', basename($path, '.pdf'))),
                'url'  => $request->getRelativeUrlRoot().str_replace(sfConfig::get('sf_web_dir'), '', $path)
            );
        }

        // Streaming links
        $releaseArray['streaming'] = [];
        $urls = explode("\n", $releaseArray['links_streaming']);
        if ($urls[0]) {
            foreach ($urls as $url) {
                $releaseArray['streaming'][] = array(
                    'title' => strtoupper(array_slice(explode('.', parse_url($url, PHP_URL_HOST)), -2, 1)[0]),
                    'url'  => $url
                );
            }
        }

        // Video links
        $releaseArray['videos'] = [];
        $urls = explode("\n", $releaseArray['links_videos']);
        if ($urls[0]) {
            foreach ($urls as $url) {
                if ($culture != 'fr') {
                    $url .= '?cc_load_policy=1&cc_lang_pref=en';
                }
                $releaseArray['videos'][] = $url;
            }
        }

        // Get previous release
        $pdo = Doctrine_Manager::getInstance()->getCurrentConnection()->getDbh();
        $stmt = $pdo->prepare('select slug, title, sku from `release` where released_at < :released_at and is_public = true order by released_at desc limit 1');
        $stmt->execute(array('released_at' => $releaseArray['released_at']));
        $previous = $stmt->fetchAll();
        $previousRelease = null;
        if (count($previous)) {
            $previousRelease = $previous[0];
        }

        // Get next release
        $pdo = Doctrine_Manager::getInstance()->getCurrentConnection()->getDbh();
        $stmt = $pdo->prepare('select slug, title, sku from `release` where released_at > :released_at and is_public = true order by released_at asc limit 1');
        $stmt->execute(array('released_at' => $releaseArray['released_at']));
        $next = $stmt->fetchAll();
        $nextRelease = null;
        if (count($next)) {
            $nextRelease = $next[0];
        }

        // Artwork
        $artworks = array();
        $pathsArtworks = glob(sprintf('%s/assets/releases/%s/images/*.png', sfConfig::get('sf_web_dir'), $release['slug']));
        foreach ($pathsArtworks as $path) {
            $artworks[] = str_replace(sfConfig::get('sf_web_dir'), '', $path);
        }
        $releaseArray['artworks'] = $artworks;

        /*
         * Featured release (header image, css, etc)
         * @see release/hometitle component
         */
        if (!$request->hasParameter('featured')) {
            if (is_readable(sprintf('%s/web/assets/releases/%s/header.jpg', sfConfig::get('sf_root_dir'), $release->slug))) {
                $request->setParameter('featured', $release->slug);
            }
        }

        // Opengraph
        $releaseTracks = Doctrine_Core::getTable('Track')->findUrlsForRelease($release['id']);
        $playlist = [];
        foreach ($releaseTracks as $track) {
            $zero = '';
            if ($track['number'] < 10) {
                $zero = 0;
            }
            $playlist[] = sprintf(
                '%s/assets/releases/%s/tracks/%s_%s%s.mp3',
                'http://www.daheardit-records.net',
                $release['slug'],
                str_replace('-', '', $release['slug']),
                $zero,
                $track['number']
            );
        }
        $flowplayerConfig = [
            'playlist' => $this->getContext()->getRouting()->generate('release_show', ['slug' => $releaseArray['slug'], 'sf_format' => 'mediarss']),
            'canvas' => [
                'backgroundImage' => sprintf(str_replace('http://', 'https://', $request->getUriPrefix()).'/assets/releases/%s/images/%s_1.png', $release['slug'], $release['slug']),
                'backgroundGradient' => 'none'
            ],
            'plugins' => [
                'audio' => [
                    'url' => sprintf('%s/frontend/swf/flowplayer/flowplayer.audio.swf', str_replace('http://', 'https://', $request->getUriPrefix()))
                ],
                'controls' => [
                    'playlist' => true,
                    'autoHide' => true,
                    'fullscreen' => false,
                    'backgroundGradient' => 'none'
                ],
                'captions' => [
                    'url' => sprintf('%s/frontend/swf/flowplayer/flowplayer.captions-3.2.10.swf', str_replace('http://', 'https://', $request->getUriPrefix())),
                    'captionTarget' => 'content',
                    'button' => null
                ],
                'content' => [
                    'url' => sprintf('%s/frontend/swf/flowplayer/flowplayer.content-3.2.9.swf', str_replace('http://', 'https://', $request->getUriPrefix())),
                    'height' => 40,
                    'top' => 0,
                    'left' => 0,
                    'width' => 486,
                    'borderRadius' => 0,
                    'background' => "none",
                    'style' => ['body' => [
                        'color' => '000000'
                    ]]
                ]
            ]
        ];


        // TODO : this should go in a filter
        $headersOgp = [
            'title' => $this->getContext()->getResponse()->getTitle(),
            'description' => strip_tags($release['Translation'][$request->getParameter('sf_culture', 'fr')]['presentation']),
            'image' => sprintf(str_replace('http://', 'https://', $request->getUriPrefix()).'/assets/releases/%s/images/%s_1.png', $release['slug'], $release['slug']),
            'type'  => 'video.other',
            'video' => sprintf(
                '%s/frontend/swf/flowplayer/flowplayer-3.2.18.swf?config=%s',
                $request->getUriPrefix(),
                urlencode(json_encode($flowplayerConfig))
            ),
            'video:secure_url' => sprintf(
                '%s/frontend/swf/flowplayer/flowplayer-3.2.18.swf?config=%s',
                str_replace('http://', 'https://', $request->getUriPrefix()),
                urlencode(json_encode($flowplayerConfig))
            ),
            'video:height' => 400,
            'video:width' => 486,
            'video:type' => 'application/x-shockwave-flash'
        ];

        foreach ($headersOgp as $name => $value) {
            $this->getContext()->getResponse()->addMeta('og:'.$name, $value);
        }

        // Pass data to view
        $this->previousRelease = $previousRelease;
        $this->nextRelease = $nextRelease;
        $this->release = $releaseArray;
        $this->archives = $archives;

        // Set content type
        if ($request->getParameter('sf_format') == 'mediarss') {
            $this->getResponse()->setContentType('application/rss+xml');
        }
    }

    public function executeShowTrack(sfWebRequest $request)
    {
        // Fetch release
        $release = Doctrine_Core::getTable('Release')->findOneBySlugAndCulture($request->getParameter('slug'), $this->getUser()->getCulture());
        $this->forward404Unless($release);
        if (!$request->hasParameter('preview') && !$release->is_public) {
            $this->forward404();
        }

        // Fetch release
        $track = Doctrine_Core::getTable('Track')->findOneByReleaseIdAndNumber($release['id'], $request->getParameter('number'));
        $this->forward404Unless($track);

        // Prefix a zero ?
        $zero = '';
        if ($track['number'] < 10) {
            $zero = '0';
        }

        // Configure view
        $this->setLayout(false);

        // Pass data to view
        $this->track = $track;
        $this->release = $release;
        $this->zero = $zero;
    }
}
