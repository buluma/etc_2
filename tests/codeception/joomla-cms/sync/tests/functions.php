<?php
require_once '../../ewcfg11.php';

$resultarray = array();
$mysqli = mysqli_connect(EW_CONN_HOST,EW_CONN_USER,EW_CONN_PASS,EW_CONN_DB) or die("Error " . mysqli_error($mysqli));

function base64_to_jpeg($base64_string) {
    $data = explode(',', $base64_string);
    return $data[1]; 
}
function setUserID($username){
    global $mysqli;
    $query = "SELECT id FROM users WHERE username = '".$username."'";
    $result = mysqli_query($mysqli,$query) or die(mysqli_error($mysqli));
    $user = mysqli_fetch_object($result);

    return $user->id;
}

function saveActionItems($clientData, $syncDate){
    global $resultarray;
    global $mysqli;
    global $handler;
	$syncTime =  $syncDate/1000; // convert from milliseconds to seconds
	$count = count($clientData);

	// start processing the data
	foreach ($clientData as $key => $item) {
		// save the item to database
	    $sqlData = array(
            'client_id' => $item->id,
            'coordinates' => $item->coords,
            'description' => $item->description,
            'submitter' => $item->submitter,
            'user_id' => setUserID($item->submitter),
            'store' => $item->store,
            'store_id' => $item->store_id,
            'store_server_id' => $item->store_server_id,
            //'client_modified_date' => $item->modified,
            'created_on' => $item->created_on,
            'last_sync_date' => $syncTime
            );
	    $columns = array_keys($sqlData);
		$values = array_values($sqlData);
		$query = 'INSERT INTO data_action_items(' .implode(',', $columns). ') VALUES ("' .implode('","',$values). '")';
		$insert = mysqli_query($mysqli,$query) or die(mysqli_error($mysqli));
		if ($insert){
		    array_push($resultarray, 'action item added with client_id: '.$item->id);
		}
    }

}
## TODO: check if product exists for this outlet, submitter and update the same
## if exists, update the currentstock, orderplaced, delivered, sale
## if sale is more than zero, subtract from the currentstock i.e currentstock = currentstock - sale
## if orderplaced is more than zero, replace the column with new data
## if delivered is more than zero, add that to currentstock

