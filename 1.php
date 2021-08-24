<?php 
	
	$mysqli = new mysqli("localhost","root","","test_kunyo");
	global $mysqli ;
	// Check connection
	if ($mysqli -> connect_errno) {
	  echo "Failed to connect to MySQL: " . $mysqli -> connect_error;
	  exit();
	}
	//function called on confirming the order after payment acceptance
	function confirmOrder(){
		//total order amount passed
		$totalOrder=231.99;
		//current cutomer id
		$customerId=23;
		//current order id
		$orderId=23111;
		//currency type
		$currencyType='USD';//'USD','NPR'
		rewardCustomer($totalOrder,$customerId,$currencyType,$orderId);
	}

	//function for exchange
	function conversionRate($amount=''){
		return floor($amount/118.68);
	}

	//function to store reward in db
	function rewardCustomer($totalOrder,$customerId,$currencyType,$orderId){
		global $mysqli;
		//if the currency is not USD below function convert to USD
		if($currencyType=='NPR'){
			$rewardPoint=conversionRate($totalOrder);
		}else{
			//remove the decimal so that the point is stored in integer
			$rewardPoint=floor($totalOrder);
		}
		//award date same as ordered date
		$awardedDate=date("Y-m-d");
		//adding one year to the ordered date as expiry date
		$expiryDate=date('Y-m-d', strtotime('+1 year', strtotime($awardedDate)));
		//query to insert into DB
		$sqlReward='insert into tbl_reward_customer (order_id,customer_id,reward_amount,expiry_date,awarded_date) values('.$orderId.','.$customerId.','.($rewardPoint/100).',"'.$expiryDate.'","'.$awardedDate.'")';
		mysqli_query($mysqli,$sqlReward);
		//the field values of reward_amount is the amount to be credited as discount in next order

		echo "Inserted Reward- ".$rewardPoint/100;
	}

	confirmOrder();


?>