<?php

/**
 * @version    CVS: 1.0.0
 * @package    Com_Perfect_checklist
 * @author     Michael Buluma <michael@buluma.me.ke>
 * @copyright  2018 Michael Buluma
 * @license    GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

use Joomla\CMS\Factory;

jimport('joomla.application.component.modellist');

/**
 * Methods supporting a list of Perfect_checklist records.
 *
 * @since  1.6
 */
class Perfect_checklistModelChecklists extends JModelList
{
	/**
	 * Constructor.
	 *
	 * @param   array  $config  An optional associative array of configuration settings.
	 *
	 * @see        JController
	 * @since      1.6
	 */
	public function __construct($config = array())
	{
		if (empty($config['filter_fields']))
		{
			$config['filter_fields'] = array(
				'id', 'a.id',
				'ordering', 'a.ordering',
				'state', 'a.state',
				'created_by', 'a.created_by',
				'modified_by', 'a.modified_by',
				'inputdate', 'a.inputdate',
				'client_id', 'a.client_id',
				'shop_mml', 'a.shop_mml',
				'sku_available', 'a.sku_available',
				'merchandising', 'a.merchandising',
				'shelf_quantity', 'a.shelf_quantity',
				'right_prices', 'a.right_prices',
				'visible_tags', 'a.visible_tags',
				'store_id', 'a.store_id',
				'dateformat', 'a.dateformat',
			);
		}

		parent::__construct($config);
	}

	/**
	 * Method to auto-populate the model state.
	 *
	 * Note. Calling getState in this method will result in recursion.
	 *
	 * @param   string  $ordering   Elements order
	 * @param   string  $direction  Order direction
	 *
	 * @return void
	 *
	 * @throws Exception
	 *
	 * @since    1.6
	 */
	protected function populateState($ordering = null, $direction = null)
	{
		$app  = Factory::getApplication();
		$list = $app->getUserState($this->context . '.list');

		$ordering  = isset($list['filter_order'])     ? $list['filter_order']     : null;
		$direction = isset($list['filter_order_Dir']) ? $list['filter_order_Dir'] : null;

		$list['limit']     = (int) Factory::getConfig()->get('list_limit', 20);
		$list['start']     = $app->input->getInt('start', 0);
		$list['ordering']  = $ordering;
		$list['direction'] = $direction;

		$app->setUserState($this->context . '.list', $list);
		$app->input->set('list', null);

		// List state information.
		parent::populateState($ordering, $direction);

        $app = Factory::getApplication();

        $ordering  = $app->getUserStateFromRequest($this->context . '.ordercol', 'filter_order', $ordering);
        $direction = $app->getUserStateFromRequest($this->context . '.orderdirn', 'filter_order_Dir', $ordering);

        $this->setState('list.ordering', $ordering);
        $this->setState('list.direction', $direction);

        $start = $app->getUserStateFromRequest($this->context . '.limitstart', 'limitstart', 0, 'int');
        $limit = $app->getUserStateFromRequest($this->context . '.limit', 'limit', 0, 'int');

        if ($limit == 0)
        {
            $limit = $app->get('list_limit', 0);
        }

        $this->setState('list.limit', $limit);
        $this->setState('list.start', $start);
	}

