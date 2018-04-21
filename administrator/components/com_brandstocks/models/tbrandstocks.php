<?php

/**
 * @version    CVS: 1.0.0
 * @package    Com_Brandstocks
 * @author     Michael Buluma <michael@buluma.me.ke>
 * @copyright  2018 Michael Buluma
 * @license    GNU General Public License version 2 or later; see LICENSE.txt
 */
defined('_JEXEC') or die;

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
				'id', 'a.`id`',
				'ordering', 'a.`ordering`',
				'state', 'a.`state`',
				'created_by', 'a.`created_by`',
				'modified_by', 'a.`modified_by`',
				'brand', 'a.`brand`',
				'brandcode', 'a.`brandcode`',
				'currentstock', 'a.`currentstock`',
				'order_placed', 'a.`order_placed`',
				'orderplaced', 'a.`orderplaced`',
				'order_date', 'a.`order_date`',
				'lpo_number', 'a.`lpo_number`',
				'delivered', 'a.`delivered`',
				'sale', 'a.`sale`',
				'stockout', 'a.`stockout`',
				'submitter', 'a.`submitter`',
				'client_id', 'a.`client_id`',
				'stockdate', 'a.`stockdate`',
				'store_id', 'a.`store_id`',
				'store_server_id', 'a.`store_server_id`',
				'client_modified_date', 'a.`client_modified_date`',
				'store', 'a.`store`',
				'remarks', 'a.`remarks`',
				'coordinates', 'a.`coordinates`',
				'created', 'a.`created`',
				'first_insert', 'a.`first_insert`',
				'server_modified_date', 'a.`server_modified_date`',
				'last_sync_date', 'a.`last_sync_date`',
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
	 */
	protected function populateState($ordering = null, $direction = null)
	{
		// Initialise variables.
		$app = JFactory::getApplication('administrator');

		// Load the filter state.
		$search = $app->getUserStateFromRequest($this->context . '.filter.search', 'filter_search');
		$this->setState('filter.search', $search);

		$published = $app->getUserStateFromRequest($this->context . '.filter.state', 'filter_published', '', 'string');
		$this->setState('filter.state', $published);
		// Filtering currentstock
		$this->setState('filter.currentstock', $app->getUserStateFromRequest($this->context.'.filter.currentstock', 'filter_currentstock', '', 'string'));

		// Filtering order_placed
		$this->setState('filter.order_placed', $app->getUserStateFromRequest($this->context.'.filter.order_placed', 'filter_order_placed', '', 'string'));

		// Filtering order_date
		$this->setState('filter.order_date.from', $app->getUserStateFromRequest($this->context.'.filter.order_date.from', 'filter_from_order_date', '', 'string'));
		$this->setState('filter.order_date.to', $app->getUserStateFromRequest($this->context.'.filter.order_date.to', 'filter_to_order_date', '', 'string'));

		// Filtering delivered
		$this->setState('filter.delivered', $app->getUserStateFromRequest($this->context.'.filter.delivered', 'filter_delivered', '', 'string'));

		// Filtering stockout
		$this->setState('filter.stockout', $app->getUserStateFromRequest($this->context.'.filter.stockout', 'filter_stockout', '', 'string'));

		// Filtering submitter
		$this->setState('filter.submitter', $app->getUserStateFromRequest($this->context.'.filter.submitter', 'filter_submitter', '', 'string'));

		// Filtering store_id
		$this->setState('filter.store_id', $app->getUserStateFromRequest($this->context.'.filter.store_id', 'filter_store_id', '', 'string'));

		// Filtering store_server_id
		$this->setState('filter.store_server_id', $app->getUserStateFromRequest($this->context.'.filter.store_server_id', 'filter_store_server_id', '', 'string'));

		// Filtering store
		$this->setState('filter.store', $app->getUserStateFromRequest($this->context.'.filter.store', 'filter_store', '', 'string'));


		// Load the parameters.
		$params = JComponentHelper::getParams('com_brandstocks');
		$this->setState('params', $params);

		// List state information.
		parent::populateState('a.brandcode', 'asc');
	}

	/**
	 * Method to get a store id based on model configuration state.
	 *
	 * This is necessary because the model is used by the component and
	 * different modules that might need different sets of data or different
	 * ordering requirements.
	 *
	 * @param   string  $id  A prefix for the store id.
	 *
	 * @return   string A store id.
	 *
	 * @since    1.6
	 */
	protected function getStoreId($id = '')
	{
		// Compile the store id.
		$id .= ':' . $this->getState('filter.search');
		$id .= ':' . $this->getState('filter.state');

		return parent::getStoreId($id);
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
		$query->select(
			$this->getState(
				'list.select', 'DISTINCT a.*'
			)
		);
		$query->from('`#__brandstocks` AS a');

		// Join over the users for the checked out user
		$query->select("uc.name AS uEditor");
		$query->join("LEFT", "#__users AS uc ON uc.id=a.checked_out");

		// Join over the user field 'created_by'
		$query->select('`created_by`.name AS `created_by`');
		$query->join('LEFT', '#__users AS `created_by` ON `created_by`.id = a.`created_by`');

		// Join over the user field 'modified_by'
		$query->select('`modified_by`.name AS `modified_by`');
		$query->join('LEFT', '#__users AS `modified_by` ON `modified_by`.id = a.`modified_by`');

		// Join over the user field 'submitter'
		$query->select('`submitter`.name AS `submitter`');
		$query->join('LEFT', '#__users AS `submitter` ON `submitter`.id = a.`submitter`');
		
		// Join over the client field 'client_id'
		$query->select('`client_id`.client_name AS `client_id`');
		$query->join('LEFT', '#__clients AS `client_id` ON `client_id`.id = a.`client_id`');

		// Filter by published state
		$published = $this->getState('filter.state');

		if (is_numeric($published))
		{
			$query->where('a.state = ' . (int) $published);
		}
		elseif ($published === '')
		{
			$query->where('(a.state IN (0, 1))');
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
		$filter_order_date_from = $this->state->get("filter.order_date.from");

		if ($filter_order_date_from !== null && !empty($filter_order_date_from))
		{
			$query->where("a.`order_date` >= '".$db->escape($filter_order_date_from)."'");
		}
		$filter_order_date_to = $this->state->get("filter.order_date.to");

		if ($filter_order_date_to !== null  && !empty($filter_order_date_to))
		{
			$query->where("a.`order_date` <= '".$db->escape($filter_order_date_to)."'");
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

		if ($filter_submitter !== null && !empty($filter_submitter))
		{
			$query->where("a.`submitter` = '".$db->escape($filter_submitter)."'");
		}

		// Filtering store_id
		$filter_store_id = $this->state->get("filter.store_id");

		if ($filter_store_id !== null && (is_numeric($filter_store_id) || !empty($filter_store_id)))
		{
			$query->where("a.`store_id` = '".$db->escape($filter_store_id)."'");
		}

		// Filtering store_server_id
		$filter_store_server_id = $this->state->get("filter.store_server_id");

		if ($filter_store_server_id !== null && (is_numeric($filter_store_server_id) || !empty($filter_store_server_id)))
		{
			$query->where("a.`store_server_id` = '".$db->escape($filter_store_server_id)."'");
		}

		// Filtering store
		$filter_store = $this->state->get("filter.store");

		if ($filter_store !== null && (is_numeric($filter_store) || !empty($filter_store)))
		{
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
	 * Get an array of data items
	 *
	 * @return mixed Array of data items on success, false on failure.
	 */
	public function getItems()
	{
		$items = parent::getItems();

		foreach ($items as $oneItem)
		{
			// $oneItem->order_placed = ($oneItem->order_placed == '') ? '' : JText::_('COM_BRANDSTOCKS_TBRANDSTOCKS_ORDER_PLACED_OPTION_' . strtoupper($oneItem->order_placed));
			// $oneItem->delivered = ($oneItem->delivered == '') ? '' : JText::_('COM_BRANDSTOCKS_TBRANDSTOCKS_DELIVERED_OPTION_' . strtoupper($oneItem->delivered));
			$oneItem->order_placed = ($oneItem->order_placed == '') ? '' : JText::_($oneItem->order_placed);
			$oneItem->delivered = ($oneItem->delivered == '') ? '' : JText::_($oneItem->delivered);


			if (isset($oneItem->store))
			{
				$values    = explode(',', $oneItem->store);
				$textValue = array();

				foreach ($values as $value)
				{
					if (!empty($value))
					{
						$db = JFactory::getDbo();
						$query = "SELECT id as value, shop_name as text from #__outlets HAVING value LIKE '" . $value . "'";
						$db->setQuery($query);
						$results = $db->loadObject();

						if ($results)
						{
							$textValue[] = $results->text;
						}
					}
				}

				$oneItem->store = !empty($textValue) ? implode(', ', $textValue) : $oneItem->store;
			}
		}

		return $items;
	}
}
