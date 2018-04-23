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

JHtml::addIncludePath(JPATH_COMPONENT . '/helpers/');
JHtml::_('bootstrap.tooltip');
JHtml::_('behavior.multiselect');
JHtml::_('formbehavior.chosen', 'select');

// Import CSS
$document = JFactory::getDocument();
$document->addStyleSheet(JUri::root() . 'administrator/components/com_location_visits/assets/css/location_visits.css');
$document->addStyleSheet(JUri::root() . 'media/com_location_visits/css/list.css');
//datatables
// $document->addStyleSheet('//cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css');
// $document->addStyleSheet('//cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css');
// $document->addScript('//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js');

// //export pdf
// $document->addScript('//cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js');
// $document->addScript('//cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js');
// $document->addScript('//cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js');
// $document->addScript('//cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js');
// $document->addScript('//cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js');
// $document->addScript('//cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js');
// $document->addScript('//cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js');
 $document->addScript('https://maps.googleapis.com/maps/api/js?key=AIzaSyAymgz0AXCj6ipuLijePEpi72_QcUga23Q&callback=initMap');

$user      = JFactory::getUser();
$userId    = $user->get('id');
$listOrder = $this->state->get('list.ordering');
$listDirn  = $this->state->get('list.direction');
$canOrder  = $user->authorise('core.edit.state', 'com_location_visits');
$saveOrder = $listOrder == 'a.`ordering`';

if ($saveOrder)
{
	$saveOrderingUrl = 'index.php?option=com_location_visits&task=maps.saveOrderAjax&tmpl=component';
	JHtml::_('sortablelist.sortable', 'locationList', 'adminForm', strtolower($listDirn), $saveOrderingUrl);
}

$sortFields = $this->getSortFields();
?>


<form action="<?php echo JRoute::_('index.php?option=com_location_visits&view=maps'); ?>" method="post"
	  name="adminForm" id="adminForm">
	<?php if (!empty($this->sidebar)): ?>
	<div id="j-sidebar-container" class="span2">
		<?php echo $this->sidebar; ?>
	</div>
	<div id="j-main-container" class="span10">
		<?php else : ?>
		<div id="j-main-container">
			<?php endif; ?>

            <?php echo JLayoutHelper::render('joomla.searchtools.default', array('view' => $this)); ?>

			<small class="red">Scroll Down to see the map</small>
			<div class="clearfix"></div>
			<table class="table table-striped hiddenx" id="locationList">
				<thead>
				<tr>
					<?php if (isset($this->items[0]->ordering)): ?>
						<th width="1%" class="nowrap center hidden-phone">
                            <?php echo JHtml::_('searchtools.sort', '', 'a.`ordering`', $listDirn, $listOrder, null, 'asc', 'JGRID_HEADING_ORDERING', 'icon-menu-2'); ?>
                        </th>
					<?php endif; ?>
					<th width="1%" class="hidden-phone">
						<input type="checkbox" name="checkall-toggle" value=""
							   title="<?php echo JText::_('JGLOBAL_CHECK_ALL'); ?>" onclick="Joomla.checkAll(this)"/>
					</th>
					<?php if (isset($this->items[0]->state)): ?>
						<th width="1%" class="nowrap center">
								<?php echo JHtml::_('searchtools.sort', 'JSTATUS', 'a.`state`', $listDirn, $listOrder); ?>
