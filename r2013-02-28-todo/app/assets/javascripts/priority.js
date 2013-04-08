function up_priority()
{
  var id = $(this).parent().siblings('.clear').prev().text();
  var token = $('input[name=authenticity_token]').val();

  $.ajax({
    dataType: 'json',
    type: "post",
    url: "/priorities/" + id + "/up",
    data: {authenticity_token:token}
  }).done(process_priority);
}

function down_priority()
{
  var id = $(this).parent().siblings('.clear').prev().text();
  var token = $('input[name=authenticity_token]').val();

  $.ajax({
    dataType: 'json',
    type: "post",
    url: "/priorities/" + id + "/down",
    data: {authenticity_token:token}
  }).done(process_priority);
}

function init_minicolors()
{
  var settings = {
    animationSpeed: 100,
    animationEasing: 'swing',
    change: null,
    changeDelay: 0,
    control: 'hue',
    defaultValue: '',
    hide: null,
    hideSpeed: 100,
    inline: false,
    letterCase: 'lowercase',
    opacity: false,
    position: 'default',
    show: null,
    showSpeed: 100,
    swatchPosition: 'left',
    textfield: false,
    theme: 'default'
};

  $('INPUT.minicolors').minicolors(settings);
}

function edit_priority()
{
  show_edit_form();

  var color = $(this).css('background-color');
  color = rgb2hex(color);
  $('input.minicolors').minicolors('value', color);
  var name = $(this).next();
  name = name.text();
  $('#name').val(name);
  var value = $(this).next().next().text();
  $('#value').val(value);
  var priority_id = $(this).next().next().next().text();
  $('#priority_id').val(priority_id);
}

function create_priority()
{
  var value = $('#value').val();
  var name = $('#name').val();
  var color = $('input.minicolors').minicolors('value');
  var token = $('input[name=authenticity_token]').val();

  $.ajax({
      dataType: 'json',
      type: "post",
      url: "/priorities",
      data: {authenticity_token:token, 'priority[color]':color, 'priority[name]':name, 'priority[value]':value}
    }).done(process_priority);

  return false;
}

function update_priority()
{
  var value = $('#value').val();
  var name = $('#name').val();
  var color = $('input.minicolors').minicolors('value');
  var token = $('input[name=authenticity_token]').val();
  var priority_id = $('#priority_id').val();

  $.ajax({
      dataType: 'json',
      type: "post",
      url: "/priorities/" + priority_id,
      data: {_method:'put', authenticity_token:token, 'priority[color]':color, 'priority[name]':name, 'priority[value]':value}
    }).done(process_priority);

  return false;
}

function process_priority(priority_list)
{
  _.each(priority_list, add_priority_to_array);
  $('ul#priorities').empty();
  _.each(priorities, display_priority);
}

function display_priority(priority)
{
  var li = $('<li>');
  var div1 = $('<div>');
  var div2 = $('<div>');
  var div3 = $('<div>');
  var div4 = $('<div>');
  var div5 = $('<div>');
  var div6 = $('<div>');

  var img1 = $('<img>');
  var img2 = $('<img>');
  img1.addClass('up');
  img1.attr('src', '/assets/famfamfam/add.png')
  img2.addClass('down');
  img2.attr('src', '/assets/famfamfam/delete.png')
  div1.append([img1, img2]);

  div1.addClass('priority');
  div2.addClass('priority').addClass('color');
  div3.addClass('priority');
  div4.addClass('priority').addClass('hide');
  div5.addClass('priority').addClass('hide');
  div6.addClass('clear');

  div2.css('background-color', priority.color);
  div3.text(priority.name);
  div4.text(priority.value);
  div5.text(priority.id);

  li.append([div1, div2, div3, div4, div5, div6]);
  $('#priorities').append(li);

  hide_priority_form();
}

function add_priority_to_array(priority)
{
  priorities = _.reject(priorities, function(p){return p.id == priority.id;});
  priorities.push(priority);
  priorities = _.sortBy(priorities, function(p){ return p.value; }).reverse();
}

function hide_priority_form()
{
  $('#new_priority').show();
  $('.priorityform').hide();
}

function show_new_priority_form()
{
  $('#new_priority').hide();
  $('.priorityform').show();
  $('#create_priority').show();
  $('#update_priority').hide();
  $('#name').val('');
  $('#value').val('')
  $('input.minicolors').minicolors('value', '#ffffff');
  $('#name').focus();
}

function show_edit_form()
{
  $('#new_priority').hide();
  $('.priorityform').show();
  $('#create_priority').hide();
  $('#update_priority').show();
  $('#name').focus();
}

function add_color_boxes()
{
  $('.color').each(change_text_to_color);
}

function change_text_to_color(index, element)
{
  var box = $(element);
  var color = box.text();

  box.removeClass('hide');
  box.css('background-color', color);
  box.text('');
}

function rgb2hex(rgb)
{
 rgb = rgb.match(/^rgb\((\d+),\s*(\d+),\s*(\d+)\)$/);
 return "#" +
  ("0" + parseInt(rgb[1],10).toString(16)).slice(-2) +
  ("0" + parseInt(rgb[2],10).toString(16)).slice(-2) +
  ("0" + parseInt(rgb[3],10).toString(16)).slice(-2);
}
