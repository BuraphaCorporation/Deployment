# var labels = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
# var labelIndex = 0;
#
# function initMarker() {
#   var bangalore = { lat: 12.97, lng: 77.59 };
#   var map = new google.maps.Map(document.getElementById('map'), {
#     zoom: 12,
#     center: bangalore
#   });
#
#   // This event listener calls addMarker() when the map is clicked.
#   google.maps.event.addListener(map, 'click', function(event) {
#     addMarker(event.latLng, map);
#   });
#
#   // Add a marker at the center of the map.
#   addMarker(bangalore, map);
# }
#
# function addMarker(location, map) {
#   // Add the marker at the clicked location, and add the next-available label
#   // from the array of alphabetical characters.
#   var marker = new google.maps.Marker({
#     position: location,
#     label: labels[labelIndex++ % labels.length],
#     map: map,
#     draggable: true
#   });
# }
# google.maps.event.addDomListener(window, 'load', initialize);

initAutocomplete = ->
  map = new (google.maps.Map)(document.getElementById('map'),
    center:
      lat: 13.7563309
      lng: 100.50176510000006
    zoom: 13
    mapTypeId: google.maps.MapTypeId.ROADMAP)
  markers = []
  # Create the search box and link it to the UI element.
  input = document.getElementById('pac-input')
  searchBox = new (google.maps.places.SearchBox)(input)

  setMarkers = ->
    i = 0
    while i < markers.length
      markers[i].setMap yourMap
      #Add the marker to the map
      i++
    return

  hideMarkers = ->
    i = 0
    while i < markers.length
      markers[i].setMap null
      #Remove the marker from the map
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
  # Bias the SearchBox results towards current map's viewport.
  map.addListener 'bounds_changed', ->
    searchBox.setBounds map.getBounds()
    return
  map.addListener 'click', (event) ->
    addMarker event.latLng
    return
  # Listen for the event fired when the user selects a prediction and retrieve
  # more details for that place.
  searchBox.addListener 'places_changed', ->
    places = searchBox.getPlaces()
    if places.length == 0
      return
    # Clear out the old markers.
    # markers.forEach(function(marker) {
    #   marker.setMap(null);
    # });
    # markers = [];
    # For each place, get the icon, name and location.
    bounds = new (google.maps.LatLngBounds)
    places.forEach (place) ->
      icon =
        url: place.icon
        size: new (google.maps.Size)(71, 71)
        origin: new (google.maps.Point)(0, 0)
        anchor: new (google.maps.Point)(17, 34)
        scaledSize: new (google.maps.Size)(25, 25)
      addMarker place.geometry.location
      # Create a marker for each place.
      # markers.push(new google.maps.Marker({
      #   map: map,
      #   title: place.name,
      #   position: place.geometry.location,
      #   draggable: true
      # }));
      if place.geometry.viewport
        # Only geocodes have viewport.
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

initAutocomplete()

init_datetimepicker = (element) ->
  $('.datepicker', element).datetimepicker format: 'DD/MM/YYYY'
  $('.timepicker', element).datetimepicker
    format: 'LT'
    stepping: 15
  return

on_ticket_add = (button) ->
  template = $('#new-ticket-template').html()
  Mustache.parse template
  rendered = Mustache.render(template, {})
  element = $(rendered)
  $('.ticket-list tbody').append element
  init_datetimepicker element
  false

on_ticket_delete = (button) ->
  element = $(button).parents('.ticket')
  element.remove()
  false

init_sortable = ->
  $('.sortable').sortable update: (event, ui) ->
    images_order = $(this).sortable('toArray', attribute: 'data-id')
    $('[name=images_order]').val images_order.join(',')
    console.log images_order.join(',')
    return
  return

$ ->
  init_datetimepicker $('body')
  on_ticket_add()
  #add 1st ticket
  return
