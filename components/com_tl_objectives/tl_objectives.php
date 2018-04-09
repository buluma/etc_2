<?php
/**
 * @version    CVS: 1.0.0
 * @package    Com_Tl_objectives
 * @author     Michael Buluma <michael@buluma.co.ke>
 * @copyright  2018 Michael Buluma
 * @license    GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

// Include dependancies
jimport('joomla.application.component.controller');

JLoader::registerPrefix('Tl_objectives', JPATH_COMPONENT);
JLoader::register('Tl_objectivesController', JPATH_COMPONENT . '/controller.php');


// Execute the task.
$controller = JControllerLegacy::getInstance('Tl_objectives');
$controller->execute(JFactory::getApplication()->input->get('task'));
$controller->redirect();
