// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

document.addEventListener('DOMContentLoaded', function(){
var modal = document.querySelector('.modal');
var modal2 = document.querySelector('.modal2');
var next = document.querySelector('.next');

var userModal = document.querySelector('.user_modal');

if(next){
  next.addEventListener('click', function(e)
  {
    modal.style.display = 'none';
    modal2.style.display = 'block';
    e.preventDefault();
  })
}




})
