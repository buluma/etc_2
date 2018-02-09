<?php

/**
 * @version    CVS: 1.0.0
 * @package    Com_Qissues
 * @author     Michael Buluma <michael@buluma.me.ke>
 * @copyright  2018 Michael Buluma
 * @license    GNU General Public License version 2 or later; see LICENSE.txt
 */
// No direct access
defined('_JEXEC') or die;

use Joomla\Utilities\ArrayHelper;
/**
 * issue Table class
 *
 * @since  1.6
 */
class QissuesTableissue extends JTable
{
	
	/**
	 * Constructor
	 *
	 * @param   JDatabase  &$db  A database connector object
	 */
	public function __construct(&$db)
	{
		JObserverMapper::addObserverClassToClass('JTableObserverContenthistory', 'QissuesTableissue', array('typeAlias' => 'com_qissues.issue'));
		parent::__construct('#__quality_issues', 'id', $db);
	}

	/**
	 * Overloaded bind function to pre-process the params.
	 *
	 * @param   array  $array   Named array
	 * @param   mixed  $ignore  Optional array or list of parameters to ignore
	 *
	 * @return  null|string  null is operation was satisfactory, otherwise returns an error
	 *
	 * @see     JTable:bind
	 * @since   1.5
	 */
	public function bind($array, $ignore = '')
	{
	    $date = JFactory::getDate();
		$task = JFactory::getApplication()->input->get('task');
	    
		$input = JFactory::getApplication()->input;
		$task = $input->getString('task', '');

		if ($array['id'] == 0 && empty($array['created_by']))
		{
			$array['created_by'] = JFactory::getUser()->id;
		}

		if ($array['id'] == 0 && empty($array['modified_by']))
		{
			$array['modified_by'] = JFactory::getUser()->id;
		}

		if ($task == 'apply' || $task == 'save')
		{
			$array['modified_by'] = JFactory::getUser()->id;
		}

		// Support for multiple field: brand
		if (isset($array['brand']))
		{
			if (is_array($array['brand']))
			{
				$array['brand'] = implode(',',$array['brand']);
			}
			elseif (strpos($array['brand'], ',') != false)
			{
				$array['brand'] = explode(',',$array['brand']);
			}
			elseif (strlen($array['brand']) == 0)
			{
				$array['brand'] = '';
			}
		}
		else
		{
			$array['brand'] = '';
		}

		// Support for multiple field: brandcode
		if (isset($array['brandcode']))
		{
			if (is_array($array['brandcode']))
			{
				$array['brandcode'] = implode(',',$array['brandcode']);
			}
			elseif (strpos($array['brandcode'], ',') != false)
			{
				$array['brandcode'] = explode(',',$array['brandcode']);
			}
			elseif (strlen($array['brandcode']) == 0)
			{
				$array['brandcode'] = '';
			}
		}
		else
		{
			$array['brandcode'] = '';
		}

		// Support for multiple field: issue_type
		if (isset($array['issue_type']))
		{
			if (is_array($array['issue_type']))
			{
				$array['issue_type'] = implode(',',$array['issue_type']);
			}
			elseif (strpos($array['issue_type'], ',') != false)
			{
				$array['issue_type'] = explode(',',$array['issue_type']);
			}
			elseif (strlen($array['issue_type']) == 0)
			{
				$array['issue_type'] = '';
			}
		}
		else
		{
			$array['issue_type'] = '';
		}

		// Support for empty date field: expiry_date
		if($array['expiry_date'] == '0000-00-00' )
		{
			$array['expiry_date'] = '';
		}

		// Support for multiple field: store
		if (isset($array['store']))
		{
			if (is_array($array['store']))
			{
				$array['store'] = implode(',',$array['store']);
			}
			elseif (strpos($array['store'], ',') != false)
			{
				$array['store'] = explode(',',$array['store']);
			}
			elseif (strlen($array['store']) == 0)
			{
				$array['store'] = '';
			}
		}
		else
		{
			$array['store'] = '';
		}

		// Support for multiple field: store_id
		if (isset($array['store_id']))
		{
			if (is_array($array['store_id']))
			{
				$array['store_id'] = implode(',',$array['store_id']);
			}
			elseif (strpos($array['store_id'], ',') != false)
			{
				$array['store_id'] = explode(',',$array['store_id']);
			}
			elseif (strlen($array['store_id']) == 0)
			{
				$array['store_id'] = '';
			}
		}
		else
		{
			$array['store_id'] = '';
		}

		// Support for multiple field: store_server_id
		if (isset($array['store_server_id']))
		{
			if (is_array($array['store_server_id']))
			{
				$array['store_server_id'] = implode(',',$array['store_server_id']);
			}
			elseif (strpos($array['store_server_id'], ',') != false)
			{
				$array['store_server_id'] = explode(',',$array['store_server_id']);
			}
			elseif (strlen($array['store_server_id']) == 0)
			{
				$array['store_server_id'] = '';
			}
		}
		else
		{
			$array['store_server_id'] = '';
		}

		if ($array['id'] == 0)
		{
			$array['created_on'] = $date->toSql();
		}

		if ($array['id'] == 0 && empty($array['submitter']))
		{
			$array['submitter'] = JFactory::getUser()->id;
		}

		if ($array['id'] == 0 && empty($array['user_id']))
		{
			$array['user_id'] = JFactory::getUser()->id;
		}

		if (isset($array['params']) && is_array($array['params']))
		{
			$registry = new JRegistry;
			$registry->loadArray($array['params']);
			$array['params'] = (string) $registry;
		}

		if (isset($array['metadata']) && is_array($array['metadata']))
		{
			$registry = new JRegistry;
			$registry->loadArray($array['metadata']);
			$array['metadata'] = (string) $registry;
		}

		if (!JFactory::getUser()->authorise('core.admin', 'com_qissues.issue.' . $array['id']))
		{
			$actions         = JAccess::getActionsFromFile(
				JPATH_ADMINISTRATOR . '/components/com_qissues/access.xml',
				"/access/section[@name='issue']/"
			);
			$default_actions = JAccess::getAssetRules('com_qissues.issue.' . $array['id'])->getData();
			$array_jaccess   = array();

			foreach ($actions as $action)
			{
                if (key_exists($action->name, $default_actions))
                {
                    $array_jaccess[$action->name] = $default_actions[$action->name];
                }
			}

			$array['rules'] = $this->JAccessRulestoArray($array_jaccess);
		}

		// Bind the rules for ACL where supported.
		if (isset($array['rules']) && is_array($array['rules']))
		{
			$this->setRules($array['rules']);
		}

		return parent::bind($array, $ignore);
	}

