<?php
/**
 * @version    CVS: 1.0.0
 * @package    Com_Other_objectives
 * @author     Michael Buluma <michael@buluma.co.ke>
 * @copyright  2018 Michael Buluma
 * @license    GNU General Public License version 2 or later; see LICENSE.txt
 */
// No direct access
defined('_JEXEC') or die;

$canEdit = JFactory::getUser()->authorise('core.edit', 'com_other_objectives');

if (!$canEdit && JFactory::getUser()->authorise('core.edit.own', 'com_other_objectives'))
{
	$canEdit = JFactory::getUser()->id == $this->item->created_by;
}
?>

<div class="item_fields">

	<table class="table">
		

		<tr>
			<th><?php echo JText::_('COM_OTHER_OBJECTIVES_FORM_LBL_OTHER_OBJECTIVE_CLIENT_ID'); ?></th>
			<td><?php echo $this->item->client_id; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_OTHER_OBJECTIVES_FORM_LBL_OTHER_OBJECTIVE_OBJECTIVE'); ?></th>
			<td><?php echo $this->item->objective; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_OTHER_OBJECTIVES_FORM_LBL_OTHER_OBJECTIVE_OBJECTIVE_ACHIEVED'); ?></th>
			<td><?php echo $this->item->objective_achieved; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_OTHER_OBJECTIVES_FORM_LBL_OTHER_OBJECTIVE_INPUTDATE'); ?></th>
			<td><?php echo $this->item->inputdate; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_OTHER_OBJECTIVES_FORM_LBL_OTHER_OBJECTIVE_CHALLENGE'); ?></th>
			<td><?php echo nl2br($this->item->challenge); ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_OTHER_OBJECTIVES_FORM_LBL_OTHER_OBJECTIVE_NEXT_PLAN'); ?></th>
			<td><?php echo nl2br($this->item->next_plan); ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_OTHER_OBJECTIVES_FORM_LBL_OTHER_OBJECTIVE_STORE'); ?></th>
			<td><?php echo $this->item->store; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_OTHER_OBJECTIVES_FORM_LBL_OTHER_OBJECTIVE_SUBMITTER'); ?></th>
			<td><?php echo $this->item->submitter_name; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_OTHER_OBJECTIVES_FORM_LBL_OTHER_OBJECTIVE_STORE_ID'); ?></th>
			<td><?php echo $this->item->store_id; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_OTHER_OBJECTIVES_FORM_LBL_OTHER_OBJECTIVE_STORE_SERVER_ID'); ?></th>
			<td><?php echo $this->item->store_server_id; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_OTHER_OBJECTIVES_FORM_LBL_OTHER_OBJECTIVE_CREATED_ON'); ?></th>
			<td><?php echo $this->item->created_on; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_OTHER_OBJECTIVES_FORM_LBL_OTHER_OBJECTIVE_COORDINATES'); ?></th>
			<td><?php echo $this->item->coordinates; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_OTHER_OBJECTIVES_FORM_LBL_OTHER_OBJECTIVE_CREATED'); ?></th>
			<td><?php echo $this->item->created; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_OTHER_OBJECTIVES_FORM_LBL_OTHER_OBJECTIVE_FIRST_INSERT'); ?></th>
			<td><?php echo $this->item->first_insert; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_OTHER_OBJECTIVES_FORM_LBL_OTHER_OBJECTIVE_CLIENT_MODIFIED_DATE'); ?></th>
			<td><?php echo $this->item->client_modified_date; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_OTHER_OBJECTIVES_FORM_LBL_OTHER_OBJECTIVE_MODIFIED_ON'); ?></th>
			<td><?php echo $this->item->modified_on; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_OTHER_OBJECTIVES_FORM_LBL_OTHER_OBJECTIVE_SERVER_MODIFIED_DATE'); ?></th>
			<td><?php echo $this->item->server_modified_date; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_OTHER_OBJECTIVES_FORM_LBL_OTHER_OBJECTIVE_LAST_SYNC_DATE'); ?></th>
			<td><?php echo $this->item->last_sync_date; ?></td>
		</tr>

	</table>

</div>

<?php if($canEdit && $this->item->checked_out == 0): ?>

	<a class="btn" href="<?php echo JRoute::_('index.php?option=com_other_objectives&task=other_objective.edit&id='.$this->item->id); ?>"><?php echo JText::_("COM_OTHER_OBJECTIVES_EDIT_ITEM"); ?></a>

<?php endif; ?>

<?php if (JFactory::getUser()->authorise('core.delete','com_other_objectives.other_objective.'.$this->item->id)) : ?>

	<a class="btn btn-danger" href="#deleteModal" role="button" data-toggle="modal">
		<?php echo JText::_("COM_OTHER_OBJECTIVES_DELETE_ITEM"); ?>
	</a>

	<div id="deleteModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="deleteModal" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			<h3><?php echo JText::_('COM_OTHER_OBJECTIVES_DELETE_ITEM'); ?></h3>
		</div>
		<div class="modal-body">
			<p><?php echo JText::sprintf('COM_OTHER_OBJECTIVES_DELETE_CONFIRM', $this->item->id); ?></p>
		</div>
		<div class="modal-footer">
			<button class="btn" data-dismiss="modal">Close</button>
			<a href="<?php echo JRoute::_('index.php?option=com_other_objectives&task=other_objective.remove&id=' . $this->item->id, false, 2); ?>" class="btn btn-danger">
				<?php echo JText::_('COM_OTHER_OBJECTIVES_DELETE_ITEM'); ?>
			</a>
		</div>
	</div>

<?php endif; ?>