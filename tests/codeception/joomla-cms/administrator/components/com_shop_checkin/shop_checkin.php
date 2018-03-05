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

// Access check.
if (!JFactory::getUser()->authorise('core.manage', 'com_shop_checkin'))
{
	throw new Exception(JText::_('JERROR_ALERTNOAUTHOR'));
}

// Include dependancies
jimport('joomla.application.component.controller');

JLoader::registerPrefix('Shop_checkin', JPATH_COMPONENT_ADMINISTRATOR);
JLoader::register('Shop_checkinHelper', JPATH_COMPONENT_ADMINISTRATOR . DIRECTORY_SEPARATOR . 'helpers' . DIRECTORY_SEPARATOR . 'shop_checkin.php');

$controller = JControllerLegacy::getInstance('Shop_checkin');
$controller->execute(JFactory::getApplication()->input->get('task'));
$controller->redirect();
