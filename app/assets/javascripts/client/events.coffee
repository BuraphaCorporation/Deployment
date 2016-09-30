

$(document).on 'turbolinks:load', (event) ->
  bodyId = $('body').attr('id')

  initSlick = ->
    $('#cover-slick').not('.slick-initialized').slick
      infinite: true
      dots: false
      arrows: false
      fade: true
      autoplay: true
      autoplaySpeed: 4000

  $('.category-filter').on 'click', ->
    category_id = $(this).attr('data-filter') # if category_id == undefined
    set_category(category_id)
    false

  set_category = (category_id) ->
    if category_id == undefined or category_id == '0'
      $('#event-section .event-list .event-wrapper').show()
    else
      $('#event-section .event-list .event-wrapper').not('.event-category-' + category_id).hide()
      $('#event-section .event-list .event-wrapper.event-category-' + category_id).show()

    selected = $("[data-filter=" + category_id + "]")
    selected.parents('.nav').find('li').removeClass 'active'
    selected.parent().addClass 'active'

  initCategory = ->
    return if bodyId == "organizer-events-edit" || bodyId == "organizer-events-new"
    category_id = $("[name=category-id]").attr('content')

    return false if category_id == "" or category_id == undefined

    set_category(category_id)
    false

  initGoogleMapEvent =  ->
    lat = $("#google-map").attr('data-lat')
    lng = $("#google-map").attr('data-lng')
    return if lat == undefined || lng == undefined

    lat = parseFloat lat
    lng = parseFloat lng

    eventLocation =
      lat: lat || 13.725275
      lng: lng || 100.5871969

    map = new (google.maps.Map)(document.getElementById('google-map'),
      center: eventLocation
      zoom: 15
      scrollwheel: false
      draggable: false
      zoomControl: false
      scrollwheel: false
      disableDoubleClickZoom: true)

    marker = new (google.maps.Marker)(
      position: eventLocation
      map: map
      title: 'Hello World!')
    return

  initGoogleMapEvent()
  # google.maps.event.addDomListener window, 'load', initGoogleMapEvent

  initSlick()
  initCategory()

  initGoogleMapOrganizer = ->
    dLat = parseFloat($('#event_latitude').val()) || 13.7563309
    dLng = parseFloat($('#event_longitude').val()) || 100.50176510000006
    map = new (google.maps.Map)(document.getElementById('organizer-map'),
      center:
        lat: dLat
        lng: dLng
      zoom: 13
      mapTypeId: google.maps.MapTypeId.ROADMAP)
    markers = []

    input = document.getElementById('pac-input')
    searchBox = new (google.maps.places.SearchBox)(input)

    map.addListener 'idle', ->
      addMarker new (google.maps.LatLng)(dLat, dLng)
      return

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
        return
      return

    map.controls[google.maps.ControlPosition.TOP_LEFT].push input

    map.addListener 'bounds_changed', ->
      searchBox.setBounds map.getBounds()
      return

    map.addListener 'click', (event) ->
      addMarker event.latLng
      return

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
        return
      map.fitBounds bounds
      return
    return

  updateLatLng = (lat, lng) ->
    $('#event_latitude').val lat
    $('#event_longitude').val lng
    return

  if $("#organizer-events-new").html() != undefined || $("#organizer-events-edit").html() != undefined
    initGoogleMapOrganizer()
  # google.maps.event.addDomListener window, 'load', initGoogleMapOrganizer

  if bodyId == "organizer-events-new"
    onTicketAdd()
