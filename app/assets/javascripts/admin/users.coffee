# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('.send-home-btn').on "ajax:success", ->
    $(this).closest('tr').remove()

$ ->
  $('.send-home-btn').on "ajax:success", ->
    $(this).html('Film Returned')
    $(this).text('Film Returned')
    $('.home-list').append($(this).closest('tr'))