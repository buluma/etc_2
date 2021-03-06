<?php

/**
 * @version    CVS: 1.0.0
 * @package    Com_Competitor_activities
 * @author     Michael Buluma <michael@buluma.me.ke>
 * @copyright  2018 Michael Buluma
 * @license    GNU General Public License version 2 or later; see LICENSE.txt
 */
defined('_JEXEC') or die;

jimport('joomla.application.component.modellist');

/**
 * Methods supporting a list of Competitor_activities records.
 *
 * @since  1.6
 */
class Competitor_activitiesModelCompeimages extends JModelList
{
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

		// Load the parameters.
		$params = JComponentHelper::getParams('com_competitor_activities');
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
		$db	= $this->getDbo();
		$query	= $db->getQuery(true);

		$value = 1;

		$query->select('COUNT(*)');
		$query->from($db->quoteName('#__competitor_images'));
		// $query->where($db->quoteName('submitter')." = ".$db->quote($value));

		// Reset the query using our newly populated query object.
		$db->setQuery($query);
		$count = $db->loadResult();

		var_dump($count);

		return $query;
	}

	/**
	 * Get an array of data items
	 *
	 * @return mixed Array of data items on success, false on failure.
	 */
	public function getItems()
	{
		// $items = parent::getItems();

		// foreach ($items as $oneItem)
		// {

		// 	if (isset($oneItem->brand))
		// 	{
		// 		$values    = explode(',', $oneItem->brand);
		// 		$textValue = array();

		// 		foreach ($values as $value)
		// 		{
		// 			if (!empty($value))
		// 			{
		// 				$db = JFactory::getDbo();
		// 				$query = "SELECT id as value, product_name as text FROM #__products HAVING value LIKE '" . $value . "'";
		// 				$db->setQuery($query);
		// 				$results = $db->loadObject();

		// 				if ($results)
		// 				{
		// 					$textValue[] = $results->text;
		// 				}
		// 			}
		// 		}

		// 		$oneItem->brand = !empty($textValue) ? implode(', ', $textValue) : $oneItem->brand;
		// 	}

		// 	if (isset($oneItem->category))
		// 	{
		// 		$db    = JFactory::getDbo();
		// 		$query = $db->getQuery(true);

		// 		$query
		// 			->select($db->quoteName('title'))
		// 			->from($db->quoteName('#__categories'))
		// 			->where('FIND_IN_SET(' . $db->quoteName('id') . ', ' . $db->quote($oneItem->category) . ')');

		// 		$db->setQuery($query);
		// 		$result = $db->loadColumn();

		// 		$oneItem->category = !empty($result) ? implode(', ', $result) : '';
		// 	}

		// 	if (isset($oneItem->store))
		// 	{
		// 		$values    = explode(',', $oneItem->store);
		// 		$textValue = array();

		// 		foreach ($values as $value)
		// 		{
		// 			if (!empty($value))
		// 			{
		// 				$db = JFactory::getDbo();
		// 				$query = "SELECT id as value, shop_name as text from #__outlets HAVING value LIKE '" . $value . "'";
		// 				$db->setQuery($query);
		// 				$results = $db->loadObject();

		// 				if ($results)
		// 				{
		// 					$textValue[] = $results->text;
		// 				}
		// 			}
		// 		}

		// 		$oneItem->store = !empty($textValue) ? implode(', ', $textValue) : $oneItem->store;
		// 	}
		// }

		$db	= $this->getDbo();
		$query	= $db->getQuery(true);

		$value = 1;

		$query->select('COUNT(*)');
		$query->from($db->quoteName('#__competitor_images'));
		// $query->where($db->quoteName('submitter')." = ".$db->quote($value));

		// Reset the query using our newly populated query object.
		$db->setQuery($query);
		$items = $db->loadResult();
		var_dump($items);

		return $items;
	}
}
