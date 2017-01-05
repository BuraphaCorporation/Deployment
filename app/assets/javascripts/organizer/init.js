$(document).on('turbolinks:load', function() {
  if ($('#organizer-events-new').html() !== void 0 || $('#organizer-events-edit').html() !== void 0 || $('#profile-settings-section').html() !== void 0) {
    initGoogleMapOrganizer();
  }
});
