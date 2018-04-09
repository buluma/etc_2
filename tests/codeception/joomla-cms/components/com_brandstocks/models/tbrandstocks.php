<?php

/**
 * @version    CVS: 1.0.0
 * @package    Com_Brandstocks
 * @author     Michael Buluma <michael@buluma.me.ke>
 * @copyright  2018 Michael Buluma
 * @license    GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

use Joomla\CMS\Factory;

jimport('joomla.application.component.modellist');

/**
 * Methods supporting a list of Brandstocks records.
 *
 * @since  1.6
 */
class BrandstocksModelTbrandstocks extends JModelList
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
				'brand', 'a.brand',
				'brandcode', 'a.brandcode',
				'currentstock', 'a.currentstock',
				'order_placed', 'a.order_placed',
				'orderplaced', 'a.orderplaced',
				'order_date', 'a.order_date',
				'lpo_number', 'a.lpo_number',
				'delivered', 'a.delivered',
				'sale', 'a.sale',
				'stockout', 'a.stockout',
				'submitter', 'a.submitter',
				'client_id', 'a.client_id',
				'stockdate', 'a.stockdate',
				'store_id', 'a.store_id',
				'store_server_id', 'a.store_server_id',
				'client_modified_date', 'a.client_modified_date',
				'store', 'a.store',
				'remarks', 'a.remarks',
				'coordinates', 'a.coordinates',
				'created', 'a.created',
				'first_insert', 'a.first_insert',
				'server_modified_date', 'a.server_modified_date',
				'last_sync_date', 'a.last_sync_date',
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

		$query->from('`#__brandstocks` AS a');
		
		// Join over the users for the checked out user.
		$query->select('uc.name AS uEditor');
		$query->join('LEFT', '#__users AS uc ON uc.id=a.checked_out');

		// Join over the created by field 'created_by'
		$query->join('LEFT', '#__users AS created_by ON created_by.id = a.created_by');

		// Join over the created by field 'modified_by'
		$query->join('LEFT', '#__users AS modified_by ON modified_by.id = a.modified_by');

		// Join over the created by field 'submitter'
		$query->join('LEFT', '#__users AS submitter ON submitter.id = a.submitter');
		
		if (!Factory::getUser()->authorise('core.edit', 'com_brandstocks'))
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
				$query->where('( a.brandcode LIKE ' . $search . ' )');
			}
		}
		

		// Filtering currentstock

		// Filtering order_placed
		$filter_order_placed = $this->state->get("filter.order_placed");

		if ($filter_order_placed !== null && (is_numeric($filter_order_placed) || !empty($filter_order_placed)))
		{
			$query->where("a.`order_placed` = '".$db->escape($filter_order_placed)."'");
		}

		// Filtering order_date
		// Checking "_dateformat"
		$filter_order_date_from = $this->state->get("filter.order_date_from_dateformat");
		$filter_Qorder_date_from = (!empty($filter_order_date_from)) ? $this->isValidDate($filter_order_date_from) : null;

		if ($filter_Qorder_date_from != null)
		{
			$query->where("a.order_date >= '" . $db->escape($filter_Qorder_date_from) . "'");
		}

		$filter_order_date_to = $this->state->get("filter.order_date_to_dateformat");
		$filter_Qorder_date_to = (!empty($filter_order_date_to)) ? $this->isValidDate($filter_order_date_to) : null ;

		if ($filter_Qorder_date_to != null)
		{
			$query->where("a.order_date <= '" . $db->escape($filter_Qorder_date_to) . "'");
		}

		// Filtering delivered
		$filter_delivered = $this->state->get("filter.delivered");

		if ($filter_delivered !== null && (is_numeric($filter_delivered) || !empty($filter_delivered)))
		{
			$query->where("a.`delivered` = '".$db->escape($filter_delivered)."'");
		}

		// Filtering stockout

		// Filtering submitter
		$filter_submitter = $this->state->get("filter.submitter");

		if ($filter_submitter)
		{
			$query->where("a.`submitter` = '" . $db->escape($filter_submitter) . "'");
		}

		// Filtering store
		$filter_store = $this->state->get("filter.store");
		if ($filter_store != '') {
			$query->where("a.`store` = '".$db->escape($filter_store)."'");
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
				$item->order_placed = empty($item->order_placed) ? '' : JText::_('COM_BRANDSTOCKS_TBRANDSTOCKS_ORDER_PLACED_OPTION_' . strtoupper($item->order_placed));
				$item->delivered = empty($item->delivered) ? '' : JText::_('COM_BRANDSTOCKS_TBRANDSTOCKS_DELIVERED_OPTION_' . strtoupper($item->delivered));

			if (isset($item->store_id))
			{
				$values    = explode(',', $item->store_id);
				$textValue = array();

				foreach ($values as $value)
				{
					if (!empty($value))
					{
						$db    = Factory::getDbo();
						$query = "SELECT id as value, shop_name as text from #__outlets HAVING value LIKE '" . $value . "'";

						$db->setQuery($query);
						$results = $db->loadObject();

						if ($results)
						{
							$textValue[] = $results->text;
						}
					}
				}

				$item->store_id = !empty($textValue) ? implode(', ', $textValue) : $item->store_id;
			}

			if (isset($item->store_server_id))
			{
				$values    = explode(',', $item->store_server_id);
				$textValue = array();

				foreach ($values as $value)
				{
					if (!empty($value))
					{
						$db    = Factory::getDbo();
						$query = "SELECT id as value, shop_name as text from #__outlets HAVING value LIKE '" . $value . "'";

						$db->setQuery($query);
						$results = $db->loadObject();

						if ($results)
						{
							$textValue[] = $results->text;
						}
					}
				}

				$item->store_server_id = !empty($textValue) ? implode(', ', $textValue) : $item->store_server_id;
			}

			if (isset($item->store))
			{
				$values    = explode(',', $item->store);
				$textValue = array();

				foreach ($values as $value)
				{
					if (!empty($value))
					{
						$db    = Factory::getDbo();
						$query = "SELECT id as value, shop_name as text from #__outlets HAVING value LIKE '" . $value . "'";

						$db->setQuery($query);
						$results = $db->loadObject();

						if ($results)
						{
							$textValue[] = $results->text;
						}
					}
				}

				$item->store = !empty($textValue) ? implode(', ', $textValue) : $item->store;
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
			$app->enqueueMessage(JText::_("COM_BRANDSTOCKS_SEARCH_FILTER_DATE_FORMAT"), "warning");
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
