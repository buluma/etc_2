<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Authorization, Origin, X-Requested-With, Content-Type, Accept");
error_reporting(1);
require_once 'connection.php';

$mysqli = mysqli_connect($host,$user,$password,$db) or die("Error " . mysqli_error($mysqli));

// $mysqli = mysqli_connect(EW_CONN_HOST,EW_CONN_USER,EW_CONN_PASS,EW_CONN_DB) or die("Error " . mysqli_error($mysqli));

if (isset($_GET['user_id'])){
   	$json = array();
   	$id = $_GET['user_id'];

   	$query = "SELECT id, user, task, description, deadline, priority FROM dxcr2_tasks WHERE user = '".$id."'";
   	$result = mysqli_query($mysqli,$query) or die(mysqli_error($mysqli));
   	$total = mysqli_num_rows($result);
   
   	while($row = mysqli_fetch_object($result)){
       //cast results to specific data types		
       $json['usertask'][] = $row;
   	}
   	header("Content-Type: application/json");
   	echo json_encode($json);

}
   
// end get data


?>