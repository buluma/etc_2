<?php

/**
 * @version    CVS: 1.0.0
 * @package    Com_Logins
 * @author     Michael Buluma <michael@buluma.me.ke>
 * @copyright  2018 Michael Buluma
 * @license    GNU General Public License version 2 or later; see LICENSE.txt
 */
// No direct access
defined('_JEXEC') or die;

jimport('joomla.application.component.view');

/**
 * View class for a list of Logins.
 *
 * @since  1.6
 */
class LoginsViewLogins extends JViewLegacy
{
	protected $items;

	protected $pagination;

	protected $state;

	/**
	 * Display the view
	 *
	 * @param   string  $tpl  Template name
	 *
	 * @return void
	 *
	 * @throws Exception
	 */
	public function display($tpl = null)
	{
		$this->state = $this->get('State');
		$this->items = $this->get('Items');
		$this->pagination = $this->get('Pagination');
        $this->filterForm = $this->get('FilterForm');
        $this->activeFilters = $this->get('ActiveFilters');

        // var_dump($this->items);

		// Check for errors.
		if (count($errors = $this->get('Errors')))
		{
			throw new Exception(implode("\n", $errors));
		}

		LoginsHelper::addSubmenu('logins');

		$this->addToolbar();

		$this->sidebar = JHtmlSidebar::render();
		parent::display($tpl);
	}

	/**
	 * Add the page title and toolbar.
	 *
	 * @return void
	 *
	 * @since    1.6
	 */
	protected function addToolbar()
	{
		$state = $this->get('State');
		$canDo = LoginsHelper::getActions();

		JToolBarHelper::title(JText::_('COM_LOGINS_TITLE_LOGINS'), 'users');

		// Check if the form exists before showing the add/edit buttons
		$formPath = JPATH_COMPONENT_ADMINISTRATOR . '/views/login';

		if (file_exists($formPath))
		{
			if ($canDo->get('core.create'))
			{
				JToolBarHelper::addNew('login.add', 'JTOOLBAR_NEW');

				if (isset($this->items[0]))
				{
					JToolbarHelper::custom('logins.duplicate', 'copy.png', 'copy_f2.png', 'JTOOLBAR_DUPLICATE', true);
				}
			}

			if ($canDo->get('core.edit') && isset($this->items[0]))
			{
				JToolBarHelper::editList('login.edit', 'JTOOLBAR_EDIT');
			}
		}

		if ($canDo->get('core.edit.state'))
		{
			if (isset($this->items[0]->state))
			{
				JToolBarHelper::divider();
				JToolBarHelper::custom('logins.publish', 'publish.png', 'publish_f2.png', 'JTOOLBAR_PUBLISH', true);
				JToolBarHelper::custom('logins.unpublish', 'unpublish.png', 'unpublish_f2.png', 'JTOOLBAR_UNPUBLISH', true);
			}
			elseif (isset($this->items[0]))
			{
				// If this component does not use state then show a direct delete button as we can not trash
				JToolBarHelper::deleteList('', 'logins.delete', 'JTOOLBAR_DELETE');
			}

			if (isset($this->items[0]->state))
			{
				JToolBarHelper::divider();
				JToolBarHelper::archiveList('logins.archive', 'JTOOLBAR_ARCHIVE');
			}

			if (isset($this->items[0]->checked_out))
			{
				JToolBarHelper::custom('logins.checkin', 'checkin.png', 'checkin_f2.png', 'JTOOLBAR_CHECKIN', true);
			}
		}

		// Show trash and delete for components that uses the state field
		if (isset($this->items[0]->state))
		{
			if ($state->get('filter.state') == -2 && $canDo->get('core.delete'))
			{
				JToolBarHelper::deleteList('', 'logins.delete', 'JTOOLBAR_EMPTY_TRASH');
				JToolBarHelper::divider();
			}
			elseif ($canDo->get('core.edit.state'))
			{
				JToolBarHelper::trash('logins.trash', 'JTOOLBAR_TRASH');
				JToolBarHelper::divider();
			}
		}

		if ($canDo->get('core.admin'))
		{
			JToolBarHelper::preferences('com_logins');
		}

		// Set sidebar action - New in 3.0
		JHtmlSidebar::setAction('index.php?option=com_logins&view=logins');
	}

	/**
	 * Method to order fields 
	 *
	 * @return void 
	 */
	protected function getSortFields()
	{
		return array(
			'a.`id`' => JText::_('JGRID_HEADING_ID'),
			'a.`ordering`' => JText::_('JGRID_HEADING_ORDERING'),
			'a.`state`' => JText::_('JSTATUS'),
			'a.`username`' => JText::_('COM_LOGINS_LOGINS_USERNAME'),
			'a.`day`' => JText::_('COM_LOGINS_LOGINS_DAY'),
			'a.`login_coords`' => JText::_('COM_LOGINS_LOGINS_LOGIN_COORDS'),
		);
	}

    /**
     * Check if state is set
     *
     * @param   mixed  $state  State
     *
     * @return bool
     */
    public function getState($state)
    {
        return isset($this->state->{$state}) ? $this->state->{$state} : false;
    }
}
