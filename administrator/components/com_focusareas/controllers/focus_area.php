<?php
/**
 * @version    CVS: 1.0.0
 * @package    Com_Focusareas
 * @author     Michael Buluma <michael@buluma.me.ke>
 * @copyright  2018 Michael Buluma
 * @license    GNU General Public License version 2 or later; see LICENSE.txt
 */

// No direct access
defined('_JEXEC') or die;

jimport('joomla.application.component.controllerform');

/**
 * Focus_area controller class.
 *
 * @since  1.6
 */
class FocusareasControllerFocus_area extends JControllerForm
{
	/**
	 * Constructor
	 *
	 * @throws Exception
	 */
	public function __construct()
	{
		$this->view_list = 'focus_areas';
		parent::__construct();
	}
}
