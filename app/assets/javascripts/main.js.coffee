# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $('.json-form').attr('data-type', 'json')
  $('.tab_container .tab').hide().first().show()
  $('.tab_links a, .tab_move a').click (e)->
    $(this).parents('.tab_container').find('.tab').hide().end().find('[name*=' + this.hash.slice(1) + ']').show()
    false