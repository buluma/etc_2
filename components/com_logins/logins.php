<?php
/**
 * @version    CVS: 1.0.0
 * @package    Com_Logins
 * @author     Michael Buluma <michael@buluma.me.ke>
 * @copyright  2018 Michael Buluma
 * @license    GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

// Include dependancies
jimport('joomla.application.component.controller');

JLoader::registerPrefix('Logins', JPATH_COMPONENT);
JLoader::register('LoginsController', JPATH_COMPONENT . '/controller.php');


// Execute the task.
$controller = JControllerLegacy::getInstance('Logins');
$controller->execute(JFactory::getApplication()->input->get('task'));
$controller->redirect();
