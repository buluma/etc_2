<?php
/**
 * @version    CVS: 1.0.0
 * @package    Com_Promotions
 * @author     Michael Buluma <michael@buluma.me.ke>
 * @copyright  2018 Michael Buluma
 * @license    GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

// Include dependancies
jimport('joomla.application.component.controller');

JLoader::registerPrefix('Promotions', JPATH_COMPONENT);
JLoader::register('PromotionsController', JPATH_COMPONENT . '/controller.php');


// Execute the task.
$controller = JControllerLegacy::getInstance('Promotions');
$controller->execute(JFactory::getApplication()->input->get('task'));
$controller->redirect();