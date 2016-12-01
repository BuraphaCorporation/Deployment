$(document).on 'turbolinks:load', ->
  bodyId = $('body').attr('id')
  if bodyId == 'organizer-events-new'
    return onTicketAdd()
  return

$(document).on 'turbolinks:load', ->
  bodyId = undefined
  initCategory = undefined
  initGoogleMapEvent = undefined
  initGoogleMapOrganizer = undefined
  initSlick = undefined
  set_category = undefined
  updateLatLng = undefined
  bodyId = $('body').attr('id')
  $('.category-filter').on 'click', ->
    category_id = undefined
    category_id = $(this).attr('data-filter')
    set_category category_id
    false

  $('.event-filter').on 'click', ->
    event = $(this).attr('data-filter')
    $('#organizer-event-list .event-for-organizer').not('.' + event).hide()
    $('#organizer-event-list .event-for-organizer.' + event).show()

  set_category = (category_id) ->
    selected = undefined
    if category_id == undefined or category_id == '0'
      $('#event-section .event-list .event-wrapper').show()
    else
      $('#event-section .event-list .event-wrapper').not('.event-category-' + category_id).hide()
      $('#event-section .event-list .event-wrapper.event-category-' + category_id).show()
    selected = $('[data-filter=' + category_id + ']')
    selected.parents('.nav').find('li').removeClass 'active'
    selected.parent().addClass 'active'

  initCategory = ->
    category_id = undefined
    if bodyId == 'organizer-events-edit' or bodyId == 'organizer-events-new'
      return
    category_id = $('[name=category-id]').attr('content')
    if category_id == '' or category_id == undefined
      return false
    set_category category_id
    false

  initCategory()
  return
# $(document).ready('ready', function(){
$(document).on 'turbolinks:load', ->

  initSlick = ->
    $('#cover-slick').not('.slick-initialized').slick
      infinite: true
      dots: false
      arrows: false
      fade: true
      autoplay: true
      autoplaySpeed: 4000
    return

  initSlick()
  return



$(document).on 'turbolinks:load', ->
  bodyId = undefined
  initCategory = undefined
  initGoogleMapEvent = undefined
  initGoogleMapOrganizer = undefined
  initSlick = undefined
  set_category = undefined
  updateLatLng = undefined

  initGoogleMapEvent = ->
    centerLocation = undefined
    eventLocation = undefined
    icon_map = undefined
    info = undefined
    infowindow = undefined
    lat = undefined
    lng = undefined
    location_address = undefined
    location_name = undefined
    map = undefined
    marker = undefined
    lat = $('#google-map').attr('data-lat')
    lng = $('#google-map').attr('data-lng')
    location_name = $('#location').attr('data-location-name')
    location_address = $('#location').attr('data-location-address')
    if lat == undefined or lng == undefined
      return
    lat = parseFloat(lat)
    lng = parseFloat(lng)
    eventLocation =
      lat: lat or 13.725275
      lng: lng or 100.5871969
    centerLocation =
      lat: lat + 0.002
      lng: lng
    map = new (google.maps.Map)(document.getElementById('google-map'),
      center: centerLocation
      zoom: 16
      scrollwheel: false
      draggable: true
      disableDoubleClickZoom: true)
    icon_map =
      url: '' + $('#google-map').attr('data-icon-map-pin')
      scaledSize: new (google.maps.Size)(64, 76)
    marker = new (google.maps.Marker)(
      position: eventLocation
      map: map
      icon: icon_map
      title: 'Hello World!')
    marker.addListener 'click', ->
      infowindow.open map, marker
      return
    info = '<center> <h5>' + location_name + '</h5> <p>' + location_address + '</p> <p> <i class=\'icon icon-xs icon-direction-flag\'></i> <a href="https://www.google.co.th/maps?q=loc:' + lat + ',' + lng + '" target="_blank">View on Google Map</a> </p> </center>'
    infowindow = new (google.maps.InfoWindow)(content: info)
    infowindow.open map, marker

  initGoogleMapEvent()

  initGoogleMapOrganizer = ->
    dLat = parseFloat($('#event_latitude').val()) or 13.7563309
    dLng = parseFloat($('#event_longitude').val()) or 100.50176510000006

    map = new (google.maps.Map)(document.getElementById('organizer-map'),
      center:
        lat: dLat
        lng: dLng
      zoom: 13
      mapTypeId: google.maps.MapTypeId.ROADMAP)

    markers = []
    input = document.getElementById('pac-input')
    searchBox = new (google.maps.places.SearchBox)(input)

    map.controls[google.maps.ControlPosition.TOP_LEFT].push input

    map.addListener 'click', (event) ->
      addMarker event.latLng

    map.addListener 'bounds_changed', ->
      searchBox.setBounds map.getBounds()

    searchBox.addListener 'places_changed', ->
      places = searchBox.getPlaces()
      if places.length == 0
        return

      bounds = new (google.maps.LatLngBounds)
      places.forEach (place) ->
        icon =
          url: place.icon
          size: new (google.maps.Size)(71, 71)
          origin: new (google.maps.Point)(0, 0)
          anchor: new (google.maps.Point)(17, 34)
          scaledSize: new (google.maps.Size)(25, 25)

        addMarker place.geometry.location

        if place.geometry.viewpor
          bounds.union place.geometry.viewport
        else
          bounds.extend place.geometry.location

      map.fitBounds bounds

    hideMarkers = ->
      i = 0
      while i < markers.length
        markers[i].setMap null
        i++
      return

    addMarker = (location) ->
      hideMarkers()
      markers = []

      marker = new (google.maps.Marker)(
        position: location
        map: map
        draggable: true)

      markers.push marker
      updateLatLng location.lat(), location.lng()

      marker.addListener 'dragend', (event) ->
        updateLatLng event.latLng.lat(), event.latLng.lng()

    # map.addListener 'idle', (event) ->
    addMarker new (google.maps.LatLng)(dLat, dLng)

  updateLatLng = (lat, lng) ->
    $('#event_latitude').val lat
    $('#event_longitude').val lng
    return

  if $('#organizer-events-new').html() != undefined or $('#organizer-events-edit').html() != undefined or $('#profile-settings-section').html() != undefined
    initGoogleMapOrganizer()
  return
