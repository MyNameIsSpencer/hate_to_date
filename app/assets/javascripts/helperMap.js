function createMap(lat, lng) {
  return new google.maps.Map(document.getElementById('map'), {
    center: {lat, lng},
    zoom: 12,
    styles: purple
  });
}


function calcDistance (lata, lnga, latb, lngb) {
return google.maps.geometry.spherical.computeDistanceBetween(
  new google.maps.LatLng(lata, lnga), new google.maps.LatLng(latb, lngb));
}
