$(document).on('turbolinks:load', function() {
  var initGoogleMapEvent;
  initGoogleMapEvent = function() {
    var centerLocation, eventLocation, icon_map, info, infowindow, lat, lng, location_address, location_name, map, marker;
    lat = $('#google-map').attr('data-lat');
    lng = $('#google-map').attr('data-lng');
    location_name = $('#location').attr('data-location-name');
    location_address = $('#location').attr('data-location-address');
    if (lat === void 0 || lng === void 0) {
      return;
    }
    lat = parseFloat(lat);
    lng = parseFloat(lng);
    eventLocation = {
      lat: lat || 13.725275,
      lng: lng || 100.5871969
    };
    centerLocation = {
      lat: lat + 0.002,
      lng: lng
    };
    map = new google.maps.Map(document.getElementById('google-map'), {
      center: centerLocation,
      zoom: 16,
      scrollwheel: false,
      draggable: true,
      disableDoubleClickZoom: true
    });
    icon_map = {
      url: '' + $('#google-map').attr('data-icon-map-pin'),
      scaledSize: new google.maps.Size(64, 76)
    };
    marker = new google.maps.Marker({
      position: eventLocation,
      map: map,
      icon: icon_map,
      title: 'Hello World!'
    });
    marker.addListener('click', function() {
      infowindow.open(map, marker);
    });
    info = '<center> <h5>' + location_name + '</h5> <p>' + location_address + '</p> <p> <i class=\'icon icon-xs icon-direction-flag\'></i> <a href="https://www.google.co.th/maps?q=loc:' + lat + ',' + lng + '" target="_blank">View on Google Map</a> </p> </center>';
    infowindow = new google.maps.InfoWindow({
      content: info
    });
    return infowindow.open(map, marker);
  };
  return initGoogleMapEvent();
});
