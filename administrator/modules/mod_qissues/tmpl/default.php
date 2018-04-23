<?php 
// No direct access
defined('_JEXEC') or die; 
// // Import CSS
// $document = JFactory::getDocument();
// $document->addStyleSheet('http://localhost:9000/startbootstrap-sb-admin/vendor/bootstrap/css/bootstrap.min.css');
// $document->addScript('//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js');
?>
<?php //echo $hello; ?>
<!-- <h2 class="module-title nav-header">Dashboard</h2> -->
	 <hr />
      <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
       <div id="top_x_div" style="width: 900px; height: 500px;"></div>
   
      <script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawStuff);

      function drawStuff() {
        var data = new google.visualization.arrayToDataTable([
          ['Opening Move', 'Percentage'],
          ["King's pawn (e4)", 44],
          ["Queen's pawn (d4)", 31],
          ["Knight to King 3 (Nf3)", 12],
          ["Queen's bishop pawn (c4)", 10],
          ['Other', 3]
        ]);

        var options = {
          title: 'Quality Issues',
          width: 900,
          legend: { position: 'none' },
          chart: { title: 'Quality Issues',
                   subtitle: 'popularity by percentage' },
          bars: 'horizontal', // Required for Material Bar Charts.
          axes: {
            x: {
              0: { side: 'top', label: 'Percentage'} // Top x-axis.
            }
          },
          bar: { groupWidth: "90%" }
        };

        var chart = new google.charts.Bar(document.getElementById('top_x_div'));
        chart.draw(data, options);
      };
      </script>