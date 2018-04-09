<?php
/**
 * @version    CVS: 1.0.0
 * @package    Com_Assets
 * @author     Michael Buluma <michael@buluma.me.ke>
 * @copyright  2018 Michael Buluma
 * @license    GNU General Public License version 2 or later; see LICENSE.txt
 */

// No direct access
defined('_JEXEC') or die;

// Access check.
if (!JFactory::getUser()->authorise('core.manage', 'com_assets'))
{
	throw new Exception(JText::_('JERROR_ALERTNOAUTHOR'));
}

// Include dependancies
jimport('joomla.application.component.controller');

JLoader::registerPrefix('Assets', JPATH_COMPONENT_ADMINISTRATOR);
JLoader::register('AssetsHelper', JPATH_COMPONENT_ADMINISTRATOR . DIRECTORY_SEPARATOR . 'helpers' . DIRECTORY_SEPARATOR . 'assets.php');

$controller = JControllerLegacy::getInstance('Assets');
$controller->execute(JFactory::getApplication()->input->get('task'));
$controller->redirect();