	/**
	 * Build an SQL query to load the list data.
	 *
	 * @return   JDatabaseQuery
	 *
	 * @since    1.6
	 */
	protected function getListQuery()
	{
		// Create a new query object.
		$db    = $this->getDbo();
		$query = $db->getQuery(true);

		// Select the required fields from the table.
		$query
			->select(
				$this->getState(
					'list.select', 'DISTINCT a.*'
				)
			);

		$query->from('`#__perfect_checklist` AS a');
		
		// Join over the users for the checked out user.
		$query->select('uc.name AS uEditor');
		$query->join('LEFT', '#__users AS uc ON uc.id=a.checked_out');

		// Join over the created by field 'created_by'
		$query->join('LEFT', '#__users AS created_by ON created_by.id = a.created_by');

		// Join over the created by field 'modified_by'
		$query->join('LEFT', '#__users AS modified_by ON modified_by.id = a.modified_by');
		
		if (!Factory::getUser()->authorise('core.edit', 'com_perfect_checklist'))
		{
			$query->where('a.state = 1');
		}

		// Filter by search in title
		$search = $this->getState('filter.search');

		if (!empty($search))
		{
			if (stripos($search, 'id:') === 0)
			{
				$query->where('a.id = ' . (int) substr($search, 3));
			}
			else
			{
				$search = $db->Quote('%' . $db->escape($search, true) . '%');
			}
		}
		

		// Filtering created_by
		$filter_created_by = $this->state->get("filter.created_by");

		if ($filter_created_by)
		{
			$query->where("a.`created_by` = '" . $db->escape($filter_created_by) . "'");
		}

		// Filtering sku_available
		$filter_sku_available = $this->state->get("filter.sku_available");
		if ($filter_sku_available != '') {
			$query->where("a.`sku_available` = '".$db->escape($filter_sku_available)."'");
		}

		// Filtering store_id
		$filter_store_id = $this->state->get("filter.store_id");
		if ($filter_store_id != '') {
			$query->where("a.`store_id` = '".$db->escape($filter_store_id)."'");
		}

		// Filtering dateformat
		// Checking "_dateformat"
		$filter_dateformat_from = $this->state->get("filter.dateformat_from_dateformat");
		$filter_Qdateformat_from = (!empty($filter_dateformat_from)) ? $this->isValidDate($filter_dateformat_from) : null;

		if ($filter_Qdateformat_from != null)
		{
			$query->where("a.dateformat >= '" . $db->escape($filter_Qdateformat_from) . "'");
		}

		$filter_dateformat_to = $this->state->get("filter.dateformat_to_dateformat");
		$filter_Qdateformat_to = (!empty($filter_dateformat_to)) ? $this->isValidDate($filter_dateformat_to) : null ;

		if ($filter_Qdateformat_to != null)
		{
			$query->where("a.dateformat <= '" . $db->escape($filter_Qdateformat_to) . "'");
		}

		// Add the list ordering clause.
		$orderCol  = $this->state->get('list.ordering');
		$orderDirn = $this->state->get('list.direction');

		if ($orderCol && $orderDirn)
		{
			$query->order($db->escape($orderCol . ' ' . $orderDirn));
		}

		return $query;
	}

	/**
	 * Method to get an array of data items
	 *
	 * @return  mixed An array of data on success, false on failure.
	 */
	public function getItems()
	{
		$items = parent::getItems();
		
		foreach ($items as $item)
		{

			$item->sku_available = JText::_('COM_PERFECT_CHECKLIST_CHECKLISTS_SKU_AVAILABLE_OPTION_' . strtoupper($item->sku_available));

			if (isset($item->store_id))
			{
				$values    = explode(',', $item->store_id);
				$textValue = array();

				foreach ($values as $value)
				{
					if (!empty($value))
					{
						$db    = Factory::getDbo();
						$query = "SELECT id, shop_name FROM `#__outlets` HAVING id LIKE '" . $value . "'";

						$db->setQuery($query);
						$results = $db->loadObject();

						if ($results)
						{
							$textValue[] = $results->shop_name;
						}
					}
				}

				$item->store_id = !empty($textValue) ? implode(', ', $textValue) : $item->store_id;
			}
		}

		return $items;
	}

	/**
	 * Overrides the default function to check Date fields format, identified by
	 * "_dateformat" suffix, and erases the field if it's not correct.
	 *
	 * @return void
	 */
	protected function loadFormData()
	{
		$app              = Factory::getApplication();
		$filters          = $app->getUserState($this->context . '.filter', array());
		$error_dateformat = false;

		foreach ($filters as $key => $value)
		{
			if (strpos($key, '_dateformat') && !empty($value) && $this->isValidDate($value) == null)
			{
				$filters[$key]    = '';
				$error_dateformat = true;
			}
		}

		if ($error_dateformat)
		{
			$app->enqueueMessage(JText::_("COM_PERFECT_CHECKLIST_SEARCH_FILTER_DATE_FORMAT"), "warning");
			$app->setUserState($this->context . '.filter', $filters);
		}

		return parent::loadFormData();
	}

	/**
	 * Checks if a given date is valid and in a specified format (YYYY-MM-DD)
	 *
	 * @param   string  $date  Date to be checked
	 *
	 * @return bool
	 */
	private function isValidDate($date)
	{
		$date = str_replace('/', '-', $date);
		return (date_create($date)) ? Factory::getDate($date)->format("Y-m-d") : null;
	}
}
