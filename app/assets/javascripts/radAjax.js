document.addEventListener('DOMContentLoaded', function() {
  $.ajax({
    url:        'new_session',
    method:     'GET',
    data:       {},
    dataType:   'json'
  })

  if (button){
    button.addEventListener('click', function(event){
      event.preventDefault()
      pictureMaker()
    });
  }
});
