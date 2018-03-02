<?php

/**
 * @version    CVS: 1.0.0
 * @package    Com_Listings
 * @author     Michael Buluma <michael@buluma.me.ke>
 * @copyright  2018 Michael Buluma
 * @license    GNU General Public License version 2 or later; see LICENSE.txt
 */
// No direct access
defined('_JEXEC') or die;

/**
 * Listings helper.
 *
 * @since  1.6
 */
class ListingsHelper
{
	/**
	 * Configure the Linkbar.
	 *
	 * @param   string  $vName  string
	 *
	 * @return void
	 */
	public static function addSubmenu($vName = '')
	{
		JHtmlSidebar::addEntry(
			JText::_('COM_LISTINGS_TITLE_LISTINGS'),
			'index.php?option=com_listings&view=listings',
			$vName == 'listings'
		);

	}

	/**
	 * Gets the files attached to an item
	 *
	 * @param   int     $pk     The item's id
	 *
	 * @param   string  $table  The table's name
	 *
	 * @param   string  $field  The field's name
	 *
	 * @return  array  The files
	 */
	public static function getFiles($pk, $table, $field)
	{
		$db = JFactory::getDbo();
		$query = $db->getQuery(true);

		$query
			->select($field)
			->from($table)
			->where('id = ' . (int) $pk);

		$db->setQuery($query);

		return explode(',', $db->loadResult());
	}

	/**
	 * Gets a list of the actions that can be performed.
	 *
	 * @return    JObject
	 *
	 * @since    1.6
	 */
	public static function getActions()
	{
		$user   = JFactory::getUser();
		$result = new JObject;

		$assetName = 'com_listings';

		$actions = array(
			'core.admin', 'core.manage', 'core.create', 'core.edit', 'core.edit.own', 'core.edit.state', 'core.delete'
		);

		foreach ($actions as $action)
		{
			$result->set($action, $user->authorise($action, $assetName));
		}

		return $result;
	}

	/**
	 * exportArrayToCSV function.
	 * 
	 * @access public
	 * @static
	 * @param mixed $array
	 * @return void
	 */
	public static function exportArrayToCSV($array, $filename, $delimiter=";")
	{
	    $config  =   JFactory::getConfig();
	    $tmppath =   $config->get('tmp_path');

	    $keys    =   array_keys($array);

	    if(is_dir($tmppath)) {
	    	$filename   =   "$filename.csv";
	        $filepath   =   "$tmppath/$filename";
	        $file       =   new SplFileObject($filepath, 'w');

	        $file->fputcsv(array_keys($array[$keys[0]]),$delimiter);

	        foreach ($array as $fields) 
	        {
	            $file->fputcsv($fields,$delimiter);
	        }

	        if(file_exists($filepath)) {
	        	header ( 'Content-Description: File Transfer' );
	            header ( 'Content-Type: application/force-download' );
	            header ( 'Content-Type: application/octet-stream' );
	            header ( 'Content-Disposition: attachment; filename=' . $filename ); 
	            header ( 'Expires: 0' );
	            header ( 'Cache-Control: must-revalidate' );
	            header ( 'Pragma: public' );
	            header ( 'Content-Length: ' . filesize ($filepath) );
	            ob_clean(); 
	            flush();
	                readfile ($filepath);
	                unlink($filepath); 
	            exit();
	        } else {
	        	return false;
	        }
	        
	    } else {
	    	return false;
	    }
	    
	}  
}

