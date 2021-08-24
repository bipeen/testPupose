<?php 
	//final price including GST
	$amountIncGST=5;
	//GST percent
	$gstPercent=6;
	//basic equation is $amtGst+($amtGst*$gstPercent/100)=$amountIncGST;
	$amtGst=$amountIncGST/(1+$gstPercent/100);
	//round the price in 2 digit after decimal
	echo round($amtGst,2);
?>	