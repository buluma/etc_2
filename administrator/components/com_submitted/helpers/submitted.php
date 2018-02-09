<?php

/**
 * @version    CVS: 1.0.0
 * @package    Com_Submitted
 * @author     Michael Buluma <michael@buluma.me.ke>
 * @copyright  2018 Michael Buluma
 * @license    GNU General Public License version 2 or later; see LICENSE.txt
 */
// No direct access
defined('_JEXEC') or die;

/**
 * Submitted helper.
 *
 * @since  1.6
 */
class SubmittedHelper
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
			JText::_('Assets'),
			'index.php?option=com_submitted&view=assets',
			$vName == 'assets'
		);

		JHtmlSidebar::addEntry(
			JText::_('Competitor Activities'),
			'index.php?option=com_submitted&view=activities',
			$vName == 'activities'
		);

		JHtmlSidebar::addEntry(
			JText::_('Field - Focus Areas'),
			'index.php?option=com_submitted&view=tlfocusareas',
			$vName == 'flfocusareas'
		);

		JHtmlSidebar::addEntry(
			JText::_('Listings'),
			'index.php?option=com_submitted&view=listings',
			$vName == 'listings'
		);

		JHtmlSidebar::addEntry(
			JText::_('COM_SUBMITTED_TITLE_CHECKLISTS'),
			'index.php?option=com_submitted&view=checklists',
			$vName == 'checklists'
		);

		JHtmlSidebar::addEntry(
			JText::_('Photos'),
			'index.php?option=com_photos&view=photos',
			$vName == 'photos'
		);

		JHtmlSidebar::addEntry(
			JText::_('Price Index Survey'),
			'index.php?option=com_submitted&view=psi',
			$vName == 'psi'
		);

		JHtmlSidebar::addEntry(
			JText::_('Promotions'),
			'index.php?option=com_submitted&view=promotions',
			$vName == 'promotions'
		);

		JHtmlSidebar::addEntry(
			JText::_('Quality Issues'),
			'index.php?option=com_submitted&view=qa',
			$vName == 'qa'
		);

		JHtmlSidebar::addEntry(
			JText::_('COM_SUBMITTED_TITLE_TLFOCUSAREAS'),
			'index.php?option=com_submitted&view=tlfocusareas',
			$vName == 'tlfocusareas'
		);

		JHtmlSidebar::addEntry(
			JText::_('Voice of Customer'),
			'index.php?option=com_submitted&view=voc',
			$vName == 'voc'
		);

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

		$assetName = 'com_submitted';

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

