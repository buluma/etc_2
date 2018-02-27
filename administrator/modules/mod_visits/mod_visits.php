<?php //defined('_JEXEC') or die; 
// No direct access
defined('_JEXEC') or die;
// Include the syndicate functions only once
require_once dirname(__FILE__) . '/helper.php';

$hello = modVisitsHelper::getHello($params);
require JModuleHelper::getLayoutPath('mod_visits');

?>

<div class="well well-small">
	<h2 class="module-title nav-header">Outlet Visits</h2>
	<!-- <hr /> -->
<iframe class="row-stripedx" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3988.693333043451!2d36.65070694985462!3d-1.3606457990027494!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x182f031ffc00ecfd%3A0xaeaf3c30be14b8bf!2sEngaji+Apartments!5e0!3m2!1sen!2ske!4v1519697862723" width="919" height="450" frameborder="0" style="border:1" allowfullscreen></iframe>	
</div>