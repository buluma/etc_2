<?php
/**
 * @version    CVS: 1.0.0
 * @package    Com_Photos
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
			<th><?php echo JText::_('COM_PHOTOS_FORM_LBL_PHOTO_CLIENT_ID'); ?></th>
			<td><?php echo $this->item->client_id; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_PHOTOS_FORM_LBL_PHOTO_IMAGEPATH'); ?></th>
			<td><?php echo $this->item->imagepath; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_PHOTOS_FORM_LBL_PHOTO_IMAGEDATE'); ?></th>
			<td><?php echo $this->item->imagedate; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_PHOTOS_FORM_LBL_PHOTO_MANUFACTURER'); ?></th>
			<td><?php echo $this->item->manufacturer; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_PHOTOS_FORM_LBL_PHOTO_BRAND'); ?></th>
			<td><?php echo $this->item->brand; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_PHOTOS_FORM_LBL_PHOTO_BRANDCODE'); ?></th>
			<td><?php echo $this->item->brandcode; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_PHOTOS_FORM_LBL_PHOTO_STORE'); ?></th>
			<td><?php echo $this->item->store; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_PHOTOS_FORM_LBL_PHOTO_STORE_ID'); ?></th>
			<td><?php echo $this->item->store_id; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_PHOTOS_FORM_LBL_PHOTO_STORE_SERVER_ID'); ?></th>
			<td><?php echo $this->item->store_server_id; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_PHOTOS_FORM_LBL_PHOTO_REMARKS'); ?></th>
			<td><?php echo nl2br($this->item->remarks); ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_PHOTOS_FORM_LBL_PHOTO_COORDINATES'); ?></th>
			<td><?php echo $this->item->coordinates; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_PHOTOS_FORM_LBL_PHOTO_CLIENT_MODIFIED_DATE'); ?></th>
			<td><?php echo $this->item->client_modified_date; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_PHOTOS_FORM_LBL_PHOTO_LAST_SYNC_DATE'); ?></th>
			<td><?php echo $this->item->last_sync_date; ?></td>
		</tr>

	</table>

</div>

