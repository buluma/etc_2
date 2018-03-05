<?php
/**
 * @version    CVS: 1.0.0
 * @package    Com_Voc
 * @author     Michael Buluma <michael@buluma.me.ke>
 * @copyright  2018 Michael Buluma
 * @license    GNU General Public License version 2 or later; see LICENSE.txt
 */
// No direct access
defined('_JEXEC') or die;


?>

<div class="item_fields">

	<table class="table">
		

		<tr>
			<th><?php echo JText::_('COM_VOC_FORM_LBL_VOC_LAST_SYNC_DATE'); ?></th>
			<td><?php echo $this->item->last_sync_date; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_VOC_FORM_LBL_VOC_PHOTOS'); ?></th>
			<td><?php echo $this->item->photos; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_VOC_FORM_LBL_VOC_BRAND'); ?></th>
			<td><?php echo $this->item->brand; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_VOC_FORM_LBL_VOC_BRANDCODE'); ?></th>
			<td><?php echo $this->item->brandcode; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_VOC_FORM_LBL_VOC_CATEGORY'); ?></th>
			<td><?php echo $this->item->category; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_VOC_FORM_LBL_VOC_ITEMS'); ?></th>
			<td><?php echo $this->item->items; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_VOC_FORM_LBL_VOC_COMMENTBY'); ?></th>
			<td><?php echo $this->item->commentby; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_VOC_FORM_LBL_VOC_ISURGENT'); ?></th>
			<td></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_VOC_FORM_LBL_VOC_STORE'); ?></th>
			<td><?php echo $this->item->store; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_VOC_FORM_LBL_VOC_STORE_ID'); ?></th>
			<td><?php echo $this->item->store_id; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_VOC_FORM_LBL_VOC_STORE_SERVER_ID'); ?></th>
			<td><?php echo $this->item->store_server_id; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_VOC_FORM_LBL_VOC_REMARKS'); ?></th>
			<td><?php echo nl2br($this->item->remarks); ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_VOC_FORM_LBL_VOC_COORDINATES'); ?></th>
			<td><?php echo $this->item->coordinates; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_VOC_FORM_LBL_VOC_CLIENT_MODIFIED_DATE'); ?></th>
			<td><?php echo $this->item->client_modified_date; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_VOC_FORM_LBL_VOC_CLIENT_ID'); ?></th>
			<td><?php echo $this->item->client_id; ?></td>
		</tr>

	</table>

</div>

