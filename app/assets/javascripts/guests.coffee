# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "turbolinks:load", ->
  $('select#guest_name').select2
    placeholder: 'Please start typing...'
    # allowClear: true
    theme: "bootstrap"
    width: '100%'
