<?php

/**
 * @version    CVS: 1.0.0
 * @package    Com_Competitor_activities
 * @author     Michael Buluma <michael@buluma.me.ke>
 * @copyright  2018 Michael Buluma
 * @license    GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

use Joomla\CMS\Factory;

jimport('joomla.application.component.modellist');

/**
 * Methods supporting a list of Competitor_activities records.
 *
 * @since  1.6
 */
class Competitor_activitiesModelComp_activities extends JModelList
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
				'client_id', 'a.client_id',
				'unique_id', 'a.unique_id',
				'brand', 'a.brand',
				'category', 'a.category',
				'submitter', 'a.submitter',
				'user_id', 'a.user_id',
				'mechanics', 'a.mechanics',
				'activity_mechanics', 'a.activity_mechanics',
				'rateofsale', 'a.rateofsale',
				'myplan', 'a.myplan',
				'myneed', 'a.myneed',
				'timeline', 'a.timeline',
				'start_date', 'a.start_date',
				'end_date', 'a.end_date',
				'coordinates', 'a.coordinates',
				'store', 'a.store',
				'store_server_id', 'a.store_server_id',
				'store_id', 'a.store_id',
				'created_on', 'a.created_on',
				'client_modified_date', 'a.client_modified_date',
				'last_sync_date', 'a.last_sync_date',
				'first_insert', 'a.first_insert',
				'server_modified_date', 'a.server_modified_date',
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

		$query->from('`#__competitor_activity` AS a');
		
		// Join over the users for the checked out user.
		$query->select('uc.name AS uEditor');
		$query->join('LEFT', '#__users AS uc ON uc.id=a.checked_out');

		// Join over the created by field 'created_by'
		$query->join('LEFT', '#__users AS created_by ON created_by.id = a.created_by');

		// Join over the created by field 'modified_by'
		$query->join('LEFT', '#__users AS modified_by ON modified_by.id = a.modified_by');

		// Join over the created by field 'submitter'
		$query->join('LEFT', '#__users AS submitter ON submitter.id = a.submitter');

		// Join over the created by field 'user_id'
		$query->join('LEFT', '#__users AS user_id ON user_id.id = a.user_id');
		
		if (!Factory::getUser()->authorise('core.edit', 'com_competitor_activities'))
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
		

		// Filtering brand
		$filter_brand = $this->state->get("filter.brand");
		if ($filter_brand != '') {
			$query->where("a.`brand` = '".$db->escape($filter_brand)."'");
		}

		// Filtering category
		$filter_category = $this->state->get("filter.category");

		if ($filter_category)
		{
			$query->where("a.`category` = '".$db->escape($filter_category)."'");
		}

		// Filtering submitter
		$filter_submitter = $this->state->get("filter.submitter");

		if ($filter_submitter)
		{
			$query->where("a.`submitter` = '" . $db->escape($filter_submitter) . "'");
		}

		// Filtering user_id
		$filter_user_id = $this->state->get("filter.user_id");

		if ($filter_user_id)
		{
			$query->where("a.`user_id` = '" . $db->escape($filter_user_id) . "'");
		}

		// Filtering start_date
		// Checking "_dateformat"
		$filter_start_date_from = $this->state->get("filter.start_date_from_dateformat");
		$filter_Qstart_date_from = (!empty($filter_start_date_from)) ? $this->isValidDate($filter_start_date_from) : null;

		if ($filter_Qstart_date_from != null)
		{
			$query->where("a.start_date >= '" . $db->escape($filter_Qstart_date_from) . "'");
		}

		$filter_start_date_to = $this->state->get("filter.start_date_to_dateformat");
		$filter_Qstart_date_to = (!empty($filter_start_date_to)) ? $this->isValidDate($filter_start_date_to) : null ;

		if ($filter_Qstart_date_to != null)
		{
			$query->where("a.start_date <= '" . $db->escape($filter_Qstart_date_to) . "'");
		}

		// Filtering end_date
		// Checking "_dateformat"
		$filter_end_date_from = $this->state->get("filter.end_date_from_dateformat");
		$filter_Qend_date_from = (!empty($filter_end_date_from)) ? $this->isValidDate($filter_end_date_from) : null;

		if ($filter_Qend_date_from != null)
		{
			$query->where("a.end_date >= '" . $db->escape($filter_Qend_date_from) . "'");
		}

		$filter_end_date_to = $this->state->get("filter.end_date_to_dateformat");
		$filter_Qend_date_to = (!empty($filter_end_date_to)) ? $this->isValidDate($filter_end_date_to) : null ;

		if ($filter_Qend_date_to != null)
		{
			$query->where("a.end_date <= '" . $db->escape($filter_Qend_date_to) . "'");
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

			if (isset($item->brand))
			{
				$values    = explode(',', $item->brand);
				$textValue = array();

				foreach ($values as $value)
				{
					if (!empty($value))
					{
						$db    = Factory::getDbo();
						$query = "SELECT id as value, product_name as text FROM #__products HAVING value LIKE '" . $value . "'";

						$db->setQuery($query);
						$results = $db->loadObject();

						if ($results)
						{
							$textValue[] = $results->text;
						}
					}
				}

				$item->brand = !empty($textValue) ? implode(', ', $textValue) : $item->brand;
			}

		if (isset($item->category) && $item->category != '')
		{

			$db    = Factory::getDbo();
			$query = $db->getQuery(true);

			$query
				->select($db->quoteName('title'))
				->from($db->quoteName('#__categories'))
				->where('FIND_IN_SET(' . $db->quoteName('id') . ', ' . $db->quote($item->category) . ')');

			$db->setQuery($query);

			$result = $db->loadColumn();

			$item->category = !empty($result) ? implode(', ', $result) : '';
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
			$app->enqueueMessage(JText::_("COM_COMPETITOR_ACTIVITIES_SEARCH_FILTER_DATE_FORMAT"), "warning");
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
