var initGoogleMapOrganizer, updateLatLng;

initGoogleMapOrganizer = function() {
  var addMarker, dLat, dLng, hideMarkers, input, map, markers, searchBox;
  dLat = parseFloat($('#event_latitude').val()) || 13.7563309;
  dLng = parseFloat($('#event_longitude').val()) || 100.50176510000006;
  map = new google.maps.Map(document.getElementById('organizer-map'), {
    center: {
      lat: dLat,
      lng: dLng
    },
    zoom: 13,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  });
  markers = [];
  input = document.getElementById('pac-input');
  searchBox = new google.maps.places.SearchBox(input);
  map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
  map.addListener('click', function(event) {
    return addMarker(event.latLng);
  });
  map.addListener('bounds_changed', function() {
    return searchBox.setBounds(map.getBounds());
  });
  searchBox.addListener('places_changed', function() {
    var bounds, places;
    places = searchBox.getPlaces();
    if (places.length === 0) {
      return;
    }
    bounds = new google.maps.LatLngBounds;
    places.forEach(function(place) {
      var icon;
      icon = {
        url: place.icon,
        size: new google.maps.Size(71, 71),
        origin: new google.maps.Point(0, 0),
        anchor: new google.maps.Point(17, 34),
        scaledSize: new google.maps.Size(25, 25)
      };
      addMarker(place.geometry.location);
      if (place.geometry.viewpor) {
        return bounds.union(place.geometry.viewport);
      } else {
        return bounds.extend(place.geometry.location);
      }
    });
    return map.fitBounds(bounds);
  });
  hideMarkers = function() {
    var i;
    i = 0;
    while (i < markers.length) {
      markers[i].setMap(null);
      i++;
    }
  };
  addMarker = function(location) {
    var marker;
    hideMarkers();
    markers = [];
    marker = new google.maps.Marker({
      position: location,
      map: map,
      draggable: true
    });
    markers.push(marker);
    updateLatLng(location.lat(), location.lng());
    return marker.addListener('dragend', function(event) {
      return updateLatLng(event.latLng.lat(), event.latLng.lng());
    });
  };
  return addMarker(new google.maps.LatLng(dLat, dLng));
};

updateLatLng = function(lat, lng) {
  $('#event_latitude').val(lat);
  $('#event_longitude').val(lng);
};
