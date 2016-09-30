
$(document).on 'turbolinks:load', ->
  loadFacebookSDK()
  bindFacebookEvents() unless window.fbEventsBound

  # loadTwitterSDK()
  # bindTwitterEventHandlers() unless twttr_events_bound

bindFacebookEvents = ->
  $(document)
    .on('turbolinks:fetch', saveFacebookRoot)
    .on('turbolinks:change', restoreFacebookRoot)
    .on('turbolinks:load', ->
      console.log "load"
      saveFacebookRoot()
      restoreFacebookRoot()
      FB?.XFBML.parse()
    )
  @fbEventsBound = true

saveFacebookRoot = ->
  console.log "saveFacebookRoot"
  if $('#fb-root').length
    @fbRoot = $('#fb-root').detach()

restoreFacebookRoot = ->
  console.log "restoreFacebookRoot"
  if @fbRoot?
    if $('#fb-root').length
      $('#fb-root').replaceWith @fbRoot
    else
      $('body').append @fbRoot

loadFacebookSDK = ->
  console.log "loadFacebookSDK"
  window.fbAsyncInit = initializeFacebookSDK
  $.getScript("//connect.facebook.net/en_US/sdk.js")

initializeFacebookSDK = ->
  FB.init
    appId  : '259929777688738'
    version: 'v2.7' # or v2.6, v2.5, v2.4, v2.3
    status : true
    cookie : true
    xfbml  : true

# bindTwitterEventHandlers = ->
#   $(document).on 'page:load', renderTweetButtons
#   twttr_events_bound = true
#
# renderTweetButtons = ->
#   $('.twitter-share-button').each ->
#     button = $(this)
#     button.attr('data-url', document.location.href) unless button.data('url')?
#     button.attr('data-text', document.title) unless button.data('text')?
#   twttr.widgets.load()
#
# loadTwitterSDK = ->
#   $.getScript("//platform.twitter.com/widgets.js")
