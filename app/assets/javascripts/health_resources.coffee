# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('.review-rating').raty
    readOnly: true
    score: -> $(this).attr 'data-score'
    path: '/'

  $('.click').on 'click', ->
    if $('span').hasClass('fa-heart')
      $('.click').removeClass 'active'
      setTimeout (->
        $('.click').removeClass 'active-2'
        return
      ), 30
      $('.click').removeClass 'active-3'
      setTimeout (->
        $('span').removeClass 'fa-heart'
        $('span').addClass 'fa-heart-o'
        return
      ), 15
    else
      $('.click').addClass 'active'
      $('.click').addClass 'active-2'
      setTimeout (->
        $('span').addClass 'fa-heart'
        $('span').removeClass 'fa-heart-o'
        return
      ), 150
      setTimeout (->
        $('.click').addClass 'active-3'
        return
      ), 150
      $('.info').addClass 'info-tog'
      setTimeout (->
        $('.info').removeClass 'info-tog'
        return
      ), 1000
    return

  return




