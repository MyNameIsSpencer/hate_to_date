

//  ========== Google Maps ==============
initShowMap = function() {

  console.log('This is the start of the User Show map')

// Parsing the logged in User's info from the JSON tag and set Radius
  var loggedUserLatLng = document.getElementById('current_guy');
  var loggedUserLat = JSON.parse(loggedUserLatLng.dataset.latitude);
  var loggedUserLng = JSON.parse(loggedUserLatLng.dataset.longitude);
  var myRadius = 10000;

  // var distance = document.getElementById('distance');
  // console.log(loggedUserLatLng);
  // console.log(loggedUserLat);
  // console.log(loggedUserLng);

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

// Convert tag to usable info
   var fsaElement = document.getElementById('fsa_data');
   var fsaData = JSON.parse(fsaElement.dataset.fsa);
   // console.log(fsaElement);
   // console.warn(fsaData);
   var fsaPopulations = {}


// Get User data from tag
  var usersLocElement = document.getElementById('user_locations');
  var usersData = JSON.parse(usersLocElement.dataset.userLocation);
  var radUsers = []

populateRadMap(usersData, radUsers, map, myRadius, loggedUserLat, loggedUserLng)
// //**
// // Iterate through Users and find distance from current User
//   for (i = 0; i < usersData.length; i ++) {
//     var iUser = usersData[i];
//     var destinationLat = iUser.latitude
//     var destinationLng = iUser['longitude']
//     var fromUserDistance = calcDistance(loggedUserLat, loggedUserLng, destinationLat, destinationLng);
//     if (fromUserDistance <= myRadius) {
//       radUsers.push(iUser);
//     }
//   }
//
// //**
//   var radFsas = [];
//   for (var i = 0; i < radUsers.length; i ++) {
//     if (!(radUsers[i]['fsa_name'] in radFsas)){
//       hasher = {};
//       hasher['fsa_name'] = radUsers[i]['fsa_name'];
//       hasher['latitude'] = radUsers[i]['latitude'];
//       hasher['longitude'] = radUsers[i]['longitude'];
//       hasher['count'] = 0;
//       radFsas.push(hasher);
//     }
//   }
//
// //**
//   //Make circles for each fsa within radius, size depending on number of Users
//     for (var i = 0; i < radFsas.length; i++) {
//       for (var j = 0; j < radUsers.length; j++) {
//         if (radFsas[i]['fsa_name'] === radUsers[j]['fsa_name']) {
//           radFsas[i]['count'] += 1;
//         }
//       }
//     }
//     for (var i = 0; i < radFsas.length; i ++) {
//       later = radFsas[i]['latitude']
//       longer = radFsas[i]['longitude']
//       fsaPop = radFsas[i]['count']
//       new google.maps.Circle({
//         strokeColor: 'deeppink',
//         strokeOpacity: 1,
//         strokeWeight: 2,
//         fillColor: 'deeppink',
//         fillOpacity: 0.6,
//         center: {lat: later, lng: longer},
//         map: map,
//         radius: fsaPop * 100
//       });
//     }
//
// //**
// // Draw rad circle
//       new google.maps.Circle({
//         strokeColor: 'deeppink',
//         strokeOpacity: 0.7,
//         strokeWeight: 2,
//         fillColor: 'deeppink',
//         fillOpacity: 0.2,
//         center: {lat: loggedUserLat, lng: loggedUserLng},
//         map: map,
//         radius: myRadius
//       });

 }
