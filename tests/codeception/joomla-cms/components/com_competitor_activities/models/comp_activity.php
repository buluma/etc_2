<?php

/**
 * @version    CVS: 1.0.0
 * @package    Com_Competitor_activities
 * @author     Michael Buluma <michael@buluma.me.ke>
 * @copyright  2018 Michael Buluma
 * @license    GNU General Public License version 2 or later; see LICENSE.txt
 */
// No direct access.
defined('_JEXEC') or die;

jimport('joomla.application.component.modelitem');
jimport('joomla.event.dispatcher');

use Joomla\CMS\Factory;
use Joomla\Utilities\ArrayHelper;

/**
 * Competitor_activities model.
 *
 * @since  1.6
 */
class Competitor_activitiesModelComp_activity extends JModelItem
{
    public $_item;

	/**
	 * Method to auto-populate the model state.
	 *
	 * Note. Calling getState in this method will result in recursion.
	 *
	 * @return void
	 *
	 * @since    1.6
	 *
	 */
	protected function populateState()
	{
		$app  = Factory::getApplication('com_competitor_activities');
		$user = Factory::getUser();

		// Check published state
		if ((!$user->authorise('core.edit.state', 'com_competitor_activities')) && (!$user->authorise('core.edit', 'com_competitor_activities')))
		{
			$this->setState('filter.published', 1);
			$this->setState('filter.archived', 2);
		}

		// Load state from the request userState on edit or from the passed variable on default
		if (Factory::getApplication()->input->get('layout') == 'edit')
		{
			$id = Factory::getApplication()->getUserState('com_competitor_activities.edit.comp_activity.id');
		}
		else
		{
			$id = Factory::getApplication()->input->get('id');
			Factory::getApplication()->setUserState('com_competitor_activities.edit.comp_activity.id', $id);
		}

		$this->setState('comp_activity.id', $id);

		// Load the parameters.
		$params       = $app->getParams();
		$params_array = $params->toArray();

		if (isset($params_array['item_id']))
		{
			$this->setState('comp_activity.id', $params_array['item_id']);
		}

		$this->setState('params', $params);
	}

	/**
	 * Method to get an object.
	 *
	 * @param   integer $id The id of the object to get.
	 *
	 * @return  mixed    Object on success, false on failure.
     *
     * @throws Exception
	 */
	public function getItem($id = null)
	{
		if ($this->_item === null)
		{
			$this->_item = false;

			if (empty($id))
			{
				$id = $this->getState('comp_activity.id');
			}

			// Get a level row instance.
			$table = $this->getTable();

			// Attempt to load the row.
			if ($table->load($id))
			{
				// Check published state.
				if ($published = $this->getState('filter.published'))
				{
					if (isset($table->state) && $table->state != $published)
					{
						throw new Exception(JText::_('COM_COMPETITOR_ACTIVITIES_ITEM_NOT_LOADED'), 403);
					}
				}

				// Convert the JTable to a clean JObject.
				$properties  = $table->getProperties(1);
				$this->_item = ArrayHelper::toObject($properties, 'JObject');
			}
		}

		

		if (isset($this->_item->created_by))
		{
			$this->_item->created_by_name = Factory::getUser($this->_item->created_by)->name;
		}

		if (isset($this->_item->modified_by))
		{
			$this->_item->modified_by_name = Factory::getUser($this->_item->modified_by)->name;
		}

		if (isset($this->_item->brand) && $this->_item->brand != '')
		{
			if (is_object($this->_item->brand))
			{
				$this->_item->brand = ArrayHelper::fromObject($this->_item->brand);
			}

			$values = (is_array($this->_item->brand)) ? $this->_item->brand : explode(',',$this->_item->brand);

			$textValue = array();

			foreach ($values as $value)
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

			$this->_item->brand = !empty($textValue) ? implode(', ', $textValue) : $this->_item->brand;
		}

		if (isset($this->_item->category) && $this->_item->category != '')
		{
			if (is_object($this->_item->category))
			{
				$this->_item->category = ArrayHelper::fromObject($this->_item->category);
			}

			if (is_array($this->_item->category))
			{
				$this->_item->category = implode(',', $this->_item->category);
			}

			$db    = Factory::getDbo();
			$query = $db->getQuery(true);

			$query
				->select($db->quoteName('title'))
				->from($db->quoteName('#__categories'))
				->where('FIND_IN_SET(' . $db->quoteName('id') . ', ' . $db->quote($this->_item->category) . ')');

			$db->setQuery($query);

			$result = $db->loadColumn();

			$this->_item->category = !empty($result) ? implode(', ', $result) : '';
		}

		if (isset($this->_item->submitter))
		{
			$this->_item->submitter_name = Factory::getUser($this->_item->submitter)->name;
		}

		if (isset($this->_item->user_id))
		{
			$this->_item->user_id_name = Factory::getUser($this->_item->user_id)->name;
		}

		if (isset($this->_item->store) && $this->_item->store != '')
		{
			if (is_object($this->_item->store))
			{
				$this->_item->store = ArrayHelper::fromObject($this->_item->store);
			}

			$values = (is_array($this->_item->store)) ? $this->_item->store : explode(',',$this->_item->store);

			$textValue = array();

			foreach ($values as $value)
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

			$this->_item->store = !empty($textValue) ? implode(', ', $textValue) : $this->_item->store;
		}

		if (isset($this->_item->store_server_id) && $this->_item->store_server_id != '')
		{
			if (is_object($this->_item->store_server_id))
			{
				$this->_item->store_server_id = ArrayHelper::fromObject($this->_item->store_server_id);
			}

			$values = (is_array($this->_item->store_server_id)) ? $this->_item->store_server_id : explode(',',$this->_item->store_server_id);

			$textValue = array();

			foreach ($values as $value)
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

			$this->_item->store_server_id = !empty($textValue) ? implode(', ', $textValue) : $this->_item->store_server_id;
		}

		if (isset($this->_item->store_id) && $this->_item->store_id != '')
		{
			if (is_object($this->_item->store_id))
			{
				$this->_item->store_id = ArrayHelper::fromObject($this->_item->store_id);
			}

			$values = (is_array($this->_item->store_id)) ? $this->_item->store_id : explode(',',$this->_item->store_id);

			$textValue = array();

			foreach ($values as $value)
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

			$this->_item->store_id = !empty($textValue) ? implode(', ', $textValue) : $this->_item->store_id;
		}

		return $this->_item;
	}