</th>
					<?php endif; ?>

									<th class='left'>
				<?php echo JHtml::_('searchtools.sort',  'COM_LOCATION_VISITS_LOCATIONS_ID', 'a.`id`', $listDirn, $listOrder); ?>
				</th>
				<th class='left'>
				<?php echo JHtml::_('searchtools.sort',  'COM_LOCATION_VISITS_LOCATIONS_CLIENT_ID', 'a.`client_id`', $listDirn, $listOrder); ?>
				</th>
				<th class='left'>
				<?php echo JHtml::_('searchtools.sort',  'COM_LOCATION_VISITS_LOCATIONS_COORDINATES', 'a.`coordinates`', $listDirn, $listOrder); ?>
				</th>
				<th class='left'>
				<?php echo JHtml::_('searchtools.sort',  'COM_LOCATION_VISITS_LOCATIONS_USER_ID', 'a.`user_id`', $listDirn, $listOrder); ?>
				</th>
				<th class='left'>
				<?php echo JHtml::_('searchtools.sort',  'COM_LOCATION_VISITS_LOCATIONS_STORE', 'a.`store`', $listDirn, $listOrder); ?>
				</th>
				<th class='left'>
				<?php echo JHtml::_('searchtools.sort',  'COM_LOCATION_VISITS_LOCATIONS_CREATED_ON', 'a.`created_on`', $listDirn, $listOrder); ?>
				</th>

					
				</tr>
				</thead>
				<tfoot>
				<tr>
					<td colspan="<?php echo isset($this->items[0]) ? count(get_object_vars($this->items[0])) : 10; ?>">
						<?php echo $this->pagination->getListFooter(); ?>
					</td>
				</tr>
				</tfoot>
				<tbody>
				<?php foreach ($this->items as $i => $item) :
					$ordering   = ($listOrder == 'a.ordering');
					$canCreate  = $user->authorise('core.create', 'com_location_visits');
					$canEdit    = $user->authorise('core.edit', 'com_location_visits');
					$canCheckin = $user->authorise('core.manage', 'com_location_visits');
					$canChange  = $user->authorise('core.edit.state', 'com_location_visits');
					?>
					<tr class="row<?php echo $i % 2; ?>">

						<?php if (isset($this->items[0]->ordering)) : ?>
							<td class="order nowrap center hidden-phone">
								<?php if ($canChange) :
									$disableClassName = '';
									$disabledLabel    = '';

									if (!$saveOrder) :
										$disabledLabel    = JText::_('JORDERINGDISABLED');
										$disableClassName = 'inactive tip-top';
									endif; ?>
									<span class="sortable-handler hasTooltip <?php echo $disableClassName ?>"
										  title="<?php echo $disabledLabel ?>">
							<i class="icon-menu"></i>
						</span>
									<input type="text" style="display:none" name="order[]" size="5"
										   value="<?php echo $item->ordering; ?>" class="width-20 text-area-order "/>
								<?php else : ?>
									<span class="sortable-handler inactive">
							<i class="icon-menu"></i>
						</span>
								<?php endif; ?>
							</td>
						<?php endif; ?>
						<td class="hidden-phone">
							<?php echo JHtml::_('grid.id', $i, $item->id); ?>
						</td>
						<?php if (isset($this->items[0]->state)): ?>
							<td class="center">
								<?php echo JHtml::_('jgrid.published', $item->state, $i, 'locations.', $canChange, 'cb'); ?>
							</td>
						<?php endif; ?>

										<td>

					<?php echo $item->id; ?>
				</td>				
				<!-- <td> -->
				<?php /*if (isset($item->checked_out) && $item->checked_out && ($canEdit || $canChange)) : ?>
					<?php echo JHtml::_('jgrid.checkedout', $i, $item->uEditor, $item->checked_out_time, 'locations.', $canCheckin); ?>
				<?php endif; ?>
				<?php if ($canEdit) : ?>
					<a href="<?php echo JRoute::_('index.php?option=com_location_visits&task=location.edit&id='.(int) $item->id); ?>">
					<?php echo $this->escape($item->client_id); ?></a>
				<?php else : ?>
					<?php echo $this->escape($item->client_id); ?>
				<?php endif;*/ ?>

				<!-- </td>				 -->
				<td>
					<?php echo $item->client_id; ?>
				</td>
				<td>
					<?php echo $item->coordinates; ?>
				</td>
				<td>

					<?php echo $item->user_id; ?>
				</td>				
				<td>
					<?php echo $item->store; ?>
				</td>				<td>

					<?php echo $item->created_on; ?>
				</td>

					</tr>
				<?php endforeach; ?>
				</tbody>
			</table>

			<input type="hidden" name="task" value=""/>
			<input type="hidden" name="boxchecked" value="0"/>
            <input type="hidden" name="list[fullorder]" value="<?php echo $listOrder; ?> <?php echo $listDirn; ?>"/>
			<?php echo JHtml::_('form.token'); ?>
			
			<!-- Locations Map -->
			<h4>Outlet Visit Map View</h4>
			<hr>
				<div class="map">
					<!-- map here -->
					<!-- <div id="map"></div> -->

					<div id="map-canvas" style="height: 500px; width: auto;">
				</div>
				<br />
			<!-- Locations map End -->

			<?php
				// foreach ($this->items as $key => $value) {
				// 	# code...
				// 	$name = $value->user_id;
				// 	$cords = $value->coordinates;
				// 	$coordinatesSplit = explode(",", $cords);

			 //        $latitude = floatval($coordinatesSplit[0]); // case string to float
			 //        $longitude =  floatval($coordinatesSplit[1]); // cast string to float
				// 	var_dump($value);
				// 	$locations[]=array( 'name'=>$name, 'lat'=>$latitude, 'lng'=>$longitude, 'lnk'=>$link );
				// 	// print_r($locations);
				// 	$data3 = array( $locations );
				// 	// echo json_encode( $data2 );
				// }
				$locations=array(); 

				foreach ($this->items as $i => $item) {
				$idd = $item->id;
				$name = $item->user_id;
				$cords = $item->coordinates;
				$coordinatesSplit = explode(",", $cords);

		        $latitude = floatval($coordinatesSplit[0]); // case string to float
		        $longitude =  floatval($coordinatesSplit[1]); // cast string to float
				// $latitude = 0.0;
				// $longitude = 7.0;
				$outlet = $item->store;
				$link = 'hgh';
				$locations[]=array( 'name'=>$name, 'lat'=>$latitude, 'lng'=>$longitude, 'lnk'=>$outlet );
				// print_r($locations);
				}
			?>

			
		</div>
