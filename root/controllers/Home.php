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
	//系统操作日志
	function systemLog(){
		$config['per_page'] = 20;
        //获取页码
		$current_page = intval($this->uri->segment(3));//index.php 后数第4个/
        //配置
		$config['base_url'] = site_url('/Home/systemLog');
        //分页配置

		$config['full_tag_open'] = '<ul class="am-pagination tpl-pagination"">';

		$config['full_tag_close'] = '</ul>';

		$config['first_tag_open'] = '<li>';

		$config['first_tag_close'] = '</li>';

		$config['prev_tag_open'] = '<li>';

		$config['prev_tag_close'] = '</li>';

		$config['next_tag_open'] = '<li>';

		$config['next_tag_close'] = '</li>';

		$config['cur_tag_open'] = '<li class="am-active"><a>';

		$config['cur_tag_close'] = '</a></li>';

		$config['last_tag_open'] = '<li>';

		$config['last_tag_close'] = '</li>';

		$config['num_tag_open'] = '<li>';

		$config['num_tag_close'] = '</li>';

		$config['first_link'] = '首页';

		$config['next_link'] = '»';

		$config['prev_link'] = '«';

		$config['last_link'] = '末页';
		$config['num_links'] = 4;

		$total = count($this->public_model->select('system_log', 'log_time'));
		$config['total_rows'] = $total;

		$this->load->library('pagination');//加载ci pagination类
		$listpage = $this->public_model->select_page('system_log', 'log_time', $current_page, $config['per_page']);
		$this->pagination->initialize($config);

		$menu = array('system', 'systemLog');
		$data = array('lists' => $listpage, 'pages' => $this->pagination->create_links(),  'menu' => $menu);

		$this->load->view('systemLog.html', $data);

	}




}
 ?>