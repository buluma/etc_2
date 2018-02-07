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
class ProductsModelBrandstocks extends JModelList
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
		$db	= $this->getDbo();
		$query	= $db->getQuery(true);

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
