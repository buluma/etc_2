<?php

/**
 * @version    CVS: 1.0.0
 * @package    Com_Qissues
 * @author     Michael Buluma <michael@buluma.me.ke>
 * @copyright  2018 Michael Buluma
 * @license    GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

use Joomla\CMS\Factory;

jimport('joomla.application.component.modellist');

/**
 * Methods supporting a list of Qissues records.
 *
 * @since  1.6
 */
class QissuesModelIssues extends JModelList
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
				'issue_type', 'a.issue_type',
				'rateofsale', 'a.rateofsale',
				'expiry_date', 'a.expiry_date',
				'store', 'a.store',
				'store_id', 'a.store_id',
				'store_server_id', 'a.store_server_id',
				'created_on', 'a.created_on',
				'remarks', 'a.remarks',
				'client_id', 'a.client_id',
				'coordinates', 'a.coordinates',
				'submitter', 'a.submitter',
				'user_id', 'a.user_id',
				'last_sync_date', 'a.last_sync_date',
				'first_insert_date', 'a.first_insert_date',
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

		$query->from('`#__quality_issues` AS a');
		
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
		
		if (!Factory::getUser()->authorise('core.edit', 'com_qissues'))
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

		// Filtering brandcode
		$filter_brandcode = $this->state->get("filter.brandcode");
		if ($filter_brandcode != '') {
			$query->where("a.`brandcode` = '".$db->escape($filter_brandcode)."'");
		}

		// Filtering issue_type
		$filter_issue_type = $this->state->get("filter.issue_type");
		if ($filter_issue_type != '') {
			$query->where("a.`issue_type` = '".$db->escape($filter_issue_type)."'");
		}

		// Filtering expiry_date
		// Checking "_dateformat"
		$filter_expiry_date_from = $this->state->get("filter.expiry_date_from_dateformat");
		$filter_Qexpiry_date_from = (!empty($filter_expiry_date_from)) ? $this->isValidDate($filter_expiry_date_from) : null;

		if ($filter_Qexpiry_date_from != null)
		{
			$query->where("a.expiry_date >= '" . $db->escape($filter_Qexpiry_date_from) . "'");
		}

		$filter_expiry_date_to = $this->state->get("filter.expiry_date_to_dateformat");
		$filter_Qexpiry_date_to = (!empty($filter_expiry_date_to)) ? $this->isValidDate($filter_expiry_date_to) : null ;

		if ($filter_Qexpiry_date_to != null)
		{
			$query->where("a.expiry_date <= '" . $db->escape($filter_Qexpiry_date_to) . "'");
		}

		// Filtering store
		$filter_store = $this->state->get("filter.store");
		if ($filter_store != '') {
			$query->where("a.`store` = '".$db->escape($filter_store)."'");
		}

		// Filtering store_id
		$filter_store_id = $this->state->get("filter.store_id");
		if ($filter_store_id != '') {
			$query->where("a.`store_id` = '".$db->escape($filter_store_id)."'");
		}

		// Filtering created_on
		// Checking "_dateformat"
		$filter_created_on_from = $this->state->get("filter.created_on_from_dateformat");
		$filter_Qcreated_on_from = (!empty($filter_created_on_from)) ? $this->isValidDate($filter_created_on_from) : null;

		if ($filter_Qcreated_on_from != null)
		{
			$query->where("a.created_on >= '" . $db->escape($filter_Qcreated_on_from) . "'");
		}

		$filter_created_on_to = $this->state->get("filter.created_on_to_dateformat");
		$filter_Qcreated_on_to = (!empty($filter_created_on_to)) ? $this->isValidDate($filter_created_on_to) : null ;

		if ($filter_Qcreated_on_to != null)
		{
			$query->where("a.created_on <= '" . $db->escape($filter_Qcreated_on_to) . "'");
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

			if (isset($item->brandcode))
			{
				$values    = explode(',', $item->brandcode);
				$textValue = array();

				foreach ($values as $value)
				{
					if (!empty($value))
					{
						$db    = Factory::getDbo();
						$query = "SELECT id as value, product_code as text FROM #__products HAVING value LIKE '" . $value . "'";

						$db->setQuery($query);
						$results = $db->loadObject();

						if ($results)
						{
							$textValue[] = $results->text;
						}
					}
				}

				$item->brandcode = !empty($textValue) ? implode(', ', $textValue) : $item->brandcode;
			}

			$item->issue_type = JText::_('COM_QISSUES_ISSUES_ISSUE_TYPE_OPTION_' . strtoupper($item->issue_type));

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
			$app->enqueueMessage(JText::_("COM_QISSUES_SEARCH_FILTER_DATE_FORMAT"), "warning");
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