<?php
//header('Content-Type: application/json');
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Authorization, Origin, X-Requested-With, Content-Type, Accept");
error_reporting(1);
require_once 'connection.php';

// $mysqli = mysqli_connect(EW_CONN_HOST,EW_CONN_USER,EW_CONN_PASS,EW_CONN_DB) or die("Error " . mysqli_error($mysqli));
$mysqli = mysqli_connect($host,$user,$password,$db) or die("Error " . mysqli_error($mysqli));

if (isset($_GET['user_auth'])){
   $param = $_GET['user_auth'];
   $userlocation = isset($_GET['location']) ? $_GET['location'] : '';
   
   // $query = "SELECT * FROM dxcr2_users WHERE username = '".$param."'";
   // $query = "SELECT dxcr2_users.id as userid, dxcr2_users.name, dxcr2_user_usergroup_map.group_id,dxcr2_usergroups.title FROM dxcr2_users LEFT OUTER JOIN dxcr2_user_usergroup_map ON dxcr2_users.id=dxcr2_user_usergroup_map.user_id LEFT OUTER JOIN dxcr2_usergroups ON dxcr2_user_usergroup_map.group_id=dxcr2_usergroups.id WHERE dxcr2_users.username = '".$param."'";

   // $query2 = "SELECT dxcr2_users.id as userid, dxcr2_users.name, dxcr2_user_usergroup_map.group_id,dxcr2_usergroups.title FROM dxcr2_users LEFT OUTER JOIN dxcr2_user_usergroup_map ON dxcr2_users.id=dxcr2_user_usergroup_map.user_id LEFT OUTER JOIN dxcr2_usergroups ON dxcr2_user_usergroup_map.group_id=dxcr2_usergroups.id WHERE dxcr2_users.username = '".$param."'";

   $query = "SELECT dxcr2_users.id as userid, dxcr2_users.name, dxcr2_users.username, dxcr2_users.email, dxcr2_user_usergroup_map.group_id, dxcr2_usergroups.title as assigned FROM dxcr2_users LEFT OUTER JOIN dxcr2_user_usergroup_map ON dxcr2_users.id=dxcr2_user_usergroup_map.user_id LEFT OUTER JOIN dxcr2_usergroups ON dxcr2_user_usergroup_map.group_id=dxcr2_usergroups.id WHERE dxcr2_users.username = '".$param."'";


   // var_dump($query);
   // exit();
   $result = mysqli_query($mysqli,$query) or die(mysqli_error($mysqli));

   // $user_Info = mysqli_fetch_object($result);
   // $thisuserid = $user_Info->id;
   // var_dump($result);
   // exit();

   $total = mysqli_num_rows($result);
   
   // echo $total;
   // exit();
   if ($total == 0) {
        echo "UserNotFound";	
   } // end if $total = 0
   else {
	   
	   	$json = array();
		while($promoter = mysqli_fetch_object($result)){
      // var_dump($result);
      // exit();
		   //echo 'shop id is '.$promoter->shop_id;  	
		   //SELECT * FROM dxcr2_fields_values WHERE `item_id` = 544 and field_id = 3 //get shop id	
       //SELECT dxcr2_users.*, dxcr2_fields_values.*
// FROM dxcr2_users
// INNER JOIN dxcr2_fields_values ON dxcr2_users.id=dxcr2_fields_values.item_id where dxcr2_fields_values.field_id='3' and dxcr2_users.username='user'	   
		   $promoterinfo = array(
			   'userid'       => $promoter->userid,
			   'userpass'     => $promoter->username,
			   'username'     => $promoter->username,
			   'fullname'     => $promoter->name,
			   'userlevel'    => $promoter->user_level,
			   'useremail'    => $promoter->email,
			   'shop'         => $promoter->shop,
			   'shopid'       => $promoter->shop_id,
			   'assigned'     => $promoter->assigned,
			   'is_promoter'  => true
		   );
       // echo '<pre>';
       // var_dump($promoter);
       // echo '<pre/>';
       // exit();
		   // if ($promoter->shop_id != 0 || $promoter->shop_id != '')  {
       if ($promoter->username != '')  {
			   	// $squery = "SELECT * FROM dxcr2_outlets WHERE id IN (".$promoter->shop_id.")";
        // SELECT dxcr2_outlets.id, dxcr2_users.id, dxcr2_outlets.category,dxcr2_outlets.location,dxcr2_outlets.manager_name, dxcr2_outlets.manager_phone, dxcr2_outlets.manager_email, dxcr2_outlets.submitter, dxcr2_outlets.last_sync_date, dxcr2_outlets.user_id, dxcr2_outlets.date_created, dxcr2_users.username, dxcr2_users.name, dxcr2_outlets.account, dxcr2_outlets.shop_name, dxcr2_outlets.region, dxcr2_outlets.gmap FROM dxcr2_users LEFT OUTER JOIN dxcr2_fields_values ON dxcr2_users.id=dxcr2_fields_values.item_id LEFT OUTER JOIN dxcr2_outlets ON dxcr2_fields_values.value=dxcr2_outlets.id where dxcr2_fields_values.field_id='3' and dxcr2_users.username='user'
        
        //$squery = "SELECT * FROM dxcr2_fields_values WHERE item_id = ".$promoter->id." and field_id = 3";


$squery = "SELECT dxcr2_outlets.id as storeid, dxcr2_outlets.account, dxcr2_outlets.shop_name, dxcr2_outlets.category,dxcr2_outlets.location,dxcr2_outlets.manager_name, dxcr2_outlets.manager_phone, dxcr2_outlets.manager_email, dxcr2_outlets.submitter, dxcr2_outlets.last_sync_date, dxcr2_outlets.user_id, dxcr2_outlets.date_created, dxcr2_users.username, dxcr2_users.name, dxcr2_outlets.region, dxcr2_outlets.gmap, dxcr2_users.id FROM dxcr2_users"

    . " LEFT OUTER JOIN dxcr2_fields_values ON"

    . "   dxcr2_users.id=dxcr2_fields_values.item_id"

    . " LEFT OUTER JOIN dxcr2_outlets ON"

    . "   dxcr2_fields_values.value=dxcr2_outlets.id"

    . "    where dxcr2_fields_values.field_id='3' and dxcr2_users.username='".$param."'";

       //  echo '<pre>';
       // var_dump($squery);
       // echo '<pre/>';
       // exit();
          $sresult = mysqli_query($mysqli,$squery) or die(mysqli_error($mysqli));
                while($shopdata = mysqli_fetch_object($sresult)){  			   
    				    $shopregion = array(
    				   		'shopregion'     => $shopdata->region
    			      	);
    		          	$promoterinfo = array_merge($promoterinfo, $shopregion);
    			      	$json['allshops'][] = $shopdata;
      
                    };
                    $json['userdata'][] = $promoterinfo; 
                    $promoterandshopinfo = $json;
    	                  
                } // endif

            // this guy has no shop assigned ---
            // we assume he is open market
            else {
                $q = "SELECT * FROM dxcr2_outlets";
                $res = mysqli_query($mysqli,$q) or die(mysqli_error($mysqli));
                 // echo '<pre>';
                 // var_dump($squery);
                 // echo '<pre/>';
                 // exit();
                $json['userdata'][] = $promoterinfo;
               
		        while($row = mysqli_fetch_object($res)){
		        //  cast results to specific data types		
		           $json['allshops'][] = $row;
		        }
                $promoterandshopinfo = $json;
             
            }
        };  // end while
        // log the number of times promoter has logged in
        // var_dump($thisuserid);
        // exit();
        //$logquery = "INSERT INTO dxcr2_logins (username,day,login_coords) VALUES ('".$thisuserid."','".Date('Y-m-d')."','".$userlocation."')";
        $logquery = "INSERT INTO dxcr2_logins (username,day,login_coords) VALUES ('".$param."','".Date('Y-m-d')."','".$userlocation."')";
        $q = mysqli_query($mysqli,$logquery) or die(mysqli_error($mysqli));      
       	//$promoterandshopinfo = array_merge($promoterinfo,$shopinfo);
	   	header("Content-Type: application/json");
       	echo json_encode($promoterandshopinfo);
   }
}

if (isset($_GET['user_sendpass'])){
   $email = $_GET['user_sendpass'];
   
   $query = "SELECT * FROM dxcr2_users WHERE email = '".$email."'";
   $result = mysqli_query($mysqli,$query) or die(mysqli_error($link));
   $total = mysqli_num_rows($result);
   
   //echo $total;
   if ($total == 0) {
        echo "UserNotFound";
   }
   else {
	   while($user = mysqli_fetch_object($result)){
	       $userid = $user->id;
	       $userpass = $user->username;
	       $username = $user->username;  
	       $userlevel = $user->user_level;   
	       $useremail = $user->email; 
	   };
	   $headers = '';
	   $parameters = '';
	   $message = 'Dear '.$username.', Your password is '.$userpass.'';
	   // send email to user with password
	   //mail(to,subject,message,headers,parameters);
	   mail($useremail,'Password Reminder',$message,$headers,$parameters);
	   
	   echo 'PasswordSent';
   }
}

?>