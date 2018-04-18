<?php
/**
 * @version    CVS: 1.0.0
 * @package    Com_Bts_items
 * @author     Michael Buluma <michael@buluma.co.ke>
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
$document->addStyleSheet(JUri::root() . 'media/com_bts_items/css/form.css');
?>
<script type="text/javascript">
	js = jQuery.noConflict();
	js(document).ready(function () {
		
	js('input:hidden.outlet').each(function(){
		var name = js(this).attr('name');
		if(name.indexOf('outlethidden')){
			js('#jform_outlet option[value="'+js(this).val()+'"]').attr('selected',true);
		}
	});
	js("#jform_outlet").trigger("liszt:updated");
	js('input:hidden.product').each(function(){
		var name = js(this).attr('name');
		if(name.indexOf('producthidden')){
			js('#jform_product option[value="'+js(this).val()+'"]').attr('selected',true);
		}
	});
	js("#jform_product").trigger("liszt:updated");
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
		if (task == 'bts_item.cancel') {
			Joomla.submitform(task, document.getElementById('bts_item-form'));
		}
		else {
			
			if (task != 'bts_item.cancel' && document.formvalidator.isValid(document.id('bts_item-form'))) {
				
				Joomla.submitform(task, document.getElementById('bts_item-form'));
			}
			else {
				alert('<?php echo $this->escape(JText::_('JGLOBAL_VALIDATION_FORM_FAILED')); ?>');
			}
		}
	}
</script>

<form
	action="<?php echo JRoute::_('index.php?option=com_bts_items&layout=edit&id=' . (int) $this->item->id); ?>"
	method="post" enctype="multipart/form-data" name="adminForm" id="bts_item-form" class="form-validate">

	<div class="form-horizontal">
		<?php echo JHtml::_('bootstrap.startTabSet', 'myTab', array('active' => 'general')); ?>

		<?php echo JHtml::_('bootstrap.addTab', 'myTab', 'general', JText::_('COM_BTS_ITEMS_TITLE_BTS_ITEM', true)); ?>
		<div class="row-fluid">
			<div class="span10 form-horizontal">
				<fieldset class="adminform">

									<input type="hidden" name="jform[id]" value="<?php echo $this->item->id; ?>" />
				<input type="hidden" name="jform[ordering]" value="<?php echo $this->item->ordering; ?>" />
				<input type="hidden" name="jform[state]" value="<?php echo $this->item->state; ?>" />
				<input type="hidden" name="jform[checked_out]" value="<?php echo $this->item->checked_out; ?>" />
				<input type="hidden" name="jform[checked_out_time]" value="<?php echo $this->item->checked_out_time; ?>" />

				<?php echo $this->form->renderField('created_by'); ?>
				<?php echo $this->form->renderField('modified_by'); ?>				<?php echo $this->form->renderField('date'); ?>
				<?php echo $this->form->renderField('outlet'); ?>

			<?php
				foreach((array)$this->item->outlet as $value): 
					if(!is_array($value)):
						echo '<input type="hidden" class="outlet" name="jform[outlethidden]['.$value.']" value="'.$value.'" />';
					endif;
				endforeach;
			?>				<?php echo $this->form->renderField('ba_name'); ?>
				<?php echo $this->form->renderField('product'); ?>

			<?php
				foreach((array)$this->item->product as $value): 
					if(!is_array($value)):
						echo '<input type="hidden" class="product" name="jform[producthidden]['.$value.']" value="'.$value.'" />';
					endif;
				endforeach;
			?>				<?php echo $this->form->renderField('sku'); ?>
				<?php echo $this->form->renderField('target'); ?>
				<?php echo $this->form->renderField('actual'); ?>
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
			?>				<?php echo $this->form->renderField('coordinates'); ?>
				<?php echo $this->form->renderField('created'); ?>
				<?php echo $this->form->renderField('client_modified_date'); ?>
				<?php echo $this->form->renderField('submitter'); ?>
				<?php echo $this->form->renderField('user_id'); ?>
				<?php echo $this->form->renderField('last_sync_date'); ?>
				<?php echo $this->form->renderField('first_insert_date'); ?>
				<?php echo $this->form->renderField('client_id'); ?>


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
