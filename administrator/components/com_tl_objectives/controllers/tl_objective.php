<?php
/**
 * @version    CVS: 1.0.0
 * @package    Com_Tl_objectives
 * @author     Michael Buluma <michael@buluma.co.ke>
 * @copyright  2018 Michael Buluma
 * @license    GNU General Public License version 2 or later; see LICENSE.txt
 */

// No direct access
defined('_JEXEC') or die;

jimport('joomla.application.component.controllerform');

/**
 * Tl_objective controller class.
 *
 * @since  1.6
 */
class Tl_objectivesControllerTl_objective extends JControllerForm
{
	/**
	 * Constructor
	 *
	 * @throws Exception
	 */
	public function __construct()
	{
		$this->view_list = 'tl_objectives';
		parent::__construct();
	}
}
