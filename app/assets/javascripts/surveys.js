// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
document.addEventListener("DOMContentLoaded", function() {
  var button = document.querySelector('button')
  var questionCounter = 0
  var imageHolder = document.createElement('div')
  button.addEventListener('click', function(event){
    event.preventDefault()
    imageHolder.innerHTML = ""
    $.ajax({
      url: "https://api.giphy.com/v1/gifs/search?api_key=RS4WEditBF6Ig0jzs1zJWbqTha5EPUo0&q=" + key[questionCounter] + "&rating=g" ,
      method: 'GET',
      dataType: 'json'
    }).done(function(data){
      var image1 = document.createElement('img')
      image1.className = "left"
      image1.src = data["data"][Math.floor(Math.random()*data["data"].length)]["images"]["fixed_height_still"]["url"];
      image1.addEventListener('click', choose)
      $.ajax({
        url: "https://api.giphy.com/v1/gifs/search?api_key=RS4WEditBF6Ig0jzs1zJWbqTha5EPUo0&q=" + value[questionCounter] + "&rating=g" ,
        method: 'GET',
        dataType: 'json'
      }).done(function(data2){
        var image2 = document.createElement('img')
        image2.className = "right"
        image2.src = data2["data"][Math.floor(Math.random()*data["data"].length)]["images"]["fixed_height_still"]["url"];
        image2.addEventListener('click', choose)
        imageHolder.append(image1)
        imageHolder.append(image2)
        document.body.append(imageHolder)
        questionCounter ++
      })
    })
  })
  var choose = function makeSelection(){
    console.log(this.className);
  }

});
