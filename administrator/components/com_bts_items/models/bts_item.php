<?php
/**
 * @version    CVS: 1.0.0
 * @package    Com_Bts_items
 * @author     Michael Buluma <michael@buluma.co.ke>
 * @copyright  2018 Michael Buluma
 * @license    GNU General Public License version 2 or later; see LICENSE.txt
 */

// No direct access.
defined('_JEXEC') or die;

jimport('joomla.application.component.modeladmin');

/**
 * Bts_items model.
 *
 * @since  1.6
 */
class Bts_itemsModelBts_item extends JModelAdmin
{
	/**
	 * @var      string    The prefix to use with controller messages.
	 * @since    1.6
	 */
	protected $text_prefix = 'COM_BTS_ITEMS';

	/**
	 * @var   	string  	Alias to manage history control
	 * @since   3.2
	 */
	public $typeAlias = 'com_bts_items.bts_item';

	/**
	 * @var null  Item data
	 * @since  1.6
	 */
	protected $item = null;

	/**
	 * Returns a reference to the a Table object, always creating it.
	 *
	 * @param   string  $type    The table type to instantiate
	 * @param   string  $prefix  A prefix for the table class name. Optional.
	 * @param   array   $config  Configuration array for model. Optional.
	 *
	 * @return    JTable    A database object
	 *
	 * @since    1.6
	 */
	public function getTable($type = 'Bts_item', $prefix = 'Bts_itemsTable', $config = array())
	{
		return JTable::getInstance($type, $prefix, $config);
	}

	/**
	 * Method to get the record form.
	 *
	 * @param   array    $data      An optional array of data for the form to interogate.
	 * @param   boolean  $loadData  True if the form is to load its own data (default case), false if not.
	 *
	 * @return  JForm  A JForm object on success, false on failure
	 *
	 * @since    1.6
	 */
	public function getForm($data = array(), $loadData = true)
	{
		// Initialise variables.
		$app = JFactory::getApplication();

		// Get the form.
		$form = $this->loadForm(
			'com_bts_items.bts_item', 'bts_item',
			array('control' => 'jform',
				'load_data' => $loadData
			)
		);

		if (empty($form))
		{
			return false;
		}

		return $form;
	}

	/**
	 * Method to get the data that should be injected in the form.
	 *
	 * @return   mixed  The data for the form.
	 *
	 * @since    1.6
	 */
	protected function loadFormData()
	{
		// Check the session for previously entered form data.
		$data = JFactory::getApplication()->getUserState('com_bts_items.edit.bts_item.data', array());

		if (empty($data))
		{
			if ($this->item === null)
			{
				$this->item = $this->getItem();
			}

			$data = $this->item;

			// Support for multiple or not foreign key field: outlet
			$array = array();

			foreach ((array) $data->outlet as $value)
			{
				if (!is_array($value))
				{
					$array[] = $value;
				}
			}

			$data->outlet = $array;

			// Support for multiple or not foreign key field: product
			$array = array();

			foreach ((array) $data->product as $value)
			{
				if (!is_array($value))
				{
					$array[] = $value;
				}
			}

			$data->product = $array;

			// Support for multiple or not foreign key field: sku
			$array = array();

			foreach ((array) $data->sku as $value)
			{
				if (!is_array($value))
				{
					$array[] = $value;
				}
			}

			$data->sku = $array;

			// Support for multiple or not foreign key field: store
			$array = array();

			foreach ((array) $data->store as $value)
			{
				if (!is_array($value))
				{
					$array[] = $value;
				}
			}

			$data->store = implode(',',$array);

			// Support for multiple or not foreign key field: store_server_id
			$array = array();

			foreach ((array) $data->store_server_id as $value)
			{
				if (!is_array($value))
				{
					$array[] = $value;
				}
			}

			$data->store_server_id = implode(',',$array);

			// Support for multiple or not foreign key field: store_id
			$array = array();

			foreach ((array) $data->store_id as $value)
			{
				if (!is_array($value))
				{
					$array[] = $value;
				}
			}

			$data->store_id = implode(',',$array);
		}

		return $data;
	}

	/**
	 * Method to get a single record.
	 *
	 * @param   integer  $pk  The id of the primary key.
	 *
	 * @return  mixed    Object on success, false on failure.
	 *
	 * @since    1.6
	 */
	public function getItem($pk = null)
	{
		if ($item = parent::getItem($pk))
		{
			// Do any procesing on fields here if needed
		}

		return $item;
	}

	/**
	 * Method to duplicate an Bts_item
	 *
	 * @param   array  &$pks  An array of primary key IDs.
	 *
	 * @return  boolean  True if successful.
	 *
	 * @throws  Exception
	 */
	public function duplicate(&$pks)
	{
		$user = JFactory::getUser();

		// Access checks.
		if (!$user->authorise('core.create', 'com_bts_items'))
		{
			throw new Exception(JText::_('JERROR_CORE_CREATE_NOT_PERMITTED'));
		}

		$dispatcher = JEventDispatcher::getInstance();
		$context    = $this->option . '.' . $this->name;

		// Include the plugins for the save events.
		JPluginHelper::importPlugin($this->events_map['save']);

		$table = $this->getTable();

		foreach ($pks as $pk)
		{
			if ($table->load($pk, true))
			{
				// Reset the id to create a new record.
				$table->id = 0;

				if (!$table->check())
				{
					throw new Exception($table->getError());
				}
				

				// Trigger the before save event.
				$result = $dispatcher->trigger($this->event_before_save, array($context, &$table, true));

				if (in_array(false, $result, true) || !$table->store())
				{
					throw new Exception($table->getError());
				}

				// Trigger the after save event.
				$dispatcher->trigger($this->event_after_save, array($context, &$table, true));
			}
			else
			{
				throw new Exception($table->getError());
			}
		}

		// Clean cache
		$this->cleanCache();

		return true;
	}

	/**
	 * Prepare and sanitise the table prior to saving.
	 *
	 * @param   JTable  $table  Table Object
	 *
	 * @return void
	 *
	 * @since    1.6
	 */
	protected function prepareTable($table)
	{
		jimport('joomla.filter.output');

		if (empty($table->id))
		{
			// Set ordering to the last item if not set
			if (@$table->ordering === '')
			{
				$db = JFactory::getDbo();
				$db->setQuery('SELECT MAX(ordering) FROM #__bts_items');
				$max             = $db->loadResult();
				$table->ordering = $max + 1;
			}
		}
	}

	//get product associated
	public function getProduct1(){
		$some_value = 13;
		$db = JFactory::getDbo();
		$query = $db->getQuery(true);
		$query->select('*');
		$query->from($db->quoteName('#__bts_items'));
		$query->where($db->quoteName('id')." = ".$db->quote($some_value));

		$db->setQuery($query);
		$row = $db->loadRow();
		print_r($row);

		// var_dump($result);
	}

	public function getProduct(){
		// $id = 13;
		$id = JRequest::getVar('id','0');
		$db = JFactory::getDBO();
		$query = $db->getQuery(true);
		$query->select(array('a.*', 'b.*'));
		$query->from($db->quoteName('#__bts_items', 'a'));

		$query->join('LEFT', $db->quoteName('#__bts_products', 'b') . ' ON (' . $db->quoteName('a.product') . ' = ' . $db->quoteName('b.id') . ')');

		$query->where($db->quoteName('a.id') . ' = '.$id);

		$db->setQuery($query);
		$row = $db->loadRow();
		// $row = $db->loadObjectList();

		return $row;
		// print_r($row);
	}
}
