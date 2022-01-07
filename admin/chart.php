<?php include('session.php'); ?>
<?php include('header.php'); ?>

<body>
<div id="wrapper">
<?php include('navbar.php'); ?>
<div style="height:50px;"></div>
<div id="page-wrapper">




<?php 
//index.php
$connect = mysqli_connect("localhost", "root", "", "pos");
$query = "SELECT * FROM sales";
$result = mysqli_query($connect, $query);
$chart_data = '';
while($row = mysqli_fetch_array($result))
{
 $chart_data .= "{ time:'".$row["sales_date"]."', price:".$row["salesid"].", total:".$row["sales_total"]."}, ";
}
$chart_data = substr($chart_data, 0, -2);
?>


<!DOCTYPE html>
<html>
 <head>
  <title>chart  </title>
  <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
  <script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
  <script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
  
 </head>
 <body>
  <br /><br />
  <div class="container" style="width:1000px;">
   <h2 align="center">CHART</h2>
   <h3 align="center">TIME AND TOTAL SALE </h3>   
   <br /><br />
   <div id="chart"></div>
  </div>
 </body>
</html>

<script>
Morris.Bar//Bar,Area,Line
({
 element : 'chart',
 data:[<?php echo $chart_data; ?>],
 xkey:'time',
 ykeys:[ 'total'],
 labels:[ 'total'],
 hideHover:'auto',
 //stacked:true
});
</script>


</div>
</div>
<?php include('script.php'); ?>
<?php include('modal.php'); ?>
</body>

<div class="foot">

</div>

<!---->