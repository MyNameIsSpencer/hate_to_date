 // # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
document.addEventListener("DOMContentLoaded", function() {
  var button = document.querySelector('#start_survey')
  var questionCounter = 0
  var result = []
  var imageHolder = document.createElement('div')
  var survey_id = parseInt(window.location.pathname.replace('/surveys/', ''))
  var userId= $("#user").val()

  function makeSelection(count){

  // shovels the user's choice into a results array
    result.push(event.target.className);
    questionCounter ++
    // if the user has made all choices, he is redirected away from the survey page
    if (questionCounter < count){
      pictureMaker()
    } else {
      $.ajax({
      method: "POST",
      url: "/users/"+userId+"/results",//issue is here
      data: { results: { survey_id: survey_id, answers: result } },
    }).done(function(data){
        window.location.replace('/users/'+userId+'/matches')
    })

    }
  }
  var pictureMaker = function loadPictures(){
    imageHolder.innerHTML = ""
    $.ajax({
      url: "/surveys/"+survey_id+"/load_pictures",
      method: 'GET',
      dataType: 'json',
      data: { number: questionCounter}
    }).done(function(data){
      var image1 = document.createElement('img')
      var image1title = document.createElement('span')
      var image1holder = document.createElement('div')
      image1holder.className = "survey col-xs-6"
      image1.className = "left"
      image1.src = data[0]["data"][Math.floor(Math.random()*5)]["images"]["fixed_height"]["url"];
      image1.alt = data[3]
      image1title.innerText = data[3]
      var image2 = document.createElement('img')
      var image2title = document.createElement('span')
      var image2holder = document.createElement('div')
      image2holder.className = "survey col-xs-6"
      image2.className = "right"
      image2.src = data[1]["data"][Math.floor(Math.random()*5)]["images"]["fixed_height"]["url"];
      image2.alt = data[4]
      image2title.innerText = data[4]
      image1holder.append(image1)
      image1holder.append(image1title)
      imageHolder.append(image1holder)
      image2holder.append(image2)
      image2holder.append(image2title)
      imageHolder.append(image2holder)
      // document.body.append(imageHolder)
      $( ".row" ).append( imageHolder);
      image1.addEventListener('click', function(event){
        makeSelection(data[2])
      });
      image2.addEventListener('click', function(event){
        makeSelection(data[2])
      });
    })
  }

if (button){
  button.addEventListener('click', function(event){
    event.preventDefault()
    pictureMaker()
    $( "#map" ).css({ display: "hidden" });
    button.style.display = "none"
  });
}
});
