<?php 
// No direct access
defined('_JEXEC') or die; 
// // Import CSS
// $document = JFactory::getDocument();
// $document->addStyleSheet('http://localhost:9000/startbootstrap-sb-admin/vendor/bootstrap/css/bootstrap.min.css');
// $document->addScript('//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js');
?>
<?php //echo $hello; ?>
<h2 class="module-title nav-header">Dashboard</h2>
	 <hr />
<!-- Icon Cards-->
      <div class="row icon cards">
        <div class="col-xl-3 col-sm-6 mb-3">
          <div class="card text-white bg-primary o-hidden h-100">
            <div class="card-body">
              <div class="card-body-icon">
                <i class="fa fa-fw fa-map-marker"></i>
              </div>
              <div class="mr-5"><?php echo $visits; ?> Visits!</div>
            </div>
            <a class="card-footer text-white clearfix small z-1" href="index.php?option=com_location_visits">
              <span class="float-left">View Details</span>
              <span class="float-right">
                <i class="fa fa-angle-right"></i>
              </span>
            </a>
          </div>
        </div>
        <div class="col-xl-3 col-sm-6 mb-3">
          <div class="card text-white bg-warning o-hidden h-100">
            <div class="card-body">
              <div class="card-body-icon">
                <i class="fa fa-fw fa-image"></i>
              </div>
              <div class="mr-5"><?php echo $photos; ?> New Images!</div>
            </div>
            <a class="card-footer text-white clearfix small z-1" href="index.php?option=com_photos">
              <span class="float-left">View Details</span>
              <span class="float-right">
                <i class="fa fa-angle-right"></i>
              </span>
            </a>
          </div>
        </div>
        <div class="col-xl-3 col-sm-6 mb-3">
          <div class="card text-white bg-success o-hidden h-100">
            <div class="card-body">
              <div class="card-body-icon">
                <i class="fa fa-fw fa-check-square"></i>
              </div>
              <div class="mr-5"><?php echo $issues; ?> Quality Issues!</div>
            </div>
            <a class="card-footer text-white clearfix small z-1" href="index.php?option=com_qissues">
              <span class="float-left">View Details</span>
              <span class="float-right">
                <i class="fa fa-angle-right"></i>
              </span>
            </a>
          </div>
        </div>
        <div class="col-xl-3 col-sm-6 mb-3">
          <div class="card text-white bg-danger o-hidden h-100">
            <div class="card-body">
              <div class="card-body-icon">
                <i class="fa fa-fw fa-paper-plane"></i>
              </div>
              <div class="mr-5"><?php echo $outlets; ?> Outlets</div>
            </div>
            <a class="card-footer text-white clearfix small z-1" href="index.php?option=com_outlets">
              <span class="float-left">View Details</span>
              <span class="float-right">
                <i class="fa fa-angle-right"></i>
              </span>
            </a>
          </div>
        </div>
        <small>Data for the last 12 hours</small>
      </div>