# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

(($) ->
  $(document).on "turbolinks:load", ->
    console.log '(document).turbolinks:load'
    $('select#guest_name').select2
      placeholder: 'Choose a person'
      allowClear: true
      theme: "bootstrap"
    return
  return
) jQuery
