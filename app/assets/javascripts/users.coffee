# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  new AvatarCropper()

class AvatarCropper
  constructor: ->
    $('#cropbox').Jcrop
      aspectRatio: 1
      setSelect: [0, 0, 600, 600]
      onSelect: @update
      onChange: @update

  update: (coords) =>
    $('#user_crop_x').val(coords.x)
    $('#user_crop_y').val(coords.y)
    $('#user_crop_w').val(coords.w)
    $('#user_crop_h').val(coords.h)
    @updatePreview(coords)

  updatePreview: (coords) =>
    $('#preview').css
        width: Math.round(100/coords.w * $('#cropbox').width()) + 'px'
        height: Math.round(100/coords.h * $('#cropbox').height()) + 'px'
        marginLeft: '-' + Math.round(100/coords.w * coords.x) + 'px'
        marginTop: '-' + Math.round(100/coords.h * coords.y) + 'px'

$(document).ready ->

  $('.datepicker').datepicker({    
    format: 'mm/dd/yyyy',
    startView: 'years'    
    });

  # ------------------------------------------------------
  # pretty-fy the upload field
  # ------------------------------------------------------
  $realInputField = $('#user_profile_image')

  # drop just the filename in the display field
  $realInputField.change ->
    $('#file-display').val $(@).val().replace(/^.*[\\\/]/, '')

  # trigger the real input field click to bring up the file selection dialog
  $('#upload-btn').click ->
    $realInputField.click()
          
###
//= require cropper.min

ready = ->
  $image = $('#image')
  $modal = $('#modal')
  cropBoxData = undefined
  canvasData = undefined
  mime = undefined

  $modal.on 'shown.bs.modal', ->
    $image.cropper
      autoCropArea: 0.5
      built: ->
        $image.cropper 'setCanvasData', canvasData
        $image.cropper 'setCropBoxData', cropBoxData
        return
    return

  $modal.on 'hidden.bs.modal', ->
    cropBoxData = $image.cropper('getCropBoxData')
    canvasData = $image.cropper('getCanvasData')
    canvas = $image.cropper('getCroppedCanvas')
    $('#user_crop_x').val(cropBoxData.left)
    $('#user_crop_y').val(cropBoxData.top)
    $('#user_crop_w').val(cropBoxData.width)
    $('#user_crop_h').val(cropBoxData.height)
    $image.cropper 'destroy'
    return

  $('#image-file-field').change ->
    readURL this
    return

  readURL = (input) ->
    if (input.files && input.files[0])    
      mime = input.files[0].type
      reader = new FileReader()
      reader.onload = (e) ->
        $image.attr 'src', e.target.result
        $modal.modal 'show'

      reader.readAsDataURL input.files[0]

$(document).ready ready
$(document).on 'page:change', ready
###