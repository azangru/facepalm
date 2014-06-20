// doesn't quite work - debug
var getCoordinates = function(){
  photoX = $("#player-in-containment-wrapper").position().left;
  photoY = $("#player-in-containment-wrapper").position().top;
  handX = $( "#draggable3" ).position().left;
  handY = $( "#draggable3" ).position().top;
  x = handX - photoX;
  y = handY - photoY;
  coordinates = x.toString() + ", " + y.toString();
  console.log(coordinates);
  return coordinates
};

function sendCoordinates(e){
    e.preventDefault();
    var text = $('#facepalm-text').val();
    id = parseInt(window.location.pathname.replace(/\/images\//g, "")).toString();
    url = "/images/" + id;
    redirect_url = "/images/" + id + "/facepalmed"
    $.ajax({
      url: url,
      type: "PUT",
      data: {
        coordinates: getCoordinates(),
        text: text},
      dataType: "json",
      complete: function(){
        window.location = redirect_url;
      }
    });
};



$(function(){
  $( "#draggable3" ).draggable({ containment: "#containment-wrapper"});
  $( "#draggable3" ).on('mouseup', getCoordinates);
  $('#facepalm-button').on('click', sendCoordinates)
});


// parseInt(window.location.pathname.replace(/\/images\//g, ""))