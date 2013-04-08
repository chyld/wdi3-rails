$(function(){

  $('#user_form').on('click', '#cancel_user_form', cancel_user_form);
  $('#stock_form').on('click', '#cancel_stock_form', cancel_stock_form);

});

function start_timer()
{
  setInterval(get_quotes, 1000);
}

function get_quotes()
{
  $.ajax({
      dataType: 'json',
      type: "get",
      url: "/stocks/quotes"
  }).done(process_quotes);
}

function process_quotes(quote_list)
{
  _.each(quote_list, add_to_quotes);
  _.each(quote_list, add_chart_element);
  _.each(quote_list, add_check_boxes);
  _.each(quote_list, clear_chart);
  _.each(quote_list, display_chart);
  _.each(quote_list, display_metadata);
}

function add_to_quotes(quote)
{
  quotes[quote.symbol] = quotes[quote.symbol] || [];
  quotes[quote.symbol].push(quote);
  if(quotes[quote.symbol].length > 100) quotes[quote.symbol].shift();
}

function add_chart_element(quote)
{
  if(!$('#' + quote.symbol).length)
    $('#graphs').append('<div id=' + quote.symbol + '>');
}

function add_check_boxes(quote)
{
  if(!$('#' + quote.symbol + '_box').length)
  {
    var div = $('<div class="checkbox">');
    var text = $('<span><small>' + quote.symbol + '</small></span>');
    var checkbox = $('<input type=checkbox id=' + quote.symbol + '_box' + '>');
    div.append([checkbox, text]);
    $('#checkboxes').append(div);
  }
}

function clear_chart(quote)
{
  $('#' + quote.symbol).empty();
}

function display_chart(quote)
{
  if($('#' + quote.symbol + '_box').is(':checked'))
  {
    var graph = $('<div>');
    graph.attr('id', quote.symbol + '_graph');
    graph.addClass('graph');

    $('#' + quote.symbol).append(graph);

    new Morris.Line({
      element: quote.symbol + '_graph',
      data: quotes[quote.symbol],
      xkey: 'time',
      ykeys: ['quote'],
      labels: [quote.symbol],
      ymin: 'auto',
      ymax: 'auto'
    });
  }
  else
  {
    $('#' + quote.symbol).remove();
  }
}

function display_metadata(quote)
{
  var current = quote.quote * quote.shares;
  var initial = quote.purchase_price * quote.shares;
  var delta = current - initial;

  var table = $('<table>');
  var tr1 = $('<tr>');
  var th1 = $('<th>current</th>');
  var th2 = $('<th>initial</th>');
  var th3 = $('<th>delta</th>');
  var tr2 = $('<tr>');
  var td1 = $('<td>' + accounting.formatMoney(current) + '</td>');
  var td2 = $('<td>' + accounting.formatMoney(initial) + '</td>');
  var td3 = $('<td>' + accounting.formatMoney(delta) + '</td>');

  tr1.append([th1, th2, th3]);
  tr2.append([td1, td2, td3]);
  table.append([tr1, tr2]);

  $('#' + quote.symbol).append(table);
  $('#' + quote.symbol).append('<div class=clear>');
}

function cancel_user_form()
{
  $('#user_form').empty();
}

function cancel_stock_form()
{
  $('#stock_form').empty();
}
