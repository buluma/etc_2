<?php
/**
 * @version    CVS: 1.0.0
 * @package    Com_Bts_items
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
JHTML::_('behavior.modal');

// Import CSS
$document = JFactory::getDocument();
$document->addStyleSheet(JUri::root() . 'administrator/components/com_bts_items/assets/css/bts_items.css');
$document->addStyleSheet(JUri::root() . 'media/com_bts_items/css/list.css');

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
$canOrder  = $user->authorise('core.edit.state', 'com_bts_items');
$saveOrder = $listOrder == 'a.`ordering`';

if ($saveOrder)
{
	$saveOrderingUrl = 'index.php?option=com_bts_items&task=bts_items.saveOrderAjax&tmpl=component';
	JHtml::_('sortablelist.sortable', 'bts_itemList', 'adminForm', strtolower($listDirn), $saveOrderingUrl);
}

$sortFields = $this->getSortFields();
?>

<form action="<?php echo JRoute::_('index.php?option=com_bts_items&view=bts_items'); ?>" method="post"
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

			<table class="table table-striped" id="bts_itemList">
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
				<?php echo JHtml::_('searchtools.sort',  'COM_BTS_ITEMS_BTS_ITEMS_ID', 'a.`id`', $listDirn, $listOrder); ?>
				</th>
				<th class='left'>
				<?php echo JHtml::_('searchtools.sort',  'COM_BTS_ITEMS_BTS_ITEMS_DATE', 'a.`date`', $listDirn, $listOrder); ?>
				</th>
				<th class='left'>
				<?php echo JHtml::_('searchtools.sort',  'COM_BTS_ITEMS_BTS_ITEMS_BA_NAME', 'a.`ba_name`', $listDirn, $listOrder); ?>
				</th>
				<th class='left'>
				<?php echo JHtml::_('searchtools.sort',  'Image', 'a.`image_id`', $listDirn, $listOrder); ?>
				</th>
				<th class='left'>
				<?php echo JHtml::_('searchtools.sort',  'COM_BTS_ITEMS_BTS_ITEMS_PRODUCT', 'a.`product`', $listDirn, $listOrder); ?>
				</th>
				<th class='left'>
				<?php echo JHtml::_('searchtools.sort',  'COM_BTS_ITEMS_BTS_ITEMS_SKU', 'a.`sku`', $listDirn, $listOrder); ?>
				</th> 
				<th class='left'>
				<?php echo JHtml::_('searchtools.sort',  'COM_BTS_ITEMS_BTS_ITEMS_TARGET', 'a.`target`', $listDirn, $listOrder); ?>
				</th>
				<th class='left'>
				<?php echo JHtml::_('searchtools.sort',  'COM_BTS_ITEMS_BTS_ITEMS_ACTUAL', 'a.`actual`', $listDirn, $listOrder); ?>
				</th>
				<th class='left'>
				<?php echo JHtml::_('searchtools.sort',  'COM_BTS_ITEMS_BTS_ITEMS_STORE', 'a.`store`', $listDirn, $listOrder); ?>
				</th>
				<th class='left'>
				<?php echo JHtml::_('searchtools.sort',  'COM_BTS_ITEMS_BTS_ITEMS_COORDINATES', 'a.`coordinates`', $listDirn, $listOrder); ?>
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
					$canCreate  = $user->authorise('core.create', 'com_bts_items');
					$canEdit    = $user->authorise('core.edit', 'com_bts_items');
					$canCheckin = $user->authorise('core.manage', 'com_bts_items');
					$canChange  = $user->authorise('core.edit.state', 'com_bts_items');
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
								<?php echo JHtml::_('jgrid.published', $item->state, $i, 'bts_items.', $canChange, 'cb'); ?>
</td>
						<?php endif; ?>

										<td>

					<?php echo $item->id; ?>
				</td>				<td>

					<?php echo $item->date; ?>
				</td>				
				<td>
				<?php if (isset($item->checked_out) && $item->checked_out && ($canEdit || $canChange)) : ?>
					<?php echo JHtml::_('jgrid.checkedout', $i, $item->uEditor, $item->checked_out_time, 'bts_items.', $canCheckin); ?>
				<?php endif; ?>
				<?php if ($canEdit) : ?>
					<a href="<?php echo JRoute::_('index.php?option=com_bts_items&task=bts_item.edit&id='.(int) $item->id); ?>">
					<?php echo $this->escape($item->ba_name); ?></a>
				<?php else : ?>
					<?php echo $this->escape($item->ba_name); ?>
				<?php endif; ?>

				</td>		
				<td>
				<!-- <a href="#mod" class="modal"> -->
					<?php
					// var_dump($item->image_id);
					if (empty($item->image_id)) {
						echo 'No Image Found';
					} else { ?>
						<img src="<?php echo $item->image_id; ?>" width="120" height="100" alt="<?php echo $item->product;?> Image" />
					<?php };
				
					?>
				

				<!--<div id="mod" class="hiddenx"><img src="<?php //var_dump($item->image_id); //echo $item->image_id; ?>" width="120" height="100" alt="<?php //echo $item->product;?> Image" /></div> -->
				<!-- <a href="#myModal" class="btn" data-toggle="modal"> Click here to see my image</a> -->

<?php echo JHTML::_('bootstrap.renderModal', 'myModal', array(), '<img src="'. $item->image_id . '" />'); ?>
				</td>	
				<td>
					<?php echo $item->product; ?>
				</td>				
				<td class="">
					<?php echo $item->product_sku; ?>
				</td>				
				<td>
					<?php echo $item->product_target; ?>
				</td>				<td>

					<?php echo $item->actual; ?>
				</td>				<td>

					<?php echo $item->store; ?>
				</td>	
				<td>
					<?php echo $item->coordinates; ?>
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
	    jQuery('#bts_itemList').DataTable( {
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