# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  if($('#map').length > 0)
    handler = Gmaps.build("Google")
    mark = $('.marker')
    handler.buildMap
      provider:
        zoom: 15 
      internal:
        id: "map"
    , ->
      markers = handler.addMarkers([
        lat: mark.data('lat')
        lng: mark.data('lon')
        picture:
          url: "https://addons.cdn.mozilla.net/img/uploads/addon_icons/13/13028-64.png"
          width: 36
          height: 36
        infowindow: mark.data('title')
        visible: false
      ])
      handler.bounds.extendWith markers
      handler.map.centerOn(markers[0])
  tab_on_error = (selector)->
    $(selector).parents('.tab_container').find('.tab').hide()
    $(selector).parents('.tab').show().end().parents('.form-group').addClass('has-error')

  $(document).on 'ajax:complete', '.photo a', ->
    $(this).parents('.photo').remove()
    show_photo_add()

  $(document).on 'click', '#new_venue input:submit', ->
    errors = false
    $('.form-group').removeClass('has-error')
    if $('#venue_price').val().length == 0 && $('#venue_price_room').val().length == 0
      $('#venue_price').addClass('required')
    $('input.required').each ->
      if( $(this).val().length == 0)
        tab_on_error(this)
        errors = true

    if errors
      return false