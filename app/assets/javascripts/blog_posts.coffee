# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('#text-resize-decrease').click ->
    fontSize = parseInt($(".content-to-resize").css("font-size"));
    decrease = -16*2/10;
    fontSize = fontSize + decrease;
    lineHeight = 10/11;
    if fontSize < 8
      fontSize = 8;
    $(".content-to-resize").css({'font-size': fontSize});
    $(".content-to-resize").css({'line-height': lineHeight});
    return
  $('#text-resize-increase').click ->
    fontSize = parseInt($(".content-to-resize").css("font-size"));
    # lineHeight = parseInt($(".content-to-resize").css("line-height"));
    increase = 16*2/10;
    fontSize = fontSize + increase;
    lineHeight = 1.1;
    if fontSize > 32
      fontSize = 32;
    $(".content-to-resize").css({'font-size': fontSize});
    $(".content-to-resize").css({'line-height': lineHeight});
    return
  return
