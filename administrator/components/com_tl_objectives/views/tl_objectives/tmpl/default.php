<?php
/**
 * @version    CVS: 1.0.0
 * @package    Com_Tl_objectives
 * @author     Michael Buluma <michael@buluma.co.ke>
 * @copyright  2018 Michael Buluma
 * @license    GNU General Public License version 2 or later; see LICENSE.txt
 */

// No direct access
defined('_JEXEC') or die;

JHtml::addIncludePath(JPATH_COMPONENT . '/helpers/');
JHtml::_('bootstrap.tooltip');
JHtml::_('behavior.multiselect');
JHtml::_('formbehavior.chosen', 'select');

// Import CSS
$document = JFactory::getDocument();
$document->addStyleSheet(JUri::root() . 'administrator/components/com_tl_objectives/assets/css/tl_objectives.css');
$document->addStyleSheet(JUri::root() . 'media/com_tl_objectives/css/list.css');

//datatables
$document->addStyleSheet('//cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css');
$document->addStyleSheet('//cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css');
$document->addScript('//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js');

//export pdf
$document->addScript('//cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js');
$document->addScript('//cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js');
$document->addScript('//cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js');
$document->addScript('//cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js');
$document->addScript('//cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js');
$document->addScript('//cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js');
$document->addScript('//cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js');

$user      = JFactory::getUser();
$userId    = $user->get('id');
$listOrder = $this->state->get('list.ordering');
$listDirn  = $this->state->get('list.direction');
$canOrder  = $user->authorise('core.edit.state', 'com_tl_objectives');
$saveOrder = $listOrder == 'a.`ordering`';

if ($saveOrder)
{
	$saveOrderingUrl = 'index.php?option=com_tl_objectives&task=tl_objectives.saveOrderAjax&tmpl=component';
	JHtml::_('sortablelist.sortable', 'tl_objectiveList', 'adminForm', strtolower($listDirn), $saveOrderingUrl);
}

$sortFields = $this->getSortFields();
?>

<form action="<?php echo JRoute::_('index.php?option=com_tl_objectives&view=tl_objectives'); ?>" method="post"
	  name="adminForm" id="adminForm">
	<?php if (!empty($this->sidebar)): ?>
	<div id="j-sidebar-container" class="span2">
		<?php echo $this->sidebar; ?>
	</div>
	<div id="j-main-container" class="span10">
		<?php else : ?>
		<div id="j-main-container">
			<?php endif; ?>

            <?php echo JLayoutHelper::render('joomla.searchtools.default', array('view' => $this)); ?>

			<div class="clearfix"></div>
			<table class="table table-striped" id="tl_objectiveList">
				<thead>
				<tr>
					<?php if (isset($this->items[0]->ordering)): ?>
						<th width="1%" class="nowrap center hidden-phone">
                            <?php echo JHtml::_('searchtools.sort', '', 'a.`ordering`', $listDirn, $listOrder, null, 'asc', 'JGRID_HEADING_ORDERING', 'icon-menu-2'); ?>
                        </th>
					<?php endif; ?>
					<th width="1%" class="hidden-phone">
						<input type="checkbox" name="checkall-toggle" value=""
							   title="<?php echo JText::_('JGLOBAL_CHECK_ALL'); ?>" onclick="Joomla.checkAll(this)"/>
					</th>
					<?php if (isset($this->items[0]->state)): ?>
						<th width="1%" class="nowrap center">
								<?php echo JHtml::_('searchtools.sort', 'JSTATUS', 'a.`state`', $listDirn, $listOrder); ?>
