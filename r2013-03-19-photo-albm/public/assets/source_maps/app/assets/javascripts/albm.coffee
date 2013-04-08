class Home
  @document_ready: ->
    $('#form').on('click', 'a[data-clear-form]', Home.clear_form)
    photos = $('.photo').length
    $('#slider').slider({ min: 0, max: photos, step: 1, slide: Home.sliding })
    $('#slider').slider('option', 'value', photos)

  @clear_form: (e) ->
    e.preventDefault()
    $('#form').empty()

  @sliding: (e, ui) ->
    album_id = $('#album').data('album-id')
    count = ui.value
    settings =
      dataType: 'script'
      type: 'get'
      url: "/albums/#{album_id}/filter?count=#{count}"
    $.ajax(settings)

$(document).ready(Home.document_ready)