	/**
	 * This function convert an array of JAccessRule objects into an rules array.
	 *
	 * @param   array  $jaccessrules  An array of JAccessRule objects.
	 *
	 * @return  array
	 */
	private function JAccessRulestoArray($jaccessrules)
	{
		$rules = array();

		foreach ($jaccessrules as $action => $jaccess)
		{
			$actions = array();

			if ($jaccess)
			{
				foreach ($jaccess->getData() as $group => $allow)
				{
					$actions[$group] = ((bool)$allow);
				}
			}

			$rules[$action] = $actions;
		}

		return $rules;
	}

	/**
	 * Overloaded check function
	 *
	 * @return bool
	 */
	public function check()
	{
		// If there is an ordering column and this is a new row then get the next ordering value
		if (property_exists($this, 'ordering') && $this->id == 0)
		{
			$this->ordering = self::getNextOrder();
		}
		
		

		return parent::check();
	}

	/**
	 * Method to set the publishing state for a row or list of rows in the database
	 * table.  The method respects checked out rows by other users and will attempt
	 * to checkin rows that it can after adjustments are made.
	 *
	 * @param   mixed    $pks     An optional array of primary key values to update.  If not
	 *                            set the instance property value is used.
	 * @param   integer  $state   The publishing state. eg. [0 = unpublished, 1 = published]
	 * @param   integer  $userId  The user id of the user performing the operation.
	 *
	 * @return   boolean  True on success.
	 *
	 * @since    1.0.4
	 *
	 * @throws Exception
	 */
	public function publish($pks = null, $state = 1, $userId = 0)
	{
		// Initialise variables.
		$k = $this->_tbl_key;

		// Sanitize input.
		ArrayHelper::toInteger($pks);
		$userId = (int) $userId;
		$state  = (int) $state;

		// If there are no primary keys set check to see if the instance key is set.
		if (empty($pks))
		{
			if ($this->$k)
			{
				$pks = array($this->$k);
			}
			// Nothing to set publishing state on, return false.
			else
			{
				throw new Exception(500, JText::_('JLIB_DATABASE_ERROR_NO_ROWS_SELECTED'));
			}
		}

		// Build the WHERE clause for the primary keys.
		$where = $k . '=' . implode(' OR ' . $k . '=', $pks);

		// Determine if there is checkin support for the table.
		if (!property_exists($this, 'checked_out') || !property_exists($this, 'checked_out_time'))
		{
			$checkin = '';
		}
		else
		{
			$checkin = ' AND (checked_out = 0 OR checked_out = ' . (int) $userId . ')';
		}

		// Update the publishing state for rows with the given primary keys.
		$this->_db->setQuery(
			'UPDATE `' . $this->_tbl . '`' .
			' SET `state` = ' . (int) $state .
			' WHERE (' . $where . ')' .
			$checkin
		);
		$this->_db->execute();

		// If checkin is supported and all rows were adjusted, check them in.
		if ($checkin && (count($pks) == $this->_db->getAffectedRows()))
		{
			// Checkin each row.
			foreach ($pks as $pk)
			{
				$this->checkin($pk);
			}
		}

		// If the JTable instance value is in the list of primary keys that were set, set the instance.
		if (in_array($this->$k, $pks))
		{
			$this->state = $state;
		}

		return true;
	}

	/**
	 * Define a namespaced asset name for inclusion in the #__assets table
	 *
	 * @return string The asset name
	 *
	 * @see JTable::_getAssetName
	 */
	protected function _getAssetName()
	{
		$k = $this->_tbl_key;

		return 'com_qissues.issue.' . (int) $this->$k;
	}

	/**
	 * Returns the parent asset's id. If you have a tree structure, retrieve the parent's id using the external key field
	 *
	 * @param   JTable   $table  Table name
	 * @param   integer  $id     Id
	 *
	 * @see JTable::_getAssetParentId
	 *
	 * @return mixed The id on success, false on failure.
	 */
	protected function _getAssetParentId(JTable $table = null, $id = null)
	{
		// We will retrieve the parent-asset from the Asset-table
		$assetParent = JTable::getInstance('Asset');

		// Default: if no asset-parent can be found we take the global asset
		$assetParentId = $assetParent->getRootId();

		// The item has the component as asset-parent
		$assetParent->loadByName('com_qissues');

		// Return the found asset-parent-id
		if ($assetParent->id)
		{
			$assetParentId = $assetParent->id;
		}

		return $assetParentId;
	}

	/**
	 * Delete a record by id
	 *
	 * @param   mixed  $pk  Primary key value to delete. Optional
	 *
	 * @return bool
	 */
	public function delete($pk = null)
	{
		$this->load($pk);
		$result = parent::delete($pk);
		
		return $result;
	}
}
