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

JHtml::addIncludePath(JPATH_COMPONENT . '/helpers/html');
JHtml::_('behavior.tooltip');
JHtml::_('behavior.formvalidation');
JHtml::_('formbehavior.chosen', 'select');
JHtml::_('behavior.keepalive');

// Import CSS
$document = JFactory::getDocument();
$document->addStyleSheet(JUri::root() . 'media/com_competitor_activities/css/form.css');
?>
<script type="text/javascript">
	js = jQuery.noConflict();
	js(document).ready(function () {
		
	js('input:hidden.brand').each(function(){
		var name = js(this).attr('name');
		if(name.indexOf('brandhidden')){
			js('#jform_brand option[value="'+js(this).val()+'"]').attr('selected',true);
		}
	});
	js("#jform_brand").trigger("liszt:updated");
	js('input:hidden.category').each(function(){
		var name = js(this).attr('name');
		if(name.indexOf('categoryhidden')){
			js('#jform_category option[value="'+js(this).val()+'"]').attr('selected',true);
		}
	});
	js("#jform_category").trigger("liszt:updated");
	js('input:hidden.store').each(function(){
		var name = js(this).attr('name');
		if(name.indexOf('storehidden')){
			js('#jform_store option[value="'+js(this).val()+'"]').attr('selected',true);
		}
	});
	js("#jform_store").trigger("liszt:updated");
	js('input:hidden.store_server_id').each(function(){
		var name = js(this).attr('name');
		if(name.indexOf('store_server_idhidden')){
			js('#jform_store_server_id option[value="'+js(this).val()+'"]').attr('selected',true);
		}
	});
	js("#jform_store_server_id").trigger("liszt:updated");
	js('input:hidden.store_id').each(function(){
		var name = js(this).attr('name');
		if(name.indexOf('store_idhidden')){
			js('#jform_store_id option[value="'+js(this).val()+'"]').attr('selected',true);
		}
	});
	js("#jform_store_id").trigger("liszt:updated");
	});

	Joomla.submitbutton = function (task) {
		if (task == 'comp_activity.cancel') {
			Joomla.submitform(task, document.getElementById('comp_activity-form'));
		}
		else {
			
			if (task != 'comp_activity.cancel' && document.formvalidator.isValid(document.id('comp_activity-form'))) {
				
				Joomla.submitform(task, document.getElementById('comp_activity-form'));
			}
			else {
				alert('<?php echo $this->escape(JText::_('JGLOBAL_VALIDATION_FORM_FAILED')); ?>');
			}
		}
	}
</script>

<form
	action="<?php echo JRoute::_('index.php?option=com_competitor_activities&layout=edit&id=' . (int) $this->item->id); ?>"
	method="post" enctype="multipart/form-data" name="adminForm" id="comp_activity-form" class="form-validate">

	<div class="form-horizontal">
		<?php echo JHtml::_('bootstrap.startTabSet', 'myTab', array('active' => 'general')); ?>

		<?php echo JHtml::_('bootstrap.addTab', 'myTab', 'general', JText::_('COM_COMPETITOR_ACTIVITIES_TITLE_COMP_ACTIVITY', true)); ?>
		<div class="row-fluid">
			<div class="span10 form-horizontal">
				<fieldset class="adminform">

				<input type="hidden" name="jform[id]" value="<?php echo $this->item->id; ?>" />
				<input type="hidden" name="jform[ordering]" value="<?php echo $this->item->ordering; ?>" />
				<input type="hidden" name="jform[state]" value="<?php echo $this->item->state; ?>" />
				<input type="hidden" name="jform[checked_out]" value="<?php echo $this->item->checked_out; ?>" />
				<input type="hidden" name="jform[checked_out_time]" value="<?php echo $this->item->checked_out_time; ?>" />

				<?php echo $this->form->renderField('created_by'); ?>
				<?php echo $this->form->renderField('modified_by'); ?>				<?php echo $this->form->renderField('client_id'); ?>
				<?php echo $this->form->renderField('unique_id'); ?>
				<?php echo $this->form->renderField('brand'); ?>

			<?php
				foreach((array)$this->item->brand as $value): 
					if(!is_array($value)):
						echo '<input type="hidden" class="brand" name="jform[brandhidden]['.$value.']" value="'.$value.'" />';
					endif;
				endforeach;
			?>				<?php echo $this->form->renderField('category'); ?>

			<?php
				foreach((array)$this->item->category as $value): 
					if(!is_array($value)):
						echo '<input type="hidden" class="category" name="jform[categoryhidden]['.$value.']" value="'.$value.'" />';
					endif;
				endforeach;
			?>				<?php echo $this->form->renderField('submitter'); ?>
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

			<?php
				foreach((array)$this->item->store as $value): 
					if(!is_array($value)):
						echo '<input type="hidden" class="store" name="jform[storehidden]['.$value.']" value="'.$value.'" />';
					endif;
				endforeach;
			?>				<?php echo $this->form->renderField('store_server_id'); ?>

			<?php
				foreach((array)$this->item->store_server_id as $value): 
					if(!is_array($value)):
						echo '<input type="hidden" class="store_server_id" name="jform[store_server_idhidden]['.$value.']" value="'.$value.'" />';
					endif;
				endforeach;
			?>				<?php echo $this->form->renderField('store_id'); ?>

			<?php
				foreach((array)$this->item->store_id as $value): 
					if(!is_array($value)):
						echo '<input type="hidden" class="store_id" name="jform[store_idhidden]['.$value.']" value="'.$value.'" />';
					endif;
				endforeach;
			?>				<?php echo $this->form->renderField('created_on'); ?>
				<?php echo $this->form->renderField('client_modified_date'); ?>
				<?php echo $this->form->renderField('last_sync_date'); ?>
				<?php echo $this->form->renderField('first_insert'); ?>
				<?php echo $this->form->renderField('server_modified_date'); ?>


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

		<!-- Images view -->
		<?php echo JHtml::_('bootstrap.addTab', 'myTab', 'images', JText::_('Images')); ?>

		<?php //echo $this->form->renderField('brand'); ?>
		<?php echo 'To Do'; 
		// var_dump($this->images);
		 // var_dump($abc);
		?>

		<?php echo JHtml::_('bootstrap.endTabSet'); ?>
		<!-- Images view -->
		

		<?php echo JHtml::_('bootstrap.endTabSet'); ?>


		<input type="hidden" name="task" value=""/>
		<?php echo JHtml::_('form.token'); ?>

	</div>
</form>
