<?php
/**
 * @version    CVS: 1.0.0
 * @package    Com_Qissues
 * @author     Michael Buluma <michael@buluma.me.ke>
 * @copyright  2018 Michael Buluma
 * @license    GNU General Public License version 2 or later; see LICENSE.txt
 */
// No direct access
defined('_JEXEC') or die;

$canEdit = JFactory::getUser()->authorise('core.edit', 'com_qissues');

if (!$canEdit && JFactory::getUser()->authorise('core.edit.own', 'com_qissues'))
{
	$canEdit = JFactory::getUser()->id == $this->item->created_by;
}
?>

<div class="item_fields">

	<table class="table">
		

		<tr>
			<th><?php echo JText::_('COM_QISSUES_FORM_LBL_ISSUE_BRAND'); ?></th>
			<td><?php echo $this->item->brand; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_QISSUES_FORM_LBL_ISSUE_BRANDCODE'); ?></th>
			<td><?php echo $this->item->brandcode; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_QISSUES_FORM_LBL_ISSUE_ISSUE_TYPE'); ?></th>
			<td><?php echo $this->item->issue_type; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_QISSUES_FORM_LBL_ISSUE_RATEOFSALE'); ?></th>
			<td><?php echo $this->item->rateofsale; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_QISSUES_FORM_LBL_ISSUE_EXPIRY_DATE'); ?></th>
			<td><?php echo $this->item->expiry_date; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_QISSUES_FORM_LBL_ISSUE_STORE'); ?></th>
			<td><?php echo $this->item->store; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_QISSUES_FORM_LBL_ISSUE_STORE_ID'); ?></th>
			<td><?php echo $this->item->store_id; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_QISSUES_FORM_LBL_ISSUE_STORE_SERVER_ID'); ?></th>
			<td><?php echo $this->item->store_server_id; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_QISSUES_FORM_LBL_ISSUE_CREATED_ON'); ?></th>
			<td><?php echo $this->item->created_on; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_QISSUES_FORM_LBL_ISSUE_REMARKS'); ?></th>
			<td><?php echo nl2br($this->item->remarks); ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_QISSUES_FORM_LBL_ISSUE_CLIENT_ID'); ?></th>
			<td><?php echo $this->item->client_id; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_QISSUES_FORM_LBL_ISSUE_COORDINATES'); ?></th>
			<td><?php echo $this->item->coordinates; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_QISSUES_FORM_LBL_ISSUE_LAST_SYNC_DATE'); ?></th>
			<td><?php echo $this->item->last_sync_date; ?></td>
		</tr>

	</table>

</div>

<?php if($canEdit && $this->item->checked_out == 0): ?>

	<a class="btn" href="<?php echo JRoute::_('index.php?option=com_qissues&task=issue.edit&id='.$this->item->id); ?>"><?php echo JText::_("COM_QISSUES_EDIT_ITEM"); ?></a>

<?php endif; ?>

<?php if (JFactory::getUser()->authorise('core.delete','com_qissues.issue.'.$this->item->id)) : ?>

	<a class="btn btn-danger" href="#deleteModal" role="button" data-toggle="modal">
		<?php echo JText::_("COM_QISSUES_DELETE_ITEM"); ?>
	</a>

	<div id="deleteModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="deleteModal" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			<h3><?php echo JText::_('COM_QISSUES_DELETE_ITEM'); ?></h3>
		</div>
		<div class="modal-body">
			<p><?php echo JText::sprintf('COM_QISSUES_DELETE_CONFIRM', $this->item->id); ?></p>
		</div>
		<div class="modal-footer">
			<button class="btn" data-dismiss="modal">Close</button>
			<a href="<?php echo JRoute::_('index.php?option=com_qissues&task=issue.remove&id=' . $this->item->id, false, 2); ?>" class="btn btn-danger">
				<?php echo JText::_('COM_QISSUES_DELETE_ITEM'); ?>
			</a>
		</div>
	</div>

<?php endif; ?>