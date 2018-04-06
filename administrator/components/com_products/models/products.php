<?php

/**
 * @version    CVS: 1.0.0
 * @package    Com_Products
 * @author     Michael Buluma <michael@buluma.me.ke>
 * @copyright  2018 Michael Buluma
 * @license    GNU General Public License version 2 or later; see LICENSE.txt
 */
defined('_JEXEC') or die;

jimport('joomla.application.component.modellist');

/**
 * Methods supporting a list of Products records.
 *
 * @since  1.6
 */
class ProductsModelProducts extends JModelList
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
				'product_code', 'a.`product_code`',
				'product_name', 'a.`product_name`',
				'category', 'a.`category`',
				'product_classification', 'a.`product_classification`',
				'product_type', 'a.`product_type`',
				'product_uom', 'a.`product_uom`',
				'product_price', 'a.`product_price`',
				'product_size', 'a.`product_size`',
				'product_cases', 'a.`product_cases`',
				'published', 'a.`published`',
				'must_have', 'a.`must_have`',
				'deleted', 'a.`deleted`',
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
		// Filtering category
		$this->setState('filter.category', $app->getUserStateFromRequest($this->context.'.filter.category', 'filter_category', '', 'string'));

		// Filtering published
		$this->setState('filter.published', $app->getUserStateFromRequest($this->context.'.filter.published', 'filter_published', '', 'string'));

		// Filtering must_have
		$this->setState('filter.must_have', $app->getUserStateFromRequest($this->context.'.filter.must_have', 'filter_must_have', '', 'string'));

		// Filtering deleted
		$this->setState('filter.deleted', $app->getUserStateFromRequest($this->context.'.filter.deleted', 'filter_deleted', '', 'string'));


		// Load the parameters.
		$params = JComponentHelper::getParams('com_products');
		$this->setState('params', $params);

		// List state information.
		parent::populateState('a.product_name', 'asc');
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
		$query->from('`#__products` AS a');

		// Join over the users for the checked out user
		$query->select("uc.name AS uEditor");
		$query->join("LEFT", "#__users AS uc ON uc.id=a.checked_out");

		// Join over the user field 'created_by'
		$query->select('`created_by`.name AS `created_by`');
		$query->join('LEFT', '#__users AS `created_by` ON `created_by`.id = a.`created_by`');

		// Join over the user field 'modified_by'
		$query->select('`modified_by`.name AS `modified_by`');
		$query->join('LEFT', '#__users AS `modified_by` ON `modified_by`.id = a.`modified_by`');
		
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
				$query->where('( a.product_name LIKE ' . $search . '  OR  a.category LIKE ' . $search . ' )');
			}
		}


		// Filtering category
		$filter_category = $this->state->get("filter.category");

		if ($filter_category !== null && !empty($filter_category))
		{
			$query->where("a.`category` = '".$db->escape($filter_category)."'");
		}

		// Filtering published
		$filter_published = $this->state->get("filter.published");

		if ($filter_published !== null && (is_numeric($filter_published) || !empty($filter_published)))
		{
			$query->where("a.`published` = '".$db->escape($filter_published)."'");
		}

		// Filtering must_have
		$filter_must_have = $this->state->get("filter.must_have");

		if ($filter_must_have !== null && (is_numeric($filter_must_have) || !empty($filter_must_have)))
		{
			$query->where("a.`must_have` = '".$db->escape($filter_must_have)."'");
		}

		// Filtering deleted
		$filter_deleted = $this->state->get("filter.deleted");

		if ($filter_deleted !== null && (is_numeric($filter_deleted) || !empty($filter_deleted)))
		{
			$query->where("a.`deleted` = '".$db->escape($filter_deleted)."'");
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

			if (isset($oneItem->category))
			{
				$db    = JFactory::getDbo();
				$query = $db->getQuery(true);

				$query
					->select($db->quoteName('title'))
					->from($db->quoteName('#__categories'))
					->where('FIND_IN_SET(' . $db->quoteName('id') . ', ' . $db->quote($oneItem->category) . ')');

				$db->setQuery($query);
				$result = $db->loadColumn();

				$oneItem->category = !empty($result) ? implode(', ', $result) : '';
			}
					$oneItem->published = JText::_('COM_PRODUCTS_PRODUCTS_PUBLISHED_OPTION_' . strtoupper($oneItem->published));
					$oneItem->must_have = JText::_('COM_PRODUCTS_PRODUCTS_MUST_HAVE_OPTION_' . strtoupper($oneItem->must_have));
					$oneItem->deleted = JText::_('COM_PRODUCTS_PRODUCTS_DELETED_OPTION_' . strtoupper($oneItem->deleted));
		}

		return $items;
	}
}
