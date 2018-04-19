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

   if ($param == 'focusmodels'){
       $query = "SELECT * FROM focus_models";
	   $result = mysqli_query($mysqli,$query) or die(mysqli_error($mysqli));
	   $total = mysqli_num_rows($result);
	   
	   if ($total == 0) {
	        echo "No Focus Models Found";				
	   }
	   else {
			// we found some models
	   	   while($row = mysqli_fetch_object($result)){
	           //cast results to specific data types		
	           $json['focusmodels'][] = $row;
	       }
	       $focusmodels = $json;
	       header("Content-Type: application/json");
	       echo json_encode($focusmodels);
	   }

	} // end if $param = focusmodels

	if ($param == 'routeplan'){
	   $promoter = $_GET['username'];
       $query = "SELECT * FROM routeplan WHERE promoter = '".$promoter."' ";
	   $result = mysqli_query($mysqli,$query) or die(mysqli_error($mysqli));
	   $total = mysqli_num_rows($result);
	   
	   if ($total == 0) {
	        echo "No Route Plan Found";				
	   }
	   else {
			// we found a routeplan
	   	   while($row = mysqli_fetch_object($result)){
	           $mon = explode(',', $row->monday);
	           $tue = explode(',', $row->tuesday);
	           $wed = explode(',', $row->wednesday);
	           $thu = explode(',', $row->thursday);	
	           $fri = explode(',', $row->friday);
	           $sat = explode(',', $row->saturday);
	           $mshops = $tshops = $wshops = $thshops = $fshops = $sashops = array();
	           foreach ($mon as $mdata) {
	           	   $query = "SELECT shop_name FROM default_shops WHERE id = '".$mdata."' ";
				   $result = mysqli_query($mysqli,$query) or die(mysqli_error($mysqli));
				   $shop = mysqli_fetch_object($result);
                   $mshops[] = $shop->shop_name;
	   
	           }
	           foreach ($tue as $tdata) {
	           	   $query = "SELECT shop_name FROM default_shops WHERE id = '".$tdata."' ";
				   $result = mysqli_query($mysqli,$query) or die(mysqli_error($mysqli));;
				   $shop = mysqli_fetch_object($result);
                   $tshops[] = $shop->shop_name;
	   
	           }
	           foreach ($wed as $tdata) {
	           	   $query = "SELECT shop_name FROM default_shops WHERE id = '".$tdata."' ";
				   $result = mysqli_query($mysqli,$query) or die(mysqli_error($mysqli));;
				   $shop = mysqli_fetch_object($result);
                   $wshops[] = $shop->shop_name;
	   
	           }
	           foreach ($thu as $tdata) {
	           	   $query = "SELECT shop_name FROM default_shops WHERE id = '".$tdata."' ";
				   $result = mysqli_query($mysqli,$query) or die(mysqli_error($mysqli));;
				   $shop = mysqli_fetch_object($result);
                   $thshops[] = $shop->shop_name;
	   
	           }
	           foreach ($fri as $tdata) {
	           	   $query = "SELECT shop_name FROM default_shops WHERE id = '".$tdata."' ";
				   $result = mysqli_query($mysqli,$query) or die(mysqli_error($mysqli));;
				   $shop = mysqli_fetch_object($result);
                   $fshops[] = $shop->shop_name;
	   
	           }
	           foreach ($sat as $tdata) {
	           	   $query = "SELECT shop_name FROM default_shops WHERE id = '".$tdata."' ";
				   $result = mysqli_query($mysqli,$query) or die(mysqli_error($mysqli));;
				   $shop = mysqli_fetch_object($result);
                   $sashops[] = $shop->shop_name;
	   
	           }	
	           $json['routeplan']['monday'] = $mshops;
	           $json['routeplan']['tuesday'] = $tshops;
	           $json['routeplan']['wednesday'] = $wshops;
	           $json['routeplan']['thursday'] = $thshops;
	           $json['routeplan']['friday'] = $fshops;
	           $json['routeplan']['saturday'] = $sashops;
	       } // end while
	       $route = $json;
	       header("Content-Type: application/json");
	       echo json_encode($route);
	       //print_r($route);
	   }

	} // end if $param = routeplan

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

	if ($param == 'btsproducts'){
		// Client expects json response here!
		// $lastmodified = $_GET['last_modified'];
		$lastmodified = 'none'; //get all
		if ($lastmodified == 'none'){
			$query = "SELECT * FROM dxcr2_bts_products";
		}
		else {
			$query = "SELECT * FROM dxcr2_bts_products WHERE modified_on > '$lastmodified'"; 
		}
       
	    $result = mysqli_query($mysqli,$query) or die(mysqli_error($mysqli));
	    $total = mysqli_num_rows($result);
	   
		if ($total == 0) {
		   		header("Content-Type: application/json");
		        $json['bts_products'] = array(); // create an empty array
		}
		else {
			while($row = mysqli_fetch_object($result)){
	           //cast results to specific data types		
	            $json['bts_products'][] = $row;
	        } 	   
		}	   
	    
        $response = $json;
        header("Content-Type: application/json");
        echo json_encode($response);

	} // end if $param = btsproducts

	if ($param == 'usertasks'){
		// Client expects json response here!
		// $lastmodified = $_GET['last_modified'];
		$lastmodified = 'none'; //get all
		if ($lastmodified == 'none'){
			$query = "SELECT * FROM dxcr2_tasks";
		}
		else {
			$query = "SELECT * FROM dxcr2_tasks WHERE modified_on > '$lastmodified'"; 
		}
       
	    $result = mysqli_query($mysqli,$query) or die(mysqli_error($mysqli));
	    $total = mysqli_num_rows($result);
	   
		if ($total == 0) {
	   		header("Content-Type: application/json");
	        $json['user_tasks'] = array(); // create an empty array
		}
		else {
			while($row = mysqli_fetch_object($result)){
	           //cast results to specific data types		
	            $json['user_tasks'][] = $row;
	        } 	   
		}	   
	    
        $response = $json;
        header("Content-Type: application/json");
        echo json_encode($response);
	} // end if $param = tasks

	if ($param == 'eablobjectives'){
		// Client expects json response here!
		// $lastmodified = $_GET['last_modified'];
		$lastmodified = 'none'; //get all
		if ($lastmodified == 'none'){
			$query = "SELECT * FROM dxcr2_objectives";
		}
		else {
			$query = "SELECT * FROM dxcr2_objectives WHERE modified_on > '$lastmodified'"; 
		}
       
	    $result = mysqli_query($mysqli,$query) or die(mysqli_error($mysqli));
	    $total = mysqli_num_rows($result);
	   
		if ($total == 0) {
	   		header("Content-Type: application/json");
	        $json['eabl_objectives'] = array(); // create an empty array
		}
		else {
			while($row = mysqli_fetch_object($result)){
	           //cast results to specific data types		
	            $json['eabl_objectives'][] = $row;
	        } 	   
		}	   
	    
        $response = $json;
        header("Content-Type: application/json");
        echo json_encode($response);

	} // end if $param = eablproducts

} //end if isset
   
// end get data


?>