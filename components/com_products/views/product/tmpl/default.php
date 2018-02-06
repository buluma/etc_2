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

$canEdit = JFactory::getUser()->authorise('core.edit', 'com_products');

if (!$canEdit && JFactory::getUser()->authorise('core.edit.own', 'com_products'))
{
	$canEdit = JFactory::getUser()->id == $this->item->created_by;
}
?>

<div class="item_fields">

	<table class="table">
		

		<tr>
			<th><?php echo JText::_('COM_PRODUCTS_FORM_LBL_PRODUCT_PRODUCT_CODE'); ?></th>
			<td><?php echo $this->item->product_code; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_PRODUCTS_FORM_LBL_PRODUCT_PRODUCT_NAME'); ?></th>
			<td><?php echo $this->item->product_name; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_PRODUCTS_FORM_LBL_PRODUCT_CATEGORY'); ?></th>
			<td><?php echo $this->item->category; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_PRODUCTS_FORM_LBL_PRODUCT_PRODUCT_CLASSIFICATION'); ?></th>
			<td><?php echo $this->item->product_classification; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_PRODUCTS_FORM_LBL_PRODUCT_PRODUCT_TYPE'); ?></th>
			<td><?php echo $this->item->product_type; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_PRODUCTS_FORM_LBL_PRODUCT_PRODUCT_UOM'); ?></th>
			<td><?php echo $this->item->product_uom; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_PRODUCTS_FORM_LBL_PRODUCT_PRODUCT_PRICE'); ?></th>
			<td><?php echo $this->item->product_price; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_PRODUCTS_FORM_LBL_PRODUCT_PRODUCT_SIZE'); ?></th>
			<td><?php echo $this->item->product_size; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_PRODUCTS_FORM_LBL_PRODUCT_PRODUCT_CASES'); ?></th>
			<td><?php echo $this->item->product_cases; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_PRODUCTS_FORM_LBL_PRODUCT_PUBLISHED'); ?></th>
			<td><?php echo $this->item->published; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_PRODUCTS_FORM_LBL_PRODUCT_MUST_HAVE'); ?></th>
			<td><?php echo $this->item->must_have; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_PRODUCTS_FORM_LBL_PRODUCT_DELETED'); ?></th>
			<td><?php echo $this->item->deleted; ?></td>
		</tr>

	</table>

</div>

<?php if($canEdit && $this->item->checked_out == 0): ?>

	<a class="btn" href="<?php echo JRoute::_('index.php?option=com_products&task=product.edit&id='.$this->item->id); ?>"><?php echo JText::_("COM_PRODUCTS_EDIT_ITEM"); ?></a>

<?php endif; ?>

<?php if (JFactory::getUser()->authorise('core.delete','com_products.product.'.$this->item->id)) : ?>

	<a class="btn btn-danger" href="#deleteModal" role="button" data-toggle="modal">
		<?php echo JText::_("COM_PRODUCTS_DELETE_ITEM"); ?>
	</a>

	<div id="deleteModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="deleteModal" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			<h3><?php echo JText::_('COM_PRODUCTS_DELETE_ITEM'); ?></h3>
		</div>
		<div class="modal-body">
			<p><?php echo JText::sprintf('COM_PRODUCTS_DELETE_CONFIRM', $this->item->id); ?></p>
		</div>
		<div class="modal-footer">
			<button class="btn" data-dismiss="modal">Close</button>
			<a href="<?php echo JRoute::_('index.php?option=com_products&task=product.remove&id=' . $this->item->id, false, 2); ?>" class="btn btn-danger">
				<?php echo JText::_('COM_PRODUCTS_DELETE_ITEM'); ?>
			</a>
		</div>
	</div>

<?php endif; ?>