<?php 

function search_member($time,$endtime,$status,$sear){
	 $table = "wxCatchv1_member_user";
	 $CI = &get_instance();
	 $res = '';

	 if(!empty($time) && empty($status) && empty($sear)){
	 	$query = $CI->db->where('createTime >=',$time)->where('createTime <=',$endtime)->order_by('createTime','desc')->get($table);
	 	$res = $query->result_array();
	 }else if(empty($time) && !empty($status) && empty($sear)){
	 	$query = $CI->db->where('status',$status)->order_by('createTime','desc')->get($table);
	 	$res = $query->result_array();
	 }else if(empty($time) && empty($status) && !empty($sear)){
	 	$query = $CI->db->like('email',$sear,'both')->or_like('username',$sear,'both')->order_by('createTime','desc')->get($table);
	 	$res = $query->result_array();
	 }else if(!empty($time) && !empty($status) && empty($sear)){
	 	$query = $CI->db->where('createTime >=',$time)->where('createTime <=',$endtime)->where('status',$status)->order_by('createTime','desc')->get($table);
	 	$res = $query->result_array();
	 }else if(!empty($time) && empty($status) && !empty($sear)){
	 	$query = $CI->db->where('createTime >=',$time)->where('createTime <=',$endtime)->like('email',$sear,'both')->or_like('username',$sear,'both')->order_by('createTime','desc')->get($table);
	 	$res = $query->result_array();
	 }else if(empty($time) && !empty($status) && !empty($sear)){
	 	$query = $CI->db->where('status',$status)->like('email',$sear,'both')->or_like('username',$sear,'both')->order_by('createTime','desc')->get($table);
	 	$res = $query->result_array();
	 }else if(!empty($time) && !empty($status) && !empty($sear)){
	 	$query = $CI->db->where('createTime >=',$time)->where('createTime <=',$endtime)->where('status',$status)->like('email',$sear,'both')->or_like('username',$sear,'both')->order_by('createTime','desc')->get($table);
	 	$res = $query->result_array();
	 }else if(empty($time) && empty($status) && empty($sear)){
	 	$query = $CI->db->order_by('createTime','desc')->get($table);
	 	$res = $query->result_array();
	 }
	 return $res;
}
function search_member_page($time,$endtime,$status,$sear,$page,$size){
	 $table = "wxCatchv1_member_user";
	 $CI = &get_instance();
	 $res = '';

	 if(!empty($time) && empty($status) && empty($sear)){
	 	$query = $CI->db->where('createTime >=',$time)->where('createTime <=',$endtime)->order_by('createTime','desc')->limit($page,$size)->get($table);
	 	$res = $query->result_array();
	 }else if(empty($time) && !empty($status) && empty($sear)){
	 	$query = $CI->db->where('status',$status)->order_by('createTime','desc')->limit($page,$size)->get($table);
	 	$res = $query->result_array();
	 }else if(empty($time) && empty($status) && !empty($sear)){
	 	$query = $CI->db->like('email',$sear,'both')->or_like('username',$sear,'both')->order_by('createTime','desc')->limit($page,$size)->get($table);
	 	$res = $query->result_array();
	 }else if(!empty($time) && !empty($status) && empty($sear)){
	 	$query = $CI->db->where('createTime >=',$time)->where('createTime <=',$endtime)->where('status',$status)->order_by('createTime','desc')->limit($page,$size)->get($table);
	 	$res = $query->result_array();
	 }else if(!empty($time) && empty($status) && !empty($sear)){
	 	$query = $CI->db->where('createTime >=',$time)->where('createTime <=',$endtime)->like('email',$sear,'both')->or_like('username',$sear,'both')->order_by('createTime','desc')->limit($page,$size)->get($table);
	 	$res = $query->result_array();
	 }else if(empty($time) && !empty($status) && !empty($sear)){
	 	$query = $CI->db->where('status',$status)->like('email',$sear,'both')->or_like('username',$sear,'both')->order_by('createTime','desc')->limit($page,$size)->get($table);
	 	$res = $query->result_array();
	 }else if(!empty($time) && !empty($status) && !empty($sear)){
	 	$query = $CI->db->where('createTime >=',$time)->where('createTime <=',$endtime)->where('status',$status)->or_like('email',$sear,'both')->like('username',$sear,'both')->order_by('createTime','desc')->limit($page,$size)->get($table);
	 	$res = $query->result_array();
	 }else if(empty($time) && empty($status) && empty($sear)){
	 	$query = $CI->db->order_by('createTime','desc')->limit($page,$size)->get($table);
	 	$res = $query->result_array();
	 }
	 return $res;
}

