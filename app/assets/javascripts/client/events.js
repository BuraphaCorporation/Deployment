$(document).on('turbolinks:load', function() {
  var bodyId, initCategory, initGoogleMapEvent, initGoogleMapOrganizer, initSlick, set_category, updateLatLng;

  bodyId = $('body').attr('id');

  $('.category-filter').on('click', function() {
    var category_id;
    category_id = $(this).attr('data-filter');
    set_category(category_id);
    return false;
  });

  set_category = function(category_id) {
    var selected;
    if (category_id === void 0 || category_id === '0') {
      $('#event-section .event-list .event-wrapper').show();
    } else {
      $('#event-section .event-list .event-wrapper').not('.event-category-' + category_id).hide();
      $('#event-section .event-list .event-wrapper.event-category-' + category_id).show();
    }
    selected = $("[data-filter=" + category_id + "]");
    selected.parents('.nav').find('li').removeClass('active');
    return selected.parent().addClass('active');
  };

  initCategory = function() {
    var category_id;
    if (bodyId === "organizer-events-edit" || bodyId === "organizer-events-new") {
      return;
    }
    category_id = $("[name=category-id]").attr('content');
    if (category_id === "" || category_id === void 0) {
      return false;
    }
    set_category(category_id);
    return false;
  };

  initCategory();
});

// $(document).ready('ready', function(){
$(document).on('turbolinks:load', function() {
  initSlick = function() {
    $('#cover-slick').not('.slick-initialized').slick({
      infinite: true,
      dots: false,
      arrows: false,
      fade: true,
      autoplay: true,
      autoplaySpeed: 4000
    });
  };

  initSlick();
});
