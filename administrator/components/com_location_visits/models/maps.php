<?php

/**
 * @version    CVS: 1.0.0
 * @package    Com_Location_visits
 * @author     Michael Buluma <michael@buluma.co.ke>
 * @copyright  2018 Michael Buluma
 * @license    GNU General Public License version 2 or later; see LICENSE.txt
 */
defined('_JEXEC') or die;

jimport('joomla.application.component.modellist');

/**
 * Methods supporting a list of Location_visits records.
 *
 * @since  1.6
 */
class Location_visitsModelMaps extends JModelList
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
				'client_id', 'a.`client_id`',
				'coordinates', 'a.`coordinates`',
				'client_modified_date', 'a.`client_modified_date`',
				'submitter', 'a.`submitter`',
				'user_id', 'a.`user_id`',
				'store', 'a.`store`',
				'store_server_id', 'a.`store_server_id`',
				'store_id', 'a.`store_id`',
				'created_on', 'a.`created_on`',
				'last_sync_date', 'a.`last_sync_date`',
				'first_insert_date', 'a.`first_insert_date`',
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

		// Filtering store
		$this->setState('filter.store', $app->getUserStateFromRequest($this->context.'.filter.store', 'filter_store', '', 'string'));

		// Filtering store_server_id
		$this->setState('filter.store_server_id', $app->getUserStateFromRequest($this->context.'.filter.store_server_id', 'filter_store_server_id', '', 'string'));

		// Filtering store_id
		$this->setState('filter.store_id', $app->getUserStateFromRequest($this->context.'.filter.store_id', 'filter_store_id', '', 'string'));

		// Filtering created_on
		$this->setState('filter.created_on.from', $app->getUserStateFromRequest($this->context.'.filter.created_on.from', 'filter_from_created_on', '', 'string'));
		$this->setState('filter.created_on.to', $app->getUserStateFromRequest($this->context.'.filter.created_on.to', 'filter_to_created_on', '', 'string'));


		// Load the parameters.
		$params = JComponentHelper::getParams('com_location_visits');
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
		$query->from('`#__locations` AS a');

		// Join over the users for the checked out user
		$query->select("uc.name AS uEditor");
		$query->join("LEFT", "#__users AS uc ON uc.id=a.checked_out");

		// Join over the user field 'created_by'
		$query->select('`created_by`.name AS `created_by`');
		$query->join('LEFT', '#__users AS `created_by` ON `created_by`.id = a.`created_by`');

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

		// Filtering created_on
		$filter_created_on_from = $this->state->get("filter.created_on.from");

		if ($filter_created_on_from !== null && !empty($filter_created_on_from))
		{
			$query->where("a.`created_on` >= '".$db->escape($filter_created_on_from)."'");
		}
		$filter_created_on_to = $this->state->get("filter.created_on.to");

		if ($filter_created_on_to !== null  && !empty($filter_created_on_to))
		{
			$query->where("a.`created_on` <= '".$db->escape($filter_created_on_to)."'");
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
