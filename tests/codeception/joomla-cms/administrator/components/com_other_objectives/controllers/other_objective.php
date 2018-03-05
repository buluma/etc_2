<?php
/**
 * @version    CVS: 1.0.0
 * @package    Com_Other_objectives
 * @author     Michael Buluma <michael@buluma.co.ke>
 * @copyright  2018 Michael Buluma
 * @license    GNU General Public License version 2 or later; see LICENSE.txt
 */

// No direct access
defined('_JEXEC') or die;

jimport('joomla.application.component.controllerform');

/**
 * Other_objective controller class.
 *
 * @since  1.6
 */
class Other_objectivesControllerOther_objective extends JControllerForm
{
	/**
	 * Constructor
	 *
	 * @throws Exception
	 */
	public function __construct()
	{
		$this->view_list = 'other_objectives';
		parent::__construct();
	}
}
