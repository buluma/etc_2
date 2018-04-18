<?php
/**
 * @version    CVS: 1.0.0
 * @package    Com_Bts_products
 * @author     Michael Buluma <michael@buluma.me.ke>
 * @copyright  2018 Michael Buluma
 * @license    GNU General Public License version 2 or later; see LICENSE.txt
 */

// No direct access
defined('_JEXEC') or die;

// Access check.
if (!JFactory::getUser()->authorise('core.manage', 'com_bts_products'))
{
	throw new Exception(JText::_('JERROR_ALERTNOAUTHOR'));
}

// Include dependancies
jimport('joomla.application.component.controller');

JLoader::registerPrefix('Bts_products', JPATH_COMPONENT_ADMINISTRATOR);
JLoader::register('Bts_productsHelper', JPATH_COMPONENT_ADMINISTRATOR . DIRECTORY_SEPARATOR . 'helpers' . DIRECTORY_SEPARATOR . 'bts_products.php');

$controller = JControllerLegacy::getInstance('Bts_products');
$controller->execute(JFactory::getApplication()->input->get('task'));
$controller->redirect();
