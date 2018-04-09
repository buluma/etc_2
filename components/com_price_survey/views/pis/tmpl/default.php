<?php
/**
 * @version    CVS: 1.0.0
 * @package    Com_Price_survey
 * @author     Michael Buluma <michael@buluma.me.ke>
 * @copyright  2018 Michael Buluma
 * @license    GNU General Public License version 2 or later; see LICENSE.txt
 */
// No direct access
defined('_JEXEC') or die;

$canEdit = JFactory::getUser()->authorise('core.edit', 'com_price_survey');

if (!$canEdit && JFactory::getUser()->authorise('core.edit.own', 'com_price_survey'))
{
	$canEdit = JFactory::getUser()->id == $this->item->created_by;
}
?>

<div class="item_fields">

	<table class="table">
		

		<tr>
			<th><?php echo JText::_('COM_PRICE_SURVEY_FORM_LBL_PIS_BRAND'); ?></th>
			<td><?php echo $this->item->brand; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_PRICE_SURVEY_FORM_LBL_PIS_TYPE'); ?></th>
			<td><?php echo $this->item->type; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_PRICE_SURVEY_FORM_LBL_PIS_INPUTDATE'); ?></th>
			<td><?php echo $this->item->inputdate; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_PRICE_SURVEY_FORM_LBL_PIS_WEEK'); ?></th>
			<td><?php echo $this->item->week; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_PRICE_SURVEY_FORM_LBL_PIS_MONTH'); ?></th>
			<td><?php echo $this->item->month; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_PRICE_SURVEY_FORM_LBL_PIS_YEAR'); ?></th>
			<td><?php echo $this->item->year; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_PRICE_SURVEY_FORM_LBL_PIS_SUBMITTER'); ?></th>
			<td><?php echo $this->item->submitter_name; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_PRICE_SURVEY_FORM_LBL_PIS_CLIENT_ID'); ?></th>
			<td><?php echo $this->item->client_id; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_PRICE_SURVEY_FORM_LBL_PIS_USER_ID'); ?></th>
			<td><?php echo $this->item->user_id_name; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_PRICE_SURVEY_FORM_LBL_PIS_STORE'); ?></th>
			<td><?php echo $this->item->store; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_PRICE_SURVEY_FORM_LBL_PIS_STORE_ID'); ?></th>
			<td><?php echo $this->item->store_id; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_PRICE_SURVEY_FORM_LBL_PIS_STORE_SERVER_ID'); ?></th>
			<td><?php echo $this->item->store_server_id; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_PRICE_SURVEY_FORM_LBL_PIS_CLIENT_MODIFIED_DATE'); ?></th>
			<td><?php echo $this->item->client_modified_date; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_PRICE_SURVEY_FORM_LBL_PIS_COORDINATES'); ?></th>
			<td><?php echo $this->item->coordinates; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_PRICE_SURVEY_FORM_LBL_PIS_CREATED_ON'); ?></th>
			<td><?php echo $this->item->created_on; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_PRICE_SURVEY_FORM_LBL_PIS_FIRST_INSERT'); ?></th>
			<td><?php echo $this->item->first_insert; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_PRICE_SURVEY_FORM_LBL_PIS_SERVER_MODIFIED_DATE'); ?></th>
			<td><?php echo $this->item->server_modified_date; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_PRICE_SURVEY_FORM_LBL_PIS_LAST_SYNC_DATE'); ?></th>
			<td><?php echo $this->item->last_sync_date; ?></td>
		</tr>

	</table>

</div>

<?php if($canEdit && $this->item->checked_out == 0): ?>

	<a class="btn" href="<?php echo JRoute::_('index.php?option=com_price_survey&task=pis.edit&id='.$this->item->id); ?>"><?php echo JText::_("COM_PRICE_SURVEY_EDIT_ITEM"); ?></a>

<?php endif; ?>

<?php if (JFactory::getUser()->authorise('core.delete','com_price_survey.pis.'.$this->item->id)) : ?>

	<a class="btn btn-danger" href="#deleteModal" role="button" data-toggle="modal">
		<?php echo JText::_("COM_PRICE_SURVEY_DELETE_ITEM"); ?>
	</a>

	<div id="deleteModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="deleteModal" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			<h3><?php echo JText::_('COM_PRICE_SURVEY_DELETE_ITEM'); ?></h3>
		</div>
		<div class="modal-body">
			<p><?php echo JText::sprintf('COM_PRICE_SURVEY_DELETE_CONFIRM', $this->item->id); ?></p>
		</div>
		<div class="modal-footer">
			<button class="btn" data-dismiss="modal">Close</button>
			<a href="<?php echo JRoute::_('index.php?option=com_price_survey&task=pis.remove&id=' . $this->item->id, false, 2); ?>" class="btn btn-danger">
				<?php echo JText::_('COM_PRICE_SURVEY_DELETE_ITEM'); ?>
			</a>
		</div>
	</div>

<?php endif; ?>