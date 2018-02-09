<?php
/**
 * @version    CVS: 1.0.0
 * @package    Com_Products
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
$document->addStyleSheet(JUri::root() . 'administrator/components/com_products/assets/css/products.css');
$document->addStyleSheet(JUri::root() . 'media/com_products/css/list.css');

$user      = JFactory::getUser();
$userId    = $user->get('id');
$listOrder = $this->state->get('list.ordering');
$listDirn  = $this->state->get('list.direction');
$canOrder  = $user->authorise('core.edit.state', 'com_products');
$saveOrder = $listOrder == 'a.`ordering`';

if ($saveOrder)
{
	$saveOrderingUrl = 'index.php?option=com_products&task=products.saveOrderAjax&tmpl=component';
	JHtml::_('sortablelist.sortable', 'productList', 'adminForm', strtolower($listDirn), $saveOrderingUrl);
}

$sortFields = $this->getSortFields();
?>

<form>
	<div id="j-sidebar-container" class="span2">
		<?php echo $this->sidebar; ?>
	</div>

	<div id="j-main-container" class="span10">
		<?php //echo JLayoutHelper::render('joomla.searchtools.default', array('view' => $this)); ?>

			<div class="clearfix"></div>
			<table class="table table-striped" id="productList">
				<thead>
				<tr>
					<?php 
					// echo '<pre>';
					// var_dump($this->items); 
					// echo '</pre>';
					?>
					<th width="1%" class="nowrap center hidden-phone">
                            <?php echo JHtml::_('searchtools.sort', '', 'a.`id`', $listDirn, $listOrder, null, 'asc', 'JGRID_HEADING_ORDERING', 'icon-menu-2'); ?>
                        </th>
                     <th width="1%" class="hidden-phone">
						<input type="checkbox" name="checkall-toggle" value=""
							   title="<?php echo JText::_('JGLOBAL_CHECK_ALL'); ?>" onclick="Joomla.checkAll(this)"/>
					</th>
					<th width="1%" class="nowrap center">
								<?php echo JHtml::_('searchtools.sort', 'JSTATUS', 'a.`state`', $listDirn, $listOrder); ?>
					</th>
					<th class='left'>
				<?php echo JHtml::_('searchtools.sort',  'COM_PRODUCTS_PRODUCTS_ID', 'a.`id`', $listDirn, $listOrder); ?>
				</th>
				<th class='left'>
				<?php echo JHtml::_('searchtools.sort',  'brandcode', 'a.`product_code`', $listDirn, $listOrder); ?>
				</th>
				<th class='left'>
				<?php echo JHtml::_('searchtools.sort',  'stockdate', 'a.`product_code`', $listDirn, $listOrder); ?>
				</th>
				<th class='left'>
				<?php echo JHtml::_('searchtools.sort',  'COM_PRODUCTS_PRODUCTS_PRODUCT_NAME', 'a.`product_name`', $listDirn, $listOrder); ?>
				</th>
				<th class='left'>
				<?php echo JHtml::_('searchtools.sort',  'currentstock', 'a.`category`', $listDirn, $listOrder); ?>
				</th>
				<th class='left'>
				<?php echo JHtml::_('searchtools.sort',  'orderplaced', 'a.`product_price`', $listDirn, $listOrder); ?>
				</th>
				<th class='left'>
				<?php echo JHtml::_('searchtools.sort',  'Piece Orderd', 'a.`published`', $listDirn, $listOrder); ?>
				</th>
				<th class='left'>
				<?php echo JHtml::_('searchtools.sort',  'order_date', 'a.`must_have`', $listDirn, $listOrder); ?>
				</th>
				<th class='left'>
				<?php echo JHtml::_('searchtools.sort',  'delivered', 'a.`must_have`', $listDirn, $listOrder); ?>
				</th>
				<th class='left'>
				<?php echo JHtml::_('searchtools.sort',  'store', 'a.`deleted`', $listDirn, $listOrder); ?>
				</th>
				<th class='left'>
				<?php echo JHtml::_('searchtools.sort',  'submitter', 'a.`submitter`', $listDirn, $listOrder); ?>
				</th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					
				</tr>
				</tfoot>
			<tbody>
				<?php 
				// echo '<pre>';
	   //      	var_dump($this->items);
	   //      	echo '<pre/>';
				foreach ($this->items as $i => $item) :
				// var_dump($item);
					$ordering   = ($listOrder == 'a.ordering');
					$canCreate  = $user->authorise('core.create', 'com_products');
					$canEdit    = $user->authorise('core.edit', 'com_products');
					$canCheckin = $user->authorise('core.manage', 'com_products');
					$canChange  = $user->authorise('core.edit.state', 'com_products');
					?>
					<?php endforeach; ?>
					<tr class="row<?php echo $i % 2; ?>">
						<td class="order nowrap center hidden-phone">
								<?php if ($canChange) :
									$disableClassName = '';
									$disabledLabel    = '';

									if (!$saveOrder) :
										$disabledLabel    = JText::_('JORDERINGDISABLED');
										$disableClassName = 'inactive tip-top';
									endif; 
									?>
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

						<td class="hidden-phone">
							<?php echo JHtml::_('grid.id', $i, $item->id); ?>
						</td>

						<td class="center">
								<?php echo JHtml::_('jgrid.published', $item->state, $i, 'products.', $canChange, 'cb'); ?>
						</td>
						<td>

					<?php echo 'hapa' . $item->id; ?>
				</td>		
				<td><?php echo $item->stockdate; ?></td>
				<td>
				<?php if ($canEdit) : ?>
					<a href="<?php echo JRoute::_('index.php?option=com_products&task=product.edit&id='.(int) $item->id); ?>">
					<?php echo $this->escape($item->brandcode); ?></a>
				<?php else : ?>
					<?php echo $this->escape($item->brandcode); ?>
				<?php endif; ?>
				</td>
				<td><?php echo $item->brand; 

									// echo '<pre>';
									// var_dump($item); 
									// echo '</pre>';
									?></td>
				<td><?php echo $item->currentstock; ?></td>
				<td><?php echo $item->order_placed; ?></td>
				<td><?php echo $item->orderplaced; ?></td>
				<td><?php echo $item->order_date; ?></td>
				<td><?php echo $item->delivered; ?></td>
				<td><?php echo $item->store; ?></td>
				<td><?php echo $item->submitter; ?></td>
					</tr>
			</tbody>
		</table>
	</div>
</form>
<script>
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