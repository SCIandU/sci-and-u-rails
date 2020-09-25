# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('.storyVideo').on 'click', ->
    $(window).on 'click', ->
      if !(($('#story-video-box').data('bs.modal') || {}).isShown)
        $('#modalVideoFrame').attr 'src', ''
    $('#modalTitle').text $(this).attr('dataTitle')
    $('#modalVideoFrame').attr 'src', $(this).attr('dataSrc')
    $('#story-video-box').modal 'show'
    return
  return
