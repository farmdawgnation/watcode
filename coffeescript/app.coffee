###
Copyright 2012 Matt Farmer

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
###

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
  .on "click", "#legends_of_wat", (event) ->
    document.location = "/"

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

  .on 'click', 'button.publish-submission', (event) ->
    $submission = $(event.target).closest(".submission")
    submissionId = $submission.data("submission-id")

    $.ajax({
      url: '/admin/publish',
      type: 'post',
      data: {submissionId: submissionId},
      success: () ->
        $submission.remove()
        alert "Submission published."
      ,
      error: (req, status, error) ->
        alert "Server Responded" + status + " - " + error
    })

  .on 'click', 'button.delete-submission', (event) ->
    $submission = $(event.target).closest(".submission")
    submissionId = $submission.data("submission-id")

    $.ajax({
      url: '/admin/delete',
      type: 'post',
      data: {submissionId: submissionId},
      success: () ->
        $submission.remove()
        alert "Submission deleted."
      ,
      error: (req, status, error) ->
        alert "Server Responded" + status + " - " + error
    })
