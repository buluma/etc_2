<?php
/**
 * @version    CVS: 1.0.0
 * @package    Com_Location_visits
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
$document->addStyleSheet(JUri::root() . 'media/com_location_visits/css/form.css');
//google maps api
// $document->addStyleSheet(JUri::root() . 'media/com_location_visits/css/form.css');

?>
<script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD-9tSrke72PouQMnMX-a7eZSW0jkFMBWY&callback=initMap">
    </script>


<script type="text/javascript">
	js = jQuery.noConflict();
	js(document).ready(function () {
		
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
		if (task == 'location.cancel') {
			Joomla.submitform(task, document.getElementById('location-form'));
		}
		else {
			
			if (task != 'location.cancel' && document.formvalidator.isValid(document.id('location-form'))) {
				
				Joomla.submitform(task, document.getElementById('location-form'));
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
      #map, #map-canvas-left, #map-canvas-right {
        height: 250px;
        position: relative;
    	overflow: hidden;
    	width: 100%;
    	margin-bottom: 10px;
      }
    </style>

<form
	action="<?php echo JRoute::_('index.php?option=com_location_visits&layout=edit&id=' . (int) $this->item->id); ?>"
	method="post" enctype="multipart/form-data" name="adminForm" id="location-form" class="form-validate">

	<div class="form-horizontal">
		<?php echo JHtml::_('bootstrap.startTabSet', 'myTab', array('active' => 'general')); ?>

		<?php echo JHtml::_('bootstrap.addTab', 'myTab', 'general', JText::_('COM_LOCATION_VISITS_TITLE_LOCATION', true)); ?>
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
				<?php echo $this->form->renderField('coordinates'); ?>

				<?php echo $this->form->renderField('client_modified_date'); ?>
				<?php echo $this->form->renderField('submitter'); ?>
				<?php echo $this->form->renderField('user_id'); ?>
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
				<?php echo $this->form->renderField('last_sync_date'); ?>
				<?php echo $this->form->renderField('first_insert_date'); ?>


					<?php if ($this->state->params->get('save_history', 1)) : ?>
					<div class="control-group">
						<div class="control-label"><?php echo $this->form->getLabel('version_note'); ?></div>
						<div class="controls"><?php echo $this->form->getInput('version_note'); ?></div>
					</div>
					<?php endif; ?>
				</fieldset>
			</div>
			<div class="span6">
				<fieldset class="adminform">
					<div class="control-group">
					<div class="controlsx">
						<?php

						$coordinates = $this->item->coordinates;
						$coordinatesSplit = explode(",", $coordinates);

						$lat = floatval($coordinatesSplit[0]); // case string to float
						$long =  floatval($coordinatesSplit[1]); // cast string to float

						$act_location_head = "Actual User Location: <small>Lat : ".$lat."\r\n" . "Long : ".$long."\r\n</small>";

						$outlet_location_head = "Outlet Location: <small>Lat : ".$lat."\r\n" . "Long : ".$long."\r\n</small>";

						 echo $act_location_head;

						 // echo "Long : ".$long."\r\n";

						 
						?>

						<!-- <div id="map">Map</div> -->
						<hr>
						<!-- <div id="map2">Outlet Location</div> -->
					    <script>

					      // function initMap() {
					      //   var myLatLng = {lat: <?php //echo $lat ?>, lng: <?php //echo $long ?>};

					      //   var map = new google.maps.Map(document.getElementById('map'), {
					      //     zoom: 16,
					      //     center: myLatLng
					      //   });

					      //   var marker = new google.maps.Marker({
					      //     position: myLatLng,
					      //     map: map,
					      //     title: '<?php //echo $this->item->created_on; ?>'
					      //   });
					      // }

					      //outlet map

					    </script>

					    <div class="containerx">
						  <div id="map-canvas-left">User Location</div>
						  <br>
						  <?php echo $outlet_location_head; ?>
						  <hr>
						  <div id="map-canvas-right">Store Location</div>
						</div>

					<script type="text/javascript">
						// *
						// * Two maps on the same page
						// * 2015 - en.marnoto.com
						// *

						// necessary variables
						var mapLeft, mapRight;
						var infoWindowLeft, infoWindowRight;

						// markersData variable stores the information necessary to each marker
						var markersDataLeft = [
						   {
						      lat: <?php echo $lat ?>,
						      lng: <?php echo $long ?>,
						      name: "User Name",
						      address1:"User Location",
						      address2: "Current",
						      postalCode: "Test" // don't insert comma in the last item of each marker
						  }
						   // },
						   // {
						   //    lat: 40.54955,
						   //    lng: -8.7498167,
						   //    name: "Camping Costa Velha",
						   //    address1:"Quinta dos Patos, n.º 2",
						   //    address2: "Praia da Costa Nova",
						   //    postalCode: "3830-453 Gafanha da Encarnação" // don't insert comma in the last item of each marker
						   // },
						   // {
						   //    lat: 40.6447167,
						   //    lng: -8.7129167,
						   //    name: "Camping Gafanha da Boavista",
						   //    address1:"Rua dos Balneários do Complexo Desportivo",
						   //    address2: "Gafanha da Nazaré",
						   //    postalCode: "3830-225 Gafanha da Nazaré" // don't insert comma in the last item of each marker
						   // } // don't insert comma in the last item
						];

						var markersDataRight = [
						   {
						      lat: <?php echo $lat ?>,
						      lng: <?php echo $long ?>,
						      name: "Outlet Name",
						      address1:"Outlet Location",
						      address2: "Current",
						      postalCode: "Test" // don't insert comma in the last item of each marker
						   }
						   // ,
						   // {
						   //    lat: 40.59955,
						   //    lng: -8.7498167,
						   //    name: "Camping Costa Nova",
						   //    address1:"Quinta dos Patos, n.º 2",
						   //    address2: "Praia da Costa Nova",
						   //    postalCode: "3830-453 Gafanha da Encarnação" // don't insert comma in the last item of each marker
						   // },
						   // {
						   //    lat: 40.6247167,
						   //    lng: -8.7129167,
						   //    name: "Camping Gafanha da Nazaré",
						   //    address1:"Rua dos Balneários do Complexo Desportivo",
						   //    address2: "Gafanha da Nazaré",
						   //    postalCode: "3830-225 Gafanha da Nazaré" // don't insert comma in the last item of each marker
						   // } // don't insert comma in the last item
						];

						function initialize(setMap) {

						   var mapOptions;
						   
						   if(setMap == "mapLeft") {
						      mapOptions = {
						         center: new google.maps.LatLng(-1.3605472,36.6530304),
						         zoom: 16,
						         mapTypeId: 'roadmap',
						      };
						   
						      mapLeft = new google.maps.Map(document.getElementById('map-canvas-left'), mapOptions);
						      
							   // a new Info Window is created
							   infoWindowLeft = new google.maps.InfoWindow();
							
							   // Event that closes the Info Window with a click on the map
							   google.maps.event.addListener(mapLeft, 'click', function() {
							      infoWindowLeft.close();
						   	});
						      
						   } else {
						      
						      mapOptions = {
						         center: new google.maps.LatLng(-1.3605472,36.6530304),
						         zoom: 16,
						         mapTypeId: 'roadmap',
						      };
						      
							   mapRight = new google.maps.Map(document.getElementById('map-canvas-right'), mapOptions);
						      
							   // a new Info Window is created
							   infoWindowRight = new google.maps.InfoWindow();
							
							   // Event that closes the Info Window with a click on the map
							   google.maps.event.addListener(mapRight, 'click', function() {
							      infoWindowRight.close();
						   	});
						   }

						   // Finally displayMarkers() function is called to begin the markers creation
						   displayMarkers(setMap);
						   
						   // Create second map only when initialize function is called for the first time.
						   // Second time setMap is equal to mapRight, so this condition returns false and it will not run  
						   if(setMap == "mapLeft"){
						      initialize("mapRight");   
						   }
						   
						}
						google.maps.event.addDomListener(window, 'load', function(){ initialize("mapLeft") });


						// This function will iterate over markersData array
						// creating markers with createMarker function
						function displayMarkers(setMap){
						   
						   var markersData;
						   var map;
						   
						   if(setMap == "mapLeft"){
						      markersData = markersDataLeft;
						      map = mapLeft;
						   } else {
						      markersData = markersDataRight;
						      map = mapRight;
						   }
						   
						   // this variable sets the map bounds according to markers position
						   var bounds = new google.maps.LatLngBounds();
						   
						   // for loop traverses markersData array calling createMarker function for each marker 
						   for (var i = 0; i < markersData.length; i++){

						      var latlng = new google.maps.LatLng(markersData[i].lat, markersData[i].lng);
						      var name = markersData[i].name;
						      var address1 = markersData[i].address1;
						      var address2 = markersData[i].address2;
						      var postalCode = markersData[i].postalCode;

						      createMarker(setMap, latlng, name, address1, address2, postalCode);

						      // marker position is added to bounds variable
						      bounds.extend(latlng);  
						   }

						   // Finally the bounds variable is used to set the map bounds
						   // with fitBounds() function
						   map.fitBounds(bounds);
						   map.setZoom(11);
						}

						// This function creates each marker and it sets their Info Window content
						function createMarker(setMap, latlng, name, address1, address2, postalCode){
						   
						   var map;
						   var infoWindow;
						   
						   if(setMap == "mapLeft"){
						      map = mapLeft;
						      infoWindow = infoWindowLeft;
						   } else {
						      map = mapRight;
						      infoWindow = infoWindowRight;
						   }
						   
						   var marker = new google.maps.Marker({
						      map: map,
						      position: latlng,
						      title: name
						   });

						   // This event expects a click on a marker
						   // When this event is fired the Info Window content is created
						   // and the Info Window is opened.
						   google.maps.event.addListener(marker, 'click', function() {
						      
						      // Creating the content to be inserted in the infowindow
						      var iwContent = '<div id="iw_container">' +
						            '<div class="iw_title">' + name + '</div>' +
						         '<div class="iw_content">' + address1 + '<br />' +
						         address2 + '<br />' +
						         postalCode + '</div></div>';
						      
						      // including content to the Info Window.
						      infoWindow.setContent(iwContent);

						      // opening the Info Window in the current map and at the current marker location.
						      infoWindow.open(map, marker);
						   });
						}
						</script>
					</div>
				</div>
				</fieldset>
			</div>
		</div>
		<?php echo JHtml::_('bootstrap.endTab'); ?>

		

		<?php echo JHtml::_('bootstrap.endTabSet'); ?>

		<input type="hidden" name="task" value=""/>
		<?php echo JHtml::_('form.token'); ?>

	</div>
</form>
