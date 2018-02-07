<?php
/**
 * @version    CVS: 1.0.0
 * @package    Com_Submitted
 * @author     Michael Buluma <michael@buluma.me.ke>
 * @copyright  2018 Michael Buluma
 * @license    GNU General Public License version 2 or later; see LICENSE.txt
 */
// No direct access
defined('_JEXEC') or die;

$canEdit = JFactory::getUser()->authorise('core.edit', 'com_submitted.' . $this->item->id);

if (!$canEdit && JFactory::getUser()->authorise('core.edit.own', 'com_submitted' . $this->item->id))
{
	$canEdit = JFactory::getUser()->id == $this->item->created_by;
}
?>

<div class="item_fields">

	<table class="table">
		

		<tr>
			<th><?php echo JText::_('COM_SUBMITTED_FORM_LBL_CHECKLIST_SHOP_MML'); ?></th>
			<td><?php echo $this->item->shop_mml; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_SUBMITTED_FORM_LBL_CHECKLIST_SKU_AVAILABLE'); ?></th>
			<td><?php echo $this->item->sku_available; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_SUBMITTED_FORM_LBL_CHECKLIST_MERCHANDISING'); ?></th>
			<td><?php echo $this->item->merchandising; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_SUBMITTED_FORM_LBL_CHECKLIST_SHELF_QUANTITY'); ?></th>
			<td><?php echo $this->item->shelf_quantity; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_SUBMITTED_FORM_LBL_CHECKLIST_RIGHT_PRICES'); ?></th>
			<td><?php echo $this->item->right_prices; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_SUBMITTED_FORM_LBL_CHECKLIST_VISIBLE_TAGS'); ?></th>
			<td><?php echo $this->item->visible_tags; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_SUBMITTED_FORM_LBL_CHECKLIST_STORE_ID'); ?></th>
			<td><?php echo $this->item->store_id; ?></td>
		</tr>

	</table>

</div>

<?php if($canEdit && $this->item->checked_out == 0): ?>

	<a class="btn" href="<?php echo JRoute::_('index.php?option=com_submitted&task=checklist.edit&id='.$this->item->id); ?>"><?php echo JText::_("COM_SUBMITTED_EDIT_ITEM"); ?></a>

<?php endif; ?>

<?php if (JFactory::getUser()->authorise('core.delete','com_submitted.checklist.'.$this->item->id)) : ?>

	<a class="btn btn-danger" href="#deleteModal" role="button" data-toggle="modal">
		<?php echo JText::_("COM_SUBMITTED_DELETE_ITEM"); ?>
	</a>

	<div id="deleteModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="deleteModal" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			<h3><?php echo JText::_('COM_SUBMITTED_DELETE_ITEM'); ?></h3>
		</div>
		<div class="modal-body">
			<p><?php echo JText::sprintf('COM_SUBMITTED_DELETE_CONFIRM', $this->item->id); ?></p>
		</div>
		<div class="modal-footer">
			<button class="btn" data-dismiss="modal">Close</button>
			<a href="<?php echo JRoute::_('index.php?option=com_submitted&task=checklist.remove&id=' . $this->item->id, false, 2); ?>" class="btn btn-danger">
				<?php echo JText::_('COM_SUBMITTED_DELETE_ITEM'); ?>
			</a>
		</div>
	</div>

<?php endif; ?>