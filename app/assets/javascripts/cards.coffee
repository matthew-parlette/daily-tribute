# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Card
$ ->
  $('#show').on 'click', ->
    $('.card-reveal').slideToggle 'slow'
    return
  $('.card-reveal .close').on 'click', ->
    $('.card-reveal').slideToggle 'slow'
    return
  return