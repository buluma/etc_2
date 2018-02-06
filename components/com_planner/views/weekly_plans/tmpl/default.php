<?php
/**
 * @version    CVS: 1.0.0
 * @package    Com_Planner
 * @author     Michael Buluma <michael@buluma.me.ke>
 * @copyright  2018 Michael Buluma
 * @license    GNU General Public License version 2 or later; see LICENSE.txt
 */
// No direct access
defined('_JEXEC') or die;

$canEdit = JFactory::getUser()->authorise('core.edit', 'com_planner');

if (!$canEdit && JFactory::getUser()->authorise('core.edit.own', 'com_planner'))
{
	$canEdit = JFactory::getUser()->id == $this->item->created_by;
}
?>

<div class="item_fields">

	<table class="table">
		

		<tr>
			<th><?php echo JText::_('COM_PLANNER_FORM_LBL_WEEKLY_PLANS_SUBMITTER'); ?></th>
			<td><?php echo $this->item->submitter_name; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_PLANNER_FORM_LBL_WEEKLY_PLANS_USER_ID'); ?></th>
			<td><?php echo $this->item->user_id_name; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_PLANNER_FORM_LBL_WEEKLY_PLANS_WEEK'); ?></th>
			<td><?php echo $this->item->week; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_PLANNER_FORM_LBL_WEEKLY_PLANS_MONTH'); ?></th>
			<td><?php echo $this->item->month; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_PLANNER_FORM_LBL_WEEKLY_PLANS_YEAR'); ?></th>
			<td><?php echo $this->item->year; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_PLANNER_FORM_LBL_WEEKLY_PLANS_ROUTEPLAN'); ?></th>
			<td><?php echo $this->item->routeplan; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_PLANNER_FORM_LBL_WEEKLY_PLANS_INPUTDATE'); ?></th>
			<td><?php echo $this->item->inputdate; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_PLANNER_FORM_LBL_WEEKLY_PLANS_COORDINATES'); ?></th>
			<td><?php echo $this->item->coordinates; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_PLANNER_FORM_LBL_WEEKLY_PLANS_FIRST_INSERT'); ?></th>
			<td><?php echo $this->item->first_insert; ?></td>
		</tr>

	</table>

</div>

<?php if($canEdit && $this->item->checked_out == 0): ?>

	<a class="btn" href="<?php echo JRoute::_('index.php?option=com_planner&task=weekly_plans.edit&id='.$this->item->id); ?>"><?php echo JText::_("COM_PLANNER_EDIT_ITEM"); ?></a>

<?php endif; ?>

<?php if (JFactory::getUser()->authorise('core.delete','com_planner.weekly_plans.'.$this->item->id)) : ?>

	<a class="btn btn-danger" href="#deleteModal" role="button" data-toggle="modal">
		<?php echo JText::_("COM_PLANNER_DELETE_ITEM"); ?>
	</a>

	<div id="deleteModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="deleteModal" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			<h3><?php echo JText::_('COM_PLANNER_DELETE_ITEM'); ?></h3>
		</div>
		<div class="modal-body">
			<p><?php echo JText::sprintf('COM_PLANNER_DELETE_CONFIRM', $this->item->id); ?></p>
		</div>
		<div class="modal-footer">
			<button class="btn" data-dismiss="modal">Close</button>
			<a href="<?php echo JRoute::_('index.php?option=com_planner&task=weekly_plans.remove&id=' . $this->item->id, false, 2); ?>" class="btn btn-danger">
				<?php echo JText::_('COM_PLANNER_DELETE_ITEM'); ?>
			</a>
		</div>
	</div>

<?php endif; ?>