function saveBrandStocks($clientData, $syncDate){
    global $resultarray;
    global $mysqli;
    global $handler;
	$syncTime =  $syncDate/1000; // convert from milliseconds to seconds
	$count = count($clientData);

	// start processing the data
	foreach ($clientData as $key => $item) {
        //$newstock = $item->currentstock;
        $neworder = $item->orderplaced;
        $newdelivery = $item->expected_delivery;
        $newsale = $item->sale;
        // check if this brandcode data exists for this outlet

        $aquery = 'SELECT id,currentstock,orderplaced,delivered,sale FROM data_brandstocks ';
        $aquery .= ' WHERE store_server_id = "'.$item->store_server_id.'" AND brandcode ="'.$item->brandcode.'"';
        $res = mysqli_query($mysqli,$aquery) or die(mysqli_error($mysqli));
        $total = mysqli_num_rows($res);

        if ($total > 0){
            //echo 'we found the product stock';
            while ($row = mysqli_fetch_object($res)) {
                // compute new values for currentstock, orderplaced,delivered,sale
                $newstock = ($row->currentstock + $newdelivery) - $newsale;
                //echo '<p>item updated with id '.$row->id.' ,oldstock: '.$row->currentstock.', newstock: '.$newstock.'</p>';
                
                $query = 'UPDATE data_brandstocks SET currentstock = "'.$newstock.'", orderplaced = "'.$neworder.'", delivered = "'.$newdelivery.'", sale = "'.$newsale.'" WHERE id = "'.$row->id.'"';
                $update = mysqli_query($mysqli,$query) or die(mysqli_error($mysqli));
                if ($update){
                    array_push($resultarray, 'brand stock updated with id '.$row->id.' ,oldstock: '.$row->currentstock.', newstock: '.$newstock);
                }
            }
            
        }
        else {
            // save the item to database
             $sqlData = array(
                'client_id' => $item->id,
                'stockdate' => Date('Y-m-d',strtotime($item->stockdate)),
                'coordinates' => $item->coords,
                'brand' => $item->brand,
                'brandcode' => $item->brandcode,           
                'currentstock' => $item->currentstock,        
                'orderplaced' => $item->orderplaced,
                'delivered' => $item->expected_delivery,
                'sale' => $item->sale,
                'stockout' => $item->stockout,
                'submitter' => $item->submitter,
                'user_id' => setUserID($item->submitter),
                'store' => $item->store,
                'store_id' => $item->store_id,
                'store_server_id' => $item->store_server_id,
                'remarks' => $item->remarks,
                'client_modified_date' => $item->modified,
                'created' => $item->created,
                'last_sync_date' => $syncTime
                );
            $columns = array_keys($sqlData);
            $values = array_values($sqlData);
            $query = 'INSERT INTO data_brandstocks(' .implode(',', $columns). ') VALUES ("' .implode('","',$values). '")';
            $insert = mysqli_query($mysqli,$query) or die(mysqli_error($mysqli));
            if ($insert){
                array_push($resultarray, 'brand stocks added with client_id: '.$item->id);
            }
        }   
    }
}
function saveChallenges($clientData, $syncDate){
    global $resultarray;
    global $mysqli;
    global $handler;
	$syncTime = $syncDate/1000; // convert from milliseconds to seconds
	$count = count($clientData);

	// start processing the data
	foreach ($clientData as $key => $item) {
	    $sqlData = array(
            'client_id' => $item->id,
            'coordinates' => $item->coords, 
            'challenge' => $item->challenge, 
            'action' => $item->action, 
            'by_who' => $item->by_who,      
            'submitter' => $item->submitter,
            'user_id' => setUserID($item->submitter),
            'store' => $item->store,
            'store_id' => $item->store_id,
            'store_server_id' => $item->store_server_id,
            //'client_modified_date' => $item->modified,
            'created_on' => $item->created_on,
            'last_sync_date' => $syncTime
            );
	    $columns = array_keys($sqlData);
		$values = array_values($sqlData);
		$query = 'INSERT INTO data_challenges(' .implode(',', $columns). ') VALUES ("' .implode('","',$values). '")';
		$insert = mysqli_query($mysqli,$query) or die(mysqli_error($mysqli));
		if ($insert){
		    array_push($resultarray, 'challenge added with client_id: '.$item->id);
		}
    }
} 
function saveCompeActivity($clientData, $syncDate){
    global $resultarray;
    global $mysqli;
    global $handler;
	$syncTime =  $syncDate/1000; // convert from milliseconds to seconds
	$count = count($clientData);

	// start processing the data
	foreach ($clientData as $key => $item) {
		// save the item to database
	    $sqlData = array(
            'client_id' => $item->id,
            'coordinates' => $item->coords,
            'unique_id' => $item->unique_id,
            'brand' => $item->brand,                       
            'category' => $item->category,        
            'activity_mechanics' => $item->activity_mechanics,
            'rateofsale' => $item->rateofsale,
            'myplan' => $item->myplan,
            'myneed' => $item->myneed,
            'timeline' => $item->timeline,
            'start_date' => $item->start_date,
            'end_date' => $item->end_date,
            'submitter' => $item->submitter,
            'user_id' => setUserID($item->submitter),
            'store' => $item->store,
            'store_id' => $item->store_id,
            'store_server_id' => $item->store_server_id,     
            'created_on' => $item->created_on,
            'last_sync_date' => $syncTime
            );
	    $columns = array_keys($sqlData);
		$values = array_values($sqlData);
		$query = 'INSERT INTO data_competitor_activity(' .implode(',', $columns). ') VALUES ("' .implode('","',$values). '")';
		$insert = mysqli_query($mysqli,$query) or die(mysqli_error($mysqli));
		if ($insert){
		    array_push($resultarray, 'competitor activity added with client_id: '.$item->id);
		}
    }
}
function saveCompeImages($clientData, $syncDate){
    global $resultarray;
    global $mysqli;
    global $handler;
	$syncTime =  $syncDate/1000; // convert from milliseconds to seconds
	$count = count($clientData);

	// start processing the data
	foreach ($clientData as $key => $item) {
		// save the item to database
	    $sqlData = array(
            'client_id' => $item->id,
            //'coordinates' => $item->coords,
            'activity_id' => $item->activity_id,
            'activity_unique_id' => $item->activity_unique_id,  
            'image' => $item->image,                      
            'submitter' => $item->submitter,
            'user_id' => setUserID($item->submitter),
            'store' => $item->store,
            'store_id' => $item->store_id,
            'store_server_id' => $item->store_server_id,     
            'created_on' => $item->created_on,
            'last_sync_date' => $syncTime
            );
	    $columns = array_keys($sqlData);
		$values = array_values($sqlData);
		$query = 'INSERT INTO data_competitor_images(' .implode(',', $columns). ') VALUES ("' .implode('","',$values). '")';
		$insert = mysqli_query($mysqli,$query) or die(mysqli_error($mysqli));
		if ($insert){
		    array_push($resultarray, 'compe activity image added with client_id: '.$item->id);
		}
    }
}
function saveEABLActivity($clientData, $syncDate){
    global $resultarray;
    global $mysqli;
    global $handler;
	$syncTime =  $syncDate/1000; // convert from milliseconds to seconds
	$count = count($clientData);

	// start processing the data
	foreach ($clientData as $key => $item) {
		// save the item to database
	    $sqlData = array(
            'client_id' => $item->id,
            'coordinates' => $item->coords,
            'unique_id' => $item->unique_id,
            'brand' => $item->brand,  
            'brandcode' => $item->brandcode,                      
            'category' => $item->category,        
            'activity_mechanics' => $item->activity_mechanics,
            'rateofsale' => $item->rateofsale,
            'myplan' => $item->myplan,
            'myneed' => $item->myneed,
            'timeline' => $item->timeline,
            'start_date' => $item->start_date,
            'end_date' => $item->end_date,
            'submitter' => $item->submitter,
            'user_id' => setUserID($item->submitter),
            'store' => $item->store,
            'store_id' => $item->store_id,
            'store_server_id' => $item->store_server_id,     
            'created_on' => $item->created_on,
            'last_sync_date' => $syncTime
            );
	    $columns = array_keys($sqlData);
		$values = array_values($sqlData);
		$query = 'INSERT INTO data_eabl_activity(' .implode(',', $columns). ') VALUES ("' .implode('","',$values). '")';
		$insert = mysqli_query($mysqli,$query) or die(mysqli_error($mysqli));
		if ($insert){
		    array_push($resultarray, 'eabl activity added with client_id: '.$item->id);
		}
    }
}
function saveEABLActivityImages($clientData, $syncDate){
    global $resultarray;
    global $mysqli;
    global $handler;
	$syncTime =  $syncDate/1000; // convert from milliseconds to seconds
	$count = count($clientData);

	// start processing the data
	foreach ($clientData as $key => $item) {
		// save the item to database
	    $sqlData = array(
            'client_id' => $item->id,
            //'coordinates' => $item->coords,
            'activity_id' => $item->activity_id,
            'activity_unique_id' => $item->activity_unique_id,  
            'image' => $item->image,                      
            'submitter' => $item->submitter,
            'user_id' => setUserID($item->submitter),
            'store' => $item->store,
            'store_id' => $item->store_id,
            'store_server_id' => $item->store_server_id,     
            'created_on' => $item->created_on,
            'last_sync_date' => $syncTime
            );
	    $columns = array_keys($sqlData);
		$values = array_values($sqlData);
		$query = 'INSERT INTO data_eabl_activity_images(' .implode(',', $columns). ') VALUES ("' .implode('","',$values). '")';
		$insert = mysqli_query($mysqli,$query) or die(mysqli_error($mysqli));
		if ($insert){
		    array_push($resultarray, 'eabl activity image added with client_id: '.$item->id);
		}
    }
}
function saveFocusAreas($clientData, $syncDate){
    global $resultarray;
    global $mysqli;
    global $handler;
	$syncTime = $syncDate/1000; // convert from milliseconds to seconds
	$count = count($clientData);

	// start processing the data
	foreach ($clientData as $key => $item) {
	    $sqlData = array(
            'client_id' => $item->id,
            'coordinates' => $item->coords, 
            'description' => $item->description,      
            'submitter' => $item->submitter,
            'user_id' => setUserID($item->submitter),
            'store' => $item->store,
            'store_id' => $item->store_id,
            'store_server_id' => $item->store_server_id,
            //'client_modified_date' => $item->modified,
            'created_on' => $item->created_on,
            'last_sync_date' => $syncTime
            );
	    $columns = array_keys($sqlData);
		$values = array_values($sqlData);
		$query = 'INSERT INTO data_focus_areas(' .implode(',', $columns). ') VALUES ("' .implode('","',$values). '")';
		$insert = mysqli_query($mysqli,$query) or die(mysqli_error($mysqli));
		if ($insert){
		    array_push($resultarray, 'focus areas added with client_id: '.$item->id);
		}
    }
} 
function savePhotos($clientData, $syncDate){
    global $resultarray;
    global $mysqli;
    global $handler;
	$syncTime =  $syncDate/1000; // convert from milliseconds to seconds
	$count = count($clientData);

	// start processing the data
	foreach ($clientData as $key => $item) {
		// save the item to database
	    $sqlData = array(
            'client_id' => $item->id,
            'coordinates' => $item->coords,
            'imagedate' => $item->imagedate,  
            'imagepath' => $item->imagepath,  
            'manufacturer' => $item->manufacturer, 
            'brand' => $item->brand, 
            'brandcode' => $item->brandcode,                    
            'submitter' => $item->submitter,
            'user_id' => setUserID($item->submitter),
            'store' => $item->store,
            'store_id' => $item->store_id,
            'store_server_id' => $item->store_server_id,  
            'remarks' => $item->remarks,   
            'created_on' => $item->created,
            'last_sync_date' => $syncTime
            );
	    $columns = array_keys($sqlData);
		$values = array_values($sqlData);
		$query = 'INSERT INTO data_photos(' .implode(',', $columns). ') VALUES ("' .implode('","',$values). '")';
		$insert = mysqli_query($mysqli,$query) or die(mysqli_error($mysqli));
		if ($insert){
		    array_push($resultarray, 'photo added with client_id: '.$item->id);
		}
    }
}
function saveLocations($clientData, $syncDate){
    global $resultarray;
    global $mysqli;
    global $handler;
	$syncTime = $syncDate/1000; // convert from milliseconds to seconds
	$count = count($clientData);

	// start processing the data
	foreach ($clientData as $key => $item) {
	    $sqlData = array(
            'client_id' => $item->id,
            'coordinates' => $item->coordinates,       
            'submitter' => $item->submitter,
            'user_id' => setUserID($item->submitter),
            'store' => $item->store,
            'store_id' => $item->store_id,
            'store_server_id' => $item->store_server_id,
            'client_modified_date' => $item->modified,
            'created_on' => $item->created_on,
            'last_sync_date' => $syncTime
            );
	    $columns = array_keys($sqlData);
		$values = array_values($sqlData);
		$query = 'INSERT INTO data_locations(' .implode(',', $columns). ') VALUES ("' .implode('","',$values). '")';
		$insert = mysqli_query($mysqli,$query) or die(mysqli_error($mysqli));
		if ($insert){
		    array_push($resultarray, 'location added with client_id: '.$item->id);
		}
    }
}
function saveObjectives($clientData, $syncDate){
    global $resultarray;
    global $mysqli;
    global $handler;
	$syncTime =  $syncDate/1000; // convert from milliseconds to seconds
	$count = count($clientData);

	// start processing the data
	foreach ($clientData as $key => $item) {
        // check if this code data exists for this outlet

        $aquery = 'SELECT id,targetscore,targetfacings,current_percent,current_facings FROM data_objectives ';
        $aquery .= ' WHERE store_server_id = "'.$item->store_server_id.'" AND objective_code ="'.$item->objective_code.'"';
        $res = mysqli_query($mysqli,$aquery) or die(mysqli_error($mysqli));
        $total = mysqli_num_rows($res);

        if ($total > 0){
            //echo 'we found the objective';
            while ($row = mysqli_fetch_object($res)) {               
                $query = 'UPDATE data_objectives SET targetfacings = "'.$item->targetfacings.'", current_percent = "'.$item->current_percent.'", 
                current_facings = "'.$item->current_facings.'", categorytotal = "'.$item->categorytotal.'", objective_achieved = "'.$item->objective_achieved.'", 
              reason_not_achieved = "'.$item->reason_not_achieved.'", action_point ="'.$item->action_point.'", last_sync_date ="'.$syncTime.'" WHERE id = "'.$row->id.'"';
                $update = mysqli_query($mysqli,$query) or die(mysqli_error($mysqli));
                if ($update){
                    array_push($resultarray, 'eabl objective updated with id '.$row->id);
                }
            }
            
        }
        else {
    		// save the item to database
    	    $sqlData = array(
                'client_id' => $item->id,
                'inputdate' => $item->inputdate,
                'coordinates' => $item->coords,
                'objective_code' => $item->objective_code,
                'objective_desc' => $item->objective_desc,                       
                'targetscore' => $item->targetscore,        
                'targetfacings' => $item->targetfacings,
                'current_percent' => $item->current_percent,
                'current_facings' => $item->current_facings,
                'categorytotal' => $item->categorytotal,
                'response_type' => $item->response_type,
                'objective_achieved' => $item->objective_achieved,
                'reason_not_achieved' => $item->reason_not_achieved,
                'action_point' => $item->action_point,
                'submitter' => $item->submitter,
                'user_id' => setUserID($item->submitter),
                'store' => $item->store,
                'store_id' => $item->store_id,
                'store_server_id' => $item->store_server_id,     
                'client_modified_date' => $item->modified,
                'created' => $item->created,
                'last_sync_date' => $syncTime
                );
    	    $columns = array_keys($sqlData);
    		$values = array_values($sqlData);
    		$query = 'INSERT INTO data_objectives(' .implode(',', $columns). ') VALUES ("' .implode('","',$values). '")';
    		$insert = mysqli_query($mysqli,$query) or die(mysqli_error($mysqli));
    		if ($insert){
    		    array_push($resultarray, 'objectives added with client_id: '.$item->id);
    		}
        }
    }
}
function saveOtherObjectives($clientData, $syncDate){
    global $resultarray;
    global $mysqli;
    global $handler;
	$syncTime =  $syncDate/1000; // convert from milliseconds to seconds
	$count = count($clientData);

	// start processing the data
	foreach ($clientData as $key => $item) {
		// save the item to database
	    $sqlData = array(
            'client_id' => $item->id,
            'inputdate' => $item->inputdate,
            'coordinates' => $item->coords,
            'objective' => $item->objective,
            'objective_achieved' => $item->objective_achieved,
            'challenge' => $item->challenge,
            'next_plan' => $item->next_plan,
            'submitter' => $item->submitter,
            'user_id' => setUserID($item->submitter),
            'store' => $item->store,
            'store_id' => $item->store_id,
            'store_server_id' => $item->store_server_id,     
            'client_modified_date' => $item->modified,
            'created' => $item->created,
            'last_sync_date' => $syncTime
            );
	    $columns = array_keys($sqlData);
		$values = array_values($sqlData);
		$query = 'INSERT INTO data_other_objectives(' .implode(',', $columns). ') VALUES ("' .implode('","',$values). '")';
		$insert = mysqli_query($mysqli,$query) or die(mysqli_error($mysqli));
		if ($insert){
		    array_push($resultarray, 'other objective added with client_id: '.$item->id);
		}
    }
}
// TODO: check if survey price for this month exists first before inserting and update it
function savePriceSurvey($clientData, $syncDate){
    global $resultarray;
    global $mysqli;
    global $handler;
	$syncTime = $syncDate/1000; // convert from milliseconds to seconds
	$count = count($clientData);

	// start processing the data
	foreach ($clientData as $key => $item) {
        $aquery = 'SELECT id,type,month,year FROM data_price_survey ';
        $aquery .= ' WHERE store_server_id = "'.$item->store_server_id.'" ';
        $aquery .= ' AND type ="'.$item->type.'" AND month="'.$item->month.'" AND year="'.$item->year.'"';
        $res = mysqli_query($mysqli,$aquery) or die(mysqli_error($mysqli));
        $total = mysqli_num_rows($res);

        if ($total > 0){
            //echo 'we found one';
            while ($row = mysqli_fetch_object($res)) {            
                $query = 'UPDATE data_price_survey SET brands = "'.mysqli_real_escape_string($mysqli,$item->brands).'", last_sync_date = "'.$syncTime.'" WHERE id = "'.$row->id.'"';
                $update = mysqli_query($mysqli,$query) or die(mysqli_error($mysqli));
                if ($update){
                    array_push($resultarray, 'price survey updated with id '.$row->id);
                }
            }
            
        }
        else {
    	    $sqlData = array(
                'client_id' => $item->id,
                'coordinates' => $item->coords, 
                'type' => $item->type,   
                'brands' => mysqli_real_escape_string($mysqli,$item->brands),
                'inputdate' => $item->inputdate,
                'week' => $item->week,
                'month' => $item->month,
                'year' => $item->year,
                'submitter' => $item->submitter,
                'user_id' => setUserID($item->submitter),
                'store' => $item->store,
                'store_id' => $item->store_id,
                'store_server_id' => $item->store_server_id,
                'client_modified_date' => $item->modified,
                'created_on' => $item->created,
                'last_sync_date' => $syncTime
                );
    	    $columns = array_keys($sqlData);
    		$values = array_values($sqlData);
    		$query = 'INSERT INTO data_price_survey(' .implode(',', $columns). ') VALUES ("' .implode('","',$values). '")';
    		$insert = mysqli_query($mysqli,$query) or die(mysqli_error($mysqli));
    		if ($insert){
    		    array_push($resultarray, 'price survey added with client_id: '.$item->id);
    		}
        }
    }
}
function saveQualityIssues($clientData, $syncDate){
    global $resultarray;
    global $mysqli;
    global $handler;
	$syncTime = $syncDate/1000; // convert from milliseconds to seconds
	$count = count($clientData);

	// start processing the data
	foreach ($clientData as $key => $item) {
	    $sqlData = array(
            'client_id' => $item->id,
            'coordinates' => $item->coords,
            'brand' => $item->brand,
            'brandcode' => $item->brandcode,           
            'issue_type' => $item->issue_type,        
            'rateofsale' => $item->rateofsale,
            'expiry_date' => $item->expiry_date,
            'submitter' => $item->submitter,
            'user_id' => setUserID($item->submitter),
            'store' => $item->store,
            'store_id' => $item->store_id,
            'store_server_id' => $item->store_server_id,
            'remarks' => $item->remarks,
            //'client_modified_date' => $item->modified,
            'created_on' => $item->created_on,
            'last_sync_date' => $syncTime
            );
	    $columns = array_keys($sqlData);
		$values = array_values($sqlData);
		$query = 'INSERT INTO data_quality_issues(' .implode(',', $columns). ') VALUES ("' .implode('","',$values). '")';
		$insert = mysqli_query($mysqli,$query) or die(mysqli_error($mysqli));
		if ($insert){
		    array_push($resultarray, 'quality issue added with client_id: '.$item->id);
		}
    }
}
function saveRecommendations($clientData, $syncDate){
    global $resultarray;
    global $mysqli;
    global $handler;
	$syncTime = $syncDate/1000; // convert from milliseconds to seconds
	$count = count($clientData);

	// start processing the data
	foreach ($clientData as $key => $item) {
	    $sqlData = array(
            'client_id' => $item->id,
            'coordinates' => $item->coords, 
            'description' => $item->description,      
            'submitter' => $item->submitter,
            'user_id' => setUserID($item->submitter),
            'store' => $item->store,
            'store_id' => $item->store_id,
            'store_server_id' => $item->store_server_id,
            //'client_modified_date' => $item->modified,
            'created_on' => $item->created_on,
            'last_sync_date' => $syncTime
            );
	    $columns = array_keys($sqlData);
		$values = array_values($sqlData);
		$query = 'INSERT INTO data_recommendations(' .implode(',', $columns). ') VALUES ("' .implode('","',$values). '")';
		$insert = mysqli_query($mysqli,$query) or die(mysqli_error($mysqli));
		if ($insert){
		    array_push($resultarray, 'recommendation added with client_id: '.$item->id);
		}
    }
}
function saveShopCheckin($clientData, $syncDate){
    global $resultarray;
    global $mysqli;
    global $handler;
	$syncTime = $syncDate/1000; // convert from milliseconds to seconds
	$count = count($clientData);

	// start processing the data
	foreach ($clientData as $key => $item) {
	    $sqlData = array(
            'client_id' => $item->id,
            'session_id' => $item->session_id,
            'checkin_time' => $item->checkin_time,
            'checkin_place' => $item->checkin_place,
            'checkout_time' => $item->checkout_time,           
            'checkout_place' => $item->checkin_place,        
            'submitter' => $item->submitter,
            'user_id' => setUserID($item->submitter),
            'store' => $item->store,
            'store_id' => $item->store_id,
            'store_server_id' => $item->store_server_id,
            'day' => $item->day,
            'created_on' => $item->created,
            'last_sync_date' => $syncTime
            );
	    $columns = array_keys($sqlData);
		$values = array_values($sqlData);
		$query = 'INSERT INTO data_shop_checkin(' .implode(',', $columns). ') VALUES ("' .implode('","',$values). '")';
		$insert = mysqli_query($mysqli,$query) or die(mysqli_error($mysqli));
		if ($insert){
		    array_push($resultarray, 'shop checkin added with client_id: '.$item->id);
		}
    }
}
#
# Empty function, maybe in future we might start uploading outlet data as well
#
function saveStore($clientData, $syncDate){   
}
function saveTLObjectives($clientData, $syncDate){
    global $resultarray;
    global $mysqli;
    global $handler;
	$syncTime =  $syncDate/1000; // convert from milliseconds to seconds
	$count = count($clientData);

	// start processing the data
	foreach ($clientData as $key => $item) {
		// save the item to database
	    $sqlData = array(
            'client_id' => $item->id,
            'inputdate' => $item->inputdate,
            'coordinates' => $item->coords,
            'objective' => $item->objective,
            'objective_achieved' => $item->objective_achieved,
            'challenge' => $item->challenge,
            'next_plan' => $item->next_plan,
            'submitter' => $item->submitter,
            'user_id' => setUserID($item->submitter),
            'store' => $item->store,
            'store_id' => $item->store_id,
            'store_server_id' => $item->store_server_id,     
            'client_modified_date' => $item->modified,
            'created' => $item->created,
            'last_sync_date' => $syncTime
            );
	    $columns = array_keys($sqlData);
		$values = array_values($sqlData);
		$query = 'INSERT INTO data_tl_objectives(' .implode(',', $columns). ') VALUES ("' .implode('","',$values). '")';
		$insert = mysqli_query($mysqli,$query) or die(mysqli_error($mysqli));
		if ($insert){
		    array_push($resultarray, 'team leader objective added with client_id: '.$item->id);
		}
    }
}

