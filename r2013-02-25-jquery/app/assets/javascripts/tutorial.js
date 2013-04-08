$(function(){

  $('#btn').click(cool_popup);
  $('#btncolor').click(backgroundcolor);
  $('#btnhide').click(hideme);
  $('#btnshow').click(showme);
  $('#btnarea').click(compute_area);

});

function compute_area()
{
  var width = parseFloat($('#width').val());
  var height = parseFloat($('#height').val());
  var a = area(width, height);
  $('#area').text(a + 'sqft');
  if(a < 100)
    $('#area').addClass('success');
  else
    $('#area').addClass('alert');
}

function area(width, height)
{
  return width * height;
}

function hideme()
{
  $('h1').hide();
}

function showme()
{
  $('h1').show();
}

function backgroundcolor()
{
  var color = $('#color').val();
  $('body').css('background-color', color);
}

function cool_popup()
{
  var name = $('#name').val();
  alert(name + ', you have won 1 billion dollars!!!');
}
