<?php
/**
 * @version    CVS: 1.0.0
 * @package    Com_Location_visits
 * @author     Michael Buluma <michael@buluma.co.ke>
 * @copyright  2018 Michael Buluma
 * @license    GNU General Public License version 2 or later; see LICENSE.txt
 */
// No direct access
defined('_JEXEC') or die;


?>

<div class="item_fields">

	<table class="table">
		

		<tr>
			<th><?php echo JText::_('COM_LOCATION_VISITS_FORM_LBL_LOCATION_CLIENT_ID'); ?></th>
			<td><?php echo $this->item->client_id; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_LOCATION_VISITS_FORM_LBL_LOCATION_COORDINATES'); ?></th>
			<td><?php echo $this->item->coordinates; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_LOCATION_VISITS_FORM_LBL_LOCATION_CLIENT_MODIFIED_DATE'); ?></th>
			<td><?php echo $this->item->client_modified_date; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_LOCATION_VISITS_FORM_LBL_LOCATION_SUBMITTER'); ?></th>
			<td><?php echo $this->item->submitter_name; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_LOCATION_VISITS_FORM_LBL_LOCATION_USER_ID'); ?></th>
			<td><?php echo $this->item->user_id_name; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_LOCATION_VISITS_FORM_LBL_LOCATION_STORE'); ?></th>
			<td><?php echo $this->item->store; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_LOCATION_VISITS_FORM_LBL_LOCATION_STORE_SERVER_ID'); ?></th>
			<td><?php echo $this->item->store_server_id; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_LOCATION_VISITS_FORM_LBL_LOCATION_STORE_ID'); ?></th>
			<td><?php echo $this->item->store_id; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_LOCATION_VISITS_FORM_LBL_LOCATION_CREATED_ON'); ?></th>
			<td><?php echo $this->item->created_on; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_LOCATION_VISITS_FORM_LBL_LOCATION_LAST_SYNC_DATE'); ?></th>
			<td><?php echo $this->item->last_sync_date; ?></td>
		</tr>

		<tr>
			<th><?php echo JText::_('COM_LOCATION_VISITS_FORM_LBL_LOCATION_FIRST_INSERT_DATE'); ?></th>
			<td><?php echo $this->item->first_insert_date; ?></td>
		</tr>

	</table>

</div>

