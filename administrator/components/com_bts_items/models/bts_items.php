<?php

/**
 * @version    CVS: 1.0.0
 * @package    Com_Bts_items
 * @author     Michael Buluma <michael@buluma.co.ke>
 * @copyright  2018 Michael Buluma
 * @license    GNU General Public License version 2 or later; see LICENSE.txt
 */
defined('_JEXEC') or die;

jimport('joomla.application.component.modellist');

/**
 * Methods supporting a list of Bts_items records.
 *
 * @since  1.6
 */
class Bts_itemsModelBts_items extends JModelList
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
				'date', 'a.`date`',
				'outlet', 'a.`outlet`',
				'ba_name', 'a.`ba_name`',
				'product', 'a.`product`',
				'sku', 'a.`sku`',
				'target', 'a.`target`',
				'actual', 'a.`actual`',
				'store', 'a.`store`',
				'store_server_id', 'a.`store_server_id`',
				'store_id', 'a.`store_id`',
				'coordinates', 'a.`coordinates`',
				'created', 'a.`created`',
				'client_modified_date', 'a.`client_modified_date`',
				'submitter', 'a.`submitter`',
				'user_id', 'a.`user_id`',
				'last_sync_date', 'a.`last_sync_date`',
				'first_insert_date', 'a.`first_insert_date`',
				'client_id', 'a.`client_id`',
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
		// Filtering date
		$this->setState('filter.date.from', $app->getUserStateFromRequest($this->context.'.filter.date.from', 'filter_from_date', '', 'string'));
		$this->setState('filter.date.to', $app->getUserStateFromRequest($this->context.'.filter.date.to', 'filter_to_date', '', 'string'));

		// Filtering ba_name
		$this->setState('filter.ba_name', $app->getUserStateFromRequest($this->context.'.filter.ba_name', 'filter_ba_name', '', 'string'));

		// Filtering sku
		$this->setState('filter.sku', $app->getUserStateFromRequest($this->context.'.filter.sku', 'filter_sku', '', 'string'));

		// Filtering store
		$this->setState('filter.store', $app->getUserStateFromRequest($this->context.'.filter.store', 'filter_store', '', 'string'));

		// Filtering store_server_id
		$this->setState('filter.store_server_id', $app->getUserStateFromRequest($this->context.'.filter.store_server_id', 'filter_store_server_id', '', 'string'));

		// Filtering store_id
		$this->setState('filter.store_id', $app->getUserStateFromRequest($this->context.'.filter.store_id', 'filter_store_id', '', 'string'));

		// Filtering submitter
		$this->setState('filter.submitter', $app->getUserStateFromRequest($this->context.'.filter.submitter', 'filter_submitter', '', 'string'));

		// Filtering user_id
		$this->setState('filter.user_id', $app->getUserStateFromRequest($this->context.'.filter.user_id', 'filter_user_id', '', 'string'));


		// Load the parameters.
		$params = JComponentHelper::getParams('com_bts_items');
		$this->setState('params', $params);

		// List state information.
		parent::populateState('a.product', 'asc');
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
		$query->from('`#__bts_items` AS a');

		// Join over the users for the checked out user
		$query->select("uc.name AS uEditor");
		$query->join("LEFT", "#__users AS uc ON uc.id=a.checked_out");

		// Join over the user field 'created_by'
		$query->select('`created_by`.name AS `created_by`');
		$query->join('LEFT', '#__users AS `created_by` ON `created_by`.id = a.`created_by`');

		// Join over the user field 'modified_by'
		$query->select('`modified_by`.name AS `modified_by`');
		$query->join('LEFT', '#__users AS `modified_by` ON `modified_by`.id = a.`modified_by`');

		// Join over the user field 'ba_name'
		$query->select('`ba_name`.name AS `ba_name`');
		$query->join('LEFT', '#__users AS `ba_name` ON `ba_name`.id = a.`ba_name`');

		// Join over the user field 'submitter'
		$query->select('`submitter`.name AS `submitter`');
		$query->join('LEFT', '#__users AS `submitter` ON `submitter`.id = a.`submitter`');

		// Join over the user field 'user_id'
		$query->select('`user_id`.name AS `user_id`');
		$query->join('LEFT', '#__users AS `user_id` ON `user_id`.id = a.`user_id`');

		// Join over the product field 'product'
		$query->select('`product`.product_name AS `product_details`');
		$query->join('LEFT', '#__bts_products AS `product` ON `product`.id = a.`product`');

		// Join over the product field 'product' for product sku
		$query->select('`productx`.product_sku AS `product_sku`');
		$query->join('LEFT', '#__bts_products AS `productx` ON `productx`.id = a.`product`');

		// Join over the product field 'product' for product target
		$query->select('`productt`.product_target AS `product_target`');
		$query->join('LEFT', '#__bts_products AS `productt` ON `productt`.id = a.`product`');

		// Join over the images field 'image_id'
		$query->select('`bts_images`.image AS `image_id`');
		$query->join('LEFT', '#__bts_promotion_images AS `bts_images` ON `bts_images`.activity_unique_id = a.`unique_id`');

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
				$query->where('( a.product LIKE ' . $search . '  OR  a.sku LIKE ' . $search . ' )');
			}
		}


		// Filtering date
		$filter_date_from = $this->state->get("filter.date.from");

		if ($filter_date_from !== null && !empty($filter_date_from))
		{
			$query->where("a.`date` >= '".$db->escape($filter_date_from)."'");
		}
		$filter_date_to = $this->state->get("filter.date.to");

		if ($filter_date_to !== null  && !empty($filter_date_to))
		{
			$query->where("a.`date` <= '".$db->escape($filter_date_to)."'");
		}

		// Filtering ba_name
		$filter_ba_name = $this->state->get("filter.ba_name");

		if ($filter_ba_name !== null && !empty($filter_ba_name))
		{
			$query->where("a.`ba_name` = '".$db->escape($filter_ba_name)."'");
		}

		// Filtering sku
		$filter_sku = $this->state->get("filter.sku");

		if ($filter_sku !== null && (is_numeric($filter_sku) || !empty($filter_sku)))
		{
			$query->where("a.`sku` = '".$db->escape($filter_sku)."'");
		}

		// Filtering store
		$filter_store = $this->state->get("filter.store");

		if ($filter_store !== null && (is_numeric($filter_store) || !empty($filter_store)))
		{
			$query->where("a.`store` = '".$db->escape($filter_store)."'");
		}

		// Filtering store_server_id
		$filter_store_server_id = $this->state->get("filter.store_server_id");

		if ($filter_store_server_id !== null && (is_numeric($filter_store_server_id) || !empty($filter_store_server_id)))
		{
			$query->where("a.`store_server_id` = '".$db->escape($filter_store_server_id)."'");
		}

		// Filtering store_id
		$filter_store_id = $this->state->get("filter.store_id");

		if ($filter_store_id !== null && (is_numeric($filter_store_id) || !empty($filter_store_id)))
		{
			$query->where("a.`store_id` = '".$db->escape($filter_store_id)."'");
		}

		// Filtering submitter
		$filter_submitter = $this->state->get("filter.submitter");

		if ($filter_submitter !== null && !empty($filter_submitter))
		{
			$query->where("a.`submitter` = '".$db->escape($filter_submitter)."'");
		}

		// Filtering user_id
		$filter_user_id = $this->state->get("filter.user_id");

		if ($filter_user_id !== null && !empty($filter_user_id))
		{
			$query->where("a.`user_id` = '".$db->escape($filter_user_id)."'");
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

			if (isset($oneItem->product))
			{
				$values    = explode(',', $oneItem->product);
				$textValue = array();

				foreach ($values as $value)
				{
					if (!empty($value))
					{
						$db = JFactory::getDbo();
						$query = "SELECT product_code, product_name FROM #__bts_products WHERE state=1 AND id LIKE '" . $value . "' ORDER BY id ASC";
						$db->setQuery($query);
						$results = $db->loadObject();

						if ($results)
						{
							$textValue[] = $results->product_name;
						}
					}
				}

				$oneItem->product = !empty($textValue) ? implode(', ', $textValue) : $oneItem->product;
			}
					$oneItem->sku = JText::_('COM_BTS_ITEMS_BTS_ITEMS_SKU_OPTION_' . strtoupper($oneItem->sku));

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
