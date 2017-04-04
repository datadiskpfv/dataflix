# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('.send-home-btn').on "ajax:success", ->
    rowCount = $('.home-list tr').length
    if ( rowCount < 4 )
      location.reload();
    else
      #location.reload();
      $('.alert').remove()
      $('<div class="alert alert-alert">Maximum Films at Home is 3 films.</div>').insertBefore('header')

$ ->
  $('.rental-remove-btn').on "ajax:success", ->
    $('.alert').remove()
    location.reload();

$ ->
  $('.barcode-field').on keyup: ->
    if ( $(this).val().length != 13 )
      $('#barcode-alert').remove()
      $(this).closest('div').append('<span id="barcode-alert" style="color:red">Barcode needs to be 13 digits</span>')
    else
      $('#barcode-alert').remove()
      $('#barcode-submit-btn').prop('disabled', false);