<?php
/**
 * @version    CVS: 1.0.0
 * @package    Com_Qissues
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
$lang->load('com_qissues', JPATH_SITE);
$doc = JFactory::getDocument();
$doc->addScript(JUri::base() . '/media/com_qissues/js/form.js');

$user    = JFactory::getUser();
$canEdit = QissuesHelpersQissues::canUserEdit($this->item, $user);


?>

<div class="issue-edit front-end-edit">
	<?php if (!$canEdit) : ?>
		<h3>
			<?php throw new Exception(JText::_('COM_QISSUES_ERROR_MESSAGE_NOT_AUTHORISED'), 403); ?>
		</h3>
	<?php else : ?>
		<?php if (!empty($this->item->id)): ?>
			<h1><?php echo JText::sprintf('COM_QISSUES_EDIT_ITEM_TITLE', $this->item->id); ?></h1>
		<?php else: ?>
			<h1><?php echo JText::_('COM_QISSUES_ADD_ITEM_TITLE'); ?></h1>
		<?php endif; ?>

		<form id="form-issue"
			  action="<?php echo JRoute::_('index.php?option=com_qissues&task=issue.save'); ?>"
			  method="post" class="form-validate form-horizontal" enctype="multipart/form-data">
			
	<input type="hidden" name="jform[id]" value="<?php echo $this->item->id; ?>" />

	<input type="hidden" name="jform[ordering]" value="<?php echo $this->item->ordering; ?>" />

	<input type="hidden" name="jform[state]" value="<?php echo $this->item->state; ?>" />

	<input type="hidden" name="jform[checked_out]" value="<?php echo $this->item->checked_out; ?>" />

	<input type="hidden" name="jform[checked_out_time]" value="<?php echo $this->item->checked_out_time; ?>" />

				<?php echo $this->form->getInput('created_by'); ?>
				<?php echo $this->form->getInput('modified_by'); ?>
	<?php echo $this->form->renderField('brand'); ?>

	<?php foreach((array)$this->item->brand as $value): ?>
		<?php if(!is_array($value)): ?>
			<input type="hidden" class="brand" name="jform[brandhidden][<?php echo $value; ?>]" value="<?php echo $value; ?>" />';
		<?php endif; ?>
	<?php endforeach; ?>
	<?php echo $this->form->renderField('brandcode'); ?>

	<?php foreach((array)$this->item->brandcode as $value): ?>
		<?php if(!is_array($value)): ?>
			<input type="hidden" class="brandcode" name="jform[brandcodehidden][<?php echo $value; ?>]" value="<?php echo $value; ?>" />';
		<?php endif; ?>
	<?php endforeach; ?>
	<?php echo $this->form->renderField('issue_type'); ?>

	<?php echo $this->form->renderField('rateofsale'); ?>

	<?php echo $this->form->renderField('expiry_date'); ?>

	<?php echo $this->form->renderField('store'); ?>

	<?php foreach((array)$this->item->store as $value): ?>
		<?php if(!is_array($value)): ?>
			<input type="hidden" class="store" name="jform[storehidden][<?php echo $value; ?>]" value="<?php echo $value; ?>" />';
		<?php endif; ?>
	<?php endforeach; ?>
	<?php echo $this->form->renderField('store_id'); ?>

	<?php foreach((array)$this->item->store_id as $value): ?>
		<?php if(!is_array($value)): ?>
			<input type="hidden" class="store_id" name="jform[store_idhidden][<?php echo $value; ?>]" value="<?php echo $value; ?>" />';
		<?php endif; ?>
	<?php endforeach; ?>
	<?php echo $this->form->renderField('store_server_id'); ?>

	<?php foreach((array)$this->item->store_server_id as $value): ?>
		<?php if(!is_array($value)): ?>
			<input type="hidden" class="store_server_id" name="jform[store_server_idhidden][<?php echo $value; ?>]" value="<?php echo $value; ?>" />';
		<?php endif; ?>
	<?php endforeach; ?>
	<?php echo $this->form->renderField('created_on'); ?>

	<?php echo $this->form->renderField('remarks'); ?>

	<?php echo $this->form->renderField('client_id'); ?>

	<?php echo $this->form->renderField('coordinates'); ?>

				<?php echo $this->form->getInput('submitter'); ?>
				<?php echo $this->form->getInput('user_id'); ?>
	<?php echo $this->form->renderField('last_sync_date'); ?>

	<input type="hidden" name="jform[first_insert_date]" value="<?php echo $this->item->first_insert_date; ?>" />

			<div class="control-group">
				<div class="controls">

					<?php if ($this->canSave): ?>
						<button type="submit" class="validate btn btn-primary">
							<?php echo JText::_('JSUBMIT'); ?>
						</button>
					<?php endif; ?>
					<a class="btn"
					   href="<?php echo JRoute::_('index.php?option=com_qissues&task=issueform.cancel'); ?>"
					   title="<?php echo JText::_('JCANCEL'); ?>">
						<?php echo JText::_('JCANCEL'); ?>
					</a>
				</div>
			</div>

			<input type="hidden" name="option" value="com_qissues"/>
			<input type="hidden" name="task"
				   value="issueform.save"/>
			<?php echo JHtml::_('form.token'); ?>
		</form>
	<?php endif; ?>
</div>
