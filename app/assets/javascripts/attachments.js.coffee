$ ->
  $('#upload_files').fileupload
    add: (e, data) ->
      file = data.files[0]
      console.log data
      data.context = $(tmpl("template-upload", file))
      $('#uploading').append(data.context)
      jqXHR = data.submit()
      $(document).on 'click', 'button.remove', ->
        jqXHR.abort()
        $(this).closest('.row').remove()
    progress: (e, data) ->
      if data.context
        progress = parseInt(data.loaded / data.total * 100, 10)
        data.context.find('.progress-bar').css('width', progress + '%').text(progress + '%')
    done: (e, data) ->
      if data.context
        data.context.find('.remove').replaceWith('OK')