# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
	$('.confirm').on 'click', (ev) ->
		console.log ev
		confirmed = confirm 'are you sure you want to delete this section?'
		return confirmed