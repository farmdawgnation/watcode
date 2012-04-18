mongoose = require "mongoose"
$ = require "jQuery"
XMLHttpRequest = require("xmlhttprequest").XMLHttpRequest

# POST /submit - Submit a new WAT
exports.submit = (req, res) ->
  # Workaround for the Same Origin Policy being enforced
  # by jQuery. This allows us to do our ReCAPTCHA API call
  # using the uber sexy $.ajax syntax.
  $.support.cors = true;
  $.ajaxSettings.xhr = () ->
      return new XMLHttpRequest

  validSubmission = true
  for key, value of req.body.submission
    validSubmission = validSubmission && value.toString().length

  if (! validSubmission)
    req.flash('error', "Please fill out all required fields.")
    res.redirect("/compose")
    return

  $.ajax({
    url: "http://www.google.com/recaptcha/api/verify",
    type: "post",
    dataType: "text",
    data: {
      privatekey: process.env.RECAPTCHAPRIVATEKEY,
      remoteip: req.headers['X-Real-IP'] || "127.0.0.1",
      challenge: req.body.recaptcha_challenge_field,
      response: req.body.recaptcha_response_field
    },
    success: (data) ->
      dataParts = data.split("\n")

      if (dataParts[0] == "true")
        Submission = mongoose.model("Submission")
  
        newsub = new Submission(req.body.submission)
        newsub.language = newsub.languageName.toLowerCase()
        newsub.authorUrl = "http://twitter.com/" + newsub.author.toLowerCase()
        newsub.published = false # We don wan no mass assignment hear?
        newsub.save()
  
        req.flash('success', "Your submission has been completed.")
        res.redirect("/")
      else
        if dataParts[1] == "invalid-site-private-key"
          req.flash('error', "ReCAPTCHA failed due to invalid private key. Please contact the site admins.")
        else if dataParts[1] == "invalid-request-cookie"
          req.flash('error', "Something went bad with the ReCAPTCHA challenge. Please try again.")
        else if dataParts[1] == "incorrect-captcha-sol"
          req.flash('error', "Your CAPTCHA solution was incorrect.")
        else if dataParts[1] == "recaptcha-not-reachable"
          req.flash('error', "We couldn't verify your CAPTCHA response because ReCAPTCHA appears to be offline.")
        else
          req.flash('error', "The ReCAPTCHA failed for some unknown reason: " + dataParts[1])

        res.redirect("/compose")

    error: (xhrreq, status, errorThrown) ->
      console.error("ReCAPTCHA request errored: " + status)
      req.flash('error', "The ReCAPTCHA service responded with error: " + status + " " + errorThrown)
      res.redirect("/compose")
  })
