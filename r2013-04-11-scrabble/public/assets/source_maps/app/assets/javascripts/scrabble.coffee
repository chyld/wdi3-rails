window.app =
  token: null
  selected_cell: null
  selected_channel: null
  selected_letter: null
  selected_letter_box: null
  pusher: null
  ready: ->
    app.token = $('#auth_token').data('auth-token')
    $('#channels').on('click', '.channel', app.select_cell)
    $('#chat_console').on('click', '#chat_button', app.send_chat)
    $('#game_center').on('click', '.letter', app.select_letter)
    $('#game_center').on('click', '.square', app.transmit_letter)
    app.pusher = new Pusher('3a852337fd2551e668fc')
  select_cell: ->
    app.selected_cell.removeClass('selected_cell') if app.selected_cell
    if app.selected_cell && (app.selected_cell[0] == this)
      app.selected_cell = null
    else
      app.selected_cell = $(this)
      app.selected_cell.addClass('selected_cell')
      app.select_channel(app.selected_cell.text())
  select_channel: (name) ->
    app.pusher.unsubscribe(app.selected_channel) if app.selected_channel
    app.pusher.subscribe(name)
    app.selected_channel = name
    app.bind_events()
  bind_events: ->
    channel = app.pusher.channels.channels[app.selected_channel]
    channel.bind('chat', app.chat)
    channel.bind('joingame', app.joingame)
    channel.bind('move_letter', app.move_letter)
    channel.bind('players_turn', app.players_turn)
  chat: (data) ->
    message = $('<div class="message">')
    message.text(data)
    $('#chat_message_list').prepend(message)
  send_chat: (e) ->
    e.preventDefault()
    $('#chat_channel').val(app.selected_channel)
    form = $(this).parent()
    form.submit()
    $('#chat_message').val('').focus()
  start_game: ->
    settings =
      dataType: 'script'
      type: "post"
      url: "/start_game"
      data: {authenticity_token: app.token, channel: app.selected_channel}
    $.ajax(settings)
  joingame: (data) ->
    settings =
      dataType: 'script'
      type: "get"
      url: "/refresh_players/#{app.selected_channel}"
    $.ajax(settings)
  select_letter: ->
    app.selected_letter_box = $(this)
    app.selected_letter = $(this).text()
    $('.letter').removeClass('selected_letter')
    $(this).addClass('selected_letter')
  transmit_letter: ->
    row = $(this).data('row')
    col = $(this).data('col')
    settings =
      dataType: 'json'
      type: "post"
      url: "/transmit_letter"
      data: {authenticity_token: app.token, channel: app.selected_channel, letter: app.selected_letter, row: row, col: col}
    $.ajax(settings).done(app.remove_letter)
  remove_letter: (data) ->
    if data.response
      app.selected_letter_box.text('').removeClass('selected_letter')
  move_letter: (data) ->
    $(".square[data-col=#{data.col}][data-row=#{data.row}]").text(data.letter)
  next_player: ->
    settings =
      dataType: 'script'
      type: "post"
      url: "/next_player"
      data: {authenticity_token: app.token, channel: app.selected_channel}
    $.ajax(settings)
  players_turn: (data) ->
    settings =
      dataType: 'script'
      type: "get"
      url: "/refresh_players/#{app.selected_channel}"
    $.ajax(settings)
  grab_letters: ->
    letters = $('.letter').text()
    settings =
      dataType: 'script'
      type: "post"
      url: "/grab_letters"
      data: {authenticity_token: app.token, channel: app.selected_channel, letters: letters}
    $.ajax(settings)

$(document).ready(app.ready)
