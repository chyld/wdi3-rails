class Numb3rs
  @document_ready: ->
    Numb3rs.get_length_of_declaration()

  @get_length_of_declaration: ->
    settings =
      dataType: 'json'
      type: 'get'
      url: '/length'
    $.ajax(settings).done(Numb3rs.create_slider)

  @create_slider: (data) ->
    $('#slider').slider({ min: 0, max: data.length, step: 1, slide: Numb3rs.sliding })
    Numb3rs.get_data(0)
    setInterval(Numb3rs.display_random, 250)

  @display_random: ->
    max = $('#slider').slider('option', 'max')
    random = Math.floor(Math.random() * max)
    $('#slider').slider('option', 'value', random)
    Numb3rs.get_data(random)
    console.log(random)

  @get_data: (position) ->
    settings =
      dataType: 'json'
      type: 'get'
      url: "/data?position=#{position}"
    $.ajax(settings).done(Numb3rs.update_display)

  @sliding: (e, ui) ->
    Numb3rs.get_data(ui.value)

  @update_display: (data) ->
    $('#word').text(data.word)
    $('#hex').text(data.hex)
    $('#dec').text(data.dec)
    $('#bin').text(data.bin)

$(document).ready(Numb3rs.document_ready)
