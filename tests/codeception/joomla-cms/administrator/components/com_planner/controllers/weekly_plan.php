<?php
/**
 * @version    CVS: 1.0.0
 * @package    Com_Planner
 * @author     Michael Buluma <michael@buluma.me.ke>
 * @copyright  2018 Michael Buluma
 * @license    GNU General Public License version 2 or later; see LICENSE.txt
 */

// No direct access
defined('_JEXEC') or die;

jimport('joomla.application.component.controllerform');

/**
 * Weekly_plan controller class.
 *
 * @since  1.6
 */
class PlannerControllerWeekly_plan extends JControllerForm
{
	/**
	 * Constructor
	 *
	 * @throws Exception
	 */
	public function __construct()
	{
		$this->view_list = 'weekly_plans';
		parent::__construct();
	}
}
