$(function(){
  $('#add_color').click(add_color);
  $('#add_image').click(add_image);
  $('#clear_colors').click(clear_colors);
  $('#colors').on('click', '.box', set_color);
  $('#canvas').on('mouseover', '.paint', paint_color);
  $('#images').on('click', '.image_box', set_image);
  create_paint_boxes();
});

function set_image()
{
  var box = $(this);
  var image = box.css('background-image');
  $('#canvas').css('background-image', image);
}

function add_image()
{
  var image = $('<div>');
  image.addClass('image_box');
  var url = $('#image').val();
  image.css('background-image', 'url('+url+')');
  $('#images').prepend(image);
  $('#image').val('');
  $('#image').focus();
}

function paint_color()
{
  var color = $('#selected').css('background-color');
  var box = $(this);
  box.css('background-color', color);
}

function create_paint_boxes()
{
  for(var i = 0; i < 2000; i++)
  {
    var paint = $('<div>');
    paint.addClass('paint');
    $('#canvas').prepend(paint);
  }
}

function clear_colors()
{
  $('#colors').empty();
  $('#selected').css('background-color', 'white');
}

function set_color()
{
  var box = $(this);
  $('#selected').css('background-color', box.css('background-color'));
}

function add_color()
{
  var color = $('#color').val();
  var box = $('<div>');
  box.addClass('box');
  box.css('background-color', color);
  $('#colors').prepend(box);
  $('#color').val('');
  $('#color').focus();
}
