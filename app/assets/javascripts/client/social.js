var bindFacebookEvents, initializeFacebookSDK, loadFacebookSDK, restoreFacebookRoot, saveFacebookRoot;

$(document).on('turbolinks:load', function() {
  loadFacebookSDK();
  if (!window.fbEventsBound) {
    return bindFacebookEvents();
  }
});

bindFacebookEvents = function() {
  $(document).on('turbolinks:fetch', saveFacebookRoot).on('turbolinks:change', restoreFacebookRoot).on('turbolinks:load', function() {
    console.log("load");
    return typeof FB !== "undefined" && FB !== null ? FB.XFBML.parse() : void 0;
  });
  return this.fbEventsBound = true;
};

saveFacebookRoot = function() {
  console.log("saveFacebookRoot");
  if ($('#fb-root').length) {
    return this.fbRoot = $('#fb-root').detach();
  }
};

restoreFacebookRoot = function() {
  console.log("restoreFacebookRoot");
  if (this.fbRoot != null) {
    if ($('#fb-root').length) {
      return $('#fb-root').replaceWith(this.fbRoot);
    } else {
      return $('body').append(this.fbRoot);
    }
  }
};

loadFacebookSDK = function() {
  console.log("loadFacebookSDK");
  window.fbAsyncInit = initializeFacebookSDK;
  return $.getScript("//connect.facebook.net/en_US/sdk.js");
};

initializeFacebookSDK = function() {
  return FB.init({
    appId: '259929777688738',
    version: 'v2.7',
    status: true,
    cookie: true,
    xfbml: true
  });
};
