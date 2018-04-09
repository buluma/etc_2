<?php
/**
* @version	$Id$
* @package	Joomla
* @subpackage	Reservation
* @copyright	Copyright (c) 2017 Norber Kuemin. All rights reserved.
* @license	http://www.gnu.org/copyleft/gpl.html GNU/GPL, see LICENSE
* @author	Norber Kuemin
* @authorEmail	momo_102@bluemail.ch
*/

// Check to ensure this file is included in Joomla!
defined('_JEXEC') or die('Restricted access');

function replaceFields($text, $recordCount) {
	return $text;
}

function getHandleForJoomlaDb() {
	return JFactory::getDBO();
}

function getHandleForExternalDb($dbServer, $dbName, $dbUser, $dbPassword) {
	$option['driver']   = 'mysql';            // Database driver name
	$option['host']     = $dbServer;          // Database host name
	$option['user']     = $dbUser;            // User for database authentication
	$option['password'] = $dbPassword;        // Password for database authentication
	$option['database'] = $dbName;            // Database name
	$option['prefix']   = '';                 // Database prefix (may be empty)
	return JDatabaseDriver::getInstance($option);
}

function getData($dbServer, $dbName, $dbUser, $dbPassword) {
	if (empty($dbServer) && empty($dbName) && empty($dbUser) && empty($dbPassword)) {
		$db = getHandleForJoomlaDb();
	} else {
		$db = getHandleForExternalDb($dbServer, $dbName, $dbUser, $dbPassword);
	}
	$query = $db->getQuery(true);
	$fields = array("date_format(bs.slot_date, '%d.%m.%Y') AS date",
		"SUBSTR(bs.slot_time_from,1,5) AS start_time",
		"SUBSTR(bs.slot_time_to,1,5) AS end_time", 
		"br.reservation_message AS message"
	);
	$query->select($fields)
		->from($db->quoteName('booking_reservation','br'))
		->join('LEFT', $db->quoteName('booking_slots', 'bs').' ON ('.$db->quoteName('br.slot_id').'='.$db->quoteName('bs.slot_id').')')
		->where("br.reservation_confirmed = '1' and br.reservation_cancelled = '0'")
		->order("bs.slot_date, bs.slot_time_from");
	$db->setQuery($query);
	return $db->loadObjectList();
}

// Get data from DB
$records = getData($this->paramsMenuEntry->get("server"), $this->paramsMenuEntry->get("database"), $this->paramsMenuEntry->get("user"), $this->paramsMenuEntry->get("password"));

// Get other data
$recordCount = 0;
$pretext = $this->paramsMenuEntry->get("pretext");
$posttext = $this->paramsMenuEntry->get("posttext");

// Output
if (!empty($pretext)) {
	echo replaceFields($pretext, $recordCount);
}
$headerDate = '';
$dayStartTime = $this->paramsMenuEntry->get("daystarttime");
if (empty($dayStartTime)) { $dayStartTime = '00:00'; }
foreach ($records as $record) {
	if (($headerDate != $record->date) && ($record->start_time >= $dayStartTime)) {
		if (!empty($headerDate)) { echo "</p>\n"; }
		$headerDate = $record->date;
		echo "<p><b>".$record->date."</b></br>\n";
	}
	echo $record->start_time." - ".$record->end_time." &nbsp; ".$record->message."<br/>\n";
}
if (!empty($headerDate)) { echo "</p>\n"; }
if (!empty($posttext)) {
	echo replaceFields($posttext, $recordCount);
}
?>
