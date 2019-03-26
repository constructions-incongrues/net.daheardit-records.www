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
    $('#menu-main li a').click(function(event) {
        event.stopPropagation();
        e = document.getElementById($(this).attr('href').slice(0, -1));
        e.scrollIntoView();
        return false;
    });

    $('.infos_button_top a').click(function() {
        document.getElementById('top').scrollIntoView();
        return false;
    });

    // Carousels
    $('a.carousel-nav').click(function() {
        // Vimeo
        if ($(this).attr('href').match(/.*vimeo.*/)) {
                $('iframe').show();
                $('#carousel-iframe').show();
                $('.calque_artists_pictures').show();
                var iframe = $('<iframe id="carousel-iframe" src="http://player.vimeo.com/video/'+ $(this).attr('href').match(/.*\/(\d+)/)[1] +'" width="460" height="460" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>')
                $('#carousel-current').show();
                $('.calque_artwork').show();
                iframe.insertAfter('#carousel-current');
        } else if ($(this).attr('href').match(/.*youtube.*/)) {
                // Youtube
                $('iframe').show();
                $('#carousel-iframe').show();
                $('.calque_artists_pictures').show();
                var id = $(this).attr('href').match(/.*v=(.+)/)[1];
                var iframe = $('<iframe width="460" height="259" src="//www.youtube.com/embed/'+ id +'" frameborder="0" allowfullscreen></iframe>');
                $('#carousel-current').show();
                $('.calque_artwork').show();
                iframe.insertAfter('#carousel-current');
        } else {
                // Images
                $('iframe').show();
                $('.calque_artists_pictures').show();
                $('#carousel-current').show();
                $('#carousel-iframe').show();
                $('#carousel-current').attr('src', $(this).attr('href'));
                $('.calque_artwork').show();
        }

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
            if (e != undefined) {
                e.click()
            };
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

    $('.open_releases_videos a.video').each(function(i, e) {
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
});
