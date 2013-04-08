$(function(){

  $('#flickr').click(search_flickr);
  $('#clear').click(clear_photos);

});

var search;
var timer;
var index;
var photos;
var page = 1;
var per_page = 500;

function search_flickr()
{
  search = $('#search').val();
  query();
}

function query()
{
  $.getJSON('http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=4c6e1f137bbeb666a1c0a884b609e286&text=' + search + '&per_page=' + per_page + '&page=' + page + '&format=json&jsoncallback=?', results);
}

function results(data)
{
  var sec = parseInt($('#duration').val());
  var msec = sec * 1000;
  index = 0;
  timer = setInterval(display_photo, msec);
  photos = data.photos.photo;
}

function display_photo()
{
  photo = photos[index];
  var width = $('#width').val();
  var height = $('#height').val();
  var url = "url(http://farm"+ photo.farm +".static.flickr.com/"+ photo.server +"/"+ photo.id +"_"+ photo.secret +"_m.jpg)";
  var image = $('<div>');
  image.addClass('image');
  image.css({'width' : width, 'height' : height, 'background-image' : url});
  $('#images').prepend(image);
  index++;

  if(index == per_page)
  {
    page++;
    clearInterval(timer);
    query();
  }
}

function clear_photos()
{
  $('#images').empty();
}
