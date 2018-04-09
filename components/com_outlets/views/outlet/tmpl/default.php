<?php
/**
 * @version    CVS: 1.0.0
 * @package    Com_Outlets
 * @author     Michael Buluma <michael@buluma.me.ke>
 * @copyright  2018 Michael Buluma
 * @license    GNU General Public License version 2 or later; see LICENSE.txt
 */
// No direct access
defined('_JEXEC') or die;

$canEdit = JFactory::getUser()->authorise('core.edit', 'com_outlets.' . $this->item->id);

if (!$canEdit && JFactory::getUser()->authorise('core.edit.own', 'com_outlets' . $this->item->id))
{
	$canEdit = JFactory::getUser()->id == $this->item->created_by;
}
?>

<div class="item_fields">

	<table class="table">
		

		<tr>
			<th><?php echo JText::_('COM_OUTLETS_FORM_LBL_OUTLET_ACCOUNT'); ?></th>
			<td><?php echo $this->item->account; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_OUTLETS_FORM_LBL_OUTLET_SHOP_NAME'); ?></th>
			<td><?php echo $this->item->shop_name; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_OUTLETS_FORM_LBL_OUTLET_CATEGORY'); ?></th>
			<td><?php echo $this->item->category; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_OUTLETS_FORM_LBL_OUTLET_REGION'); ?></th>
			<td><?php echo $this->item->region; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_OUTLETS_FORM_LBL_OUTLET_LOCATION'); ?></th>
			<td><?php echo $this->item->location; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_OUTLETS_FORM_LBL_OUTLET_MANAGER_NAME'); ?></th>
			<td><?php echo $this->item->manager_name; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_OUTLETS_FORM_LBL_OUTLET_MANAGER_PHONE'); ?></th>
			<td><?php echo $this->item->manager_phone; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_OUTLETS_FORM_LBL_OUTLET_MANAGER_EMAIL'); ?></th>
			<td><?php echo $this->item->manager_email; ?></td>
		</tr>

	</table>

</div>

<?php if($canEdit && $this->item->checked_out == 0): ?>

	<a class="btn" href="<?php echo JRoute::_('index.php?option=com_outlets&task=outlet.edit&id='.$this->item->id); ?>"><?php echo JText::_("COM_OUTLETS_EDIT_ITEM"); ?></a>

<?php endif; ?>

<?php if (JFactory::getUser()->authorise('core.delete','com_outlets.outlet.'.$this->item->id)) : ?>

	<a class="btn btn-danger" href="#deleteModal" role="button" data-toggle="modal">
		<?php echo JText::_("COM_OUTLETS_DELETE_ITEM"); ?>
	</a>

	<div id="deleteModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="deleteModal" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			<h3><?php echo JText::_('COM_OUTLETS_DELETE_ITEM'); ?></h3>
		</div>
		<div class="modal-body">
			<p><?php echo JText::sprintf('COM_OUTLETS_DELETE_CONFIRM', $this->item->id); ?></p>
		</div>
		<div class="modal-footer">
			<button class="btn" data-dismiss="modal">Close</button>
			<a href="<?php echo JRoute::_('index.php?option=com_outlets&task=outlet.remove&id=' . $this->item->id, false, 2); ?>" class="btn btn-danger">
				<?php echo JText::_('COM_OUTLETS_DELETE_ITEM'); ?>
			</a>
		</div>
	</div>

<?php endif; ?>