
init_slick = ->
  $('#cover-slick').slick
    infinite: true
    dots: false
    arrows: false
    fade: true
    autoplay: true
    autoplaySpeed: 4000
  return

$ ->
  init_slick()
  return

on_events_filter = (element, options) ->
  if options['category_id'] != undefined
    category_id = options['category_id']
    $('#event-section .event-list .event-wrapper').not('.event-category-' + category_id).hide()
    $('#event-section .event-list .event-wrapper.event-category-' + category_id).show()
  else
    $('#event-section .event-list .event-wrapper').show()

  $(element).parents('.nav').find('li').removeClass 'active'
  $(element).parent().addClass 'active'
  false
