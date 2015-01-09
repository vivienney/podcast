---
---
$ ->
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

	$('.js-tweet-link').on 'click', ->
		quote = $(this).data('quote')
		link = $(this).data('link')
		shareUrl = encodeURI("https://twitter.com/share?text=\"" + quote + "\" - Listen at &url=" + link + "&via=teamsteer")

		window.open(shareUrl, 'name', 'height=396,width=550')
		return false


	$('#audio-player').jPlayer
		ready: ->
			$(this).jPlayer 'setMedia',
				mp3: $('#audio-player').data('audio')
		preload: 'auto'
		cssSelectorAncestor: '.player__container'
		cssSelector:
			play: '.play-btn'
			pause: '.pause-btn'
			seekBar: '.player__seek-bar'
			playBar: '.player__play-bar'
			currentTime: '.player__current-time'
			duration: '.player__duration'


	$('.js-itunes-link').click ->
		ga('send','event', 'Episodes', 'iTunes Subscribe')

	$('.play-btn').click ->
		episode_no = $(this).closest('#audio-player').data('episode')
		ga('send','event', 'Episodes', 'Play', episode_no)

	$('.player__download-link').click ->
		episode_no = $(this).closest('#audio-player').data('episode')
		ga('send', 'event', 'Episodes', 'Download', episode_no)