# WAT app.js - What's up doc?

try_to_reenable_form = () ->
  $button_disabled = false
    
  $(".required-for-submission").each (i, element) ->
    $button_disabled = true if ($(element).val() == "")
    
  if ($button_disabled)
    $("button[type=submit]").addClass("disabled")
  else
    $("button[type=submit]").removeClass("disabled")
  

$(document).ready () ->
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

  .on "click", "button.twitter-share", (event) ->
    $submission = $(event.target).closest(".submission")
    submissionId = $submission.data("submission-id")
    submissionTitle = $submission.data("submission-title")
    submissionHref = $submission.find(".submission-link").attr("href")

    text = submissionTitle + " on WATgramming. "

    tweetUrl = "https://twitter.com/share?text=" + encodeURIComponent(text) + "&url=" + encodeURIComponent(submissionHref)

    window.open(tweetUrl, 'twitterShare', 'width=600,height=300')
