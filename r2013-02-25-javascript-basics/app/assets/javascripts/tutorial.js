/*
multi-line comment
alert('hello world');
*/

// single line comment

var first = prompt('enter your name?');
//alert('you just entered in' + first);
console.log('you just entered in ' + first);

var age = prompt('enter your age?');
age = parseInt(age);

if(age < 18)
{
  console.log('you are a minor');
}
else
{
  console.log('you are a major');
}

switch(age)
{
  case 10:
    console.log('you are 10');
    break;
  case 20:
    console.log('you are 20');
    break;
  case 30:
    console.log('you are 30');
    break;
  default:
    console.log('age not specified');
}

var colors = [];
var color = prompt('enter a color?');

while(color != 'q')
{
  colors.push(color);
  color = prompt('enter a color?');
}

for(var index = 0; index < colors.length; index++)
{
  console.log('the color is : ' + colors[index]);
}

function square(number)
{
  return (number * number);
}

function cube(number)
{
  return (square(number) * number)
}

function area(length, width)
{
  return (length * width);
}

function get_number(message)
{
  return parseInt(prompt(message));
}

var response = prompt('(s)quare, (c)ube, (a)rea or (q)uit?');
while(response != 'q')
{
  switch(response)
  {
    case 's':
      var squared = square(get_number('enter number to square?'));
      console.log('the square is : ' + squared)
      break;
    case 'c':
      var cubed = cube(get_number('enter number to cube?'));
      console.log('the cube is : ' + cubed)
      break;
    case 'a':
      var length = get_number('enter length?');
      var width = get_number('enter width?');
      console.log('the area is : ' + area(length, width));
      break;
  }
  response = prompt('(s)quare, (c)ube, (a)rea or (q)uit?');
}


























