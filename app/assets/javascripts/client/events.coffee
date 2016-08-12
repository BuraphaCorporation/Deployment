


$(document).ready ->
  init_slick()
  return

init_slick = ->
  $('#cover-slick').slick
    infinite: true
    dots: false
    arrows: false
    fade: true
    autoplay: true
    autoplaySpeed: 4000
  return
