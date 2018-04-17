<?php 
defined('BASEPATH') OR exit('No direct script access allowed');
require_once(APPPATH.'controllers/Default_Controller.php');

/**
*    网站首页
*/
class Home extends Default_Controller
{
	public $classliy = 'wxCatchv1_biz_classify';//类别
	public $wechat = 'wxCatchv1_biz';//公众号表
	public $content = 'wxCatchv1_biz_news';//公众号表
	public $conf = 'wxCatchv1_system_configure';//公众号表
	public $table = "wxCatchv1_system_nav";
	public $member = "wxCatchv1_member_user";
	public $spread = "wxCatchv1_biz_spread";//推广
    public $activity = "wxCatchv1_biz_activity"; //活动
	function __construct()
	{
		parent::__construct();
		$this->load->model('public_model');
	}

	//登陆界面
	function index(){

		//获取用户信息
		// $users = $this->session->users;

		// //判断是否是超级管理员
		// if($users['super_admin'] == '1'){
		// 	//获取所有权限
		// 	$list = $this->public_model->select($this->table,'id');
		// 	$menus = subtree($list);
        // 	//$power = json_encode(subtree($list),JSON_UNESCAPED_UNICODE);
        // 	// $this->session->users['power'] = json_encode($menus);
		// }else{
		// 	//获取用户组权限
		// 	$power = $this->public_model->select_info('wxCatchv1_system_group','gid',$users['g_id']);
		// 	if(!empty($power)){
		// 		$plateid = json_decode($power['perm'],true);
		// 		foreach ($plateid as $key => $value) {
	    //             $query = $this->db->where('id',$value)->get($this->table);
	    //             $menu[] = $query->row_array();
	    //         }
	    //         $arr = array();
	          
	    //         $menus = subtree($menu);
	    //     }else{
        //     	echo "<script>alert('该用户权限为空，请联系超级管理员！');window.location.href='".site_url('/Login/index')."'</script>";exit;

	    //     }
		// }
		
		// $menus_data = array();
		
		// foreach($menus as $key=>$value){
		// 	if($value['status'] == '1'){
		// 		if($value['pid'] == '0'){
		// 			$menus_data[$value['id']]['value'] = $value;
		// 		}else{
		// 			$menus_data[$value['pid']]['value']['chick'][] = $value;
		// 		}
		// 	}
		// }


		// $this->session->set_userdata('menus',json_encode($menus_data));



		$this->load->view('index.html');
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