<?php include('session.php'); ?>
<?php include('header.php'); ?>

<style>
.zoom {
  background-color: white;
  transition: transform .2s; /* Animation */
  width=10px;
  height=10px;
  margin: auto;
}

.zoom:hover {
  transform: scale(1.5); /* (150% zoom - Note: if the zoom is too large, it will go outside of the viewport) */
}

/*khung product**/
.product {
  padding: 40px;
  border: 1px solid #4CAF50;
}
.details{
	padding:10px;
	border: 1px solid gray;
}

</style>

<body>
	<?php include('navbar.php'); ?>
	<div class="container">
		<?php include('cart_search_field.php'); ?>
		<div style="height: 80px;"></div>
		<div>
			<?php
				$inc=4;
				if(isset($_GET['id'])){
					$id = mysqli_real_escape_string($conn, $_GET['id']);
				}
				$sql = mysqli_query($conn,"SELECT * FROM product WHERE productid=$id");
				while($row=mysqli_fetch_array($sql)){
					$inc = ($inc == 4) ? 1 : $inc+1;
					if($inc == 1) echo "<div class='row'>";
			?>	
				<div class="product col-sm-10">
						<div class="col-sm-4">

								<a ><img src="../<?php if (empty($row['photo'])){echo "upload/noimage.jpg";}else{echo $row['photo'];} ?>" class="zoom"  style="width:100%;max-width:300px"></a>
								<div style="height: 10px;"></div>
							
						</div>
						<div class="col-sm-8">
							<div style="font-size: 24px;color: darkblue; line-height: 40px;">
								<strong><?php echo $row['product_name']; ?><strong>
							</div>
							<div> 
								<span style=" font-size: 24px;color: red; line-height: 40px;"  ><strong>$ <?php echo number_format($row['product_price'],2); ?></strong></span> 
							</div>
							<div><strong>Details :<strong></div>
							<div class="details">
								<?php echo $row['details']; ?>
							</div>
							<br>

							<div style="display:none;position:sticky; top:210px; left:10px;" class="well" id="cart<?php echo $row['productid']; ?>">Qty: <input type="text" style="width:40px;" id="qty<?php echo $row['productid']; ?>"> <button type="button" class="btn btn-primary btn-sm concart" value="<?php echo $row['productid']; ?>"><i class="fa fa-shopping-cart fa-fw"></i></button></div>
							
							
							<div style=" margin-right:17px;">
								<button type="button" class="btn btn-primary btn-sm addcart" value="<?php echo $row['productid']; ?>"><i class="fa fa-shopping-cart fa-fw"></i> Add to Cart</button> 
							</div>
						</div>
				</div>
				
			<?php
		if($inc == 4) echo "</div><div style='height: 30px;'></div>";
		}
		if($inc == 1) echo "<div class='col-lg-3></div><div class='col-lg-3'></div><div class='col-lg-3'></div></div>";
		if($inc == 2) echo "<div class='col-lg-3'></div><div class='col-lg-3'></div></div>";
		if($inc == 3) echo "<div class='col-lg-3'></div></div>";
		
	?>
	</div>
</div>
<?php include('script.php'); ?>
<?php include('modal.php'); ?>
<script src="custom.js"></script>
<br>
</body>

<div class="foot">
<footer>
<p> POS SYSTEM </p>
</footer>
</div>
<style> .foot{text-align: center; border: 2px solid black;}</style>

