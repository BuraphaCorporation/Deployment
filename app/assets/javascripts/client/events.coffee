
$(document).ready ->
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
    if category_id != undefined
      $('#event-section .event-list .event-wrapper').not('.event-category-' + category_id).hide()
      $('#event-section .event-list .event-wrapper.event-category-' + category_id).show()
    else
      $('#event-section .event-list .event-wrapper').show()
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

  initSlick()
  initCategory()
  initGoogleMapEvent()
