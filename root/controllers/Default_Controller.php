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
		// $a = '345';
		//判断是否
		if(!isset($this->session->users)){
          echo "<script>alert('您还没有登陆！');window.location.href='".site_url('/Login/index')."';</script>";
          exit;
        }
	}


}



 ?>