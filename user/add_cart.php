<?php

include('session.php');
if(isset($_POST['cart'])){
    $id=$_POST['id'];
    $qty=$_POST['qty'];
if($qty>0){//This Condition work for you
	
    $query=mysqli_query($conn,"select product_qty from product where productid='$id'");
$result=mysqli_fetch_object($query);
if($result->product_qty < $qty){
   echo 'Input must be lower than the stocks';
} else{
        $query=mysqli_query($conn,"select * from cart where productid='$id' and userid='".$_SESSION['id']."'");
        if (mysqli_num_rows($query)>0){
            echo "Product already on your cart!";
        }
        else{
            mysqli_query($conn,"insert into cart (userid, productid, qty) values ('".$_SESSION['id']."', '$id', '$qty')");
        }
  }
}
}

?>