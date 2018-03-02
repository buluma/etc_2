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

jimport('joomla.application.component.modeladmin');

/**
 * Competitor_activities model.
 *
 * @since  1.6
 */
class Competitor_activitiesModelComp_activity extends JModelAdmin
{
	/**
	 * @var      string    The prefix to use with controller messages.
	 * @since    1.6
	 */
	protected $text_prefix = 'COM_COMPETITOR_ACTIVITIES';

	/**
	 * @var   	string  	Alias to manage history control
	 * @since   3.2
	 */
	public $typeAlias = 'com_competitor_activities.comp_activity';

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
	public function getTable($type = 'Comp_activity', $prefix = 'Competitor_activitiesTable', $config = array())
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
			'com_competitor_activities.comp_activity', 'comp_activity',
			array('control' => 'jform',
				'load_data' => $loadData
			)
		);

			if($form->getFieldAttribute('first_insert', 'default') == 'NOW'){
				$form->setFieldAttribute('first_insert', 'default', date('Y-m-d H:i:s'));
			}
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
		$data = JFactory::getApplication()->getUserState('com_competitor_activities.edit.comp_activity.data', array());

		// var_dump($data);
		// exit();

		if (empty($data))
		{
			if ($this->item === null)
			{
				$this->item = $this->getItem();
			}

			$data = $this->item;

			// Support for multiple or not foreign key field: brand
			$array = array();

			foreach ((array) $data->brand as $value)
			{
				if (!is_array($value))
				{
					$array[] = $value;
				}
			}

			$data->brand = implode(',',$array);

			// Support for multiple or not foreign key field: category
			$array = array();

			foreach ((array) $data->category as $value)
			{
				if (!is_array($value))
				{
					$array[] = $value;
				}
			}

			$data->category = $array;

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
		// var_dump($data);
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
			// echo $item;
		}

		return $item;
		
		// $db = JFactory::getDbo();
		// $query = $db->getQuery(true);
		// $query->select('*');
		// $query->from($db->quoteName('#__competitor_activity'));
		// $query->where($db->quoteName('id')." = ".$db->quote($pk));

		// $db->setQuery($query);
		// $result = $db->loadResult();
	}

	/**
	 * Method to duplicate an Comp_activity
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
		if (!$user->authorise('core.create', 'com_competitor_activities'))
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
				$db->setQuery('SELECT MAX(ordering) FROM #__competitor_activity');
				$max             = $db->loadResult();
				$table->ordering = $max + 1;
			}
		}
	}

	public function getImage()
	{
		$input = JFactory::getApplication()->input;
		$pk = $input->get('id');

		// var_dump($pk);

		// Get a db connection.
		$some_value = '1';
		$db = JFactory::getDbo();
		$query = $db->getQuery(true);
		$query->select('*');
		$query->from($db->quoteName('#__competitor_images'));
		$query->where($db->quoteName('id')." = ".$db->quote($pk));

		$db->setQuery($query);
		// $result = $db->loadResult();
		$row = $db->loadRowList();

		// print_r($row);


		// var_dump($row);
		$result =  $row;
		// return $db->loadRow();

		// print_r($row);
	}


}