function saveVOC($clientData, $syncDate){
    global $resultarray;
    global $mysqli;
    global $handler;
	$syncTime = $syncDate/1000; // convert from milliseconds to seconds
	$count = count($clientData);

	// start processing the data
	foreach ($clientData as $key => $item) {
	    $sqlData = array(
            'client_id' => $item->id,
            'coordinates' => $item->coords,
            'photos' => $item->photos,
            'brand' => $item->brand,
            'brandcode' => $item->brandcode,                       
            'category' => $item->category,        
            'items' => $item->items,
            'commentby' => $item->commentby,
            'isurgent' => $item->isurgent,    
            'submitter' => $item->submitter,
            'user_id' => setUserID($item->submitter),
            'store' => $item->store,
            'store_id' => $item->store_id,
            'store_server_id' => $item->store_server_id,
            'remarks' => mysqli_real_escape_string($mysqli,$item->remarks),
            'client_modified_date' => $item->modified,
            'created_on' => $item->created,
            'last_sync_date' => $syncTime
            );
	    $columns = array_keys($sqlData);
		$values = array_values($sqlData);
		$query = 'INSERT INTO data_voc(' .implode(',', $columns). ') VALUES ("' .implode('","',$values). '")';
		$insert = mysqli_query($mysqli,$query) or die(mysqli_error($mysqli));
		if ($insert){
		    array_push($resultarray, 'voc added with client_id: '.$item->id);
		}
    }
}



?>