</th>
					<?php endif; ?>

									<th class='left'>
				<?php echo JHtml::_('searchtools.sort',  'COM_TL_OBJECTIVES_TL_OBJECTIVES_ID', 'a.`id`', $listDirn, $listOrder); ?>
				</th>
				<th class='left'>
				<?php echo JHtml::_('searchtools.sort',  'COM_TL_OBJECTIVES_TL_OBJECTIVES_CLIENT_ID', 'a.`client_id`', $listDirn, $listOrder); ?>
				</th>
				<th class='left'>
				<?php echo JHtml::_('searchtools.sort',  'COM_TL_OBJECTIVES_TL_OBJECTIVES_OBJECTIVE', 'a.`objective`', $listDirn, $listOrder); ?>
				</th>
				<th class='left'>
				<?php echo JHtml::_('searchtools.sort',  'COM_TL_OBJECTIVES_TL_OBJECTIVES_INPUTDATE', 'a.`inputdate`', $listDirn, $listOrder); ?>
				</th>
				<th class='left'>
				<?php echo JHtml::_('searchtools.sort',  'COM_TL_OBJECTIVES_TL_OBJECTIVES_OBJECTIVE_ACHIEVED', 'a.`objective_achieved`', $listDirn, $listOrder); ?>
				</th>
				<th class='left'>
				<?php echo JHtml::_('searchtools.sort',  'COM_TL_OBJECTIVES_TL_OBJECTIVES_SUBMITTER', 'a.`submitter`', $listDirn, $listOrder); ?>
				</th>
				<th class='left'>
				<?php echo JHtml::_('searchtools.sort',  'Created On', 'a.`created_on`', $listDirn, $listOrder); ?>
				</th>
				<th class='left'>
				<?php echo JHtml::_('searchtools.sort',  'COM_TL_OBJECTIVES_TL_OBJECTIVES_STORE', 'a.`store`', $listDirn, $listOrder); ?>
				</th>

					
				</tr>
				</thead>
				<tfoot>
				<tr>
					<td colspan="<?php echo isset($this->items[0]) ? count(get_object_vars($this->items[0])) : 10; ?>">
						<?php echo $this->pagination->getListFooter(); ?>
					</td>
				</tr>
				</tfoot>
				<tbody>
				<?php foreach ($this->items as $i => $item) :
					$ordering   = ($listOrder == 'a.ordering');
					$canCreate  = $user->authorise('core.create', 'com_tl_objectives');
					$canEdit    = $user->authorise('core.edit', 'com_tl_objectives');
					$canCheckin = $user->authorise('core.manage', 'com_tl_objectives');
					$canChange  = $user->authorise('core.edit.state', 'com_tl_objectives');
					?>
					<tr class="row<?php echo $i % 2; ?>">

						<?php if (isset($this->items[0]->ordering)) : ?>
							<td class="order nowrap center hidden-phone">
								<?php if ($canChange) :
									$disableClassName = '';
									$disabledLabel    = '';

									if (!$saveOrder) :
										$disabledLabel    = JText::_('JORDERINGDISABLED');
										$disableClassName = 'inactive tip-top';
									endif; ?>
									<span class="sortable-handler hasTooltip <?php echo $disableClassName ?>"
										  title="<?php echo $disabledLabel ?>">
							<i class="icon-menu"></i>
						</span>
									<input type="text" style="display:none" name="order[]" size="5"
										   value="<?php echo $item->ordering; ?>" class="width-20 text-area-order "/>
								<?php else : ?>
									<span class="sortable-handler inactive">
							<i class="icon-menu"></i>
						</span>
								<?php endif; ?>
							</td>
						<?php endif; ?>
						<td class="hidden-phone">
							<?php echo JHtml::_('grid.id', $i, $item->id); ?>
						</td>
						<?php if (isset($this->items[0]->state)): ?>
							<td class="center">
								<?php echo JHtml::_('jgrid.published', $item->state, $i, 'tl_objectives.', $canChange, 'cb'); ?>
</td>
						<?php endif; ?>

										<td>

					<?php echo $item->id; ?>
				</td>				
				<td>

					<?php echo $item->client_id; ?>
				</td>	
				<td>
				<?php if (isset($item->checked_out) && $item->checked_out && ($canEdit || $canChange)) : ?>
					<?php echo JHtml::_('jgrid.checkedout', $i, $item->uEditor, $item->checked_out_time, 'tl_objectives.', $canCheckin); ?>
				<?php endif; ?>
				<?php if ($canEdit) : ?>
					<a href="<?php echo JRoute::_('index.php?option=com_tl_objectives&task=tl_objective.edit&id='.(int) $item->id); ?>">
					<?php echo $this->escape($item->objective); ?></a>
				<?php else : ?>
					<?php echo $this->escape($item->objective); ?>
				<?php endif; ?>

				</td>				<td>

					<?php echo $item->inputdate; ?>
				</td>							<td>

					<?php echo $item->objective_achieved; ?>
				</td>				<td>

					<?php echo $item->submitter; ?>
				</td>				
				<td>
					<?php echo $item->created_on; ?>
				</td>
				<td>
					<?php echo $item->store; ?>
				</td>

					</tr>
				<?php endforeach; ?>
				</tbody>
			</table>

			<input type="hidden" name="task" value=""/>
			<input type="hidden" name="boxchecked" value="0"/>
            <input type="hidden" name="list[fullorder]" value="<?php echo $listOrder; ?> <?php echo $listDirn; ?>"/>
			<?php echo JHtml::_('form.token'); ?>
		</div>
</form>
<script>
	//export function
	jQuery(document).ready(function() {
	    jQuery('#tl_objectiveList').DataTable( {
	        dom: 'Bfrtip',
	        buttons: [
	            'copy', 'csv', 'excel', 'pdf', 'print'
	        ]
	    } );
	} );
	
    window.toggleField = function (id, task, field) {

        var f = document.adminForm, i = 0, cbx, cb = f[ id ];

        if (!cb) return false;

        while (true) {
            cbx = f[ 'cb' + i ];

            if (!cbx) break;

            cbx.checked = false;
            i++;
        }

        var inputField   = document.createElement('input');

        inputField.type  = 'hidden';
        inputField.name  = 'field';
        inputField.value = field;
        f.appendChild(inputField);

        cb.checked = true;
        f.boxchecked.value = 1;
        window.submitform(task);

        return false;
    };
</script>