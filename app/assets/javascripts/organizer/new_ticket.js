$(document).on('turbolinks:load', function() {
  var bodyId;
  bodyId = $('body').attr('id');
  if (bodyId === 'organizer-events-new') {
    return onTicketAdd();
  }
});
