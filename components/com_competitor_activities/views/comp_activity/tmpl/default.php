<?php
/**
 * @version    CVS: 1.0.0
 * @package    Com_Competitor_activities
 * @author     Michael Buluma <michael@buluma.me.ke>
 * @copyright  2018 Michael Buluma
 * @license    GNU General Public License version 2 or later; see LICENSE.txt
 */
// No direct access
defined('_JEXEC') or die;

$canEdit = JFactory::getUser()->authorise('core.edit', 'com_competitor_activities');

if (!$canEdit && JFactory::getUser()->authorise('core.edit.own', 'com_competitor_activities'))
{
	$canEdit = JFactory::getUser()->id == $this->item->created_by;
}
?>

<div class="item_fields">

	<table class="table">
		

		<tr>
			<th><?php echo JText::_('COM_COMPETITOR_ACTIVITIES_FORM_LBL_COMP_ACTIVITY_CLIENT_ID'); ?></th>
			<td><?php echo $this->item->client_id; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_COMPETITOR_ACTIVITIES_FORM_LBL_COMP_ACTIVITY_UNIQUE_ID'); ?></th>
			<td><?php echo $this->item->unique_id; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_COMPETITOR_ACTIVITIES_FORM_LBL_COMP_ACTIVITY_BRAND'); ?></th>
			<td><?php echo $this->item->brand; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_COMPETITOR_ACTIVITIES_FORM_LBL_COMP_ACTIVITY_CATEGORY'); ?></th>
			<td><?php echo $this->item->category; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_COMPETITOR_ACTIVITIES_FORM_LBL_COMP_ACTIVITY_SUBMITTER'); ?></th>
			<td><?php echo $this->item->submitter_name; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_COMPETITOR_ACTIVITIES_FORM_LBL_COMP_ACTIVITY_USER_ID'); ?></th>
			<td><?php echo $this->item->user_id_name; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_COMPETITOR_ACTIVITIES_FORM_LBL_COMP_ACTIVITY_MECHANICS'); ?></th>
			<td><?php echo $this->item->mechanics; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_COMPETITOR_ACTIVITIES_FORM_LBL_COMP_ACTIVITY_ACTIVITY_MECHANICS'); ?></th>
			<td><?php echo $this->item->activity_mechanics; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_COMPETITOR_ACTIVITIES_FORM_LBL_COMP_ACTIVITY_RATEOFSALE'); ?></th>
			<td><?php echo $this->item->rateofsale; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_COMPETITOR_ACTIVITIES_FORM_LBL_COMP_ACTIVITY_MYPLAN'); ?></th>
			<td><?php echo nl2br($this->item->myplan); ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_COMPETITOR_ACTIVITIES_FORM_LBL_COMP_ACTIVITY_MYNEED'); ?></th>
			<td><?php echo nl2br($this->item->myneed); ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_COMPETITOR_ACTIVITIES_FORM_LBL_COMP_ACTIVITY_TIMELINE'); ?></th>
			<td><?php echo $this->item->timeline; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_COMPETITOR_ACTIVITIES_FORM_LBL_COMP_ACTIVITY_START_DATE'); ?></th>
			<td><?php echo $this->item->start_date; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_COMPETITOR_ACTIVITIES_FORM_LBL_COMP_ACTIVITY_END_DATE'); ?></th>
			<td><?php echo $this->item->end_date; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_COMPETITOR_ACTIVITIES_FORM_LBL_COMP_ACTIVITY_COORDINATES'); ?></th>
			<td><?php echo $this->item->coordinates; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_COMPETITOR_ACTIVITIES_FORM_LBL_COMP_ACTIVITY_STORE'); ?></th>
			<td><?php echo $this->item->store; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_COMPETITOR_ACTIVITIES_FORM_LBL_COMP_ACTIVITY_STORE_SERVER_ID'); ?></th>
			<td><?php echo $this->item->store_server_id; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_COMPETITOR_ACTIVITIES_FORM_LBL_COMP_ACTIVITY_STORE_ID'); ?></th>
			<td><?php echo $this->item->store_id; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_COMPETITOR_ACTIVITIES_FORM_LBL_COMP_ACTIVITY_CREATED_ON'); ?></th>
			<td><?php echo $this->item->created_on; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_COMPETITOR_ACTIVITIES_FORM_LBL_COMP_ACTIVITY_CLIENT_MODIFIED_DATE'); ?></th>
			<td><?php echo $this->item->client_modified_date; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_COMPETITOR_ACTIVITIES_FORM_LBL_COMP_ACTIVITY_LAST_SYNC_DATE'); ?></th>
			<td><?php echo $this->item->last_sync_date; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_COMPETITOR_ACTIVITIES_FORM_LBL_COMP_ACTIVITY_FIRST_INSERT'); ?></th>
			<td><?php echo $this->item->first_insert; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_COMPETITOR_ACTIVITIES_FORM_LBL_COMP_ACTIVITY_SERVER_MODIFIED_DATE'); ?></th>
			<td><?php echo $this->item->server_modified_date; ?></td>
		</tr>

	</table>

</div>

<?php if($canEdit && $this->item->checked_out == 0): ?>

	<a class="btn" href="<?php echo JRoute::_('index.php?option=com_competitor_activities&task=comp_activity.edit&id='.$this->item->id); ?>"><?php echo JText::_("COM_COMPETITOR_ACTIVITIES_EDIT_ITEM"); ?></a>

<?php endif; ?>

<?php if (JFactory::getUser()->authorise('core.delete','com_competitor_activities.comp_activity.'.$this->item->id)) : ?>

	<a class="btn btn-danger" href="#deleteModal" role="button" data-toggle="modal">
		<?php echo JText::_("COM_COMPETITOR_ACTIVITIES_DELETE_ITEM"); ?>
	</a>

	<div id="deleteModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="deleteModal" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			<h3><?php echo JText::_('COM_COMPETITOR_ACTIVITIES_DELETE_ITEM'); ?></h3>
		</div>
		<div class="modal-body">
			<p><?php echo JText::sprintf('COM_COMPETITOR_ACTIVITIES_DELETE_CONFIRM', $this->item->id); ?></p>
		</div>
		<div class="modal-footer">
			<button class="btn" data-dismiss="modal">Close</button>
			<a href="<?php echo JRoute::_('index.php?option=com_competitor_activities&task=comp_activity.remove&id=' . $this->item->id, false, 2); ?>" class="btn btn-danger">
				<?php echo JText::_('COM_COMPETITOR_ACTIVITIES_DELETE_ITEM'); ?>
			</a>
		</div>
	</div>

<?php endif; ?>