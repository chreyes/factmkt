# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $("#fact").dynatable(
    table: 
      defaultColumnIdStyle: 'underscore'

    features:
      perPageSelect: false)

  $('.dtp').fdatepicker(
    format: 'dd/mm/yyyy')
