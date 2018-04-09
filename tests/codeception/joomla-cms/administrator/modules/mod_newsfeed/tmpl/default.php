<?php 
// No direct access
defined('_JEXEC') or die; 
// // Import CSS
// $document = JFactory::getDocument();
// $document->addStyleSheet('http://localhost:9000/startbootstrap-sb-admin/vendor/bootstrap/css/bootstrap.min.css');
// $document->addScript('//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js');

foreach ($photos as $key => $value) {
  # code...
  // var_dump($value['1']);
}
?>

<div class="row icon cards">
  <div class="col-md-8">
    <div class="mb-0 mt-4">
        <i class="fa fa-newspaper-o"></i> Photos News Feed
      </div>
        <hr class="mt-2">
          <div class="card-columns">
            <div class="card mb-3">
                <a href="#">
                <img class="card-img-top img-fluid w-100" src="https://unsplash.it/700/450?image=610" alt="">
              </a>
              <div class="card-body">
                <h6 class="card-title mb-1"><a href="#">David Miller</a></h6>
                <p class="card-text small">These waves are looking pretty good today!
                  <a href="#">#surfsup</a>
                </p>
              </div>
              <hr class="my-0">
              <!-- <div class="card-footer small text-muted">Posted 32 mins ago</div> -->
              </div>
              <div class="card mb-3">
                <a href="#">
                <img class="card-img-top img-fluid w-100" src="https://unsplash.it/700/450?image=610" alt="">
              </a>
              <div class="card-body">
                <h6 class="card-title mb-1"><a href="#">David Miller</a></h6>
                <p class="card-text small">These waves are looking pretty good today!
                  <a href="#">#surfsup</a>
                </p>
              </div>
              <hr class="my-0">
              </div>
            </div>
            <div class="card-footer small text-muted">Updated <?php $date = new DateTime(); echo date_format($date,"l, F j, Y H:i:s A");?></div>
  </div>

  <div class="col-md-4">
    <div class="card mb-3">
      <div class="card-header">
              <i class="fa fa-bell-o"></i> Outlet Visits</div>
              <div class="list-group list-group-flush small">
                <?php 
                  // foreach ($locations as $key => $value) {
                    foreach ($locations as $results) {
                      // foreach($locations as $key => $value) {
                    # code...
                    // var_dump($results);
                        // echo "<div>". $key . " : " . $value ."</div>";
                  // }
                ?>
              <a class="list-group-item list-group-item-action" href="index.php?option=com_location_visits">
                <div class="media">
                  <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/45x45" alt="">
                  <div class="media-body">
                    <strong><?php echo $results->name;?></strong> visited 
                    <strong><?php echo $results->storename;?> Outlet</strong>.
                    <div class="text-muted smaller">
                      <?php //echo $results->lastvisitDate;  
                     $diff  = date_diff( date_create($results->lastvisitDate), date_create() );
                     // var_dump($diff); http://webdevzoom.com/calculate-date-time-difference-php/
                     echo $diff->format('Visited %d days, %h hours and  %i minutes ago');

//                      echo time_elapsed_string('2013-05-01 00:22:35');
// echo time_elapsed_string('@1367367755'); # timestamp input
// echo time_elapsed_string('2013-05-01 00:22:35', true);
                    ?> <!-- - 5m ago --></div>
                  </div>
                </div>
              </a>
              <?php
                // }
              }
              ?> 
              <a class="list-group-item list-group-item-action" href="index.php?option=com_location_visits">View all activity...</a>
            </div>
            <div class="card-footer small text-muted">Updated <?php $date = new DateTime(); echo date_format($date,"l, F j, Y H:i:s A");?></div>
    </div>
  </div>

</div>