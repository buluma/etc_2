<?php
/**
 * @version    CVS: 1.0.0
 * @package    Com_Shop_checkin
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
$document->addStyleSheet(JUri::root() . 'media/com_shop_checkin/css/form.css');
?>
<script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD-9tSrke72PouQMnMX-a7eZSW0jkFMBWY&callback=initMap">
    </script>
<script type="text/javascript">
	js = jQuery.noConflict();
	js(document).ready(function () {
		
	js('input:hidden.checkin_place').each(function(){
		var name = js(this).attr('name');
		if(name.indexOf('checkin_placehidden')){
			js('#jform_checkin_place option[value="'+js(this).val()+'"]').attr('selected',true);
		}
	});
	js("#jform_checkin_place").trigger("liszt:updated");
	js('input:hidden.checkout_place').each(function(){
		var name = js(this).attr('name');
		if(name.indexOf('checkout_placehidden')){
			js('#jform_checkout_place option[value="'+js(this).val()+'"]').attr('selected',true);
		}
	});
	js("#jform_checkout_place").trigger("liszt:updated");
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
		if (task == 'shop_checkin.cancel') {
			Joomla.submitform(task, document.getElementById('shop_checkin-form'));
		}
		else {
			
			if (task != 'shop_checkin.cancel' && document.formvalidator.isValid(document.id('shop_checkin-form'))) {
				
				Joomla.submitform(task, document.getElementById('shop_checkin-form'));
			}
			else {
				alert('<?php echo $this->escape(JText::_('JGLOBAL_VALIDATION_FORM_FAILED')); ?>');
			}
		}
	}
</script>
<style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 200px;
        position: relative;
    	overflow: hidden;
    	width: 500px;
    	margin-bottom: 10px;
      }
    </style>

<form
	action="<?php echo JRoute::_('index.php?option=com_shop_checkin&layout=edit&id=' . (int) $this->item->id); ?>"
	method="post" enctype="multipart/form-data" name="adminForm" id="shop_checkin-form" class="form-validate">

	<div class="form-horizontal">
		<?php echo JHtml::_('bootstrap.startTabSet', 'myTab', array('active' => 'general')); ?>

		<?php echo JHtml::_('bootstrap.addTab', 'myTab', 'general', JText::_('COM_SHOP_CHECKIN_TITLE_SHOP_CHECKIN', true)); ?>
		<div class="row-fluid">
			<div class="span6 form-horizontal">
				<fieldset class="adminform">

				<input type="hidden" name="jform[id]" value="<?php echo $this->item->id; ?>" />
				<input type="hidden" name="jform[ordering]" value="<?php echo $this->item->ordering; ?>" />
				<input type="hidden" name="jform[state]" value="<?php echo $this->item->state; ?>" />
				<input type="hidden" name="jform[checked_out]" value="<?php echo $this->item->checked_out; ?>" />
				<input type="hidden" name="jform[checked_out_time]" value="<?php echo $this->item->checked_out_time; ?>" />

				<?php echo $this->form->renderField('created_by'); ?>				
				<?php echo $this->form->renderField('client_id'); ?>
				<?php echo $this->form->renderField('session_id'); ?>
				<?php echo $this->form->renderField('day'); ?>
				<?php echo $this->form->renderField('coordinates'); ?>
				<?php echo $this->form->renderField('checkin_time'); ?>
				<?php echo $this->form->renderField('checkin_place'); ?>

			<?php
				foreach((array)$this->item->checkin_place as $value): 
					if(!is_array($value)):
						echo '<input type="hidden" class="checkin_place" name="jform[checkin_placehidden]['.$value.']" value="'.$value.'" />';
					endif;
				endforeach;
			?>				

				<div class="control-group">
					<div class="control-label">Actual User Location</div>
					<div class="controls">
				
					</div>
				</div>

			<?php echo $this->form->renderField('checkout_time'); ?>
			
			<?php echo $this->form->renderField('checkout_place'); ?>

			<?php
				foreach((array)$this->item->checkout_place as $value): 
					if(!is_array($value)):
						echo '<input type="hidden" class="checkout_place" name="jform[checkout_placehidden]['.$value.']" value="'.$value.'" />';
					endif;
				endforeach;
			?>				<input type="hidden" name="jform[comments]" value="<?php echo $this->item->comments; ?>" />
				<input type="hidden" name="jform[accompaniment]" value="<?php echo $this->item->accompaniment; ?>" />
				<input type="hidden" name="jform[quality]" value="<?php echo $this->item->quality; ?>" />
				<?php echo $this->form->renderField('created_on'); ?>
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
			?>				<?php echo $this->form->renderField('first_insert_date'); ?>
				<?php echo $this->form->renderField('last_sync_date'); ?>
				<?php echo $this->form->renderField('client_modified_date'); ?>
				<?php echo $this->form->renderField('submitter'); ?>
				<?php echo $this->form->renderField('user_id'); ?>


					<?php if ($this->state->params->get('save_history', 1)) : ?>
					<div class="control-group">
						<div class="control-label"><?php echo $this->form->getLabel('version_note'); ?></div>
						<div class="controls"><?php echo $this->form->getInput('version_note'); ?></div>
					</div>
					<?php endif; ?>
				</fieldset>
			</div>

			<div class="span6">
				<?php
						// var_dump($this->item->checkin_place);
						$chkinPlace = $this->item->checkin_place;

						echo '<pre>';
						var_dump($chkinPlace);
						// var_dump($chkinPlace->[0]);
						echo '<pre/>';

						foreach ($chkinPlace as $key => $row) {
							# code...
							var_dump($row);
							// echo $row['0'];
							// echo $row['1'];
						}
						$coordinates = $this->item->coordinates;
						$coordinatesSplit = explode(",", $coordinates);

						$lat = floatval($coordinatesSplit[0]); // case string to float
						$long =  floatval($coordinatesSplit[1]); // cast string to float

						$act_location_head = "Actual User Location: <small>Lat : ".$lat."\r\n" . "Long : ".$long."\r\n</small>";

						$outlet_location_head = "Outlet Location: <small>Lat : ".$lat."\r\n" . "Long : ".$long."\r\n</small>";

						// echo $act_location_head;

						 // echo "Long : ".$long."\r\n";

						 
						?>

						<div id="map">Map</div>
						<hr>
						<div id="map2">Outlet Location</div>
					    <script>

					      function initMap() {
					        var myLatLng = {lat: <?php echo $lat ?>, lng: <?php echo $long ?>};

					        var map = new google.maps.Map(document.getElementById('map'), {
					          zoom: 18,
					          center: myLatLng
					        });

					        var marker = new google.maps.Marker({
					          position: myLatLng,
					          map: map,
					          title: '<?php echo $this->item->created_on; ?>'
					        });
					      }

					      //outlet map

					    </script>

					</div>
		</div>
		<?php echo JHtml::_('bootstrap.endTab'); ?>

		

		<?php echo JHtml::_('bootstrap.endTabSet'); ?>

		<input type="hidden" name="task" value=""/>
		<?php echo JHtml::_('form.token'); ?>

	</div>
</form>
