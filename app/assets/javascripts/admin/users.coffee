# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#$ ->
#  $('.send-home-btn').on "ajax:success", ->
#    $(this).closest('tr').remove()

$ ->
  $('.send-home-btn').on "ajax:success", ->
    rowCount = $('.hole-list tr').length
    #rowCount = "<%= @home_count %>"
    if ( rowCount < 4 )
      $(this).closest('tr').remove()
      $(this).text('Film returned')
      $('.home-list').append($(this).closest('tr'))