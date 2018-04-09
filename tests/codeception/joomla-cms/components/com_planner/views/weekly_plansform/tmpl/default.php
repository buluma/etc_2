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

JHtml::_('behavior.keepalive');
JHtml::_('behavior.tooltip');
JHtml::_('behavior.formvalidation');
JHtml::_('formbehavior.chosen', 'select');

// Load admin language file
$lang = JFactory::getLanguage();
$lang->load('com_planner', JPATH_SITE);
$doc = JFactory::getDocument();
$doc->addScript(JUri::base() . '/media/com_planner/js/form.js');

$user    = JFactory::getUser();
$canEdit = PlannerHelpersPlanner::canUserEdit($this->item, $user);


?>

<div class="weekly_plans-edit front-end-edit">
	<?php if (!$canEdit) : ?>
		<h3>
			<?php throw new Exception(JText::_('COM_PLANNER_ERROR_MESSAGE_NOT_AUTHORISED'), 403); ?>
		</h3>
	<?php else : ?>
		<?php if (!empty($this->item->id)): ?>
			<h1><?php echo JText::sprintf('COM_PLANNER_EDIT_ITEM_TITLE', $this->item->id); ?></h1>
		<?php else: ?>
			<h1><?php echo JText::_('COM_PLANNER_ADD_ITEM_TITLE'); ?></h1>
		<?php endif; ?>

		<form id="form-weekly_plans"
			  action="<?php echo JRoute::_('index.php?option=com_planner&task=weekly_plans.save'); ?>"
			  method="post" class="form-validate form-horizontal" enctype="multipart/form-data">
			
	<input type="hidden" name="jform[id]" value="<?php echo $this->item->id; ?>" />

	<input type="hidden" name="jform[ordering]" value="<?php echo $this->item->ordering; ?>" />

	<input type="hidden" name="jform[state]" value="<?php echo $this->item->state; ?>" />

	<input type="hidden" name="jform[checked_out]" value="<?php echo $this->item->checked_out; ?>" />

	<input type="hidden" name="jform[checked_out_time]" value="<?php echo $this->item->checked_out_time; ?>" />

				<?php echo $this->form->getInput('created_by'); ?>
				<?php echo $this->form->getInput('modified_by'); ?>
	<input type="hidden" name="jform[submitter]" value="<?php echo $this->item->submitter; ?>" />

	<?php echo $this->form->renderField('user_id'); ?>

	<input type="hidden" name="jform[week]" value="<?php echo $this->item->week; ?>" />

	<input type="hidden" name="jform[month]" value="<?php echo $this->item->month; ?>" />

	<input type="hidden" name="jform[year]" value="<?php echo $this->item->year; ?>" />

	<?php echo $this->form->renderField('routeplan'); ?>

	<input type="hidden" name="jform[inputdate]" value="<?php echo $this->item->inputdate; ?>" />

	<input type="hidden" name="jform[coordinates]" value="<?php echo $this->item->coordinates; ?>" />

	<input type="hidden" name="jform[first_insert]" value="<?php echo $this->item->first_insert; ?>" />

			<div class="control-group">
				<div class="controls">

					<?php if ($this->canSave): ?>
						<button type="submit" class="validate btn btn-primary">
							<?php echo JText::_('JSUBMIT'); ?>
						</button>
					<?php endif; ?>
					<a class="btn"
					   href="<?php echo JRoute::_('index.php?option=com_planner&task=weekly_plansform.cancel'); ?>"
					   title="<?php echo JText::_('JCANCEL'); ?>">
						<?php echo JText::_('JCANCEL'); ?>
					</a>
				</div>
			</div>

			<input type="hidden" name="option" value="com_planner"/>
			<input type="hidden" name="task"
				   value="weekly_plansform.save"/>
			<?php echo JHtml::_('form.token'); ?>
		</form>
	<?php endif; ?>
</div>
