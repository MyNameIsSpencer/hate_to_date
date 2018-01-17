
initFirstMap = function() {
  console.log('This is the Map');
//========== Google Maps Start ==========

// Bitmaker coordinates for the index page
  var loggedUserLat = 43.647219
  var loggedUserLng = -79.387905


  var distance = document.getElementById('distance');
  // console.log(loggedUserLatLng);
  // console.log(loggedUserLat);
  // console.log(loggedUserLng);


  var map;
    map = new google.maps.Map(document.getElementById('map'), {
      center: {lat: 43.647219, lng: -79.387905},
      zoom: 12,
      styles: purple
    });

   var fsaElement = document.getElementById('fsa_data');
   var fsaData = JSON.parse(fsaElement.dataset.fsa);
   // console.warn(fsaData);
   var fsaPopulations = {}

   for (i = 0; i < fsaData.length; i ++) {
     var currentFsa = fsaData[i];
     if (fsaPopulations[currentFsa['fsa_name']] > 0) {
       fsaPopulations[currentFsa['fsa_name']] += 1;
     } else {
       fsaPopulations[currentFsa['fsa_name']] = 1;
     }
   }

   for (var key in fsaPopulations) {
     count = fsaPopulations[key]
     later = 0.0;
     longer = 0.0;
     for (i = 0; i < fsaData.length; i ++) {
       if (key === fsaData[i].fsa_name) {
         later = fsaData[i].lat;
         longer = fsaData[i].lng;
       }
       new google.maps.Circle({
         strokeColor: 'deeppink',
         strokeOpacity: 0.3,
         strokeWeight: 2,
         fillColor: 'deeppink',
         fillOpacity: 0.05,
         center: {lat: later, lng: longer},
         map: map,
         radius: count * 50
       });
     }
   }




//========== Google Maps End ==========
}
