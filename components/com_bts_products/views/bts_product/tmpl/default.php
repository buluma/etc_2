<?php
/**
 * @version    CVS: 1.0.0
 * @package    Com_Bts_products
 * @author     Michael Buluma <michael@buluma.me.ke>
 * @copyright  2018 Michael Buluma
 * @license    GNU General Public License version 2 or later; see LICENSE.txt
 */
// No direct access
defined('_JEXEC') or die;

$canEdit = JFactory::getUser()->authorise('core.edit', 'com_bts_products');

if (!$canEdit && JFactory::getUser()->authorise('core.edit.own', 'com_bts_products'))
{
	$canEdit = JFactory::getUser()->id == $this->item->created_by;
}
?>

<div class="item_fields">

	<table class="table">
		

		<tr>
			<th><?php echo JText::_('COM_BTS_PRODUCTS_FORM_LBL_BTS_PRODUCT_PRODUCT_CODE'); ?></th>
			<td><?php echo $this->item->product_code; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_BTS_PRODUCTS_FORM_LBL_BTS_PRODUCT_PRODUCT_NAME'); ?></th>
			<td><?php echo $this->item->product_name; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_BTS_PRODUCTS_FORM_LBL_BTS_PRODUCT_PRODUCT_SKU'); ?></th>
			<td><?php echo $this->item->product_sku; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_BTS_PRODUCTS_FORM_LBL_BTS_PRODUCT_CATEGORY'); ?></th>
			<td><?php echo $this->item->category; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_BTS_PRODUCTS_FORM_LBL_BTS_PRODUCT_PRODUCT_TARGET'); ?></th>
			<td><?php echo $this->item->product_target; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_BTS_PRODUCTS_FORM_LBL_BTS_PRODUCT_PUBLISHED'); ?></th>
			<td><?php echo $this->item->published; ?></td>
		</tr>

	</table>

</div>

<?php if($canEdit && $this->item->checked_out == 0): ?>

	<a class="btn" href="<?php echo JRoute::_('index.php?option=com_bts_products&task=bts_product.edit&id='.$this->item->id); ?>"><?php echo JText::_("COM_BTS_PRODUCTS_EDIT_ITEM"); ?></a>

<?php endif; ?>

<?php if (JFactory::getUser()->authorise('core.delete','com_bts_products.bts_product.'.$this->item->id)) : ?>

	<a class="btn btn-danger" href="#deleteModal" role="button" data-toggle="modal">
		<?php echo JText::_("COM_BTS_PRODUCTS_DELETE_ITEM"); ?>
	</a>

	<div id="deleteModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="deleteModal" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			<h3><?php echo JText::_('COM_BTS_PRODUCTS_DELETE_ITEM'); ?></h3>
		</div>
		<div class="modal-body">
			<p><?php echo JText::sprintf('COM_BTS_PRODUCTS_DELETE_CONFIRM', $this->item->id); ?></p>
		</div>
		<div class="modal-footer">
			<button class="btn" data-dismiss="modal">Close</button>
			<a href="<?php echo JRoute::_('index.php?option=com_bts_products&task=bts_product.remove&id=' . $this->item->id, false, 2); ?>" class="btn btn-danger">
				<?php echo JText::_('COM_BTS_PRODUCTS_DELETE_ITEM'); ?>
			</a>
		</div>
	</div>

<?php endif; ?>