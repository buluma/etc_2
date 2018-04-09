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

JHtml::_('behavior.keepalive');
JHtml::_('behavior.tooltip');
JHtml::_('behavior.formvalidation');
JHtml::_('formbehavior.chosen', 'select');

// Load admin language file
$lang = JFactory::getLanguage();
$lang->load('com_competitor_activities', JPATH_SITE);
$doc = JFactory::getDocument();
$doc->addScript(JUri::base() . '/media/com_competitor_activities/js/form.js');

$user    = JFactory::getUser();
$canEdit = Competitor_activitiesHelpersCompetitor_activities::canUserEdit($this->item, $user);


?>

<div class="comp_activity-edit front-end-edit">
	<?php if (!$canEdit) : ?>
		<h3>
			<?php throw new Exception(JText::_('COM_COMPETITOR_ACTIVITIES_ERROR_MESSAGE_NOT_AUTHORISED'), 403); ?>
		</h3>
	<?php else : ?>
		<?php if (!empty($this->item->id)): ?>
			<h1><?php echo JText::sprintf('COM_COMPETITOR_ACTIVITIES_EDIT_ITEM_TITLE', $this->item->id); ?></h1>
		<?php else: ?>
			<h1><?php echo JText::_('COM_COMPETITOR_ACTIVITIES_ADD_ITEM_TITLE'); ?></h1>
		<?php endif; ?>

		<form id="form-comp_activity"
			  action="<?php echo JRoute::_('index.php?option=com_competitor_activities&task=comp_activity.save'); ?>"
			  method="post" class="form-validate form-horizontal" enctype="multipart/form-data">
			
	<input type="hidden" name="jform[id]" value="<?php echo $this->item->id; ?>" />

	<input type="hidden" name="jform[ordering]" value="<?php echo $this->item->ordering; ?>" />

	<input type="hidden" name="jform[state]" value="<?php echo $this->item->state; ?>" />

	<input type="hidden" name="jform[checked_out]" value="<?php echo $this->item->checked_out; ?>" />

	<input type="hidden" name="jform[checked_out_time]" value="<?php echo $this->item->checked_out_time; ?>" />

				<?php echo $this->form->getInput('created_by'); ?>
				<?php echo $this->form->getInput('modified_by'); ?>
	<?php echo $this->form->renderField('client_id'); ?>

	<?php echo $this->form->renderField('unique_id'); ?>

	<?php echo $this->form->renderField('brand'); ?>

	<?php foreach((array)$this->item->brand as $value): ?>
		<?php if(!is_array($value)): ?>
			<input type="hidden" class="brand" name="jform[brandhidden][<?php echo $value; ?>]" value="<?php echo $value; ?>" />';
		<?php endif; ?>
	<?php endforeach; ?>
	<?php echo $this->form->renderField('category'); ?>

	<?php echo $this->form->renderField('submitter'); ?>

	<?php echo $this->form->renderField('user_id'); ?>

	<?php echo $this->form->renderField('mechanics'); ?>

	<?php echo $this->form->renderField('activity_mechanics'); ?>

	<?php echo $this->form->renderField('rateofsale'); ?>

	<?php echo $this->form->renderField('myplan'); ?>

	<?php echo $this->form->renderField('myneed'); ?>

	<?php echo $this->form->renderField('timeline'); ?>

	<?php echo $this->form->renderField('start_date'); ?>

	<?php echo $this->form->renderField('end_date'); ?>

	<?php echo $this->form->renderField('coordinates'); ?>

	<?php echo $this->form->renderField('store'); ?>

	<?php foreach((array)$this->item->store as $value): ?>
		<?php if(!is_array($value)): ?>
			<input type="hidden" class="store" name="jform[storehidden][<?php echo $value; ?>]" value="<?php echo $value; ?>" />';
		<?php endif; ?>
	<?php endforeach; ?>
	<?php echo $this->form->renderField('store_server_id'); ?>

	<?php foreach((array)$this->item->store_server_id as $value): ?>
		<?php if(!is_array($value)): ?>
			<input type="hidden" class="store_server_id" name="jform[store_server_idhidden][<?php echo $value; ?>]" value="<?php echo $value; ?>" />';
		<?php endif; ?>
	<?php endforeach; ?>
	<?php echo $this->form->renderField('store_id'); ?>

	<?php foreach((array)$this->item->store_id as $value): ?>
		<?php if(!is_array($value)): ?>
			<input type="hidden" class="store_id" name="jform[store_idhidden][<?php echo $value; ?>]" value="<?php echo $value; ?>" />';
		<?php endif; ?>
	<?php endforeach; ?>
	<?php echo $this->form->renderField('created_on'); ?>

	<?php echo $this->form->renderField('client_modified_date'); ?>

	<?php echo $this->form->renderField('last_sync_date'); ?>

	<?php echo $this->form->renderField('first_insert'); ?>

	<?php echo $this->form->renderField('server_modified_date'); ?>

			<div class="control-group">
				<div class="controls">

					<?php if ($this->canSave): ?>
						<button type="submit" class="validate btn btn-primary">
							<?php echo JText::_('JSUBMIT'); ?>
						</button>
					<?php endif; ?>
					<a class="btn"
					   href="<?php echo JRoute::_('index.php?option=com_competitor_activities&task=comp_activityform.cancel'); ?>"
					   title="<?php echo JText::_('JCANCEL'); ?>">
						<?php echo JText::_('JCANCEL'); ?>
					</a>
				</div>
			</div>

			<input type="hidden" name="option" value="com_competitor_activities"/>
			<input type="hidden" name="task"
				   value="comp_activityform.save"/>
			<?php echo JHtml::_('form.token'); ?>
		</form>
	<?php endif; ?>
</div>
