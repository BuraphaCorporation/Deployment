
$(document).ready ->
  init_slick = ->
    $('#cover-slick').not('.slick-initialized').slick
      infinite: true
      dots: false
      arrows: false
      fade: true
      autoplay: true
      autoplaySpeed: 4000

  init_slick()

  $('.category-filter').on 'click', ->
    category_id = $(this).attr('data-filter')
    console.log category_id
    if category_id != undefined
      $('#event-section .event-list .event-wrapper').not('.event-category-' + category_id).hide()
      $('#event-section .event-list .event-wrapper.event-category-' + category_id).show()
    else
      $('#event-section .event-list .event-wrapper').show()

    $(this).parents('.nav').find('li').removeClass 'active'
    $(this).parent().addClass 'active'
    false

  initGoogleMap =  ->
    lat = $("#google-map").attr('data-lat')
    lng = $("#google-map").attr('data-lng')
    return if lat == undefined || lng == undefined

    lat = parseFloat lat
    lng = parseFloat lng

    eventLocation =
      lat: lat || 13.725275
      lng: lng || 100.5871969

    eventMaker =
      lat: lat
      lng: lng

    map = new (google.maps.Map)(document.getElementById('google-map'),
      center: eventLocation
      zoom: 13
      scrollwheel: false)

    marker = new (google.maps.Marker)(
      position: eventLocation
      map: map
      title: 'Hello World!')
    return

  initGoogleMap()
