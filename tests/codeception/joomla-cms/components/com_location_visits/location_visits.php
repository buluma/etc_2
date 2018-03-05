<?php
/**
 * @version    CVS: 1.0.0
 * @package    Com_Location_visits
 * @author     Michael Buluma <michael@buluma.co.ke>
 * @copyright  2018 Michael Buluma
 * @license    GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

// Include dependancies
jimport('joomla.application.component.controller');

JLoader::registerPrefix('Location_visits', JPATH_COMPONENT);
JLoader::register('Location_visitsController', JPATH_COMPONENT . '/controller.php');


// Execute the task.
$controller = JControllerLegacy::getInstance('Location_visits');
$controller->execute(JFactory::getApplication()->input->get('task'));
$controller->redirect();
