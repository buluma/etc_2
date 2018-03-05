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
		if (task == 'compeimage.cancel') {
			Joomla.submitform(task, document.getElementById('compeimage-form'));
		}
		else {
			
			if (task != 'compeimage.cancel' && document.formvalidator.isValid(document.id('compeimage-form'))) {
				
				Joomla.submitform(task, document.getElementById('compeimage-form'));
			}
			else {
				alert('<?php echo $this->escape(JText::_('JGLOBAL_VALIDATION_FORM_FAILED')); ?>');
			}
		}
	}
</script>

<form
	action="<?php echo JRoute::_('index.php?option=com_competitor_activities&layout=edit&id=' . (int) $this->item->id); ?>"
	method="post" enctype="multipart/form-data" name="adminForm" id="compeimage-form" class="form-validate">

	<div class="form-horizontal">
		<?php echo JHtml::_('bootstrap.startTabSet', 'myTab', array('active' => 'general')); ?>

		<?php echo JHtml::_('bootstrap.addTab', 'myTab', 'general', JText::_('COM_COMPETITOR_ACTIVITIES_TITLE_COMPEIMAGE', true)); ?>
		<div class="row-fluid">
			<div class="span10 form-horizontal">
				<fieldset class="adminform">

					

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
