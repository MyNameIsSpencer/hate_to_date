// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
function initMap() {
  console.log('init Map');
}

document.addEventListener('DOMContentLoaded', function(){
console.log("what");
var register = document.querySelector('.register');
var modal = document.querySelector('.modal');
var modal2 = document.querySelector('.modal2');
var next = document.querySelector('.next');
// to display sign in block
register.addEventListener('click', function()
{
  modal.style.display = 'block';
  register.style.display = 'none'
}
)

next.addEventListener('click', function(e)
{
  console.log("ok");
  modal.style.display = 'none';
  modal2.style.display = 'block';
  e.preventDefault();
}
)




})
