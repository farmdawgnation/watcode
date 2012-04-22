# WAT app.js - What's up doc?

track_mixpanel = (event, props) ->
  if (! document.location.host.match(/localhost/))
    mixpanel.track(event, props)

try_to_reenable_form = () ->
  $button_disabled = false
    
  $(".required-for-submission").each (i, element) ->
    $button_disabled = true if ($(element).val() == "")
    
  if ($button_disabled)
    $("button[type=submit]").addClass("disabled")
  else
    $("button[type=submit]").removeClass("disabled")
  

$(document).ready () ->
  track_mixpanel('view', {
    url: document.location
  })

  $(".container")
  .on "blur", ".submission-compose-form input, .submission-compose-form textarea, .submission-compose-form .select", (event) ->
    $event_target = $(event.target)
    $event_target_container = $(event.target).closest(".control-group")
    
    $event_target_container.removeClass("error") if ($event_target.val() != "")
    $event_target_container.addClass("error") if ($event_target.val() == "")

  .on "keyup", ".submission-compose-form input, .submission-compose-form textarea", (event) ->
    $event_target = $(event.target)
    $event_target_container = $(event.target).closest(".control-group")
    
    $event_target_container.removeClass("error")

  .on "keyup", ".required-for-submission", (event) ->
    try_to_reenable_form()
  
  .on "change", ".required-for-submission", (event) ->
    try_to_reenable_form()

  .on "click", "button[type=submit].disabled", (event) ->
    return false
  
  .on "submit", ".submission-compose-form", (event) ->
    track_mixpanel("send_submission", {
      category: $('#submission-category').val(),
      language: $('#submission-language').val()
    })

  .on "click", "button.twitter-share", (event) ->
    track_mixpanel("twitter_share")
    $submission = $(event.target).closest(".submission")
    submissionId = $submission.data("submission-id")
    submissionTitle = $submission.data("submission-title")
    submissionHref = $submission.find(".submission-link").attr("href")

    text = submissionTitle + " on watcode. "

    tweetUrl = "https://twitter.com/share?text=" + encodeURIComponent(text) + "&url=" + encodeURIComponent(submissionHref)

    window.open(tweetUrl, 'twitterShare', 'width=600,height=300')

  .on "click", "button.facebook-share", (event) ->
    track_mixpanel("facebook_share")
    $submission = $(event.target).closest(".submission")
    submissionId = $submission.data("submission-id")
    submissionTitle = $submission.data("submission-title")
    submissionHref = $submission.find(".submission-link").attr("href")

    text = submissionTitle + " on watcode. "

    fbUrl = "https://www.facebook.com/sharer.php?u=" + encodeURIComponent(submissionHref) + "&t=" + encodeURIComponent(submissionTitle)

    window.open(fbUrl, 'facebookShare', 'width=650,height=400')
