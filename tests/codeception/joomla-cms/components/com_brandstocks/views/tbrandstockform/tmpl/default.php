<?php
/**
 * @version    CVS: 1.0.0
 * @package    Com_Brandstocks
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
$lang->load('com_brandstocks', JPATH_SITE);
$doc = JFactory::getDocument();
$doc->addScript(JUri::base() . '/media/com_brandstocks/js/form.js');

$user    = JFactory::getUser();
$canEdit = BrandstocksHelpersBrandstocks::canUserEdit($this->item, $user);


?>

<div class="tbrandstock-edit front-end-edit">
	<?php if (!$canEdit) : ?>
		<h3>
			<?php throw new Exception(JText::_('COM_BRANDSTOCKS_ERROR_MESSAGE_NOT_AUTHORISED'), 403); ?>
		</h3>
	<?php else : ?>
		<?php if (!empty($this->item->id)): ?>
			<h1><?php echo JText::sprintf('COM_BRANDSTOCKS_EDIT_ITEM_TITLE', $this->item->id); ?></h1>
		<?php else: ?>
			<h1><?php echo JText::_('COM_BRANDSTOCKS_ADD_ITEM_TITLE'); ?></h1>
		<?php endif; ?>

		<form id="form-tbrandstock"
			  action="<?php echo JRoute::_('index.php?option=com_brandstocks&task=tbrandstock.save'); ?>"
			  method="post" class="form-validate form-horizontal" enctype="multipart/form-data">
			
	<input type="hidden" name="jform[id]" value="<?php echo $this->item->id; ?>" />

	<input type="hidden" name="jform[ordering]" value="<?php echo $this->item->ordering; ?>" />

	<input type="hidden" name="jform[state]" value="<?php echo $this->item->state; ?>" />

	<input type="hidden" name="jform[checked_out]" value="<?php echo $this->item->checked_out; ?>" />

	<input type="hidden" name="jform[checked_out_time]" value="<?php echo $this->item->checked_out_time; ?>" />

				<?php echo $this->form->getInput('created_by'); ?>
				<?php echo $this->form->getInput('modified_by'); ?>
	<?php echo $this->form->renderField('brand'); ?>

	<?php echo $this->form->renderField('brandcode'); ?>

	<?php echo $this->form->renderField('currentstock'); ?>

	<?php echo $this->form->renderField('order_placed'); ?>

	<?php echo $this->form->renderField('orderplaced'); ?>

	<?php echo $this->form->renderField('order_date'); ?>

	<?php echo $this->form->renderField('lpo_number'); ?>

	<?php echo $this->form->renderField('delivered'); ?>

	<?php echo $this->form->renderField('sale'); ?>

	<?php echo $this->form->renderField('stockout'); ?>

	<?php echo $this->form->renderField('submitter'); ?>

	<?php echo $this->form->renderField('client_id'); ?>

	<?php echo $this->form->renderField('stockdate'); ?>

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
	<?php echo $this->form->renderField('client_modified_date'); ?>

	<?php echo $this->form->renderField('store'); ?>

	<?php foreach((array)$this->item->store as $value): ?>
		<?php if(!is_array($value)): ?>
			<input type="hidden" class="store" name="jform[storehidden][<?php echo $value; ?>]" value="<?php echo $value; ?>" />';
		<?php endif; ?>
	<?php endforeach; ?>
	<?php echo $this->form->renderField('remarks'); ?>

	<?php echo $this->form->renderField('coordinates'); ?>

	<?php echo $this->form->renderField('created'); ?>

	<?php echo $this->form->renderField('first_insert'); ?>

	<?php echo $this->form->renderField('server_modified_date'); ?>

	<?php echo $this->form->renderField('last_sync_date'); ?>

			<div class="control-group">
				<div class="controls">

					<?php if ($this->canSave): ?>
						<button type="submit" class="validate btn btn-primary">
							<?php echo JText::_('JSUBMIT'); ?>
						</button>
					<?php endif; ?>
					<a class="btn"
					   href="<?php echo JRoute::_('index.php?option=com_brandstocks&task=tbrandstockform.cancel'); ?>"
					   title="<?php echo JText::_('JCANCEL'); ?>">
						<?php echo JText::_('JCANCEL'); ?>
					</a>
				</div>
			</div>

			<input type="hidden" name="option" value="com_brandstocks"/>
			<input type="hidden" name="task"
				   value="tbrandstockform.save"/>
			<?php echo JHtml::_('form.token'); ?>
		</form>
	<?php endif; ?>
</div>