	/**
	 * Get an instance of JTable class
	 *
	 * @param   string $type   Name of the JTable class to get an instance of.
	 * @param   string $prefix Prefix for the table class name. Optional.
	 * @param   array  $config Array of configuration values for the JTable object. Optional.
	 *
	 * @return  JTable|bool JTable if success, false on failure.
	 */
	public function getTable($type = 'Comp_activity', $prefix = 'Competitor_activitiesTable', $config = array())
	{
		$this->addTablePath(JPATH_ADMINISTRATOR . '/components/com_competitor_activities/tables');

		return JTable::getInstance($type, $prefix, $config);
	}

	/**
	 * Get the id of an item by alias
	 *
	 * @param   string $alias Item alias
	 *
	 * @return  mixed
	 */
	public function getItemIdByAlias($alias)
	{
		$table      = $this->getTable();
		$properties = $table->getProperties();
		$result     = null;

		if (key_exists('alias', $properties))
		{
            $table->load(array('alias' => $alias));
            $result = $table->id;
		}

		return $result;
	}

	/**
	 * Method to check in an item.
	 *
	 * @param   integer $id The id of the row to check out.
	 *
	 * @return  boolean True on success, false on failure.
	 *
	 * @since    1.6
	 */
	public function checkin($id = null)
	{
		// Get the id.
		$id = (!empty($id)) ? $id : (int) $this->getState('comp_activity.id');

		if ($id)
		{
			// Initialise the table
			$table = $this->getTable();

			// Attempt to check the row in.
			if (method_exists($table, 'checkin'))
			{
				if (!$table->checkin($id))
				{
					return false;
				}
			}
		}

		return true;
	}

	/**
	 * Method to check out an item for editing.
	 *
	 * @param   integer $id The id of the row to check out.
	 *
	 * @return  boolean True on success, false on failure.
	 *
	 * @since    1.6
	 */
	public function checkout($id = null)
	{
		// Get the user id.
		$id = (!empty($id)) ? $id : (int) $this->getState('comp_activity.id');

		if ($id)
		{
			// Initialise the table
			$table = $this->getTable();

			// Get the current user object.
			$user = Factory::getUser();

			// Attempt to check the row out.
			if (method_exists($table, 'checkout'))
			{
				if (!$table->checkout($user->get('id'), $id))
				{
					return false;
				}
			}
		}

		return true;
	}

	/**
	 * Publish the element
	 *
	 * @param   int $id    Item id
	 * @param   int $state Publish state
	 *
	 * @return  boolean
	 */
	public function publish($id, $state)
	{
		$table = $this->getTable();
		$table->load($id);
		$table->state = $state;

		return $table->store();
	}

	/**
	 * Method to delete an item
	 *
	 * @param   int $id Element id
	 *
	 * @return  bool
	 */
	public function delete($id)
	{
		$table = $this->getTable();

		return $table->delete($id);
	}

	
}
