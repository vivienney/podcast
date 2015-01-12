---
---
$ ->
	# Smooth scroll for click
	$('.scroll').on 'click', ->
		sectionHeight= $('#scroll-to-end').offset().top
		totalHeight = sectionHeight - 100

		$('body,html').animate
			scrollTop: totalHeight
		, 1000

		return false

	$(document).on 'scroll', ->
		t = $(document).scrollTop()
		$('header').toggleClass 'active', t > 10

	# Twitter link share

	$('.js-tweet-link').on 'click', ->
		quote = $(this).data('quote')
		link = $(this).data('link')
		shareUrl = encodeURI("https://twitter.com/share?text=\"" + quote + "\" - Listen at &url=" + link + "&via=teamsteer")

		window.open(shareUrl, 'name', 'height=396,width=550')
		return false

	# Audio Player

	$('#audio-player').jPlayer
		ready: ->
			$(this).jPlayer 'setMedia',
				mp3: $('#audio-player').data('audio')
		preload: 'auto'
		volume: 1
		cssSelectorAncestor: '.player__container'
		cssSelector:
			play: '.play-btn'
			pause: '.pause-btn'
			seekBar: '.player__seek-bar'
			playBar: '.player__play-bar'
			currentTime: '.player__current-time'
			duration: '.player__duration'

	# Analytic events

	currentEpisodeNo = (episode) ->
		$(episode).closest('.episode__player').find('#audio-player').data('episode')

	$('.js-itunes-link').click ->
		ga('send','event', 'Episodes', 'iTunes Subscribe')

	$('.play-btn').click ->
		episodeNo = currentEpisodeNo(this)
		ga('send','event', 'Episodes', 'Play', 'Episode: ' + episodeNo)

	$('.player__download-link').click ->
		episodeNo = currentEpisodeNo(this)
		ga('send', 'event', 'Episodes', 'Download', 'Episode: ' + episodeNo)