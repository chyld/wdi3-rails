class Virgin
  @document_ready: ->
    $('#nav').on('click', 'a[data-clear-user-form]', Virgin.clear_user_form)
    $('#form').on('click', 'a[data-clear-form]', Virgin.clear_form)
    $('#airplane').on('mouseenter', 'td.available', Virgin.seat_hover_enter)
    $('#airplane').on('mouseleave', 'td.available', Virgin.seat_hover_leave)
    $('#airplane').on('click', 'td.available', Virgin.purchase_ticket)

  @clear_user_form: (e) ->
    e.preventDefault()
    $('#user').remove()

  @clear_form: (e) ->
    e.preventDefault()
    $('#form').empty()

  @seat_hover_enter: ->
    $(this).addClass('seat-hover')

  @seat_hover_leave: ->
    $(this).removeClass('seat-hover')

  @purchase_ticket: ->
    token = $('#flight').data('auth-token')
    flight_id = $('#flight').data('flight-id')
    col = $(this).data('col')
    row = $(this).data('row')
    settings =
      dataType: 'script'
      type: "post"
      url: "/flights/#{flight_id}/purchase"
      data: {authenticity_token: token, col: col, row: row}
    $.ajax(settings)

$(document).ready(Virgin.document_ready)
