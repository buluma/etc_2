<?php
/**
 * @version    CVS: 1.0.0
 * @package    Com_Objectives
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
$document->addStyleSheet(JUri::root() . 'media/com_objectives/css/form.css');
?>
<script type="text/javascript">
	js = jQuery.noConflict();
	js(document).ready(function () {
		
	js('input:hidden.category').each(function(){
		var name = js(this).attr('name');
		if(name.indexOf('categoryhidden')){
			js('#jform_category option[value="'+js(this).val()+'"]').attr('selected',true);
		}
	});
	js("#jform_category").trigger("liszt:updated");
	});

	Joomla.submitbutton = function (task) {
		if (task == 'objective.cancel') {
			Joomla.submitform(task, document.getElementById('objective-form'));
		}
		else {
			
			if (task != 'objective.cancel' && document.formvalidator.isValid(document.id('objective-form'))) {
				
				Joomla.submitform(task, document.getElementById('objective-form'));
			}
			else {
				alert('<?php echo $this->escape(JText::_('JGLOBAL_VALIDATION_FORM_FAILED')); ?>');
			}
		}
	}
</script>

<form
	action="<?php echo JRoute::_('index.php?option=com_objectives&layout=edit&id=' . (int) $this->item->id); ?>"
	method="post" enctype="multipart/form-data" name="adminForm" id="objective-form" class="form-validate">

	<div class="form-horizontal">
		<?php echo JHtml::_('bootstrap.startTabSet', 'myTab', array('active' => 'general')); ?>

		<?php echo JHtml::_('bootstrap.addTab', 'myTab', 'general', JText::_('COM_OBJECTIVES_TITLE_OBJECTIVE', true)); ?>
		<div class="row-fluid">
			<div class="span10 form-horizontal">
				<fieldset class="adminform">

				<input type="hidden" name="jform[id]" value="<?php echo $this->item->id; ?>" />
				<input type="hidden" name="jform[ordering]" value="<?php echo $this->item->ordering; ?>" />
				<input type="hidden" name="jform[state]" value="<?php echo $this->item->state; ?>" />
				<input type="hidden" name="jform[checked_out]" value="<?php echo $this->item->checked_out; ?>" />
				<input type="hidden" name="jform[checked_out_time]" value="<?php echo $this->item->checked_out_time; ?>" />

				<?php echo $this->form->renderField('created_by'); ?>
				<?php echo $this->form->renderField('modified_by'); ?>				
				<?php echo $this->form->renderField('client_id'); ?>
				<?php echo $this->form->renderField('inputdate'); ?>
				<?php echo $this->form->renderField('objective_desc'); ?>
				<?php echo $this->form->renderField('response_type'); ?>
				<?php echo $this->form->renderField('targetscore'); ?>
				<?php echo $this->form->renderField('categorytotal'); ?>
				<?php echo $this->form->renderField('targetfacings'); ?>
				<?php echo $this->form->renderField('current_percent'); ?>
				<?php echo $this->form->renderField('current_facings'); ?>
				<?php echo $this->form->renderField('objective_achieved'); ?>
				<?php echo $this->form->renderField('reason_not_achieved'); ?>
				<?php echo $this->form->renderField('action_point'); ?>
				<?php echo $this->form->renderField('submitter'); ?>
				<?php echo $this->form->renderField('user_id'); ?>
				<?php echo $this->form->renderField('store'); ?>
				<?php echo $this->form->renderField('store_id'); ?>
				<?php echo $this->form->renderField('store_server_id'); ?>
				<?php echo $this->form->renderField('remarks'); ?>
				<?php echo $this->form->renderField('created'); ?>
				<?php echo $this->form->renderField('client_modified_date'); ?>
				<?php echo $this->form->renderField('coordinates'); ?>
				<?php echo $this->form->renderField('first_insert'); ?>
				<?php echo $this->form->renderField('server_modified_date'); ?>
				<?php echo $this->form->renderField('last_sync_date'); ?>
				<?php echo $this->form->renderField('modified_by'); ?>

			<?php
				/*foreach((array)$this->item->category as $value): 
					if(!is_array($value)):
						echo '<input type="hidden" class="category" name="jform[categoryhidden]['.$value.']" value="'.$value.'" />';
					endif;
				endforeach;*/
			?>				

				<?php //echo $this->form->renderField('published'); ?>
				<?php //echo $this->form->renderField('deleted'); ?>
				<?php echo $this->form->renderField('created_on'); ?>
				<?php echo $this->form->renderField('modified_on'); ?>


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

		

		<?php echo JHtml::_('bootstrap.endTabSet'); ?>

		<input type="hidden" name="task" value=""/>
		<?php echo JHtml::_('form.token'); ?>

	</div>
</form>
