<?php 
function searchCommision($t,$endtime,$type){
	$CI = &get_instance();
	
	if($type == '1'){
		//销售人员
		$query = $CI->db->where('isDel','0')->get('hj_sales_user');
		$sales = $query->result_array();

		foreach($sales as $v){
			
		}


	}elseif($type =='2'){

	}elseif($type =='3'){

	}elseif($type =='4'){

	}



}



 ?>