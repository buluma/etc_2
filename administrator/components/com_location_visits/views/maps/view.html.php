<?php

/**
 * @version    CVS: 1.0.0
 * @package    Com_Location_visits
 * @author     Michael Buluma <michael@buluma.co.ke>
 * @copyright  2018 Michael Buluma
 * @license    GNU General Public License version 2 or later; see LICENSE.txt
 */
// No direct access
defined('_JEXEC') or die;

jimport('joomla.application.component.view');

/**
 * View class for a list of Location_visits.
 *
 * @since  1.6
 */
class location_visitsViewmaps extends JViewLegacy
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

		// Check for errors.
		if (count($errors = $this->get('Errors')))
		{
			throw new Exception(implode("\n", $errors));
		}

		// Set up the data to be sent in the response.
// $data = array( 'some data' );
// $data2 = $this->items;

// // Output the JSON data.
// echo '<pre>';
// echo json_encode( $data2 );
// echo '<pre/>';

		Location_visitsHelper::addSubmenu('maps');

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
		$canDo = Location_visitsHelper::getActions();

		JToolBarHelper::title(JText::_('Map View'), 'location');

		// Check if the form exists before showing the add/edit buttons
		$formPath = JPATH_COMPONENT_ADMINISTRATOR . '/views/maps';

		if ($canDo->get('core.admin'))
		{
			JToolBarHelper::preferences('com_location_visits');
		}

		// Set sidebar action - New in 3.0
		JHtmlSidebar::setAction('index.php?option=com_location_visits&view=maps');
	
	}


	protected function addToolbarold()
	{
		$state = $this->get('State');
		$canDo = Location_visitsHelper::getActions();

		JToolBarHelper::title(JText::_('COM_LOCATION_VISITS_TITLE_LOCATIONS'), 'location');

		// Check if the form exists before showing the add/edit buttons
		$formPath = JPATH_COMPONENT_ADMINISTRATOR . '/views/maps';

		if (file_exists($formPath))
		{
			if ($canDo->get('core.create'))
			{
				JToolBarHelper::addNew('map.add', 'JTOOLBAR_NEW');

				if (isset($this->items[0]))
				{
					JToolbarHelper::custom('maps.duplicate', 'copy.png', 'copy_f2.png', 'JTOOLBAR_DUPLICATE', true);
				}
			}

			if ($canDo->get('core.edit') && isset($this->items[0]))
			{
				JToolBarHelper::editList('map.edit', 'JTOOLBAR_EDIT');
			}
		}

		if ($canDo->get('core.edit.state'))
		{
			if (isset($this->items[0]->state))
			{
				JToolBarHelper::divider();
				JToolBarHelper::custom('maps.publish', 'publish.png', 'publish_f2.png', 'JTOOLBAR_PUBLISH', true);
				JToolBarHelper::custom('maps.unpublish', 'unpublish.png', 'unpublish_f2.png', 'JTOOLBAR_UNPUBLISH', true);
			}
			elseif (isset($this->items[0]))
			{
				// If this component does not use state then show a direct delete button as we can not trash
				JToolBarHelper::deleteList('', 'maps.delete', 'JTOOLBAR_DELETE');
			}

			if (isset($this->items[0]->state))
			{
				JToolBarHelper::divider();
				JToolBarHelper::archiveList('maps.archive', 'JTOOLBAR_ARCHIVE');
			}

			if (isset($this->items[0]->checked_out))
			{
				JToolBarHelper::custom('maps.checkin', 'checkin.png', 'checkin_f2.png', 'JTOOLBAR_CHECKIN', true);
			}
		}

		// Show trash and delete for components that uses the state field
		// if (isset($this->items[0]->state))
		// {
		// 	if ($state->get('filter.state') == -2 && $canDo->get('core.delete'))
		// 	{
		// 		JToolBarHelper::deleteList('', 'maps.delete', 'JTOOLBAR_EMPTY_TRASH');
		// 		JToolBarHelper::divider();
		// 	}
		// 	elseif ($canDo->get('core.edit.state'))
		// 	{
		// 		JToolBarHelper::trash('maps.trash', 'JTOOLBAR_TRASH');
		// 		JToolBarHelper::divider();
		// 	}
		// }

		if ($canDo->get('core.admin'))
		{
			JToolBarHelper::preferences('com_location_visits');
		}

		// Set sidebar action - New in 3.0
		JHtmlSidebar::setAction('index.php?option=com_location_visits&view=maps');
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
			'a.`client_id`' => JText::_('COM_LOCATION_VISITS_LOCATIONS_CLIENT_ID'),
			'a.`coordinates`' => JText::_('COM_LOCATION_VISITS_LOCATIONS_COORDINATES'),
			'a.`submitter`' => JText::_('COM_LOCATION_VISITS_LOCATIONS_SUBMITTER'),
			'a.`user_id`' => JText::_('COM_LOCATION_VISITS_LOCATIONS_USER_ID'),
			'a.`store`' => JText::_('COM_LOCATION_VISITS_LOCATIONS_STORE'),
			'a.`created_on`' => JText::_('COM_LOCATION_VISITS_LOCATIONS_CREATED_ON'),
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
