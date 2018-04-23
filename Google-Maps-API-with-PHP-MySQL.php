<?php
        error_reporting(1);


        $con=mysqli_connect("localhost","root","root","etc_2");
        // Check connection
        if (mysqli_connect_errno())
          {
            echo "Failed to connect to MySQL: " . mysqli_connect_error();
          } else {
            // echo "Connected to MySQL";
          }

        // ...some PHP code for database "my_db"...
        $sql = "SELECT id, coordinates, submitter, store_server_id, created_on FROM dxcr2_locations";
        $result = $con->query($sql);

        if ($result->num_rows > 0) {
        // output data of each row
            while($row = $result->fetch_assoc()) {
                // var_dump($row);
                    echo "id: " . $row["id"]. " coordinates " . $row["coordinates"]. "<br>";

                    // var_dump($row2);
                    $coordinates = $row["coordinates"];
                    $coordinatesSplit = explode(",", $coordinates);

                    $latitude = floatval($coordinatesSplit[0]); // case string to float
                    $longitude =  floatval($coordinatesSplit[1]); // cast string to float

                    $name = $row['submitter'];
                    // $longitude = $row['coordinates'];                              
                    // $latitude = $row['coordinates'];
                    $link=$row['store_server_id'];

                    /* Each row is added as a new array */
                    $locations[]=array( 'name'=>$name, 'lat'=>$latitude, 'lng'=>$longitude, 'lnk'=>$link );
                }
            } else {
                echo "0 results";
            }
        

        // Perform queries
        // mysqli_query($con,"SELECT * FROM Persons");
        // $number_of_rows = mysql_num_rows($con); 
        // ...some PHP code for database "test"...

        // mysqli_close($con);
        // exit();

        // $locations=array(); 
        // $uname="root";
        // $pass="root";
        // $servername="localhost";
        // $dbname="etc_2";

        // $db = mysqli($servername,$uname,$pass,$dbname);
        // $query =  $db->query("SELECT * FROM dxcr2_locations");
        // $number_of_rows = mysql_num_rows($result);  
        // echo $number_of_rows;
        // exit();
        // while( $row2 = $result->fetch_assoc() ){
        //     var_dump($row2);
        //     $name = $row2['uname'];
        //     $longitude = $row2['longitude'];                              
        //     $latitude = $row2['latitude'];
        //     $link=$row2['link'];
        //     /* Each row is added as a new array */
        //     $locations[]=array( 'name'=>$name, 'lat'=>$latitude, 'lng'=>$longitude, 'lnk'=>$link );
        // }
        //echo $locations[0]['name'].": In stock: ".$locations[0]['lat'].", sold: ".$locations[0]['lng'].".<br>";
        //echo $locations[1]['name'].": In stock: ".$locations[1]['lat'].", sold: ".$locations[1]['lng'].".<br>";
         // mysqli_close($con);
    ?>
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyAymgz0AXCj6ipuLijePEpi72_QcUga23Q"></script> 
    <script type="text/javascript">
    var map;
    var Markers = {};
    var infowindow;
    var locations = [
        <?php for($i=0;$i<sizeof($locations);$i++){ $j=$i+1;?>
        [
            'Location Visit',
            '<p><a href="<?php echo $locations[0]['lnk'];?>">Book this Person Now</a></p>',
            <?php echo $locations[$i]['lat'];?>,
            <?php echo $locations[$i]['lng'];?>,
            0
        ]<?php if($j!=sizeof($locations))echo ","; }?>
    ];
    var origin = new google.maps.LatLng(locations[0][2], locations[0][3]);
    function initialize() {
      var mapOptions = {
        zoom: 9,
        center: origin
      };
      map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
        infowindow = new google.maps.InfoWindow();
        for(i=0; i<locations.length; i++) {
            var position = new google.maps.LatLng(locations[i][2], locations[i][3]);
            var marker = new google.maps.Marker({
                position: position,
                map: map,
            });
            google.maps.event.addListener(marker, 'click', (function(marker, i) {
                return function() {
                    infowindow.setContent(locations[i][1]);
                    infowindow.setOptions({maxWidth: 200});
                    infowindow.open(map, marker);
                }
            }) (marker, i));
            Markers[locations[i][4]] = marker;
        }
        locate(0);
    }
    function locate(marker_id) {
        var myMarker = Markers[marker_id];
        var markerPosition = myMarker.getPosition();
        map.setCenter(markerPosition);
        google.maps.event.trigger(myMarker, 'click');
    }
    google.maps.event.addDomListener(window, 'load', initialize);
    </script>
<body id="map-canvas" style="height: 500px; width: auto;">