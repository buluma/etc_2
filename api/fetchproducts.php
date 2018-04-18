<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Authorization, Origin, X-Requested-With, Content-Type, Accept");
error_reporting(1);
// exit();
require_once 'connection.php';

// $mysqli = mysqli_connect(EW_CONN_HOST,EW_CONN_USER,EW_CONN_PASS,EW_CONN_DB) or die("Error " . mysqli_error($mysqli));
$mysqli = mysqli_connect($host,$user,$password,$db) or die("Error " . mysqli_error($mysqli));
// var_dump($mysqli);
// exit();

if (isset($_GET['data'])){
   //echo $_GET['data'];
   $json = array();
   $param = $_GET['data'];	

   //fetch producrs
   if ($param == 'eablproducts'){
		// Client expects json response here!
		// $lastmodified = $_GET['last_modified'];
		$lastmodified = 'none'; //get all
		if ($lastmodified == 'none'){
			$query = "SELECT * FROM dxcr2_products";
		}
		else {
			$query = "SELECT * FROM dxcr2_products WHERE modified_on > '$lastmodified'"; 
		}
       
	    $result = mysqli_query($mysqli,$query) or die(mysqli_error($mysqli));
	    $total = mysqli_num_rows($result);
	   
		if ($total == 0) {
		   		header("Content-Type: application/json");
		        $json['eabl_products'] = array(); // create an empty array
		}
		else {
			while($row = mysqli_fetch_object($result)){
	           //cast results to specific data types		
	            $json['eabl_products'][] = $row;
	        } 	   
		}	   
	    
        $response = $json;
        header("Content-Type: application/json");
        echo json_encode($response);

	} // end if $param = eablproducts
}


?>