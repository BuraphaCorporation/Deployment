
$(document).ready ->
  initSlick = ->
    $('#cover-slick').not('.slick-initialized').slick
      infinite: true
      dots: false
      arrows: false
      fade: true
      autoplay: true
      autoplaySpeed: 4000

  initSlick()


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
    category_id = $("[name=category-id]").attr('content')
    return false if category_id == "" or category_id == undefined

    set_category(category_id)
    false

  initCategory()

  $('.category-filter').on 'click', ->
    category_id = $(this).attr('data-filter') # if category_id == undefined
    set_category(category_id)
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


  ((d, s, id) ->
    js = undefined
    fjs = d.getElementsByTagName(s)[0]
    if d.getElementById(id)
      return
    js = d.createElement(s)
    js.id = id
    js.src = '//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.7&appId=259929777688738'
    fjs.parentNode.insertBefore js, fjs
    return
  ) document, 'script', 'facebook-jssdk'
