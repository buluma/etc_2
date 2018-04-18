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

$canEdit = JFactory::getUser()->authorise('core.edit', 'com_bts_items');

if (!$canEdit && JFactory::getUser()->authorise('core.edit.own', 'com_bts_items'))
{
	$canEdit = JFactory::getUser()->id == $this->item->created_by;
}
?>

<div class="item_fields">

	<table class="table">
		

		<tr>
			<th><?php echo JText::_('COM_BTS_ITEMS_FORM_LBL_BTS_ITEM_DATE'); ?></th>
			<td><?php echo $this->item->date; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_BTS_ITEMS_FORM_LBL_BTS_ITEM_OUTLET'); ?></th>
			<td><?php echo $this->item->outlet; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_BTS_ITEMS_FORM_LBL_BTS_ITEM_BA_NAME'); ?></th>
			<td><?php echo $this->item->ba_name_name; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_BTS_ITEMS_FORM_LBL_BTS_ITEM_PRODUCT'); ?></th>
			<td><?php echo $this->item->product; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_BTS_ITEMS_FORM_LBL_BTS_ITEM_SKU'); ?></th>
			<td><?php echo $this->item->sku; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_BTS_ITEMS_FORM_LBL_BTS_ITEM_TARGET'); ?></th>
			<td><?php echo $this->item->target; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_BTS_ITEMS_FORM_LBL_BTS_ITEM_ACTUAL'); ?></th>
			<td><?php echo $this->item->actual; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_BTS_ITEMS_FORM_LBL_BTS_ITEM_STORE'); ?></th>
			<td><?php echo $this->item->store; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_BTS_ITEMS_FORM_LBL_BTS_ITEM_STORE_SERVER_ID'); ?></th>
			<td><?php echo $this->item->store_server_id; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_BTS_ITEMS_FORM_LBL_BTS_ITEM_STORE_ID'); ?></th>
			<td><?php echo $this->item->store_id; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_BTS_ITEMS_FORM_LBL_BTS_ITEM_COORDINATES'); ?></th>
			<td><?php echo $this->item->coordinates; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_BTS_ITEMS_FORM_LBL_BTS_ITEM_CREATED'); ?></th>
			<td><?php echo $this->item->created; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_BTS_ITEMS_FORM_LBL_BTS_ITEM_CLIENT_MODIFIED_DATE'); ?></th>
			<td><?php echo $this->item->client_modified_date; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_BTS_ITEMS_FORM_LBL_BTS_ITEM_SUBMITTER'); ?></th>
			<td><?php echo $this->item->submitter_name; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_BTS_ITEMS_FORM_LBL_BTS_ITEM_USER_ID'); ?></th>
			<td><?php echo $this->item->user_id_name; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_BTS_ITEMS_FORM_LBL_BTS_ITEM_LAST_SYNC_DATE'); ?></th>
			<td><?php echo $this->item->last_sync_date; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_BTS_ITEMS_FORM_LBL_BTS_ITEM_FIRST_INSERT_DATE'); ?></th>
			<td><?php echo $this->item->first_insert_date; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_BTS_ITEMS_FORM_LBL_BTS_ITEM_CLIENT_ID'); ?></th>
			<td><?php echo $this->item->client_id; ?></td>
		</tr>

	</table>

</div>

<?php if($canEdit && $this->item->checked_out == 0): ?>

	<a class="btn" href="<?php echo JRoute::_('index.php?option=com_bts_items&task=bts_item.edit&id='.$this->item->id); ?>"><?php echo JText::_("COM_BTS_ITEMS_EDIT_ITEM"); ?></a>

<?php endif; ?>

<?php if (JFactory::getUser()->authorise('core.delete','com_bts_items.bts_item.'.$this->item->id)) : ?>

	<a class="btn btn-danger" href="#deleteModal" role="button" data-toggle="modal">
		<?php echo JText::_("COM_BTS_ITEMS_DELETE_ITEM"); ?>
	</a>

	<div id="deleteModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="deleteModal" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			<h3><?php echo JText::_('COM_BTS_ITEMS_DELETE_ITEM'); ?></h3>
		</div>
		<div class="modal-body">
			<p><?php echo JText::sprintf('COM_BTS_ITEMS_DELETE_CONFIRM', $this->item->id); ?></p>
		</div>
		<div class="modal-footer">
			<button class="btn" data-dismiss="modal">Close</button>
			<a href="<?php echo JRoute::_('index.php?option=com_bts_items&task=bts_item.remove&id=' . $this->item->id, false, 2); ?>" class="btn btn-danger">
				<?php echo JText::_('COM_BTS_ITEMS_DELETE_ITEM'); ?>
			</a>
		</div>
	</div>

<?php endif; ?>