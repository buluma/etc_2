<?php
/**
 * @version    CVS: 1.0.0
 * @package    Com_Brandstocks
 * @author     Michael Buluma <michael@buluma.me.ke>
 * @copyright  2018 Michael Buluma
 * @license    GNU General Public License version 2 or later; see LICENSE.txt
 */

// No direct access
defined('_JEXEC') or die;

// Access check.
if (!JFactory::getUser()->authorise('core.manage', 'com_brandstocks'))
{
	throw new Exception(JText::_('JERROR_ALERTNOAUTHOR'));
}

// Include dependancies
jimport('joomla.application.component.controller');

JLoader::registerPrefix('Brandstocks', JPATH_COMPONENT_ADMINISTRATOR);
JLoader::register('BrandstocksHelper', JPATH_COMPONENT_ADMINISTRATOR . DIRECTORY_SEPARATOR . 'helpers' . DIRECTORY_SEPARATOR . 'brandstocks.php');

$controller = JControllerLegacy::getInstance('Brandstocks');
$controller->execute(JFactory::getApplication()->input->get('task'));
$controller->redirect();
