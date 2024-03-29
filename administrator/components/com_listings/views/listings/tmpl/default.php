<?php
/**
 * @version    CVS: 1.0.0
 * @package    Com_Listings
 * @author     Michael Buluma <michael@buluma.me.ke>
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
$document->addStyleSheet(JUri::root() . 'administrator/components/com_listings/assets/css/listings.css');
$document->addStyleSheet(JUri::root() . 'media/com_listings/css/list.css');
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
$canOrder  = $user->authorise('core.edit.state', 'com_listings');
$saveOrder = $listOrder == 'a.`ordering`';

if ($saveOrder)
{
	$saveOrderingUrl = 'index.php?option=com_listings&task=listings.saveOrderAjax&tmpl=component';
	JHtml::_('sortablelist.sortable', 'listingList', 'adminForm', strtolower($listDirn), $saveOrderingUrl);
}

$sortFields = $this->getSortFields();
?>

<form action="<?php echo JRoute::_('index.php?option=com_listings&view=listings'); ?>" method="post"
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
			<table class="table table-striped" id="listingList">
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
								<?php echo JHtml::_('searchtools.sort', 'JSTATUS', '', $listDirn, $listOrder); ?>
</th>
					<?php endif; ?>

				<th class='left'>
				<?php echo 'ID'; ?>
				</th>
				<th class='left'>
				<?php echo JHtml::_('searchtools.sort',  'COM_LISTINGS_LISTINGS_LISTING', '', $listDirn, $listOrder); ?>
				</th>
				<th class='left'>
				<?php echo JHtml::_('searchtools.sort',  'COM_LISTINGS_LISTINGS_LISTED', '', $listDirn, $listOrder); ?>
				</th>
				<th class='left'>
				<?php echo JHtml::_('searchtools.sort',  'COM_LISTINGS_LISTINGS_SUBMITTER', '', $listDirn, $listOrder); ?>
				</th>
				<th class='left'>
				<?php echo JHtml::_('searchtools.sort',  'COM_LISTINGS_LISTINGS_USER_ID', '', $listDirn, $listOrder); ?>
				</th>
				<th class='left'>
				<?php echo JHtml::_('searchtools.sort',  'Created On', '', $listDirn, $listOrder); ?>
				</th>
				<th class='left'>
				<?php echo JHtml::_('searchtools.sort',  'COM_LISTINGS_LISTINGS_STORE', '', $listDirn, $listOrder); ?>
				</th>
				<th class='left'>
				<?php echo JHtml::_('searchtools.sort',  'Client Id', '', $listDirn, $listOrder); ?>
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
					$canCreate  = $user->authorise('core.create', 'com_listings');
					$canEdit    = $user->authorise('core.edit', 'com_listings');
					$canCheckin = $user->authorise('core.manage', 'com_listings');
					$canChange  = $user->authorise('core.edit.state', 'com_listings');
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
								<?php echo JHtml::_('jgrid.published', $item->state, $i, 'listings.', $canChange, 'cb'); ?>
</td>
						<?php endif; ?>

										<td>

					<?php echo $item->id; ?>
				</td>				<td>

					<?php echo $item->product; ?>
				</td>				<td>

					<?php echo $item->listed; ?>
				</td>				<td>

					<?php echo $item->submitter; ?>
				</td>				
				<td>
					<?php echo $item->user_id; ?>
				</td>				
				<td>
					<?php echo $item->created_on; ?>
				</td>				
				<td>
					<?php echo $item->store; ?>
				</td><td>

					<?php echo $item->client_id; ?>
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

	// jQuery(document).ready(function(){
 //    jQuery('#listingList').DataTable();
	// });

	// jQuery(document).ready(function() {
	//     jQuery('#listingList').DataTable( {
	//         dom: 'Bfrtip',
	//         buttons: [
	//             'copy', 'csv', 'excel', 'pdf', 'print'
	//         ]
	//     } );
	// } );

	jQuery(document).ready(function() {
    jQuery('#listingList').DataTable( {
        dom: 'Bfrtip',
        buttons: [
            'copyHtml5',
            'excelHtml5',
            'csvHtml5',
            'pdfHtml5'
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

<style type="text/css">
	div.btn-wrapper.input-append{
		display: none;
	}
</style>