# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$('#myModal').on 'shown.bs.modal', ->
  $('#myInput').focus()
  return


$('#myAlert').on 'closed.bs.alert', ->
  # do something…
  return
