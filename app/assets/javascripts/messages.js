// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
document.addEventListener("DOMContentLoaded", function(){
  var button2 = document.querySelector("#ticketMaster")
  var topic = document.querySelector(".topic")

if (button2){
  button2.addEventListener("click", function(event){
    event.preventDefault()
    $.ajax({
      url: "/find_event",
      method: "GET",
      dataType: 'json',
      data: { topic: topic.id }
    }).done(function(data){
      console.log(data["_embedded"]);
      if (data["_embedded"]=== undefined || data["_embedded"]["attractions"][0]["url"] === undefined){
        alert("No events for this Subject Nearby");
        window.location.replace("/surveys")
      }else{
        window.location.replace(data["_embedded"]["attractions"][0]["url"]);
      }
    })
  })
}
})
