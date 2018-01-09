// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
document.addEventListener("DOMContentLoaded", function() {
  var button = document.querySelector('button')
  var questionCounter = 0
  var result = []
  var imageHolder = document.createElement('div')


  var choose = function makeSelection(){
  // shovels the user's choice into a results array
    result.push(this.className);
    questionCounter ++
    // if the user has made all choices, he is redirected away from the survey page
    if (questionCounter < key.length){
      pictureMaker()
    } else {
      $.ajax({
      method: "POST",
      url: "/users/results",
      data: { results: { user_id: current_user, survey_id: survey_id, answers: result } },
    }).done(function(data){
        window.location.replace('/users')
    })

    }
  }

  var pictureMaker = function loadPictures(){
    imageHolder.innerHTML = ""
    $.ajax({
      url: "https://api.giphy.com/v1/gifs/search?api_key="+giphyKey+"&q=" + key[questionCounter] + "&rating=g" ,
      method: 'GET',
      dataType: 'json'
    }).done(function(data1){
      var image1 = document.createElement('img')
      image1.className = "left"
      image1.src = data1["data"][Math.floor(Math.random()*data1["data"].length)]["images"]["fixed_height_still"]["url"];
      image1.addEventListener('click', choose)
      $.ajax({
        url: "https://api.giphy.com/v1/gifs/search?api_key="+giphyKey+"&q=" + value[questionCounter] + "&rating=g" ,
        method: 'GET',
        dataType: 'json'
      }).done(function(data2){
        var image2 = document.createElement('img')
        image2.className = "right"
        image2.src = data2["data"][Math.floor(Math.random()*data2["data"].length)]["images"]["fixed_height_still"]["url"];
        image2.addEventListener('click', choose)
        imageHolder.append(image1)
        imageHolder.append(image2)
        document.body.append(imageHolder)
      })
    })
  }

  button.addEventListener('click', function(event){
    event.preventDefault()
    pictureMaker()
  });

});
