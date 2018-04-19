<?php
require_once '../api/connection.php';

$resultarray = array();
//$mysqli = mysqli_connect(EW_CONN_HOST,EW_CONN_USER,EW_CONN_PASS,EW_CONN_DB) or die("Error " . mysqli_error($mysqli));
$mysqli = mysqli_connect($host,$user,$password,$db) or die("Error " . mysqli_error($mysqli));

function base64_to_jpeg($base64_string) {
    $data = explode(',', $base64_string);
    return $data[1];
}
function setUserID($username){
    global $mysqli;
    $query = "SELECT id FROM dxcr2_users WHERE username = '".$username."'";
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
##saveEmpties function
function saveEmpties($clientData, $syncDate){
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
	    'empties_case' => $item->empties_case,
	    'empties_shell' => $item->empties_shell,
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
		$query = 'INSERT INTO data_tl_empties(' .implode(',', $columns). ') VALUES ("' .implode('","',$values). '")';
		$insert = mysqli_query($mysqli,$query) or die(mysqli_error($mysqli));
		if ($insert){
		    array_push($resultarray, 'empties added with client_id: '.$item->id);
		}
    }

}

##saveListings function
function saveListings($clientData, $syncDate){
    global $resultarray;
    global $mysqli;
    global $handler;
	$syncTime =  $syncDate/1000; // convert from milliseconds to seconds
	$count = count($clientData);

	// start processing the data
	foreach ($clientData as $key => $item) {
		// save the item to database
	    $sqlData = array(
            // 'client_id' => $item->id,
            'client_id' => '1',
            'state' => '1',
            'ordering' => '1',
            'coordinates' => $item->coords,
            //'description' => $item->description,
	       'listing' => $item->listing,
	       'listed' => $item->listed,
            // 'submitter' => $item->submitter,
            'user_id' => setUserID($item->submitter),
            'submitter' => setUserID($item->submitter),
            'created_by' => setUserID($item->submitter),
            'store' => $item->store,
            'store_id' => $item->store_id,
            'store_server_id' => $item->store_server_id,
            //'client_modified_date' => $item->modified,
            'created_on' => $item->created_on,
            'last_sync_date' => $syncTime
            );
	    $columns = array_keys($sqlData);
		$values = array_values($sqlData);
		$query = 'INSERT INTO dxcr2_listings(' .implode(',', $columns). ') VALUES ("' .implode('","',$values). '")';
		$insert = mysqli_query($mysqli,$query) or die(mysqli_error($mysqli));
		if ($insert){
		    array_push($resultarray, 'listings added with client_id: '.$item->id);
		}
    }

}
##saveChecklist function
function saveChecklist($clientData, $syncDate){
    global $resultarray;
    global $mysqli;
    global $handler;
	$syncTime =  $syncDate/1000; // convert from milliseconds to seconds
	$count = count($clientData);

	// start processing the data
	foreach ($clientData as $key => $item) {
		// save the item to database
	    $sqlData = array(
            // 'client_id' => $item->id,
            'client_id' => '1',
            'coordinates' => $item->coords,
            //'description' => $item->description,
	        'beer_bottles' => $item->beer_bottles,
	        'beer' => $item->beer,
            'rtds' => $item->rtds,
            'vodka' => $item->vodka,
            'liqeur' => $item->liqeur,
            'brandy' => $item->brandy,
            'whisky' => $item->whisky,
            'tequila' => $item->tequila,
            'rums' => $item->rums,
            'anads' => $item->anads,
            'gins' => $item->gins,
            'canes' => $item->canes,
            'cold_space' => $item->cold_space,
            'comments' => $item->comments,
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
		$query = 'INSERT INTO data_tl_checklist(' .implode(',', $columns). ') VALUES ("' .implode('","',$values). '")';
		$insert = mysqli_query($mysqli,$query) or die(mysqli_error($mysqli));
		if ($insert){
		    array_push($resultarray, 'checklist added with client_id: '.$item->id);
		}
    }

}
##savePromotions_2 function
function savePromotions($clientData, $syncDate){
    global $resultarray;
    global $mysqli;
    global $handler;
	$syncTime =  $syncDate/1000; // convert from milliseconds to seconds
	$count = count($clientData);

	// start processing the data
	foreach ($clientData as $key => $item) {
		// save the item to database
	    $sqlData = array(
            'state' => '1',
            'ordering' => '1',
            // 'client_id' => $item->id,
            'client_id' => '1',
            'coordinates' => $item->coords,
            'unique_id' => $item->unique_id,
            'brand' => $item->brand,
            'brandcode' => $item->brandcode,
            'category' => $item->category,
            'activity_mechanics' => $item->act_activity,
            'rateofsale' => $item->rateofsale,
            'myplan' => $item->myplan,
            'myneed' => $item->myneed,
            'timeline' => $item->timeline,
            'start_date' => $item->start_date,
            'end_date' => $item->end_date,
            // 'submitter' => $item->submitter,
            'submitter' => setUserID($item->submitter),
            'user_id' => setUserID($item->submitter),
            'store' => $item->store,
            'store_id' => $item->store_id,
            'store_server_id' => $item->store_server_id,
            'created_on' => $item->created_on,
            'last_sync_date' => $syncTime
            );
	    $columns = array_keys($sqlData);
		$values = array_values($sqlData);
		$query = 'INSERT INTO dxcr2_promotions(' .implode(',', $columns). ') VALUES ("' .implode('","',$values). '")';
		$insert = mysqli_query($mysqli,$query) or die(mysqli_error($mysqli));
		if ($insert){
		    array_push($resultarray, 'etc promotions added with client_id: '.$item->id);
		}
    }
}
function saveEABLPromotionsImages($clientData, $syncDate){
    global $resultarray;
    global $mysqli;
    global $handler;
	$syncTime =  $syncDate/1000; // convert from milliseconds to seconds
	$count = count($clientData);

	// start processing the data
	foreach ($clientData as $key => $item) {
		// save the item to database
	    $sqlData = array(
            // 'client_id' => $item->id,
            'client_id' => '1',
            //'coordinates' => $item->coords,
            'activity_id' => $item->activity_id,
            'activity_unique_id' => $item->activity_unique_id,
            'image' => $item->image,
            'submitter' => setUserID($item->submitter),
            // 'submitter' => $item->submitter,
            'user_id' => setUserID($item->submitter),
            'store' => $item->store,
            'store_id' => $item->store_id,
            'store_server_id' => $item->store_server_id,
            'created_on' => $item->created_on,
            'last_sync_date' => $syncTime
            );
	    $columns = array_keys($sqlData);
		$values = array_values($sqlData);
		$query = 'INSERT INTO dxcr2_promotion_images(' .implode(',', $columns). ') VALUES ("' .implode('","',$values). '")';
		$insert = mysqli_query($mysqli,$query) or die(mysqli_error($mysqli));
		if ($insert){
		    array_push($resultarray, 'etc promo images added with client_id: '.$item->id);
		}
    }
}

//bts promotions
function saveBTSPromotions($clientData, $syncDate){
    global $resultarray;
    global $mysqli;
    global $handler;
    $syncTime =  $syncDate/1000; // convert from milliseconds to seconds
    $count = count($clientData);

    // start processing the data
    foreach ($clientData as $key => $item) {
        // save the item to database
        $sqlData = array(
            'state' => '1',
            'ordering' => '1',
            // 'client_id' => $item->id,
            'client_id' => '1',
            'coordinates' => $item->coords,
            'unique_id' => $item->unique_id,
            'product' => $item->brandcode,
            // 'brandcode' => $item->brandcode,
            // 'sku' => $item->sku,
            // 'target' => $item->target,
            'actual' => $item->actual,
            'date' => $item->date,
            'outlet' => $item->store_server_id,
            'ba_name' => setUserID($item->submitter),
            'user_id' => setUserID($item->submitter),
            'submitter' => setUserID($item->submitter),
            'store' => $item->store,
            'store_id' => $item->store_id,
            'store_server_id' => $item->store_server_id,
            'created' => $item->created_on,
            'last_sync_date' => $syncTime
            );
        $columns = array_keys($sqlData);
        $values = array_values($sqlData);
        $query = 'INSERT INTO dxcr2_bts_items(' .implode(',', $columns). ') VALUES ("' .implode('","',$values). '")';
        $insert = mysqli_query($mysqli,$query) or die(mysqli_error($mysqli));
        if ($insert){
            array_push($resultarray, 'bts promotions added with client_id: '.$item->id);
        }
    }
}

function saveBTSPromotionsImages($clientData, $syncDate){
    global $resultarray;
    global $mysqli;
    global $handler;
    $syncTime =  $syncDate/1000; // convert from milliseconds to seconds
    $count = count($clientData);

    // start processing the data
    foreach ($clientData as $key => $item) {
        // save the item to database
        $sqlData = array(
            // 'client_id' => $item->id,
            'client_id' => '1',
            //'coordinates' => $item->coords,
            'activity_id' => $item->activity_id,
            'activity_unique_id' => $item->activity_unique_id,
            'image' => $item->image,
            'submitter' => setUserID($item->submitter),
            // 'submitter' => $item->submitter,
            'user_id' => setUserID($item->submitter),
            'store' => $item->store,
            'store_id' => $item->store_id,
            'store_server_id' => $item->store_server_id,
            'created_on' => $item->created_on,
            'last_sync_date' => $syncTime
            );
        $columns = array_keys($sqlData);
        $values = array_values($sqlData);
        $query = 'INSERT INTO dxcr2_promotion_images(' .implode(',', $columns). ') VALUES ("' .implode('","',$values). '")';
        $insert = mysqli_query($mysqli,$query) or die(mysqli_error($mysqli));
        if ($insert){
            array_push($resultarray, 'bts promo images added with client_id: '.$item->id);
        }
    }
}


/*function savePromotions($clientData, $syncDate){
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
            'promos' => $item->promos,
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
		$query = 'INSERT INTO data_tl_promotions(' .implode(',', $columns). ') VALUES ("' .implode('","',$values). '")';
		$insert = mysqli_query($mysqli,$query) or die(mysqli_error($mysqli));
		if ($insert){
		    array_push($resultarray, 'promotions added with client_id: '.$item->id);
		}
    }
}*/

##savePerformance function
function savePerformance($clientData, $syncDate){
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
            //'description' => $item->description,
            'rtd_actual' => $item->rtd_actual,
            'udv_actual' => $item->udv_actual,
            'kbl_actual' => $item->kbl_actual,
            'comments' => $item->comments,
            //'transfer' => $item->transfer,
            'transfer' => (isset($item->transfer) ? $item->transfer : ''),
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
		$query = 'INSERT INTO data_tl_performance(' .implode(',', $columns). ') VALUES ("' .implode('","',$values). '")';
		$insert = mysqli_query($mysqli,$query) or die(mysqli_error($mysqli));
		if ($insert){
		    array_push($resultarray, 'performance added with client_id: '.$item->id);
		}
    }

}
##saveCallage function
function saveOTR($clientData, $syncDate){
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
            'segment' => $item->segment,
            'cdivision' => $item->cdivision,
            'teritorry' => $item->teritorry,
            //'store_server_id' => $item->outlet,
            'store_server_id' => (isset($item->outlet) ? $item->outlet : ''),
            'sis_name' => $item->sis_name,
            'supervisor' => $item->supervisor,
            'leave_type' => $item->leave_type,
            'start_date' => $item->start_date,
            'end_date' => $item->end_date,
            'original_call_target' => $item->original_call_target,
            'new_call_target' => $item->new_call_target,
            'remarks' => $item->remarks,
            'submitter' => $item->submitter,
            'user_id' => setUserID($item->submitter),
            //'client_modified_date' => $item->modified,
            'created_on' => $item->created_on,
            'last_sync_date' => $syncTime
            );
	    $columns = array_keys($sqlData);
		$values = array_values($sqlData);
		$query = 'INSERT INTO data_otr(' .implode(',', $columns). ') VALUES ("' .implode('","',$values). '")';
		$insert = mysqli_query($mysqli,$query) or die(mysqli_error($mysqli));
		if ($insert){
		    array_push($resultarray, 'otr added with client_id: '.$item->id);
		}
    }

}
##saveDailyplan function
function saveDailyPlan($clientData, $syncDate){
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
            //'segment' => $item->segment,
            //'cdivision' => $item->cdivision,
            //'daily_date' => $item->daily_date,
            //'start_time_input' => $item->start_time_input,
            //'end_time_input' => $item->end_time_input,
            //'daily_challenges' => $item->daily_challenges,
            /*'status' => $item->status,
            'daily_notes' => $item->daily_notes,
            'routeplan' => $item->routeplan,*/
            'submitter' => setUserID($item->submitter),
            // 'submitter' => $item->submitter,
            'user_id' => setUserID($item->submitter),
            //'store' => $item->store,
            //'store_id' => $item->store_id,
            //'store_server_id' => $item->store_server_id,
            //'client_modified_date' => $item->modified,
            //'created_on' => $item->created_on,
            'last_sync_date' => $syncTime
            );
	    $columns = array_keys($sqlData);
		$values = array_values($sqlData);
		$query = 'INSERT INTO data_tl_daily_plannerxx(' .implode(',', $columns). ') VALUES ("' .implode('","',$values). '")';
		$insert = mysqli_query($mysqli,$query) or die(mysqli_error($mysqli));
		if ($insert){
		    array_push($resultarray, 'daily plan added with client_id: '.$item->id);
		}
    }

}
## TODO: check if product exists for this outlet, submitter and update the same
## if exists, update the currentstock, orderplaced, delivered, sale
## if sale is more than zero, subtract from the currentstock i.e currentstock = currentstock - sale
## if orderplaced is more than zero, replace the column with new data
## if delivered is more than zero, add that to currentstock

