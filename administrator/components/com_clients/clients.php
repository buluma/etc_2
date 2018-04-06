<?php
/**
 * @version    CVS: 1.0.0
 * @package    Com_Clients
 * @author     Michael Buluma <michael@buluma.me.ke>
 * @copyright  2018 Michael Buluma
 * @license    GNU General Public License version 2 or later; see LICENSE.txt
 */

// No direct access
defined('_JEXEC') or die;

// Access check.
if (!JFactory::getUser()->authorise('core.manage', 'com_clients'))
{
	throw new Exception(JText::_('JERROR_ALERTNOAUTHOR'));
}

// Include dependancies
jimport('joomla.application.component.controller');

JLoader::registerPrefix('Clients', JPATH_COMPONENT_ADMINISTRATOR);
JLoader::register('ClientsHelper', JPATH_COMPONENT_ADMINISTRATOR . DIRECTORY_SEPARATOR . 'helpers' . DIRECTORY_SEPARATOR . 'clients.php');

$controller = JControllerLegacy::getInstance('Clients');
$controller->execute(JFactory::getApplication()->input->get('task'));
$controller->redirect();
