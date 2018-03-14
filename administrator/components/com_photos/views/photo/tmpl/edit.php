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

JHtml::addIncludePath(JPATH_COMPONENT . '/helpers/html');
JHtml::_('behavior.tooltip');
JHtml::_('behavior.formvalidation');
JHtml::_('formbehavior.chosen', 'select');
JHtml::_('behavior.keepalive');

// Import CSS
$document = JFactory::getDocument();
$document->addStyleSheet(JUri::root() . 'media/com_photos/css/form.css');
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
	js('input:hidden.brandcode').each(function(){
		var name = js(this).attr('name');
		if(name.indexOf('brandcodehidden')){
			js('#jform_brandcode option[value="'+js(this).val()+'"]').attr('selected',true);
		}
	});
	js("#jform_brandcode").trigger("liszt:updated");
	js('input:hidden.store').each(function(){
		var name = js(this).attr('name');
		if(name.indexOf('storehidden')){
			js('#jform_store option[value="'+js(this).val()+'"]').attr('selected',true);
		}
	});
	js("#jform_store").trigger("liszt:updated");
	js('input:hidden.store_id').each(function(){
		var name = js(this).attr('name');
		if(name.indexOf('store_idhidden')){
			js('#jform_store_id option[value="'+js(this).val()+'"]').attr('selected',true);
		}
	});
	js("#jform_store_id").trigger("liszt:updated");
	js('input:hidden.store_server_id').each(function(){
		var name = js(this).attr('name');
		if(name.indexOf('store_server_idhidden')){
			js('#jform_store_server_id option[value="'+js(this).val()+'"]').attr('selected',true);
		}
	});
	js("#jform_store_server_id").trigger("liszt:updated");
	});

	Joomla.submitbutton = function (task) {
		if (task == 'photo.cancel') {
			Joomla.submitform(task, document.getElementById('photo-form'));
		}
		else {
			
			if (task != 'photo.cancel' && document.formvalidator.isValid(document.id('photo-form'))) {
				
				Joomla.submitform(task, document.getElementById('photo-form'));
			}
			else {
				alert('<?php echo $this->escape(JText::_('JGLOBAL_VALIDATION_FORM_FAILED')); ?>');
			}
		}
	}
</script>

<form
	action="<?php echo JRoute::_('index.php?option=com_photos&layout=edit&id=' . (int) $this->item->id); ?>"
	method="post" enctype="multipart/form-data" name="adminForm" id="photo-form" class="form-validate">

	<div class="form-horizontal">
		<?php echo JHtml::_('bootstrap.startTabSet', 'myTab', array('active' => 'general')); ?>

		<?php echo JHtml::_('bootstrap.addTab', 'myTab', 'general', JText::_('COM_PHOTOS_TITLE_PHOTO', true)); ?>
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
				<img src="<?php echo $this->item->imagepath; ?>" />
				<?php echo $this->form->renderField('imagedate'); ?>
				<?php echo $this->form->renderField('manufacturer'); ?>
				<?php echo $this->form->renderField('brand'); ?>

			<?php
				foreach((array)$this->item->brand as $value): 
					if(!is_array($value)):
						echo '<input type="hidden" class="brand" name="jform[brandhidden]['.$value.']" value="'.$value.'" />';
					endif;
				endforeach;
			?>				<?php echo $this->form->renderField('brandcode'); ?>

			<?php
				foreach((array)$this->item->brandcode as $value): 
					if(!is_array($value)):
						echo '<input type="hidden" class="brandcode" name="jform[brandcodehidden]['.$value.']" value="'.$value.'" />';
					endif;
				endforeach;
			?>
				<?php echo $this->form->renderField('submitter'); ?>
				<?php echo $this->form->renderField('user_id'); ?>				
				<?php echo $this->form->renderField('store'); ?>

			<?php
				foreach((array)$this->item->store as $value): 
					if(!is_array($value)):
						echo '<input type="hidden" class="store" name="jform[storehidden]['.$value.']" value="'.$value.'" />';
					endif;
				endforeach;
			?>				<?php echo $this->form->renderField('store_id'); ?>

			<?php
				foreach((array)$this->item->store_id as $value): 
					if(!is_array($value)):
						echo '<input type="hidden" class="store_id" name="jform[store_idhidden]['.$value.']" value="'.$value.'" />';
					endif;
				endforeach;
			?>				<?php echo $this->form->renderField('store_server_id'); ?>

			<?php
				foreach((array)$this->item->store_server_id as $value): 
					if(!is_array($value)):
						echo '<input type="hidden" class="store_server_id" name="jform[store_server_idhidden]['.$value.']" value="'.$value.'" />';
					endif;
				endforeach;
			?>				<?php echo $this->form->renderField('remarks'); ?>

				<?php echo $this->form->renderField('created_on'); ?>				<?php echo $this->form->renderField('coordinates'); ?>
				<?php echo $this->form->renderField('client_modified_date'); ?>
				<input type="hidden" name="jform[first_insert_date]" value="<?php echo $this->item->first_insert_date; ?>" />
				<?php echo $this->form->renderField('last_sync_date'); ?>


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
