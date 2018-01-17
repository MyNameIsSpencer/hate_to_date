

//  ========== Google Maps ==============
initShowMap = function() {

  console.log('This is the User Show map')
  var loggedUserLatLng = document.getElementById('current_guy');
  var loggedUserLat = JSON.parse(loggedUserLatLng.dataset.latitude);
  var loggedUserLng = JSON.parse(loggedUserLatLng.dataset.longitude);
  var distance = document.getElementById('distance');
  var myRadius = 12000;
  // console.log(loggedUserLatLng);
  // console.log(loggedUserLat);
  // console.log(loggedUserLng);


  var map;
    map = new google.maps.Map(document.getElementById('map'), {
      center: {lat: 43.647219, lng: -79.387905},
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

// Counting number of Users in each fsa
   for (i = 0; i < fsaData.length; i ++) {
     var currentFsa = fsaData[i];
     if (fsaPopulations[currentFsa['fsa_name']] > 0) {
       fsaPopulations[currentFsa['fsa_name']] += 1;
     } else {
       fsaPopulations[currentFsa['fsa_name']] = 1;
     }
   }



// Radius


  var usersLocElement = document.getElementById('user_locations');
  var usersData = JSON.parse(usersLocElement.dataset.userLocation);
  var radUsers = []



// Iterate through Users and find distance from current User
  for (i = 0; i < usersData.length; i ++) {
    var iUser = usersData[i];
    var destinationLat = iUser.latitude
    var destinationLng = iUser['longitude']
    var fromUserDistance = calcDistance(loggedUserLat, loggedUserLng, destinationLat, destinationLng);
    if (fromUserDistance <= myRadius) {
      radUsers.push(iUser);
    }
  }
console.log(radUsers);

  var fsaElement = document.getElementById('fsa_data');
  var fsaData = JSON.parse(fsaElement.dataset.fsa);
  // console.warn(fsaData);
  var fsaPopulations = {}



  var radFsas = [];
  for (var i = 0; i < radUsers.length; i ++) {
    if (!(radUsers[i]['fsa_name'] in radFsas)){
      hasher = {};
      hasher['fsa_name'] = radUsers[i]['fsa_name'];
      hasher['latitude'] = radUsers[i]['latitude'];
      hasher['longitude'] = radUsers[i]['longitude'];
      hasher['count'] = 0;
      radFsas.push(hasher);
    }
  }


  //Make circle for each fsa, size depending on number of Users
    for (var i = 0; i < radFsas.length; i++) {
      for (var j = 0; j < radUsers.length; j++) {
        if (radFsas[i]['fsa_name'] === radUsers[j]['fsa_name']) {
          radFsas[i]['count'] += 1;
        }
      }
    }



    for (var i = 0; i < radFsas.length; i ++) {
      later = radFsas[i]['latitude']
      longer = radFsas[i]['longitude']
      pop = radFsas[i]['count']
      new google.maps.Circle({
        strokeColor: 'deeppink',
        strokeOpacity: 1,
        strokeWeight: 2,
        fillColor: 'deeppink',
        fillOpacity: 0.6,
        center: {lat: later, lng: longer},
        map: map,
        radius: pop * 200
      });
    }





console.log('Bottom of Map');
 }
