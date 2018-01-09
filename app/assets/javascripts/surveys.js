// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
document.addEventListener("DOMContentLoaded", function() {
  var button = document.querySelector('button')
  var questionCounter = 0
  var results = []
  var imageHolder = document.createElement('div')
  button.addEventListener('click', function(event){
    event.preventDefault()
<<<<<<< HEAD
      imageHolder.innerHTML = ""
=======
    imageHolder.innerHTML = ""
    $.ajax({
      url: "https://api.giphy.com/v1/gifs/search?api_key=RS4WEditBF6Ig0jzs1zJWbqTha5EPUo0&q=" + key[questionCounter] + "&rating=g" ,
      method: 'GET',
      dataType: 'json'
    }).done(function(data1){
      var image1 = document.createElement('img')
      image1.className = "left"
      image1.src = data1["data"][Math.floor(Math.random()*data1["data"].length)]["images"]["fixed_height_still"]["url"];
      image1.addEventListener('click', choose)
>>>>>>> 75b69e3fe740aadcb6f9777192d9cf6681eddc2e
      $.ajax({
        url: "https://api.giphy.com/v1/gifs/search?api_key=RS4WEditBF6Ig0jzs1zJWbqTha5EPUo0&q=" + key[questionCounter] + "&rating=g" ,
        method: 'GET',
        dataType: 'json'
<<<<<<< HEAD
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

        })
=======
      }).done(function(data2){
        var image2 = document.createElement('img')
        image2.className = "right"
        image2.src = data2["data"][Math.floor(Math.random()*data2["data"].length)]["images"]["fixed_height_still"]["url"];
        image2.addEventListener('click', choose)
        imageHolder.append(image1)
        imageHolder.append(image2)
        document.body.append(imageHolder)
        questionCounter ++
>>>>>>> 75b69e3fe740aadcb6f9777192d9cf6681eddc2e
      })

  })
  var choose = function makeSelection(){
  // shovels the user's choice into a results array
    results.push(this.className);
    questionCounter ++
    // if the user has made all choices, he is redirected away from the survey page
    if (questionCounter > key.length)
    window.location.replace('/surveys');
    }

});
