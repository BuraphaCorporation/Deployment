
$(document).on('turbolinks:load', function(event) {
  if (bodyId === "organizer-events-new") {
    return onTicketAdd();
  }
});
