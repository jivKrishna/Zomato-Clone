function initMap(){

   map = new google.maps.Map(document.getElementById('map_address'), {
          center: {lat: -34.397, lng: 150.644},
          zoom: 6
        });
  // if(navigator.geolocation){
  //   navigator.geolocation.getCurrentPosition(function(position){
  //     var point = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);

  //     var map = new google.maps.Map(document.getElementById("map_address"), {
  //       zoom: 15,
  //       center: point,
  //       mapTypeId: google.maps.MapTypeId.ROADMAP
  //     });

  //     var marker = new google.maps.Marker({
  //       position: point,
  //       map: map,
  //       draggable: true
  //     });

  //     google.maps.event.addListener(marker, "dragend", function(){
  //       var point = {lat: marker.getPosition().lat(), lng: marker.getPosition().lng()};
  //       map.setCenter(point);
  //       console.log(point);
  //     });
  //   });
  // else{
  //   alert("W3C Geolocation API is not available");
  // }
}