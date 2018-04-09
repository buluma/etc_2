<?php
/**
 * @version    CVS: 1.0.0
 * @package    Com_Shop_checkin
 * @author     Michael Buluma <michael@buluma.co.ke>
 * @copyright  2018 Michael Buluma
 * @license    GNU General Public License version 2 or later; see LICENSE.txt
 */

// No direct access
defined('_JEXEC') or die;

jimport('joomla.application.component.controllerform');

/**
 * Shop_checkin controller class.
 *
 * @since  1.6
 */
class Shop_checkinControllerShop_checkin extends JControllerForm
{
	/**
	 * Constructor
	 *
	 * @throws Exception
	 */
	public function __construct()
	{
		$this->view_list = 'shop_checkins';
		parent::__construct();
	}
}
