<?php
/**
 * @version    CVS: 1.0.0
 * @package    Com_Submitted
 * @author     Michael Buluma <michael@buluma.me.ke>
 * @copyright  2018 Michael Buluma
 * @license    GNU General Public License version 2 or later; see LICENSE.txt
 */
// No direct access
defined('_JEXEC') or die;

JHtml::addIncludePath(JPATH_COMPONENT . '/helpers/html');
JHtml::_('behavior.tooltip');
JHtml::_('behavior.formvalidation');
JHtml::_('formbehavior.chosen', 'select');
JHtml::_('behavior.keepalive');

// Import CSS
$document = JFactory::getDocument();
$document->addStyleSheet(JUri::root() . 'media/com_submitted/css/form.css');
?>
<script type="text/javascript">
	js = jQuery.noConflict();
	js(document).ready(function () {
		
	js('input:hidden.store_id').each(function(){
		var name = js(this).attr('name');
		if(name.indexOf('store_idhidden')){
			js('#jform_store_id option[value="'+js(this).val()+'"]').attr('selected',true);
		}
	});
	js("#jform_store_id").trigger("liszt:updated");
	});

	Joomla.submitbutton = function (task) {
		if (task == 'checklist.cancel') {
			Joomla.submitform(task, document.getElementById('checklist-form'));
		}
		else {
			
			if (task != 'checklist.cancel' && document.formvalidator.isValid(document.id('checklist-form'))) {
				
				Joomla.submitform(task, document.getElementById('checklist-form'));
			}
			else {
				alert('<?php echo $this->escape(JText::_('JGLOBAL_VALIDATION_FORM_FAILED')); ?>');
			}
		}
	}
</script>

<form
	action="<?php echo JRoute::_('index.php?option=com_submitted&layout=edit&id=' . (int) $this->item->id); ?>"
	method="post" enctype="multipart/form-data" name="adminForm" id="checklist-form" class="form-validate">

	<div class="form-horizontal">
		<?php echo JHtml::_('bootstrap.startTabSet', 'myTab', array('active' => 'general')); ?>

		<?php echo JHtml::_('bootstrap.addTab', 'myTab', 'general', JText::_('COM_SUBMITTED_TITLE_CHECKLIST', true)); ?>
		<div class="row-fluid">
			<div class="span10 form-horizontal">
				<fieldset class="adminform">

									<input type="hidden" name="jform[id]" value="<?php echo $this->item->id; ?>" />
				<input type="hidden" name="jform[ordering]" value="<?php echo $this->item->ordering; ?>" />
				<input type="hidden" name="jform[state]" value="<?php echo $this->item->state; ?>" />
				<input type="hidden" name="jform[checked_out]" value="<?php echo $this->item->checked_out; ?>" />
				<input type="hidden" name="jform[checked_out_time]" value="<?php echo $this->item->checked_out_time; ?>" />

				<?php echo $this->form->renderField('created_by'); ?>
				<?php echo $this->form->renderField('modified_by'); ?>				<input type="hidden" name="jform[inputdate]" value="<?php echo $this->item->inputdate; ?>" />
				<input type="hidden" name="jform[client_id]" value="<?php echo $this->item->client_id; ?>" />
				<?php echo $this->form->renderField('shop_mml'); ?>
				<?php echo $this->form->renderField('sku_available'); ?>
				<?php echo $this->form->renderField('merchandising'); ?>
				<?php echo $this->form->renderField('shelf_quantity'); ?>
				<?php echo $this->form->renderField('right_prices'); ?>
				<?php echo $this->form->renderField('visible_tags'); ?>
				<?php echo $this->form->renderField('store_id'); ?>

			<?php
				foreach((array)$this->item->store_id as $value): 
					if(!is_array($value)):
						echo '<input type="hidden" class="store_id" name="jform[store_idhidden]['.$value.']" value="'.$value.'" />';
					endif;
				endforeach;
			?>

					<?php if ($this->state->params->get('save_history', 1)) : ?>
					<div class="control-group">
						<div class="control-label"><?php echo $this->form->getLabel('version_note'); ?></div>
						<div class="controls"><?php echo $this->form->getInput('version_note'); ?></div>
					</div>
					<?php endif; ?>
				</fieldset>
			</div>
		</div>
		<?php echo JHtml::_('bootstrap.endTab'); ?>

		<?php if (JFactory::getUser()->authorise('core.admin','submitted')) : ?>
	<?php echo JHtml::_('bootstrap.addTab', 'myTab', 'permissions', JText::_('JGLOBAL_ACTION_PERMISSIONS_LABEL', true)); ?>
		<?php echo $this->form->getInput('rules'); ?>
	<?php echo JHtml::_('bootstrap.endTab'); ?>
<?php endif; ?>

		<?php echo JHtml::_('bootstrap.endTabSet'); ?>

		<input type="hidden" name="task" value=""/>
		<?php echo JHtml::_('form.token'); ?>

	</div>
</form>
