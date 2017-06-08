$(document).ready(function () {
    // Paypal add to cart links
    $('a.paypal').click(function() {
        $('#paypal_id').val($(this).data('paypalid'));
        $('form#paypal').submit();
        return false;
    });

    // Paypal view cart
    $('a.paypal-cart').click(function() {
        $('form#paypal-view-cart').submit();
        return false;
    });

    // Media player
    if ($('.open_releases_playlist li a')) {
        // Build playlist
        var playlist = [];
        $('.open_releases_playlist li a').each(function() {
            var media = {mp3: $(this).attr('href'), title: $(this).text()};
            if ($(this).text().match(/\(bonus track\)/i)) {
                media.liClass = 'bonus';
            }
            playlist.push(media);
        });

        // Media player
        var player = new jPlayerPlaylist(null, playlist, {
            solution: 'flash, html',
            swfPath: dhrUriRoot + "/frontend/js/jQuery.jPlayer.2.1.0/",
            playlistOptions: { autoPlay: window.autoPlay }
        });

        // Track releases streaming activity
        $("#jquery_jplayer_1").bind($.jPlayer.event.play, function(event) {
            trackInfos = event.jPlayer.status.src.match(/^.*\/dhr(\d+)_(\d+)\.mp3$/);
            _gaq.push(['_trackEvent', 'Releases', 'Track Played - ' + trackInfos[2], 'dhr-' + trackInfos[1]]);
        });

        // Go to previous release after release's last track
        $("#jquery_jplayer_1").bind($.jPlayer.event.ended, function(event) {
            if (event.jPlayer.status.src == $('.open_releases_playlist li a').last().attr('href')) {
                if ($('a.previous')) {
                    window.location = $('a.previous').attr('href').split('#')[0] + '?play#release';;
                }
            }
        });

        $("#jquery_jplayer_1").bind($.jPlayer.event.resize, function(event) {
            $($('.open_releases_playlist li')[0]).hide();
        });
    }


    // Top menu
    $('#menu-main li a').click(function() {
        $.scrollTo($($(this).attr('href')), 1000);
        return false;
    });

    $('.infos_button_top a').click(function() {
        $.scrollTo($('#top'), 1000);
        return false;
    });

    // Carousels
    $('a.carousel-nav').click(function() {
        // Vimeo
  
                // Images
                $('iframe').remove();
                $('.calque_artists_pictures').show();
                $('#carousel-current').show();
                $('#carousel-iframe').hide();
                $('#carousel-current').attr('src', $(this).attr('href'));
                $('.calque_artwork').show();
        

        // Navigation
        $('a.carousel-nav').removeClass('current');
        $(this).addClass('current');
        $('a.carousel-nav img').each(function() {
            $(this).attr('src', dhrUriRoot + '/frontend/pics/button/caroussel-release.png');
        });
        $(this).find('img').attr('src', dhrUriRoot + '/frontend/pics/button/caroussel-release-hover.png');
        return false;
    });

    // Carousel auto change
    createIntervalCarousel = function() {
            intervalCarousel = setInterval(function() {
            var e = $('a.carousel-nav.current').parent().next().children()[0];
            if (e == undefined) {
                e = $('a.carousel-nav')[0];
            }
            e.click()
        }, 8000);
    };

    createIntervalCarousel();

    $('div.open_artists_pictures, div.open_releases_artwork').on('mouseover', function() {
        clearInterval(intervalCarousel);
    });

    $('div.open_artists_pictures, div.open_releases_artwork').on('mouseout', function() {
        createIntervalCarousel();
    });

    // Track releases download count
    // @see https://developers.google.com/analytics/devguides/collection/gajs/eventTrackerGuide
    $('a.release-download').click(function() {
        _gaq.push(['_trackEvent', 'Releases', 'Archive Downloaded - ' + $(this).data('dhr-archive-format'), $(this).data('dhr-release-slug')]);
    });

    $('a.video').each(function(i, e) {
        var match = $(e).attr('href').match(/.*youtube.com\/watch\?v=(.+).*/);
        if (match) {
            $.getJSON(
                'https://www.googleapis.com/youtube/v3/videos?id=' + match[1] + '&key=AIzaSyB2PdLvZ7DIllTB6PeY6eeBqi9mruirfMo&fields=items(snippet(title))&part=snippet',
                function (data) {
                    $(e).text(data.items[0].snippet.title);
                }
            );
        }
        var match = $(e).attr('href').match(/.*vimeo.com\/(\d+)/);
        if (match) {
            console.log(match);
            $.getJSON('http://vimeo.com/api/v2/video/' + match[1] + '.json', function (data) {
                $(e).text(data[0].title);
            });
        }
    })

    /*
    // Handles animation of content area
    $('#content_async').on('pjax:end', function () {
        $('#content_async').slideDown('slow', function () {
            $.scrollTo($('#release'));
        });
    });

    // Handles closing of content area
    $('a.close').live('click', function () {
        console.log($(this).data('close'));
        $($(this).data('close')).slideUp('slow');
        return false;
    });

    // Handles clicks on releases titles and images
    $('.releases_discography h1 a, .releases_discography h2 a, .releases_discography p a').click(function() {
        $('#content_async').hide();
        var link = $(this);
        $.scrollTo($('#discography'), 1000, {onAfter:function() {
            $.pjax({
                url: link.attr('href'),
                container: link.data('pjax')
            });
        }});

        return false;
    });

    // Handles navigation between releases
    $('a.previous, a.next').live('click', function() {
        $.pjax({
            url: $(this).attr('href'),
            container: $(this).data('pjax')
        });

        return false;
    });
    */
});
