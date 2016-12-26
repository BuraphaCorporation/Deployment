$(document).on('turbolinks:load', function() {
  var initSlick;
  initSlick = function() {
    return $('#cover-slick').not('.slick-initialized').slick({
      infinite: true,
      dots: false,
      arrows: false,
      fade: true,
      autoplay: true,
      autoplaySpeed: 4000
    });
  };
  return initSlick();
});
