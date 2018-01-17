// ******* Have yet to pass distance to html
//  ========== Google Maps ==============
initChatMap = function() {
  console.log('Start of the Chat Map')

// Parsing the logged in User's info from the JSON tag and set Radius
  var loggedUserLatLng = document.getElementById('current_guy');
  var loggedUserLat = JSON.parse(loggedUserLatLng.dataset.latitude);
  var loggedUserLng = JSON.parse(loggedUserLatLng.dataset.longitude);
  var receiverLatLng = document.getElementById('receiver_guy');
  var receiverLat = JSON.parse(receiverLatLng.dataset.latitude);
  var receiverLng = JSON.parse(receiverLatLng.dataset.longitude);
  console.log(receiverLatLng);
  console.log(receiverLat);
  console.log(receiverLng);

// Caculate distance between User and Recevier
  var userReceiverDistance = calcDistance(loggedUserLat, loggedUserLng, receiverLat, receiverLng);

// ****** Pass distance to tag *******
  function callback(response) {

  }

// Put the map into the #map div
  var map;
    map = new google.maps.Map(document.getElementById('map'), {
      center: {lat: loggedUserLat, lng: loggedUserLng},
      zoom: 12,
      styles: purple
    });

// Put Marker at User's fsa
    var marker = new google.maps.Marker({
     position: {lat: loggedUserLat, lng: loggedUserLng},
     map: map,
     title: 'Hello World!'
    });

// Put Marker at Receiver's fsa
    var marker = new google.maps.Marker({
     position: {lat: receiverLat, lng: receiverLng},
     map: map,
     title: 'Hello World!'
    });

// Draw Polyline from User to Receiver fsa
   var differenceCoordinates = [
     {lat: loggedUserLat, lng: loggedUserLng},
     {lat: receiverLat, lng: receiverLng},
   ];
   var differenceLine = new google.maps.Polyline({
     path: differenceCoordinates,
     geodesic: true,
     strokeColor: 'deeppink',
     strokeOpacity: 1.0,
     strokeWeight: 4
   });
   differenceLine.setMap(map);


// ====== Not sure about this V
   callback();

   function callback(response, status) {``
     var results = response.rows[0].elements[0]['distance']['text'];
     distanceText.innerText = ('You are about  ' + results + '  apart');
   };

 }
