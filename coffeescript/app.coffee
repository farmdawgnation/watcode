# WAT app.js - What's up doc?
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
    

