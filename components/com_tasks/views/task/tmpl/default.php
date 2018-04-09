<?php
/**
 * @version    CVS: 1.0.0
 * @package    Com_Tasks
 * @author     Michael Buluma <michael@buluma.co.ke>
 * @copyright  2018 Michael Buluma
 * @license    GNU General Public License version 2 or later; see LICENSE.txt
 */
// No direct access
defined('_JEXEC') or die;

$canEdit = JFactory::getUser()->authorise('core.edit', 'com_tasks.' . $this->item->id);

if (!$canEdit && JFactory::getUser()->authorise('core.edit.own', 'com_tasks' . $this->item->id))
{
	$canEdit = JFactory::getUser()->id == $this->item->created_by;
}
?>

<div class="item_fields">

	<table class="table">
		

		<tr>
			<th><?php echo JText::_('COM_TASKS_FORM_LBL_TASK_TASK'); ?></th>
			<td><?php echo $this->item->task; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_TASKS_FORM_LBL_TASK_USER'); ?></th>
			<td><?php echo $this->item->user_name; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_TASKS_FORM_LBL_TASK_DESCRIPTION'); ?></th>
			<td><?php echo nl2br($this->item->description); ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_TASKS_FORM_LBL_TASK_DEADLINE'); ?></th>
			<td><?php echo $this->item->deadline; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_TASKS_FORM_LBL_TASK_PRIORITY'); ?></th>
			<td><?php echo $this->item->priority; ?></td>
		</tr>

	</table>

</div>

<?php if($canEdit && $this->item->checked_out == 0): ?>

	<a class="btn" href="<?php echo JRoute::_('index.php?option=com_tasks&task=task.edit&id='.$this->item->id); ?>"><?php echo JText::_("COM_TASKS_EDIT_ITEM"); ?></a>

<?php endif; ?>

<?php if (JFactory::getUser()->authorise('core.delete','com_tasks.task.'.$this->item->id)) : ?>

	<a class="btn btn-danger" href="#deleteModal" role="button" data-toggle="modal">
		<?php echo JText::_("COM_TASKS_DELETE_ITEM"); ?>
	</a>

	<div id="deleteModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="deleteModal" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			<h3><?php echo JText::_('COM_TASKS_DELETE_ITEM'); ?></h3>
		</div>
		<div class="modal-body">
			<p><?php echo JText::sprintf('COM_TASKS_DELETE_CONFIRM', $this->item->id); ?></p>
		</div>
		<div class="modal-footer">
			<button class="btn" data-dismiss="modal">Close</button>
			<a href="<?php echo JRoute::_('index.php?option=com_tasks&task=task.remove&id=' . $this->item->id, false, 2); ?>" class="btn btn-danger">
				<?php echo JText::_('COM_TASKS_DELETE_ITEM'); ?>
			</a>
		</div>
	</div>

<?php endif; ?>