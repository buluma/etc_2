<?php

/**
 * @version    CVS: 1.0.0
 * @package    Com_Promotions
 * @author     Michael Buluma <michael@buluma.me.ke>
 * @copyright  2018 Michael Buluma
 * @license    GNU General Public License version 2 or later; see LICENSE.txt
 */
// No direct access
defined('_JEXEC') or die;

/**
 * Promotions helper.
 *
 * @since  1.6
 */
class PromotionsHelper
{
	/**
	 * Configure the Linkbar.
	 *
	 * @param   string  $vName  string
	 *
	 * @return void
	 */
	public static function addSubmenu($vName = '')
	{
		JHtmlSidebar::addEntry(
			JText::_('COM_PROMOTIONS_TITLE_PROMOTIONS'),
			'index.php?option=com_promotions&view=promotions',
			$vName == 'promotions'
		);

		JHtmlSidebar::addEntry(
			JText::_('JCATEGORIES') . ' (' . JText::_('COM_PROMOTIONS_TITLE_PROMOTIONS') . ')',
			"index.php?option=com_categories&extension=com_promotions.promotions",
			$vName == 'categories.promotions'
		);
		if ($vName=='categories') {
			JToolBarHelper::title('Promotions: JCATEGORIES (COM_PROMOTIONS_TITLE_PROMOTIONS)');
		}

		// JHtmlSidebar::addEntry(
		// 	JText::_('COM_PROMOTIONS_TITLE_PROMOIMAGES'),
		// 	'index.php?option=com_promotions&view=promoimages',
		// 	$vName == 'promoimages'
		// );
	}

	/**
	 * Gets the files attached to an item
	 *
	 * @param   int     $pk     The item's id
	 *
	 * @param   string  $table  The table's name
	 *
	 * @param   string  $field  The field's name
	 *
	 * @return  array  The files
	 */
	public static function getFiles($pk, $table, $field)
	{
		$db = JFactory::getDbo();
		$query = $db->getQuery(true);

		$query
			->select($field)
			->from($table)
			->where('id = ' . (int) $pk);

		$db->setQuery($query);

		return explode(',', $db->loadResult());
	}

	/**
	 * Gets a list of the actions that can be performed.
	 *
	 * @return    JObject
	 *
	 * @since    1.6
	 */
	public static function getActions()
	{
		$user   = JFactory::getUser();
		$result = new JObject;

		$assetName = 'com_promotions';

		$actions = array(
			'core.admin', 'core.manage', 'core.create', 'core.edit', 'core.edit.own', 'core.edit.state', 'core.delete'
		);

		foreach ($actions as $action)
		{
			$result->set($action, $user->authorise($action, $assetName));
		}

		return $result;
	}
}

