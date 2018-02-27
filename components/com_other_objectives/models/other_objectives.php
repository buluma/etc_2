<?php

/**
 * @version    CVS: 1.0.0
 * @package    Com_Other_objectives
 * @author     Michael Buluma <michael@buluma.co.ke>
 * @copyright  2018 Michael Buluma
 * @license    GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

use Joomla\CMS\Factory;

jimport('joomla.application.component.modellist');

/**
 * Methods supporting a list of Other_objectives records.
 *
 * @since  1.6
 */
class Other_objectivesModelOther_objectives extends JModelList
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
				'client_id', 'a.client_id',
				'ordering', 'a.ordering',
				'state', 'a.state',
				'created_by', 'a.created_by',
				'modified_by', 'a.modified_by',
				'objective', 'a.objective',
				'objective_achieved', 'a.objective_achieved',
				'inputdate', 'a.inputdate',
				'challenge', 'a.challenge',
				'next_plan', 'a.next_plan',
				'store', 'a.store',
				'submitter', 'a.submitter',
				'store_id', 'a.store_id',
				'store_server_id', 'a.store_server_id',
				'created_on', 'a.created_on',
				'coordinates', 'a.coordinates',
				'created', 'a.created',
				'first_insert', 'a.first_insert',
				'client_modified_date', 'a.client_modified_date',
				'modified_on', 'a.modified_on',
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

		$query->from('`#__other_objectives` AS a');
		
		// Join over the users for the checked out user.
		$query->select('uc.name AS uEditor');
		$query->join('LEFT', '#__users AS uc ON uc.id=a.checked_out');

		// Join over the created by field 'created_by'
		$query->join('LEFT', '#__users AS created_by ON created_by.id = a.created_by');

		// Join over the created by field 'modified_by'
		$query->join('LEFT', '#__users AS modified_by ON modified_by.id = a.modified_by');

		// Join over the created by field 'submitter'
		$query->join('LEFT', '#__users AS submitter ON submitter.id = a.submitter');
		
		if (!Factory::getUser()->authorise('core.edit', 'com_other_objectives'))
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
				$query->where('( a.objective LIKE ' . $search . ' )');
			}
		}
		

		// Filtering objective_achieved
		$filter_objective_achieved = $this->state->get("filter.objective_achieved");

		if ($filter_objective_achieved !== null && (is_numeric($filter_objective_achieved) || !empty($filter_objective_achieved)))
		{
			$query->where("a.`objective_achieved` = '".$db->escape($filter_objective_achieved)."'");
		}

		// Filtering inputdate
		// Checking "_dateformat"
		$filter_inputdate_from = $this->state->get("filter.inputdate_from_dateformat");
		$filter_Qinputdate_from = (!empty($filter_inputdate_from)) ? $this->isValidDate($filter_inputdate_from) : null;

		if ($filter_Qinputdate_from != null)
		{
			$query->where("a.inputdate >= '" . $db->escape($filter_Qinputdate_from) . "'");
		}

		$filter_inputdate_to = $this->state->get("filter.inputdate_to_dateformat");
		$filter_Qinputdate_to = (!empty($filter_inputdate_to)) ? $this->isValidDate($filter_inputdate_to) : null ;

		if ($filter_Qinputdate_to != null)
		{
			$query->where("a.inputdate <= '" . $db->escape($filter_Qinputdate_to) . "'");
		}

		// Filtering store
		$filter_store = $this->state->get("filter.store");
		if ($filter_store != '') {
			$query->where("a.`store` = '".$db->escape($filter_store)."'");
		}

		// Filtering submitter
		$filter_submitter = $this->state->get("filter.submitter");

		if ($filter_submitter)
		{
			$query->where("a.`submitter` = '" . $db->escape($filter_submitter) . "'");
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
				$item->objective_achieved = empty($item->objective_achieved) ? '' : JText::_('COM_OTHER_OBJECTIVES_OTHER_OBJECTIVES_OBJECTIVE_ACHIEVED_OPTION_' . strtoupper($item->objective_achieved));

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
			$app->enqueueMessage(JText::_("COM_OTHER_OBJECTIVES_SEARCH_FILTER_DATE_FORMAT"), "warning");
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
