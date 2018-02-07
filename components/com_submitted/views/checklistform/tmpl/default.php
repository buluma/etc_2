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

JHtml::_('behavior.keepalive');
JHtml::_('behavior.tooltip');
JHtml::_('behavior.formvalidation');
JHtml::_('formbehavior.chosen', 'select');

// Load admin language file
$lang = JFactory::getLanguage();
$lang->load('com_submitted', JPATH_SITE);
$doc = JFactory::getDocument();
$doc->addScript(JUri::base() . '/media/com_submitted/js/form.js');

$user    = JFactory::getUser();
$canEdit = SubmittedHelpersSubmitted::canUserEdit($this->item, $user);


?>

<div class="checklist-edit front-end-edit">
	<?php if (!$canEdit) : ?>
		<h3>
			<?php throw new Exception(JText::_('COM_SUBMITTED_ERROR_MESSAGE_NOT_AUTHORISED'), 403); ?>
		</h3>
	<?php else : ?>
		<?php if (!empty($this->item->id)): ?>
			<h1><?php echo JText::sprintf('COM_SUBMITTED_EDIT_ITEM_TITLE', $this->item->id); ?></h1>
		<?php else: ?>
			<h1><?php echo JText::_('COM_SUBMITTED_ADD_ITEM_TITLE'); ?></h1>
		<?php endif; ?>

		<form id="form-checklist"
			  action="<?php echo JRoute::_('index.php?option=com_submitted&task=checklist.save'); ?>"
			  method="post" class="form-validate form-horizontal" enctype="multipart/form-data">
			
	<input type="hidden" name="jform[id]" value="<?php echo $this->item->id; ?>" />

	<input type="hidden" name="jform[ordering]" value="<?php echo $this->item->ordering; ?>" />

	<input type="hidden" name="jform[state]" value="<?php echo $this->item->state; ?>" />

	<input type="hidden" name="jform[checked_out]" value="<?php echo $this->item->checked_out; ?>" />

	<input type="hidden" name="jform[checked_out_time]" value="<?php echo $this->item->checked_out_time; ?>" />

				<?php echo $this->form->getInput('created_by'); ?>
				<?php echo $this->form->getInput('modified_by'); ?>
	<input type="hidden" name="jform[inputdate]" value="<?php echo $this->item->inputdate; ?>" />

	<input type="hidden" name="jform[client_id]" value="<?php echo $this->item->client_id; ?>" />

	<?php echo $this->form->renderField('shop_mml'); ?>

	<?php echo $this->form->renderField('sku_available'); ?>

	<?php echo $this->form->renderField('merchandising'); ?>

	<?php echo $this->form->renderField('shelf_quantity'); ?>

	<?php echo $this->form->renderField('right_prices'); ?>

	<?php echo $this->form->renderField('visible_tags'); ?>

	<?php echo $this->form->renderField('store_id'); ?>

	<?php foreach((array)$this->item->store_id as $value): ?>
		<?php if(!is_array($value)): ?>
			<input type="hidden" class="store_id" name="jform[store_idhidden][<?php echo $value; ?>]" value="<?php echo $value; ?>" />';
		<?php endif; ?>
	<?php endforeach; ?>
	<?php echo $this->form->renderField('dateformat'); ?>
				<div class="fltlft" <?php if (!JFactory::getUser()->authorise('core.admin','submitted')): ?> style="display:none;" <?php endif; ?> >
                <?php echo JHtml::_('sliders.start', 'permissions-sliders-'.$this->item->id, array('useCookie'=>1)); ?>
                <?php echo JHtml::_('sliders.panel', JText::_('ACL Configuration'), 'access-rules'); ?>
                <fieldset class="panelform">
                    <?php echo $this->form->getLabel('rules'); ?>
                    <?php echo $this->form->getInput('rules'); ?>
                </fieldset>
                <?php echo JHtml::_('sliders.end'); ?>
            </div>
				<?php if (!JFactory::getUser()->authorise('core.admin','submitted')): ?>
                <script type="text/javascript">
                    jQuery.noConflict();
                    jQuery('.tab-pane select').each(function(){
                       var option_selected = jQuery(this).find(':selected');
                       var input = document.createElement("input");
                       input.setAttribute("type", "hidden");
                       input.setAttribute("name", jQuery(this).attr('name'));
                       input.setAttribute("value", option_selected.val());
                       document.getElementById("form-checklist").appendChild(input);
                    });
                </script>
             <?php endif; ?>
			<div class="control-group">
				<div class="controls">

					<?php if ($this->canSave): ?>
						<button type="submit" class="validate btn btn-primary">
							<?php echo JText::_('JSUBMIT'); ?>
						</button>
					<?php endif; ?>
					<a class="btn"
					   href="<?php echo JRoute::_('index.php?option=com_submitted&task=checklistform.cancel'); ?>"
					   title="<?php echo JText::_('JCANCEL'); ?>">
						<?php echo JText::_('JCANCEL'); ?>
					</a>
				</div>
			</div>

			<input type="hidden" name="option" value="com_submitted"/>
			<input type="hidden" name="task"
				   value="checklistform.save"/>
			<?php echo JHtml::_('form.token'); ?>
		</form>
	<?php endif; ?>
</div>
