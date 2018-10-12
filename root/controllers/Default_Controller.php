<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

/**
*    公用父类控制器
*/
class Default_Controller extends CI_Controller
{
	
	function __construct()
	{
		parent::__construct();
		date_default_timezone_set("Asia/Shanghai");
		$this->load->helper('public_helper');
		define('ROOTCSS', base_url('/assets'));
		define('name','噢唛嘎车位管理系统');
		$this->load->model('public_model');
		if (!isset($this->session->users)) {
			echo "<script>alert('您还没有登陆！');window.location.href='" . site_url('/Login/index') . "';</script>";
			exit;
		}
		// $a = '345';
		//判断是否
		//获取权限
		// $url = $this->uri->uri_string();
		$url = $this->uri->segment('1').'/'.$this->uri->segment('2');

		//获取
		$usergroup = $this->public_model->select_info('hj_admin_user_group','gid',$this->session->users['gId']);
		// var_dump($usergroup);
		if(deep_in_array($url, json_decode($usergroup['user_power'], true)) != true){
			echo "<script>alert('你没有权限！');javascript:history.go(-1)</script>";exit;
		}

	
		
	}


}



 ?>