<!DOCTYPE html>
<html>
  <head>
   
  <title>ICE :: Emergency Request Location</title>
<style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 550px;
      }
      /* Optional: Makes the sample page fill the window. */
    </style>
  </head>
  <body style="margin: 20px;">
    <h3>ICE :: Emergency Request Location</h3>
    <div id="map"></div>
    <script type="text/javascript">
	var la = ${userProfileInstance.lat};
    var lo = ${userProfileInstance.lon};
      function initMap() {
        var uluru = {lat: la, lng: lo};
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 15,
          center: uluru
        });

        var contentString = '<div id="content">'+
        '<div id="siteNotice">'+
        '</div>'+
        '<h1 id="firstHeading" class="firstHeading">Emergency Alert</h1>'+
        '<div id="bodyContent">' +
        '<p><h4>Name       :${userProfileInstance.firstName} ${userProfileInstance.lastName}</h4></p>'+
        '<p><h4>Mobile     :${userProfileInstance.mobile}</h4></p>'+
        '<p><h4>Qatari ID  :${userProfileInstance.qatariId}</h4></p>'+
        '<p><h4>Nationality:${userProfileInstance.nationality}</h4></p>'+
        '<p><h4>Blood Group:${userProfileInstance.bloodGroup}</h4></p>'+
        '</div>'+
        '</div>';

   		var infowindow = new google.maps.InfoWindow({
   		  content: contentString
   		});
            
        var marker = new google.maps.Marker({
          position: uluru,
          map: map
        });
        marker.addListener('click', function() {
            infowindow.open(map, marker);
          });
      }
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCdYjFvnSJ2g4f1vTtZ2idD6HEfxwS7dRQ&callback=initMap">
    </script>
  </body>
</html>