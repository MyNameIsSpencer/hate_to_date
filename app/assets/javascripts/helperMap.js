function createMap(lat, lng) {
  return new google.maps.Map(document.getElementById('map'), {
    center: {lat, lng},
    zoom: 12,
    styles: purple
  });
}
