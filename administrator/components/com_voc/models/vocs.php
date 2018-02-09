<?php

/**
 * @version    CVS: 1.0.0
 * @package    Com_Voc
 * @author     Michael Buluma <michael@buluma.me.ke>
 * @copyright  2018 Michael Buluma
 * @license    GNU General Public License version 2 or later; see LICENSE.txt
 */
defined('_JEXEC') or die;

jimport('joomla.application.component.modellist');

/**
 * Methods supporting a list of Voc records.
 *
 * @since  1.6
 */
class VocModelVocs extends JModelList
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
				'submitter', 'a.`submitter`',
				'user_id', 'a.`user_id`',
				'last_sync_date', 'a.`last_sync_date`',
				'insert_date', 'a.`insert_date`',
				'photos', 'a.`photos`',
				'brand', 'a.`brand`',
				'brandcode', 'a.`brandcode`',
				'category', 'a.`category`',
				'items', 'a.`items`',
				'commentby', 'a.`commentby`',
				'isurgent', 'a.`isurgent`',
				'store', 'a.`store`',
				'store_id', 'a.`store_id`',
				'store_server_id', 'a.`store_server_id`',
				'remarks', 'a.`remarks`',
				'coordinates', 'a.`coordinates`',
				'client_modified_date', 'a.`client_modified_date`',
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
		// Filtering submitter
		$this->setState('filter.submitter', $app->getUserStateFromRequest($this->context.'.filter.submitter', 'filter_submitter', '', 'string'));

		// Filtering user_id
		$this->setState('filter.user_id', $app->getUserStateFromRequest($this->context.'.filter.user_id', 'filter_user_id', '', 'string'));

		// Filtering brand
		$this->setState('filter.brand', $app->getUserStateFromRequest($this->context.'.filter.brand', 'filter_brand', '', 'string'));

		// Filtering brandcode
		$this->setState('filter.brandcode', $app->getUserStateFromRequest($this->context.'.filter.brandcode', 'filter_brandcode', '', 'string'));

		// Filtering category
		$this->setState('filter.category', $app->getUserStateFromRequest($this->context.'.filter.category', 'filter_category', '', 'string'));

		// Filtering items
		$this->setState('filter.items', $app->getUserStateFromRequest($this->context.'.filter.items', 'filter_items', '', 'string'));

		// Filtering commentby
		$this->setState('filter.commentby', $app->getUserStateFromRequest($this->context.'.filter.commentby', 'filter_commentby', '', 'string'));

		// Filtering isurgent
		$this->setState('filter.isurgent', $app->getUserStateFromRequest($this->context.'.filter.isurgent', 'filter_isurgent', '', 'string'));

		// Filtering store
		$this->setState('filter.store', $app->getUserStateFromRequest($this->context.'.filter.store', 'filter_store', '', 'string'));

		// Filtering store_id
		$this->setState('filter.store_id', $app->getUserStateFromRequest($this->context.'.filter.store_id', 'filter_store_id', '', 'string'));

		// Filtering store_server_id
		$this->setState('filter.store_server_id', $app->getUserStateFromRequest($this->context.'.filter.store_server_id', 'filter_store_server_id', '', 'string'));


		// Load the parameters.
		$params = JComponentHelper::getParams('com_voc');
		$this->setState('params', $params);

		// List state information.
		parent::populateState('a.id', 'asc');
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
		$query->from('`#__voc` AS a');

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

		// Join over the user field 'user_id'
		$query->select('`user_id`.name AS `user_id`');
		$query->join('LEFT', '#__users AS `user_id` ON `user_id`.id = a.`user_id`');

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
				
			}
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

		// Filtering brand
		$filter_brand = $this->state->get("filter.brand");

		if ($filter_brand !== null && (is_numeric($filter_brand) || !empty($filter_brand)))
		{
			$query->where("a.`brand` = '".$db->escape($filter_brand)."'");
		}

		// Filtering brandcode
		$filter_brandcode = $this->state->get("filter.brandcode");

		if ($filter_brandcode !== null && (is_numeric($filter_brandcode) || !empty($filter_brandcode)))
		{
			$query->where("a.`brandcode` = '".$db->escape($filter_brandcode)."'");
		}

		// Filtering category
		$filter_category = $this->state->get("filter.category");

		if ($filter_category !== null && (is_numeric($filter_category) || !empty($filter_category)))
		{
			$query->where("a.`category` = '".$db->escape($filter_category)."'");
		}

		// Filtering items
		$filter_items = $this->state->get("filter.items");

		if ($filter_items !== null && (is_numeric($filter_items) || !empty($filter_items)))
		{
			$query->where("a.`items` = '".$db->escape($filter_items)."'");
		}

		// Filtering commentby
		$filter_commentby = $this->state->get("filter.commentby");

		if ($filter_commentby !== null && (is_numeric($filter_commentby) || !empty($filter_commentby)))
		{
			$query->where("a.`commentby` = '".$db->escape($filter_commentby)."'");
		}

		// Filtering isurgent
		$filter_isurgent = $this->state->get("filter.isurgent");

		if ($filter_isurgent !== null && (is_numeric($filter_isurgent) || !empty($filter_isurgent)))
		{
			$query->where("a.`isurgent` = '".$db->escape($filter_isurgent)."'");
		}

		// Filtering store
		$filter_store = $this->state->get("filter.store");

		if ($filter_store !== null && (is_numeric($filter_store) || !empty($filter_store)))
		{
			$query->where("a.`store` = '".$db->escape($filter_store)."'");
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

			if (isset($oneItem->brand))
			{
				$values    = explode(',', $oneItem->brand);
				$textValue = array();

				foreach ($values as $value)
				{
					if (!empty($value))
					{
						$db = JFactory::getDbo();
						$query = "SELECT id as value, product_name as text FROM #__products HAVING value LIKE '" . $value . "'";
						$db->setQuery($query);
						$results = $db->loadObject();

						if ($results)
						{
							$textValue[] = $results->text;
						}
					}
				}

				$oneItem->brand = !empty($textValue) ? implode(', ', $textValue) : $oneItem->brand;
			}

			if (isset($oneItem->brandcode))
			{
				$values    = explode(',', $oneItem->brandcode);
				$textValue = array();

				foreach ($values as $value)
				{
					if (!empty($value))
					{
						$db = JFactory::getDbo();
						$query = "SELECT id as value, product_code as text FROM #__products HAVING value LIKE '" . $value . "'";
						$db->setQuery($query);
						$results = $db->loadObject();

						if ($results)
						{
							$textValue[] = $results->text;
						}
					}
				}

				$oneItem->brandcode = !empty($textValue) ? implode(', ', $textValue) : $oneItem->brandcode;
			}
					$oneItem->category = JText::_('COM_VOC_VOCS_CATEGORY_OPTION_' . strtoupper($oneItem->category));
					$oneItem->items = JText::_('COM_VOC_VOCS_ITEMS_OPTION_' . strtoupper($oneItem->items));
					$oneItem->commentby = JText::_('COM_VOC_VOCS_COMMENTBY_OPTION_' . strtoupper($oneItem->commentby));

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

			if (isset($oneItem->store_id))
			{
				$values    = explode(',', $oneItem->store_id);
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

				$oneItem->store_id = !empty($textValue) ? implode(', ', $textValue) : $oneItem->store_id;
			}
		}

		return $items;
	}
}