</form>



<script>
	//export function
	// jQuery(document).ready(function() {
	//     jQuery('#locationList').DataTable( {
	//         dom: 'Bfrtip',
	//         buttons: [
	//             'copy', 'csv', 'excel', 'pdf', 'print'
	//         ]
	//     } );
	// } );

	//first map
	// var map;
 //      function initMap() {
 //        map = new google.maps.Map(document.getElementById('map'), {
 //          center: {lat: -1.3571565, lng: 36.6503689},
 //          zoom: 8
 //        });
 //      };

    window.toggleField = function (id, task, field) {

        var f = document.adminForm, i = 0, cbx, cb = f[ id ];

        if (!cb) return false;

        while (true) {
            cbx = f[ 'cb' + i ];

            if (!cbx) break;

            cbx.checked = false;
            i++;
        }

        var inputField   = document.createElement('input');

        inputField.type  = 'hidden';
        inputField.name  = 'field';
        inputField.value = field;
        f.appendChild(inputField);

        cb.checked = true;
        f.boxchecked.value = 1;
        window.submitform(task);

        return false;
    };

</script>
<!-- <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAymgz0AXCj6ipuLijePEpi72_QcUga23Q&callback=initMap"
    async defer> </script> -->

<script type="text/javascript">
    var map;
    var Markers = {};
    var infowindow;
    var locations = [
        <?php for($i=0;$i<sizeof($locations);$i++){ $j=$i+1;?>
        [
            'Location Visit',
            // '<p><a href="<?php //echo $locations[0]['lnk'];?>">Book this Person Now</a></p>',
            '<p>User: <?php echo $locations[0]['name'];?></p>',
            <?php echo $locations[$i]['lat'];?>,
            <?php echo $locations[$i]['lng'];?>,
            0
        ]<?php if($j!=sizeof($locations))echo ","; }?>
    ];

    var origin = new google.maps.LatLng(locations[0][2], locations[0][3]);
    function initialize() {
      var mapOptions = {
        zoom: 9,
        center: origin
      };
      map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
        infowindow = new google.maps.InfoWindow();
        for(i=0; i<locations.length; i++) {
            var position = new google.maps.LatLng(locations[i][2], locations[i][3]);
            var marker = new google.maps.Marker({
                position: position,
                map: map,
            });
            google.maps.event.addListener(marker, 'click', (function(marker, i) {
                return function() {
                    infowindow.setContent(locations[i][1]);
                    infowindow.setOptions({maxWidth: 200});
                    infowindow.open(map, marker);
                }
            }) (marker, i));
            Markers[locations[i][4]] = marker;
        }
        locate(0);
    }
    function locate(marker_id) {
        var myMarker = Markers[marker_id];
        var markerPosition = myMarker.getPosition();
        map.setCenter(markerPosition);
        google.maps.event.trigger(myMarker, 'click');
    }
    google.maps.event.addDomListener(window, 'load', initialize);
    </script>



<style type="text/css">
	input#filter_search.js-stools-search-string{
		display: inline-block;
		line-height: 50px;
    padding: 13px;
	}

	div#map {
    position: relative;
    overflow: hidden;
    height: 444px;
    /* width: 56%; */
	}
	small.red{
		color: red;
		font-weight: bold;
	}
</style>