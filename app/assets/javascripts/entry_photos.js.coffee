$ ->
  window.hide_photo_add = ->
    $('.entry_photos .add_sign').hide()
  window.show_photo_add = ->
    $('.entry_photos .add_sign').show()
  if($('#new_entry_photo').length > 0)
    if($('.entry_photos li').length > 11)
      hide_photo_add()
    $('#entry_photo_photo').attr('name','entry_photo[photo]')
    $('#new_entry_photo').hide()
    $('.entry_photos .add_sign').click ->
      $('#entry_photo_photo').click()
    $('#new_entry_photo').fileupload
      dataType: 'script'
      add: (e, data) ->
        types = /(\.|\/)(gif|jpe?g|png)$/i
        file = data.files[0]
        if types.test(file.type) || types.test(file.name)
          data.context = $(tmpl("template-upload", file))
          $('#new_upload').append(data.context)
          data.submit()
        else
          alert("#{file.name} - #{$('#new_entry_photo .error_text.format').text()}")
      progress: (e, data) ->
        if data.context
          progress = parseInt(data.loaded / data.total * 100, 10)
          data.context.find('.bar').css('width', progress + '%')