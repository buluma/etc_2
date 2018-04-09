<?php

/**
 * @version    CVS: 1.0.0
 * @package    Com_Brandstocks
 * @author     Michael Buluma <michael@buluma.me.ke>
 * @copyright  2018 Michael Buluma
 * @license    GNU General Public License version 2 or later; see LICENSE.txt
 */
// No direct access
defined('_JEXEC') or die;

jimport('joomla.application.component.view');

/**
 * View class for a list of Brandstocks.
 *
 * @since  1.6
 */
class BrandstocksViewTbrandstocks extends JViewLegacy
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

		BrandstocksHelper::addSubmenu('tbrandstocks');

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
		$canDo = BrandstocksHelper::getActions();

		JToolBarHelper::title(JText::_('COM_BRANDSTOCKS_TITLE_TBRANDSTOCKS'), 'tbrandstocks.png');

		// Check if the form exists before showing the add/edit buttons
		$formPath = JPATH_COMPONENT_ADMINISTRATOR . '/views/tbrandstock';

		if (file_exists($formPath))
		{
			if ($canDo->get('core.create'))
			{
				JToolBarHelper::addNew('tbrandstock.add', 'JTOOLBAR_NEW');

				if (isset($this->items[0]))
				{
					JToolbarHelper::custom('tbrandstocks.duplicate', 'copy.png', 'copy_f2.png', 'JTOOLBAR_DUPLICATE', true);
				}
			}

			if ($canDo->get('core.edit') && isset($this->items[0]))
			{
				JToolBarHelper::editList('tbrandstock.edit', 'JTOOLBAR_EDIT');
			}
		}

		if ($canDo->get('core.edit.state'))
		{
			if (isset($this->items[0]->state))
			{
				JToolBarHelper::divider();
				JToolBarHelper::custom('tbrandstocks.publish', 'publish.png', 'publish_f2.png', 'JTOOLBAR_PUBLISH', true);
				JToolBarHelper::custom('tbrandstocks.unpublish', 'unpublish.png', 'unpublish_f2.png', 'JTOOLBAR_UNPUBLISH', true);
			}
			elseif (isset($this->items[0]))
			{
				// If this component does not use state then show a direct delete button as we can not trash
				JToolBarHelper::deleteList('', 'tbrandstocks.delete', 'JTOOLBAR_DELETE');
			}

			if (isset($this->items[0]->state))
			{
				JToolBarHelper::divider();
				JToolBarHelper::archiveList('tbrandstocks.archive', 'JTOOLBAR_ARCHIVE');
			}

			if (isset($this->items[0]->checked_out))
			{
				JToolBarHelper::custom('tbrandstocks.checkin', 'checkin.png', 'checkin_f2.png', 'JTOOLBAR_CHECKIN', true);
			}
		}

		// Show trash and delete for components that uses the state field
		if (isset($this->items[0]->state))
		{
			if ($state->get('filter.state') == -2 && $canDo->get('core.delete'))
			{
				JToolBarHelper::deleteList('', 'tbrandstocks.delete', 'JTOOLBAR_EMPTY_TRASH');
				JToolBarHelper::divider();
			}
			elseif ($canDo->get('core.edit.state'))
			{
				JToolBarHelper::trash('tbrandstocks.trash', 'JTOOLBAR_TRASH');
				JToolBarHelper::divider();
			}
		}

		if ($canDo->get('core.admin'))
		{
			JToolBarHelper::preferences('com_brandstocks');
		}

		// Set sidebar action - New in 3.0
		JHtmlSidebar::setAction('index.php?option=com_brandstocks&view=tbrandstocks');
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
			'a.`brand`' => JText::_('COM_BRANDSTOCKS_TBRANDSTOCKS_BRAND'),
			'a.`brandcode`' => JText::_('COM_BRANDSTOCKS_TBRANDSTOCKS_BRANDCODE'),
			'a.`currentstock`' => JText::_('COM_BRANDSTOCKS_TBRANDSTOCKS_CURRENTSTOCK'),
			'a.`order_placed`' => JText::_('COM_BRANDSTOCKS_TBRANDSTOCKS_ORDER_PLACED'),
			'a.`orderplaced`' => JText::_('COM_BRANDSTOCKS_TBRANDSTOCKS_ORDERPLACED'),
			'a.`order_date`' => JText::_('COM_BRANDSTOCKS_TBRANDSTOCKS_ORDER_DATE'),
			'a.`delivered`' => JText::_('COM_BRANDSTOCKS_TBRANDSTOCKS_DELIVERED'),
			'a.`stockout`' => JText::_('COM_BRANDSTOCKS_TBRANDSTOCKS_STOCKOUT'),
			'a.`submitter`' => JText::_('COM_BRANDSTOCKS_TBRANDSTOCKS_SUBMITTER'),
			'a.`stockdate`' => JText::_('COM_BRANDSTOCKS_TBRANDSTOCKS_STOCKDATE'),
			'a.`store`' => JText::_('COM_BRANDSTOCKS_TBRANDSTOCKS_STORE'),
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
