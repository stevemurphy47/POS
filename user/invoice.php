<?php
require ('fpdf/fpdf.php');

//db connection
$conn=mysqli_connect('localhost','root','');
mysqli_select_db($conn,'pos');

if(isset($_GET['id'])){
	$id = mysqli_real_escape_string($conn, $_GET['id']);
}
$sql = mysqli_query($conn,
                            "SELECT *
                             FROM 
                                sales,
                                customer,
                                product
                            WHERE salesid=$id"
);
$invoice = mysqli_fetch_array($sql);

$pdf = new FPDF ('P','mm','A4');
$pdf -> AddPage ();
$pdf->SetFont('Arial','B',14);

//Cell(width , height , text , border , end line , [align] )

$pdf->Cell(130 ,5,'POS SYSTEM',0,0);
$pdf->Cell(59 ,5,'INVOICE',0,1);//end of line

//set font to arial, regular, 12pt
$pdf->SetFont('Arial','',12);

$pdf->Cell(130 ,5,'280 An Duong Vuong',0,0);
$pdf->Cell(59 ,5,'',0,1);//end of line

$pdf->Cell(130 ,5,'District 5, Ho Chi Minh city',0,0);
$pdf->Cell(25 ,5,'Date',0,0);
$pdf->Cell(34 ,5,date("Y/m/d"),0,1);//end of line

$pdf->Cell(130 ,5,'Phone (+84) - (8) - 38352020',0,0);
$pdf->Cell(25 ,5,'Invoice #',0,0);
$pdf->Cell(34 ,5,$invoice['salesid'],0,1);//end of line

$pdf->Cell(130 ,5,'Fax (+84) - (8) - 38398946',0,0);
$pdf->Cell(25 ,5,'Customer ID : ',0,0);
$pdf->Cell(34 ,5,$invoice['userid'],0,1);//end of line

//make a dummy empty cell as a vertical spacer
$pdf->Cell(189 ,10,'',0,1);//end of line

//billing address
$pdf->Cell(100 ,5,'Bill to',0,1);//end of line

//add dummy cell at beginning of each line for indentation
$pdf->Cell(10 ,5,'',0,0);
$pdf->Cell(90 ,5,$invoice['customer_name'],0,1);

$pdf->Cell(10 ,5,'',0,0);
$pdf->Cell(90 ,5,$invoice['address'],0,1);

$pdf->Cell(10 ,5,'',0,0);
$pdf->Cell(90 ,5,$invoice['contact'],0,1);

//make a dummy empty cell as a vertical spacer
$pdf->Cell(189 ,10,'',0,1);//end of line

//invoice contents
$pdf->SetFont('Arial','B',12);

$pdf->Cell(130 ,5,'PRODUCT',1,0);
$pdf->Cell(25 ,5,'QTY',1,0);
$pdf->Cell(34 ,5,'PRICE',1,1);//end of line

$pdf->SetFont('Arial','',12);

//Numbers are right-aligned so we give 'R' after new line parameter


//--------------------
//-----TABLE----------
//--------------------

$query=mysqli_query($conn,"select * from sales_detail left join product on product.productid=sales_detail.productid where salesid=$id");
while($row=mysqli_fetch_array($query)){
    $pdf->Cell(130 ,5,$row['product_name'],1,0);
    $pdf->Cell(25 ,5,$row['sales_qty'],1,0);
    $pdf->Cell(34 ,5,$row['product_price']*$row['sales_qty'],1,1,'R');//end of line
}

//summary
$pdf->Cell(130 ,5,'',0,0);
$pdf->Cell(25 ,5,'Subtotal',0,0);
$pdf->Cell(4 ,5,'$',1,0);
$pdf->Cell(30 ,5,$invoice['sales_total'],1,1,'R');//end of line




$pdf -> Output();
?>