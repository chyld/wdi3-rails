game =
  selected: null
  timer: 0
  counter: 0
  ready: ->
    $('#reset').click(game.reset)
    $('#start').click(game.start)
    $('td').click(game.move)
  reset: (e) ->
    e.preventDefault()
    clearInterval(game.timer)
    game.counter = 0
    $('td').empty()
    $('#status').text('')
    $('#count').val('')
    $('#count').focus()
  start: (e) ->
    e.preventDefault()
    count = parseInt $('#count').val()
    $('#a').append("<div class=disc style=width:#{x*10}px;>") for x in [1..count]
    clearInterval(game.timer)
    game.timer = setInterval(game.clock, 1000)
  clock: ->
    game.counter++
    $('#timer').text(game.counter)
  move: ->
    if game.selected?
      disc = $(game.selected).children('div:nth-child(1)').detach()
      $(this).prepend(disc)
      $('#status').text "You moved the selected disc to the #{this.id} rod"
      game.selected = null
    else
      $('#status').text "You selected the #{this.id} rod"
      game.selected = this

$(document).ready(game.ready)
