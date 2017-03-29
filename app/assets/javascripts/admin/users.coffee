# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('.send-home-btn').on "ajax:success", ->
    rowCount = $('.home-list tr').length
    if ( rowCount < 4 )
      $(this).closest('tr').remove()
      $(this).text('Film returned')
      $('.home-list').append($(this).closest('tr'))
    else
      $('.alert').remove()
      $('<div class="alert alert-alert">Maximum Films at Home is 3 films.</div>').insertBefore('header')

$ ->
  $('.rental-remove-btn').on "ajax:success", ->
    $('.alert').remove()