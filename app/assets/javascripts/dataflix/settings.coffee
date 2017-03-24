# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('.rental-remove-btn').on "ajax:success", ->
    $(this).closest('tr').remove()