<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Authorization, Origin, X-Requested-With, Content-Type, Accept");
error_reporting(E_ALL);
ini_set("log_errors", 1);
ini_set("error_log", "error_log.txt");

include("webSqlSyncHandler.php");

$handler = new SqlSyncHandler();	// to initialize the json handler from 'php://input'. It put it in $clientData
include("functions.php");
$handler->call('myJob',$handler);	// call a custom function which will make a job with parsed data

function myJob($handler){
	$currentDateTime =  time();
	$input = $handler->clientData;
    global $resultarray;
    /*echo '<pre>';
    print_r($input);
    echo '</pre>';
    */
    /*
    if (isset($input->data->stores)){
		saveStores($input->data->stores, $handler->syncDate);
	}
	*/
	//
    if (isset($input->data->action_items)){
	    saveActionItems($input->data->action_items, $handler->syncDate); // array of objects
	}
	if (isset($input->data->brandstocks)){
	    saveBrandStocks($input->data->brandstocks, $handler->syncDate); // array of objects
	}	
	if (isset($input->data->objectives)){
		saveObjectives($input->data->objectives, $handler->syncDate);
	}
	if (isset($input->data->other_objectives)){
		saveOtherObjectives($input->data->other_objectives, $handler->syncDate);
	}
	if (isset($input->data->tl_objectives)){
		saveTLObjectives($input->data->tl_objectives, $handler->syncDate);
	}
	if (isset($input->data->quality_issues)){
		saveQualityIssues($input->data->quality_issues, $handler->syncDate);
	}
	if (isset($input->data->shop_checkin)){
		saveShopCheckin($input->data->shop_checkin, $handler->syncDate);
	}
	if (isset($input->data->locations)){
		saveLocations($input->data->locations, $handler->syncDate);
	}
	if (isset($input->data->recommendations)){
		saveRecommendations($input->data->recommendations, $handler->syncDate);
	}
	if (isset($input->data->voc)){
		saveVOC($input->data->voc, $handler->syncDate);
	}
	if (isset($input->data->competitor_activity)){
		saveCompeActivity($input->data->competitor_activity, $handler->syncDate);
	}
	if (isset($input->data->competitor_images)){
		saveCompeImages($input->data->competitor_images, $handler->syncDate);
	}
	if (isset($input->data->eabl_activity)){
		saveEABLActivity($input->data->eabl_activity, $handler->syncDate);
	}
	if (isset($input->data->eabl_activity_images)){
		saveEABLActivityImages($input->data->eabl_activity_images, $handler->syncDate);
	}
	if (isset($input->data->images)){
		savePhotos($input->data->images, $handler->syncDate);
	}
	if (isset($input->data->price_survey)){
		savePriceSurvey($input->data->price_survey, $handler->syncDate);
	}
	if (isset($input->data->focus_areas)){
		saveFocusAreas($input->data->focus_areas, $handler->syncDate);
	}
	if (isset($input->data->challenges)){
		saveChallenges($input->data->challenges, $handler->syncDate);
	}

	// My job is to get all the table data from the server and send a json to client
	$handler -> reply(true,"Data Successfully Saved", $resultarray);	
	// with a dynamic array coming from a MySQL query //function reply($status,$message,$data)
	// It return $serverAnswer from SqlSyncHandler.php:	
	// {"result":"OK","message":"this is a positive reply","syncDate":1327075596000,"data":{"Unites":[{"UniteID":"0","UniteSymbol":"h"},{"UniteID":"1","UniteSymbol":"km"},{"UniteID":"2","UniteSymbol":"$"},{"UniteID":"3","UniteSymbol":"U$"},{"UniteID":"4","UniteSymbol":"\u20ac"},{"UniteID":"5","UniteSymbol":"$P"}]}} 

	// a error reply example
	//$handler -> reply(true,"this is a reply",array('browser' => 'firefox'));
	//$handler->reply(true,'Notes Successfully saved',array('notes' => 2, 'stores' => 3));
}

?>