function saveBrandStocks($clientData, $syncDate,$appversion = null){
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
        $lpo_number = $item->lpo_number;
        $order_placed = $item->order_placed;
        $order_date = $item->order_date;
        $newsale = $item->sale;
        // check if this brandcode data exists for this outlet

        $aquery = 'SELECT id,currentstock,orderplaced,order_placed,order_date,delivered,sale FROM dxcr2_brandstocks ';
        $aquery .= ' WHERE store_server_id = "'.$item->store_server_id.'" AND brandcode ="'.$item->brandcode.'"';
        $res = mysqli_query($mysqli,$aquery) or die(mysqli_error($mysqli));
        $total = mysqli_num_rows($res);

        if ($total > 0){
            //echo 'we found the product stock';
            while ($row = mysqli_fetch_object($res)) {
                // synced from new brand interface
                if ($appversion != null){
                    // update the data as is, currentstock already computed in mobile app
                    $newstock = $item->currentstock;
                }
                else {
                    // compute new values for currentstock, orderplaced,delivered,sale
                    $newstock = ($row->currentstock + $newdelivery) - $newsale;
                }

                $query = 'UPDATE dxcr2_brandstocks SET currentstock = "'.$newstock.'", orderplaced = "'.$neworder.'", order_placed = "'.$order_placed.'", order_date = "'.$order_date.'", delivered = "'.$newdelivery.'", lpo_number = "'.$lpo_number.'", sale = "'.$newsale.'" WHERE id = "'.$row->id.'"';
                $update = mysqli_query($mysqli,$query) or die(mysqli_error($mysqli));
                if ($update){
                    array_push($resultarray, 'brand stock updated with id '.$row->id.' ,oldstock: '.$row->currentstock.', newstock: '.$newstock);
                }
            }

        }
        else {
            // save the item to database
             $sqlData = array(
                // 'client_id' => $item->id,
                'client_id' => '1',
                'state' => '1',
                'ordering' => '1',
                'stockdate' => Date('Y-m-d',strtotime($item->stockdate)),
                'coordinates' => $item->coords,
                'brand' => $item->brand,
                'brandcode' => $item->brandcode,
                'currentstock' => $item->currentstock,
                'orderplaced' => $item->orderplaced,
                'order_placed' => $item->order_placed,
                'order_date' => $item->order_date,
                'delivered' => $item->expected_delivery,
                'lpo_number' => $item->lpo_number,
                'sale' => $item->sale,
                'stockout' => $item->stockout,
                'submitter' => setUserID($item->submitter),
                // 'submitter' => $item->submitter,
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
            $query = 'INSERT INTO dxcr2_brandstocks(' .implode(',', $columns). ') VALUES ("' .implode('","',$values). '")';
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
            'state' => '1',
            'ordering' => '1',
            // 'client_id' => $item->id,
            'client_id' => '1',
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
            'submitter' => setUserID($item->submitter),
            // 'submitter' => $item->submitter,
            'user_id' => setUserID($item->submitter),
            'store' => $item->store,
            'store_id' => $item->store_id,
            'store_server_id' => $item->store_server_id,
            'created_on' => $item->created_on,
            'last_sync_date' => $syncTime
            );
	    $columns = array_keys($sqlData);
		$values = array_values($sqlData);
		$query = 'INSERT INTO dxcr2_competitor_activity(' .implode(',', $columns). ') VALUES ("' .implode('","',$values). '")';
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
            // 'client_id' => $item->id,
            'client_id' => '1',
            //'coordinates' => $item->coords,
            'activity_id' => $item->activity_id,
            'activity_unique_id' => $item->activity_unique_id,
            'image' => $item->image,
            // 'submitter' => $item->submitter,
            'submitter' => setUserID($item->submitter),
            'user_id' => setUserID($item->submitter),
            'store' => $item->store,
            'store_id' => $item->store_id,
            'store_server_id' => $item->store_server_id,
            'created_on' => $item->created_on,
            'last_sync_date' => $syncTime
            );
	    $columns = array_keys($sqlData);
		$values = array_values($sqlData);
		$query = 'INSERT INTO dxcr2_competitor_images(' .implode(',', $columns). ') VALUES ("' .implode('","',$values). '")';
		$insert = mysqli_query($mysqli,$query) or die(mysqli_error($mysqli));
		if ($insert){
		    array_push($resultarray, 'competitor activity image added with client_id: '.$item->id);
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
            // 'submitter' => $item->submitter,
            'submitter' => setUserID($item->submitter),
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
            'submitter' => setUserID($item->submitter),
            // 'submitter' => $item->submitter,
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
function saveAssetManagmnt($clientData, $syncDate){
    global $resultarray;
    global $mysqli;
    global $handler;
	$syncTime = $syncDate/1000; // convert from milliseconds to seconds
	$count = count($clientData);

	// start processing the data
	foreach ($clientData as $key => $item) {
	    $sqlData = array(
            'state' => '1',
            'ordering' => '1',
            // 'client_id' => $item->id,
            'client_id' => '1',
            'coordinates' => $item->coords,
            'imagedate' => isset($item->imagedate) ? $item->imagedate : '',
            'imagepath' => isset($item->imagepath) ? $item->imagepath : '',
            'serial_number' => $item->serial_number,
            'asset_type' => $item->asset_type,
            // 'submitter' => $item->submitter,
            'submitter' => setUserID($item->submitter),
            'user_id' => setUserID($item->submitter),
            'created_by' => setUserID($item->submitter),
            'state' => '1',
            'ordering' => '1',
            // 'user_id' => setUserID($item->submitter),
            'store' => $item->store,
            'store_id' => $item->store_id,
            'store_server_id' => $item->store_server_id,
            //'client_modified_date' => $item->modified,
            'created_on' => $item->created_on,
            'last_sync_date' => $syncTime
            );
	    $columns = array_keys($sqlData);
		$values = array_values($sqlData);
		$query = 'INSERT INTO dxcr2_asset_management(' .implode(',', $columns). ') VALUES ("' .implode('","',$values). '")';
		$insert = mysqli_query($mysqli,$query) or die(mysqli_error($mysqli));
		if ($insert){
		    array_push($resultarray, 'asset management added with client_id: '.$item->id);
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
            'state' => '1',
            'ordering' => '1',
            // 'client_id' => $item->id,
            'client_id' => '1',
            'coordinates' => $item->coords,
            'description' => $item->description,
            'focus_type' => $item->focus_type,
            'action_input' => $item->action_input,
            // 'submitter' => $item->submitter,
            'user_id' => setUserID($item->submitter),
            'created_by' => setUserID($item->submitter),
            'submitter' => setUserID($item->submitter),
            'store' => $item->store,
            'store_id' => $item->store_id,
            'store_server_id' => $item->store_server_id,
            //'client_modified_date' => $item->modified,
            'created_on' => $item->created_on,
            'last_sync_date' => $syncTime
            );
	    $columns = array_keys($sqlData);
		$values = array_values($sqlData);
		$query = 'INSERT INTO dxcr2_focusareas(' .implode(',', $columns). ') VALUES ("' .implode('","',$values). '")';
		$insert = mysqli_query($mysqli,$query) or die(mysqli_error($mysqli));
		if ($insert){
		    array_push($resultarray, 'focus areas added with client_id: '.$item->id);
		}
    }
}
function saveTLFocusAreas($clientData, $syncDate){
    global $resultarray;
    global $mysqli;
    global $handler;
	$syncTime = $syncDate/1000; // convert from milliseconds to seconds
	$count = count($clientData);

	// start processing the data
	foreach ($clientData as $key => $item) {
	    $sqlData = array(
            'state' => '1',
            'ordering' => '1',
            // 'client_id' => $item->id,
            'client_id' => '1',
            'coordinates' => $item->coords,
            'description' => $item->description,
            'focus_type' => $item->focus_type,
            'action_input' => $item->action_input,
            'submitter' => setUserID($item->submitter),
            // 'submitter' => $item->submitter,
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
		$query = 'INSERT INTO dxcr2_focusareas(' .implode(',', $columns). ') VALUES ("' .implode('","',$values). '")';
		$insert = mysqli_query($mysqli,$query) or die(mysqli_error($mysqli));
		if ($insert){
		    array_push($resultarray, 'tl focus areas added with client_id: '.$item->id);
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
            'state' => '1',
            'ordering' => '1',
            // 'client_id' => $item->id,
            'client_id' => '1',
            'coordinates' => $item->coords,
            'imagedate' => $item->imagedate,
            'imagepath' => $item->imagepath,
            'manufacturer' => $item->manufacturer,
            'brand' => $item->brand,
            'brandcode' => $item->brandcode,
            // 'submitter' => $item->submitter,
            'submitter' => setUserID($item->submitter),
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
		$query = 'INSERT INTO dxcr2_photos(' .implode(',', $columns). ') VALUES ("' .implode('","',$values). '")';
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
            'state' => '1',
            'ordering' => '1',
            // 'client_id' => $item->id,
            'client_id' => '1',
            'coordinates' => $item->coordinates,
            'submitter' => setUserID($item->submitter),
            'created_by' => setUserID($item->submitter),
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
		// $query = 'INSERT INTO data_locations(' .implode(',', $columns). ') VALUES ("' .implode('","',$values). '")';
        $query = 'INSERT INTO dxcr2_locations(' .implode(',', $columns). ') VALUES ("' .implode('","',$values). '")';
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

        $aquery = 'SELECT id,targetscore,targetfacings,current_percent,current_facings FROM dxcr2_data_objectives ';
        $aquery .= ' WHERE store_server_id = "'.$item->store_server_id.'" AND objective_code ="'.$item->objective_code.'"';
        $res = mysqli_query($mysqli,$aquery) or die(mysqli_error($mysqli));
        $total = mysqli_num_rows($res);

        if ($total > 0){
            //echo 'we found the objective';
            while ($row = mysqli_fetch_object($res)) {
                $query = 'UPDATE dxcr2_data_objectives SET targetfacings = "'.$item->targetfacings.'", current_percent = "'.$item->current_percent.'",
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
                'state' => '1',
                // 'client_id' => $item->id,
                'client_id' => '1',
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
                'submitter' => setUserID($item->submitter),
                // 'submitter' => $item->submitter,
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
    		$query = 'INSERT INTO dxcr2_data_objectives(' .implode(',', $columns). ') VALUES ("' .implode('","',$values). '")';
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
            // 'client_id' => $item->id,
            'client_id' => '1',
            'state' => '1',
            'ordering' => '1',
            'inputdate' => $item->inputdate,
            'coordinates' => $item->coords,
            'objective' => $item->objective,
            'objective_achieved' => $item->objective_achieved,
            'challenge' => $item->challenge,
            'next_plan' => $item->next_plan,
            // 'submitter' => $item->submitter,
            'submitter' => setUserID($item->submitter),
            'created_by' => setUserID($item->submitter),
            // 'user_id' => setUserID($item->submitter),
            'store' => $item->store,
            'store_id' => $item->store_id,
            'store_server_id' => $item->store_server_id,
            'client_modified_date' => $item->modified,
            'created' => $item->created,
            'last_sync_date' => $syncTime
            );
	    $columns = array_keys($sqlData);
		$values = array_values($sqlData);
		$query = 'INSERT INTO dxcr2_other_objectives(' .implode(',', $columns). ') VALUES ("' .implode('","',$values). '")';
		$insert = mysqli_query($mysqli,$query) or die(mysqli_error($mysqli));
		if ($insert){
		    array_push($resultarray, 'other objective added with client_id: '.$item->id);
		}
    }
}

// save perfect checklist
function savePerfectChecklist($clientData, $syncDate){
    global $resultarray;
    global $mysqli;
    global $handler;
    $syncTime =  $syncDate/1000; // convert from milliseconds to seconds
    $count = count($clientData);

    // start processing the data
    foreach ($clientData as $key => $item) {
        // save the item to database
        $sqlData = array(
            // 'client_id' => $item->id,
            'client_id' => '1',
            'state' => '1',
            'ordering' => '1',
            'inputdate' => $item->inputdate,
            'coordinates' => $item->coords,
            'shop_mml' => $item->shop_mml,
            'sku_available' => $item->sku_available,
            'merchandising' => $item->merchandising,
            'shelf_quantity' => $item->shelf_quantity,
            'right_prices' => $item->right_prices,
            'visible_tags' => $item->visible_tags,
            'traffic_area' => $item->traffic_area,
            'eye_level' => $item->eye_level,
            'posm' => $item->shelf_quantity,
            'shelf_quantity' => $item->posm,
            'priority_gondolas' => $item->priority_gondolas,
            'retailer_informed' => $item->retailer_informed,
            'promotion_visible' => $item->promotion_visible,
            'wobbler' => $item->wobbler,
            'posters_place' => $item->posters_place,
            'gondolas_installed' => $item->gondolas_installed,
            // 'submitter' => $item->submitter,
            'created_by' => setUserID($item->submitter),
            // 'user_id' => setUserID($item->submitter),
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
        $query = 'INSERT INTO dxcr2_perfect_checklist(' .implode(',', $columns). ') VALUES ("' .implode('","',$values). '")';
        $insert = mysqli_query($mysqli,$query) or die(mysqli_error($mysqli));
        if ($insert){
            array_push($resultarray, 'perfect store checklist added with client_id: '.$item->id);
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
        $aquery = 'SELECT id,type,month,year FROM dxcr2_price_survey ';
        $aquery .= ' WHERE store_server_id = "'.$item->store_server_id.'" ';
        $aquery .= ' AND type ="'.$item->type.'" AND month="'.$item->month.'" AND year="'.$item->year.'"';
        $res = mysqli_query($mysqli,$aquery) or die(mysqli_error($mysqli));
        $total = mysqli_num_rows($res);

        if ($total > 0){
            //echo 'we found one';
            while ($row = mysqli_fetch_object($res)) {
                $query = 'UPDATE dxcr2_price_survey SET brands = "'.mysqli_real_escape_string($mysqli,$item->brands).'", last_sync_date = "'.$syncTime.'" WHERE id = "'.$row->id.'"';
                $update = mysqli_query($mysqli,$query) or die(mysqli_error($mysqli));
                if ($update){
                    array_push($resultarray, 'price survey updated with id '.$row->id);
                }
            }

        }
        else {
    	    $sqlData = array(
                'state' => '1',
                'ordering' => '1',
                // 'client_id' => $item->id,
                'client_id' => '1',
                'coordinates' => $item->coords,
                'type' => $item->type,
                'brands' => mysqli_real_escape_string($mysqli,$item->brands),
                'inputdate' => $item->inputdate,
                'week' => $item->week,
                'month' => $item->month,
                'year' => $item->year,
                // 'submitter' => $item->submitter,
                'submitter' => setUserID($item->submitter),
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
    		$query = 'INSERT INTO dxcr2_price_survey(' .implode(',', $columns). ') VALUES ("' .implode('","',$values). '")';
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
            // 'client_id' => $item->id,
            'client_id' => '1',
            'state' => '1',
            'ordering' => '1',
            'coordinates' => $item->coords,
            'brand' => $item->brand,
            'brandcode' => $item->brandcode,
            'issue_type' => $item->issue_type,
            'rateofsale' => $item->rateofsale,
            'expiry_date' => $item->expiry_date,
            // 'submitter' => $item->submitter,
            'submitter' => setUserID($item->submitter),
            'user_id' => setUserID($item->submitter),
            'created_by' => setUserID($item->submitter),
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
		$query = 'INSERT INTO dxcr2_quality_issues(' .implode(',', $columns). ') VALUES ("' .implode('","',$values). '")';
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
            // 'client_id' => $item->id,
            'client_id' => '1',
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
            // 'client_id' => $item->id,
            'client_id' => '1',
            'state' => '1',
            'ordering' => '1',
            'session_id' => $item->session_id,
            'checkin_time' => $item->checkin_time,
            'checkin_place' => $item->checkin_place,
            'checkout_time' => $item->checkout_time,
            'checkout_place' => $item->checkin_place,
            // 'submitter' => $item->submitter,
            'submitter' => setUserID($item->submitter),
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
		$query = 'INSERT INTO dxcr2_shop_checkin(' .implode(',', $columns). ') VALUES ("' .implode('","',$values). '")';
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
            'state' => '1',
            // 'client_id' => $item->id,
            'client_id' => '1',
            'inputdate' => $item->inputdate,
            'coordinates' => $item->coords,
            'objective' => $item->objective,
            'objective_achieved' => $item->objective_achieved,
            'next_plan' => $item->next_plan,
            'challenge' => $item->challenge,
            'submitter' => setUserID($item->submitter),
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
		$query = 'INSERT INTO dxcr2_tl_objectives(' .implode(',', $columns). ') VALUES ("' .implode('","',$values). '")';
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
            // 'client_id' => $item->id,
            'client_id' => '1',
            'coordinates' => $item->coords,
            'photos' => $item->photos,
            'brand' => $item->brand,
            'brandcode' => $item->brandcode,
            'category' => $item->category,
            'items' => $item->items,
            'commentby' => $item->commentby,
            'isurgent' => $item->isurgent,
            // 'submitter' => $item->submitter,
            'created_by' => setUserID($item->submitter),
            'submitter' => setUserID($item->submitter),
            'state' => '1',
            'ordering' => '1',
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
		$query = 'INSERT INTO dxcr2_voc(' .implode(',', $columns). ') VALUES ("' .implode('","',$values). '")';
		$insert = mysqli_query($mysqli,$query) or die(mysqli_error($mysqli));
		if ($insert){
		    array_push($resultarray, 'voc added with client_id: '.$item->id);
		}
    }
}

//sync tasks
function saveTasks($clientData, $syncDate){
    global $resultarray;
    global $mysqli;
    global $handler;
    $syncTime =  $syncDate/1000; // convert from milliseconds to seconds
    $count = count($clientData);
    // var_dump($count);
    // exit();

    // start processing the data
    foreach ($clientData as $key => $item) {
        //$newstock = $item->currentstock;
        $tstatus = $item->status;
        $completion_date = $item->completion_date;
        $remarks = $item->remarks;
        // check if this brandcode data exists for this outlet

        $aquery = 'SELECT id,task,description,deadline,priority,status,completion_date,remarks FROM dxcr2_tasks';
        $aquery .= ' WHERE user = "'.$item->user.'" AND id ="'.$item->task_id.'"';
        $res = mysqli_query($mysqli,$aquery) or die(mysqli_error($mysqli));
        $total = mysqli_num_rows($res);

        if ($total > 0){
            //echo 'we found the tasks';
            while ($row = mysqli_fetch_object($res)) {
                // synced from tasks interface
                $query = 'UPDATE dxcr2_tasks SET status = "'.$tstatus.'", completion_date = "'.$completion_date.'", remarks = "'.$remarks.'" WHERE id = "'.$row->id.'"';
                $update = mysqli_query($mysqli,$query) or die(mysqli_error($mysqli));
                if ($update){
                    array_push($resultarray, 'task updated with id '.$row->id.'');
                }
            }

        }
        else {
            // save the item to database
             $sqlData = array(
                // 'client_id' => $item->id,
                // 'client_id' => '1',
                'state' => '1',
                'ordering' => '1',
                'task' => $item->task,
                'description' => $item->description,
                'deadline' => $item->deadline,
                'priority' => $item->priority,
                'status' => $item->status,
                'completion_date' => $item->completion_date,
                'remarks' => $item->remarks,
                'created' => $item->created,
                'created_by' => setUserID($item->submitter),
                'last_sync_date' => $syncTime
                );
            $columns = array_keys($sqlData);
            $values = array_values($sqlData);
            $query = 'INSERT INTO dxcr2_tasks(' .implode(',', $columns). ') VALUES ("' .implode('","',$values). '")';
            $insert = mysqli_query($mysqli,$query) or die(mysqli_error($mysqli));
            if ($insert){
                array_push($resultarray, 'task added with client_id: '.$item->id);
            }
        }
    }
}

?>
