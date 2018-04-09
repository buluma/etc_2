<?php
/**
 * Name   : webSqlSyncHandler.php for WebSqlSync.js code
 * Creator: sg4r3z 20/05/2013
 * modified by abeauseigle 2013-10-08 to add the tableName in the JSON
 * This class allow to manage the json flow sended by the client (with the WebSqlSync script by orbitaloop), and make a reply.
 * ToDo: 
*/
	 
final class SqlSyncHandler{
	//private $clientData,$jsonData;
	public $clientData;
	// syncdate in milliseconds
	public $syncDate;
	private $jsonData;
	// well formatted Answer for WebSqlSync.js Script
	private $serverAnswer = array("result" => '',"message" => '', "syncDate" => '',"data" => array());
		
	/*
	 * __construct 
	 * Capture the input stream and creates 
	 * an array with the same structure
	 */

	public function __construct(){					
		//$this->jsonData = file_get_contents('php://input');		// json file to string 
		$this->jsonData = file_get_contents('jsondata/1460534542_syncdata.json');		// json file to string 
		//$this-> clientData = json_decode($this-> jsonData,true);	// json string to array, $this -> clientData is used by ??? 
		$this->clientData = json_decode($this->jsonData);
		$this->syncDate = strtotime("now")*1000;
		$mytime = $this->syncDate/1000; // time in seconds
		// ToDo: Do something with the Client JSON data
		//file_put_contents('jsondata/'.$mytime.'_syncdata.json', $this->jsonData);
		//file_put_contents('clientdata.json', $this->clientData);
	}
	/*
	 * reply (Server -> JSON  -> Client)
	 * This method create a well-structred reply for Client in JSON
	 * This method accept status,message,data
	 * STATUS = boolean value (TRUE for OK, FALSE for ERROR)
	 * MESSAGE = string value for message
	 * DATA = array of data for client
	 */
	public function reply($status,$message,$data){		// $data come from the query getAllServerData() from sqlSyncHandlerTest.php
		if($status)
			{$this -> serverAnswer['result'] = 'OK';}
		else
			{$this -> serverAnswer['result'] = 'ERROR';}
			$this -> serverAnswer['message'] = $message;
			//$this -> serverAnswer['syncDate'] = strtotime("now")*1000;	// return sync_date: "1372365079000",
			$this -> serverAnswer['syncDate'] = $this->syncDate;
			$this -> serverAnswer['data'] = $data;

			echo json_encode($this -> serverAnswer);
		//$myObject = '{"result":"OK","message":"this is a positive reply","syncDate":"1371753757","data":[{"UniteID":"0","UniteSymbol":"h"},{"UniteID":"1","UniteSymbol":"km"},{"UniteID":"2","UniteSymbol":"$"},{"UniteID":"3","UniteSymbol":"U$"},{"UniteID":"4","UniteSymbol":"\u20ac"},{"UniteID":"5","UniteSymbol":"$P"}]}';
		//echo $myObject;
	}

	/*
	* call 
	* This method allows class to call an
	* external functon to make a custom job
	*/
	public function call($function,SqlSyncHandler $param = NULL){
		call_user_func($function,$param);
	}
		
	/*
	* getter clientData 
	* get a clientData property
	*/
	public function get_clientData(){
		return $this -> clientData;
	}
		
	/*
	* get serverAnswer 
	* get a serverAnswer property
	*/
	public function get_serverAnswer(){
		return $this -> serverAnswer;
	}
		
	/*
	* get jsonData
	* get a jsonData property
	*/
	public function get_jsonData(){
		return $this -> jsonData;
	}

}
?>