//搜索推广位
function search_spread($sear,$status,$type){
	$table = "wxCatchv1_biz_spread";
	$CI = &get_instance();
	$res = '';

	if(!empty($sear) && empty($status) && empty($type)){
		$query  = $CI->db->where('bizName',$sear)->or_where('bizId',$sear)->order_by('endtime','desc')->get($table);
		$res = $query->result_array();
	}else if(empty($sear) && !empty($status) && empty($type)){
		$query = $CI->db->where('status',$status)->order_by('endtime','desc')->get($table);
		$res = $query->result_array();
	}else if(empty($sear) && empty($status) && !empty($type)){
		$query = $CI->db->where('type',$type)->order_by('endtime','desc')->get($table);
		$res = $query->result_array();
	}else if(!empty($sear) && !empty($status) && empty($type)){
		$query  = $CI->db->where('bizName',$sear)->or_where('bizId',$sear)->where('status',$status)->order_by('endtime','desc')->get($table);
		$res = $query->result_array();
	}else if(!empty($sear) && empty($status) && !empty($type)){
		$query  = $CI->db->where('bizName',$sear)->or_where('bizId',$sear)->where('type',$type)->order_by('endtime','desc')->get($table);
		$res = $query->result_array();
	}else if(empty($sear) && !empty($status) && !empty($type)){
		$query  = $CI->db->where('status',$status)->where('type',$type)->order_by('endtime','desc')->get($table);
		$res = $query->result_array();
	}else if(!empty($sear) && !empty($status) && !empty($type)){
		$query  = $CI->db->where('bizName',$sear)->or_where('bizId',$sear)->where('status',$status)->where('type',$type)->order_by('endtime','desc')->get($table);
		$res = $query->result_array();
	}else if(empty($sear) && empty($status) && empty($type)){
		$query  = $CI->db->order_by('endtime','desc')->get($table);
		$res = $query->result_array();
	}
	return $res;
}
function search_spreadPage($sear,$status,$type,$page,$size){
	$table = "wxCatchv1_biz_spread";
	$CI = &get_instance();
	$res = '';

	if(!empty($sear) && empty($status) && empty($type)){
		$query  = $CI->db->where('bizName',$sear)->or_where('bizId',$sear)->order_by('endtime','desc')->limit($page,$size)->get($table);
		$res = $query->result_array();
	}else if(empty($sear) && !empty($status) && empty($type)){
		$query = $CI->db->where('status',$status)->order_by('endtime','desc')->limit($page,$size)->get($table);
		$res = $query->result_array();
	}else if(empty($sear) && empty($status) && !empty($type)){
		$query = $CI->db->where('type',$type)->order_by('endtime','desc')->limit($page,$size)->get($table);
		$res = $query->result_array();
	}else if(!empty($sear) && !empty($status) && empty($type)){
		$query  = $CI->db->where('bizName',$sear)->or_where('bizId',$sear)->where('status',$status)->order_by('endtime','desc')->limit($page,$size)->get($table);
		$res = $query->result_array();
	}else if(!empty($sear) && empty($status) && !empty($type)){
		$query  = $CI->db->where('bizName',$sear)->or_where('bizId',$sear)->where('type',$type)->order_by('endtime','desc')->limit($page,$size)->get($table);
		$res = $query->result_array();
	}else if(empty($sear) && !empty($status) && !empty($type)){
		$query  = $CI->db->where('status',$status)->where('type',$type)->order_by('endtime','desc')->limit($page,$size)->get($table);
		$res = $query->result_array();
	}else if(!empty($sear) && !empty($status) && !empty($type)){
		$query  = $CI->db->where('bizName',$sear)->or_where('bizId',$sear)->where('status',$status)->where('type',$type)->order_by('endtime','desc')->limit($page,$size)->get($table);
		$res = $query->result_array();
	}else if(empty($sear) && empty($status) && empty($type)){
		$query  = $CI->db->order_by('endtime','desc')->limit($page,$size)->get($table);
		$res = $query->result_array();
	}
	return $res;
}



 ?>