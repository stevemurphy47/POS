
<?php include('session.php'); ?>
<?php include('header.php'); ?>



<?php $cat=$_GET['cat']; ?>
<body>
<div id="wrapper">
<?php include('navbar.php'); ?>
<div style="height:50px;"></div>
<div id="page-wrapper">



<div class="container-fluid">
<!-- Main content -->
<section class="content">
      <div class="container-fluid">
        <!-- Small boxes (Stat box) -->
      <div class="row">
      <?php
        $sql = mysqli_query($conn,"select SUM(sales_total) as sold from sales");
        $sales = mysqli_fetch_array($sql);
		    $query=mysqli_query($conn," select SUM(product_qty) as total,category_name 
                                    from product, category
                                    where category.categoryid=product.categoryid
                                    group by product.categoryid");
		    while($row=mysqli_fetch_array($query) ){
            		
			      ?>
				        
                  <div class="col-lg-3 col-6">
                    <!-- small box -->
                    <div class="small-box bg-info">
                      <div class="inner">
                        <h3>
                          <?php
                            echo $row['total'];
                          ?>
                        </h3>
                        <p>
                          <?php
                            echo $row['category_name'];
                          ?>
                        </p>
                    </div>
                    <div class="icon">
                      <i class="ion ion-bag"></i>
                    </div>
              
                  </div>
                </div>
                <!-- ./col -->
			      <?php
		    }
          
	    ?>
                  <div class="col-lg-3 col-6">
                    <!-- small box -->
                    <div class="small-box bg-info">
                      <div class="inner">
                        <h3>
                          <?php
                          $format= number_format( $sales ['sold']);
                             echo $format;
                          ?>
                        </h3>
                        <p>
                          Total Sales
                        </p>
                    </div>
                    <div class="icon">
                      <i class="ion ion-bag"></i>
                    </div>
              
                  </div>
                </div>
                <!-- ./col -->
      
       
        
<?php 
//index.php
$connect = mysqli_connect("localhost", "root", "", "pos");
$query = "SELECT * FROM product";
$result = mysqli_query($connect, $query);
$chart_data = '';
while($row = mysqli_fetch_array($result))
{
 $chart_data .= "{ name:'".$row["product_name"]."', price:".$row["product_price"].", qty:".$row["product_qty"]."}, ";
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
   <h3 align="center">PRODUCT</h3>   
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
 xkey:'name',
 ykeys:[ 'qty'],
 labels:[ 'qty'],
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