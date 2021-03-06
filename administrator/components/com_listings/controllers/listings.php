<?php
/**
 * @version    CVS: 1.0.0
 * @package    Com_Listings
 * @author     Michael Buluma <michael@buluma.me.ke>
 * @copyright  2018 Michael Buluma
 * @license    GNU General Public License version 2 or later; see LICENSE.txt
 */

// No direct access.
defined('_JEXEC') or die;

jimport('joomla.application.component.controlleradmin');

use Joomla\Utilities\ArrayHelper;

/**
 * Listings list controller class.
 *
 * @since  1.6
 */
class ListingsControllerListings extends JControllerAdmin
{
	/**
	 * Method to clone existing Listings
	 *
	 * @return void
	 */
	public function duplicate()
	{
		// Check for request forgeries
		Jsession::checkToken() or jexit(JText::_('JINVALID_TOKEN'));

		// Get id(s)
		$pks = $this->input->post->get('cid', array(), 'array');

		try
		{
			if (empty($pks))
			{
				throw new Exception(JText::_('COM_LISTINGS_NO_ELEMENT_SELECTED'));
			}

			ArrayHelper::toInteger($pks);
			$model = $this->getModel();
			$model->duplicate($pks);
			$this->setMessage(Jtext::_('COM_LISTINGS_ITEMS_SUCCESS_DUPLICATED'));
		}
		catch (Exception $e)
		{
			JFactory::getApplication()->enqueueMessage($e->getMessage(), 'warning');
		}

		$this->setRedirect('index.php?option=com_listings&view=listings');
	}

	/**
	 * Proxy for getModel.
	 *
	 * @param   string  $name    Optional. Model name
	 * @param   string  $prefix  Optional. Class prefix
	 * @param   array   $config  Optional. Configuration array for model
	 *
	 * @return  object	The Model
	 *
	 * @since    1.6
	 */
	public function getModel($name = 'listing', $prefix = 'ListingsModel', $config = array())
	{
		$model = parent::getModel($name, $prefix, array('ignore_request' => true));

		return $model;
	}

	/**
	 * Method to save the submitted ordering values for records via AJAX.
	 *
	 * @return  void
	 *
	 * @since   3.0
	 */
	public function saveOrderAjax()
	{
		// Get the input
		$input = JFactory::getApplication()->input;
		$pks   = $input->post->get('cid', array(), 'array');
		$order = $input->post->get('order', array(), 'array');

		// Sanitize the input
		ArrayHelper::toInteger($pks);
		ArrayHelper::toInteger($order);

		// Get the model
		$model = $this->getModel();

		// Save the ordering
		$return = $model->saveorder($pks, $order);

		if ($return)
		{
			echo "1";
		}

		// Close the application
		JFactory::getApplication()->close();
	}

	//export function
	public function export()
	{
		header("Content-type: text/csv");
		header("Content-Disposition: attachment; filename=listings.csv");
		header("Pragma: no-cache");
		header("Expires: 0");
		
		$this->getModel()->getCsv();
		
		jexit();
	}

	/**
	 * exportcsv function.
	 * 
	 * @access public
	 * @return void
	 */
	public function exportcsv()
	{

	    $jinput = JFactory::getApplication()->input;
	    $ids = $jinput->get('cid', '', 'array');
	    $modelitems = $this->getModel();
	    // echo '<pre>';
	    // var_dump($ids);
	    // echo '<pre/>';
	    // exit();

	    $array = array();

	    foreach($ids as $id)
	    {
	        $item = $modelitems->getItem($id);      
	        $array[$item->id]['itemid'] = $item->id;
	        $array[$item->listing]['listing'] = $item->listing;
	        $array[$item->listed]['listed'] = $item->listed;
	        $array[$item->listed]['listed'] = $item->listed;
	        $array[$item->store]['store'] = $item->store;
	        $array[$item->created_by]['created_by'] = $item->created_by;
	        $array[$item->created_on]['created_on'] = $item->created_on;
	        // var_dump($array);
	        // exit();
	    }

	    $csv = ListingsHelper::exportArrayToCSV($array, "items-report");
	    // ArrayHelper::exportArrayToCSV($array, "items-report");
	    $this->setRedirect('index.php?option=bestia&view=items', false);        

	}       
}
