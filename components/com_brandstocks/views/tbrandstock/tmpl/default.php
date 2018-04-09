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

$canEdit = JFactory::getUser()->authorise('core.edit', 'com_brandstocks');

if (!$canEdit && JFactory::getUser()->authorise('core.edit.own', 'com_brandstocks'))
{
	$canEdit = JFactory::getUser()->id == $this->item->created_by;
}
?>

<div class="item_fields">

	<table class="table">
		

		<tr>
			<th><?php echo JText::_('COM_BRANDSTOCKS_FORM_LBL_TBRANDSTOCK_BRAND'); ?></th>
			<td><?php echo $this->item->brand; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_BRANDSTOCKS_FORM_LBL_TBRANDSTOCK_BRANDCODE'); ?></th>
			<td><?php echo $this->item->brandcode; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_BRANDSTOCKS_FORM_LBL_TBRANDSTOCK_CURRENTSTOCK'); ?></th>
			<td><?php echo $this->item->currentstock; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_BRANDSTOCKS_FORM_LBL_TBRANDSTOCK_ORDER_PLACED'); ?></th>
			<td><?php echo $this->item->order_placed; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_BRANDSTOCKS_FORM_LBL_TBRANDSTOCK_ORDERPLACED'); ?></th>
			<td><?php if( $this->item->order_placed == 1 ) echo $this->item->orderplaced; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_BRANDSTOCKS_FORM_LBL_TBRANDSTOCK_ORDER_DATE'); ?></th>
			<td><?php if( $this->item->order_placed == 1 ) echo $this->item->order_date; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_BRANDSTOCKS_FORM_LBL_TBRANDSTOCK_LPO_NUMBER'); ?></th>
			<td><?php if( $this->item->order_placed == 1 ) echo $this->item->lpo_number; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_BRANDSTOCKS_FORM_LBL_TBRANDSTOCK_DELIVERED'); ?></th>
			<td><?php echo $this->item->delivered; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_BRANDSTOCKS_FORM_LBL_TBRANDSTOCK_SALE'); ?></th>
			<td><?php echo $this->item->sale; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_BRANDSTOCKS_FORM_LBL_TBRANDSTOCK_STOCKOUT'); ?></th>
			<td><?php echo $this->item->stockout; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_BRANDSTOCKS_FORM_LBL_TBRANDSTOCK_SUBMITTER'); ?></th>
			<td><?php echo $this->item->submitter_name; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_BRANDSTOCKS_FORM_LBL_TBRANDSTOCK_CLIENT_ID'); ?></th>
			<td><?php echo $this->item->client_id; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_BRANDSTOCKS_FORM_LBL_TBRANDSTOCK_STOCKDATE'); ?></th>
			<td><?php echo $this->item->stockdate; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_BRANDSTOCKS_FORM_LBL_TBRANDSTOCK_STORE_ID'); ?></th>
			<td><?php echo $this->item->store_id; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_BRANDSTOCKS_FORM_LBL_TBRANDSTOCK_STORE_SERVER_ID'); ?></th>
			<td><?php echo $this->item->store_server_id; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_BRANDSTOCKS_FORM_LBL_TBRANDSTOCK_CLIENT_MODIFIED_DATE'); ?></th>
			<td><?php echo $this->item->client_modified_date; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_BRANDSTOCKS_FORM_LBL_TBRANDSTOCK_STORE'); ?></th>
			<td><?php echo $this->item->store; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_BRANDSTOCKS_FORM_LBL_TBRANDSTOCK_REMARKS'); ?></th>
			<td><?php echo nl2br($this->item->remarks); ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_BRANDSTOCKS_FORM_LBL_TBRANDSTOCK_COORDINATES'); ?></th>
			<td><?php echo $this->item->coordinates; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_BRANDSTOCKS_FORM_LBL_TBRANDSTOCK_CREATED'); ?></th>
			<td><?php echo $this->item->created; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_BRANDSTOCKS_FORM_LBL_TBRANDSTOCK_FIRST_INSERT'); ?></th>
			<td><?php echo $this->item->first_insert; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_BRANDSTOCKS_FORM_LBL_TBRANDSTOCK_SERVER_MODIFIED_DATE'); ?></th>
			<td><?php echo $this->item->server_modified_date; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_BRANDSTOCKS_FORM_LBL_TBRANDSTOCK_LAST_SYNC_DATE'); ?></th>
			<td><?php echo $this->item->last_sync_date; ?></td>
		</tr>

	</table>

</div>

<?php if($canEdit && $this->item->checked_out == 0): ?>

	<a class="btn" href="<?php echo JRoute::_('index.php?option=com_brandstocks&task=tbrandstock.edit&id='.$this->item->id); ?>"><?php echo JText::_("COM_BRANDSTOCKS_EDIT_ITEM"); ?></a>

<?php endif; ?>

<?php if (JFactory::getUser()->authorise('core.delete','com_brandstocks.tbrandstock.'.$this->item->id)) : ?>

	<a class="btn btn-danger" href="#deleteModal" role="button" data-toggle="modal">
		<?php echo JText::_("COM_BRANDSTOCKS_DELETE_ITEM"); ?>
	</a>

	<div id="deleteModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="deleteModal" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			<h3><?php echo JText::_('COM_BRANDSTOCKS_DELETE_ITEM'); ?></h3>
		</div>
		<div class="modal-body">
			<p><?php echo JText::sprintf('COM_BRANDSTOCKS_DELETE_CONFIRM', $this->item->id); ?></p>
		</div>
		<div class="modal-footer">
			<button class="btn" data-dismiss="modal">Close</button>
			<a href="<?php echo JRoute::_('index.php?option=com_brandstocks&task=tbrandstock.remove&id=' . $this->item->id, false, 2); ?>" class="btn btn-danger">
				<?php echo JText::_('COM_BRANDSTOCKS_DELETE_ITEM'); ?>
			</a>
		</div>
	</div>

<?php endif; ?>