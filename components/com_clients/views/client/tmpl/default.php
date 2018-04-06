<?php
/**
 * @version    CVS: 1.0.0
 * @package    Com_Clients
 * @author     Michael Buluma <michael@buluma.me.ke>
 * @copyright  2018 Michael Buluma
 * @license    GNU General Public License version 2 or later; see LICENSE.txt
 */
// No direct access
defined('_JEXEC') or die;

$canEdit = JFactory::getUser()->authorise('core.edit', 'com_clients.' . $this->item->id);

if (!$canEdit && JFactory::getUser()->authorise('core.edit.own', 'com_clients' . $this->item->id))
{
	$canEdit = JFactory::getUser()->id == $this->item->created_by;
}
?>

<div class="item_fields">

	<table class="table">
		

		<tr>
			<th><?php echo JText::_('COM_CLIENTS_FORM_LBL_CLIENT_CLIENT_LOGO'); ?></th>
			<td><?php echo $this->item->client_logo; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_CLIENTS_FORM_LBL_CLIENT_CLIENT_NAME'); ?></th>
			<td><?php echo $this->item->client_name; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_CLIENTS_FORM_LBL_CLIENT_CLIENT_EMAIL'); ?></th>
			<td><?php echo $this->item->client_email; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_CLIENTS_FORM_LBL_CLIENT_CLIENT_LOCATION'); ?></th>
			<td><?php echo $this->item->client_location; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_CLIENTS_FORM_LBL_CLIENT_CONTACT_PERSON'); ?></th>
			<td><?php echo $this->item->contact_person; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_CLIENTS_FORM_LBL_CLIENT_CONTACT_PERSON_EMAIL'); ?></th>
			<td><?php echo $this->item->contact_person_email; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_CLIENTS_FORM_LBL_CLIENT_CREATED_ON'); ?></th>
			<td><?php echo $this->item->created_on; ?></td>
		</tr>

	</table>

</div>

<?php if($canEdit && $this->item->checked_out == 0): ?>

	<a class="btn" href="<?php echo JRoute::_('index.php?option=com_clients&task=client.edit&id='.$this->item->id); ?>"><?php echo JText::_("COM_CLIENTS_EDIT_ITEM"); ?></a>

<?php endif; ?>

<?php if (JFactory::getUser()->authorise('core.delete','com_clients.client.'.$this->item->id)) : ?>

	<a class="btn btn-danger" href="#deleteModal" role="button" data-toggle="modal">
		<?php echo JText::_("COM_CLIENTS_DELETE_ITEM"); ?>
	</a>

	<div id="deleteModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="deleteModal" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			<h3><?php echo JText::_('COM_CLIENTS_DELETE_ITEM'); ?></h3>
		</div>
		<div class="modal-body">
			<p><?php echo JText::sprintf('COM_CLIENTS_DELETE_CONFIRM', $this->item->id); ?></p>
		</div>
		<div class="modal-footer">
			<button class="btn" data-dismiss="modal">Close</button>
			<a href="<?php echo JRoute::_('index.php?option=com_clients&task=client.remove&id=' . $this->item->id, false, 2); ?>" class="btn btn-danger">
				<?php echo JText::_('COM_CLIENTS_DELETE_ITEM'); ?>
			</a>
		</div>
	</div>

<?php endif; ?>