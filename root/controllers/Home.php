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

	
		$data['menu'] = 'index';
		$this->load->view('index.html',$data);
	}


	// banner
	function bannerList(){
		$data['banners'] = $this->public_model->select('system_banner','createTime','desc');
		$data['menu'] = array('system', 'bannerList');
		$this->load->view('bannerList.html', $data);
	}

	//新增banner
	function addBanner(){
		if($_POST){
			$data = $this->input->post();
			if (!empty($_FILES['file']['name'])) {
				$config['upload_path'] = 'upload/car/';
				$config['allowed_types'] = 'gif|jpg|png|jpeg';
				$config['max_size'] = 5120;
				$config['file_name'] = date('y-m-d_His');
				$this->load->library('upload', $config);
                // 上传
				if (!$this->upload->do_upload('file')) {
					echo "<script>alert('文件上传失败！');history.back(-1);</script>";
					exit;
				} else {
					$logo = 'upload/car/' . $this->upload->data('file_name');
					$data['bannerUrl'] = qiniu($logo, 'banner');
					unlink($logo);
				}
			}

			if($this->public_model->insert('system_banner',$data)){
				$arr = array(
					'log_url' => $this->uri->uri_string(),
					'user_id' => $this->session->users['userId'],
					'username' => $this->session->users['userName'],
					'log_ip' => get_client_ip(),
					'log_status' => '1',
					'log_message' => "新增banner成功,banner名称是：" . $data['title'],
				);
				add_system_log($arr);
				echo "<script>alert('操作成功！');window.location.href='" . site_url('/Home/bannerList') . "'</script>";
				exit;
			}else{
				$arr = array(
					'log_url' => $this->uri->uri_string(),
					'user_id' => $this->session->users['userId'],
					'username' => $this->session->users['userName'],
					'log_ip' => get_client_ip(),
					'log_status' => '0',
					'log_message' => "新增banner失败,banner名称是：" . $data['title'],
				);
				add_system_log($arr);
				echo "<script>alert('操作成功！');window.location.href='" . site_url('/Home/bannerList') . "'</script>";
				exit;
			}
		}else{
			$this->load->view('404.html');
		}
	}

	//编辑banner
	function editBanner(){
		if($_POST){
			$data = $this->input->post();
			if (!empty($_FILES['file']['name'])) {
				$config['upload_path'] = 'upload/car/';
				$config['allowed_types'] = 'gif|jpg|png|jpeg';
				$config['max_size'] = 5120;
				$config['file_name'] = date('y-m-d_His');
				$this->load->library('upload', $config);
					// 上传
				if (!$this->upload->do_upload('file')) {
					echo "<script>alert('文件上传失败！');history.back(-1);</script>";
					exit;
				} else {
					$logo = 'upload/car/' . $this->upload->data('file_name');
					$data['bannerUrl'] = qiniu($logo, 'banner');
					unlink($logo);
				}
			}

			if ($this->public_model->updata('system_banner','bannerId',$data['bannerId'] ,$data)) {
				$arr = array(
					'log_url' => $this->uri->uri_string(),
					'user_id' => $this->session->users['userId'],
					'username' => $this->session->users['userName'],
					'log_ip' => get_client_ip(),
					'log_status' => '1',
					'log_message' => "编辑banner成功,banner名称是：" . $data['title'].',bannerId是:'.$data['bannerId'],
				);
				add_system_log($arr);
				echo "<script>alert('操作成功！');window.location.href='" . site_url('/Home/bannerList') . "'</script>";
				exit;
			} else {
				$arr = array(
					'log_url' => $this->uri->uri_string(),
					'user_id' => $this->session->users['userId'],
					'username' => $this->session->users['userName'],
					'log_ip' => get_client_ip(),
					'log_status' => '0',
					'log_message' => "编辑banner失败,banner名称是：" . $data['title'] . ',bannerId是:' . $data['bannerId'],
				);
				add_system_log($arr);
				echo "<script>alert('操作成功！');window.location.href='" . site_url('/Home/bannerList') . "'</script>";
				exit;
			}
		} else {
			$this->load->view('404.html');
		}
	}


	//删除banner
	function delBanner(){
		if($_POST){
			$id = $this->input->post('id');
			if($this->public_model->delete('system_banner','bannerId',$id)){
				$arr = array(
					'log_url' => $this->uri->uri_string(),
					'user_id' => $this->session->users['userId'],
					'username' => $this->session->users['userName'],
					'log_ip' => get_client_ip(),
					'log_status' => '1',
					'log_message' => "删除banner成功,bannerId是:" . $data['bannerId'],
				);
				add_system_log($arr);
				echo "1";
				exit;
			}else{
				$arr = array(
					'log_url' => $this->uri->uri_string(),
					'user_id' => $this->session->users['userId'],
					'username' => $this->session->users['userName'],
					'log_ip' => get_client_ip(),
					'log_status' => '0',
					'log_message' => "删除banner失败,bannerId是:" . $data['bannerId'],
				);
				add_system_log($arr);
				echo "2";
				exit;
			}

		}else{
			echo "3";
		}
	}



}
 ?>