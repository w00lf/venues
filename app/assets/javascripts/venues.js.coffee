# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  if($('#map').length > 0)
    handler = Gmaps.build("Google")
    mark = $('.marker')
    handler.buildMap
      provider: {}
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

        title: mark.data('title')
      ])
      handler.bounds.extendWith markers
      handler.fitMapToBounds()
