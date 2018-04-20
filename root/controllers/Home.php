<?php 
defined('BASEPATH') OR exit('No direct script access allowed');
require_once(APPPATH.'controllers/Default_Controller.php');

/**
*    网站首页
*/
class Home extends Default_Controller
{
	function __construct()
	{
		parent::__construct();
		$this->load->model('public_model');
	}

	//登陆界面
	function index(){

		//获取用户信息
		// var_dump($)
		$power = $this->public_model->select_info('admin_user_group','gid',$this->session->users['gId']);

		$this->session->set_userdata('menus',$power['perm']);

		$data['menu'] = 'index';
		$this->load->view('index.html',$data);
	}

	//囚牛
	function qiniu(){
	
		$this->load->library('Qiniu');
		$accessKey = "qjWkScOlHQsxnSMyAYScOwCBgWljlwaOuqMmXAg2";
		$secretKey = "hj-sLlpzxyKIbGd4T97iXQscj9UG2-Yx2siA0kXg";
		$bucket = "hengjiyuan";


		$auth = new Qiniu\Auth($accessKey, $secretKey);

		$token = $auth->uploadToken($bucket);

		//上传文件的本地路径
		$filePath = 'upload/car/18-04-19_184520.png';
		$key = '2313213132.jpg';
		$uploadMgr = new Qiniu\Storage\UploadManager();

		list($ret, $err) = $uploadMgr->putFile($token, $key, $filePath);
		echo "\n====> putFile result: \n";
		if ($err !== null) {
			var_dump($err);
		} else {
			echo $ret['key'];

		}
	}


	//修改数据配置信息
	function configure(){
		if($_POST){
			$data = $this->input->post();
			foreach ($data as $k => $v) {
				$this->public_model->updata($this->conf,'name',$k,array('value'=>$v));
			}
			$arr = array(
	                'log_url'=>$this->uri->uri_string(),
	                'user_id'=> $this->session->users['id'],
	                'username'=>$this->session->users['username'],
	                'log_ip'=>get_client_ip(),
	                'log_status'=>'1',
	                'log_message'=>"修改数据调整信息",
	        );
            add_system_log($arr);
            echo "<script>alert('操作成功！');window.location.href='".site_url('/Home/configure')."'</script>";exit;
		}else{
			$data['menu'] = 'configure';
			//配置
			$this->load->view('dataAdjust.html',$data);
		}
	}

	//
	function systemSeo(){
		if($_POST){
			$data = $this->input->post();
			foreach ($data as $k => $v) {
				$this->public_model->updata($this->conf,'name',$k,array('value'=>$v));
			}
			$arr = array(
	                'log_url'=>$this->uri->uri_string(),
	                'user_id'=> $this->session->users['id'],
	                'username'=>$this->session->users['username'],
	                'log_ip'=>get_client_ip(),
	                'log_status'=>'1',
	                'log_message'=>"修改网站信息",
	        );
            add_system_log($arr);
            echo "<script>alert('操作成功！');window.location.href='".site_url('/Home/systemSeo')."'</script>";exit;
		}else{
			$data['menu'] = 'systemSeo';
			//配置
			$this->load->view('systemSeo.html',$data);
		}
	}




}
 ?>