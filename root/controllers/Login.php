<?php 
/**
*    登陆。注册
*/
class Login extends CI_Controller
{
	public $user = 'admin_user';
	function __construct()
	{
		parent::__construct();
		$this->load->model('public_model');
		$this->load->helper('public_helper');

		// $this->load->helper('captcha');
		define('ROOTCSS', base_url('/assets'));
	}

	//登陆界面
	function index(){
		

		$this->load->view('login.html');
	}

	//管理员登陆
	function land(){
		if($_POST){
			$username = $this->input->post('name');
			$pass = $this->input->post('pass');

			if(empty($username || empty($pass))){
                $error['error'] = "用户名或密码不能为空！";
                $this->load->view('login.html',$error);
            }else{
				//获取用户
				$user = $this->public_model->select_admin_user($username);
				if (!empty($user)) {
					if($user['status'] == '1' && $user['state'] == '1'){
						if (!empty($user)) {
							if ($user['password'] != md5($pass)) {
								$error['error'] = "密码错误!请重新登陆！";
								$this->load->view('login.html', $error);
							} else {
								$arr['loginTime'] = date('Y-m-d H:i:s');
								$this->public_model->updata($this->user,'userId',$user['userId'],$arr);
								$this->session->set_tempdata('users', $user, 7200);
								$this->session->set_userdata('menus', $user['perm']);
								$this->session->set_tempdata('uId', '1', 7200);
								redirect('Home/index');
							}
						} else {
							$error['error'] = "该用户不存在，请重新登陆！";
							$this->load->view('login.html', $error);
						}
					}else{
						if ($user['status'] != '1'){
							$error['error'] = "该账户存在异常！禁止登陆！";
							$this->load->view('login.html', $error);
						}else if ($user['state'] != '1') {
							$error['error'] = "该账户所在用户组存在异常！禁止登陆！";
							$this->load->view('login.html', $error);
						}

					}
					
				}else {
				$error['error'] = "账户不存在！";
				$this->load->view('login.html', $error);
			}
		}
		}else{
			$this->load->view('404.html');
		}
	}

	//银行工作人员登陆
	function bankLogin(){
		if($_POST){
			$phone = $this->input->post('phone');
			$pass = $this->input->post('pass');

			if (empty($phone || empty($pass))) {
				$error['error'] = "账户或密码不能为空！";
				$this->load->view('login.html', $error);
			} else {
            	//获取用户
				$user = $this->public_model->select_info('bank_user','linkPhone',$phone);
				if(!empty($user)){
					if ($user['isDel'] == '1') {
						if (!empty($user)) {
							if ($user['password'] != md5($pass)) {
								$error['error'] = "密码错误!请重新登陆！";
								$this->load->view('login.html', $error);
							} else {
								$this->session->set_tempdata('users', $user, 7200);
								$this->session->set_tempdata('uId', '2', 7200);
								$menu = '{"2": {"value": {
													"id": "2",
													"name": "按揭申请管理",
													"status": "1",
													"pid": "0",
													"addtime": null,
													"url": "Mortgage\/applyList",
													"style": "am-icon-calendar",
													"other": "applyList",
													"lev": 1
												}
											}
										}';
								$this->session->set_userdata('menus', $menu);
								redirect('Home/index');
							}
						} else {
							$error['error'] = "该用户不存在，请重新登陆！";
							$this->load->view('login.html', $error);
						}
					} else {
						if ($user['status'] != '1') {
							$error['error'] = "该账户存在异常！禁止登陆！";
							$this->load->view('login.html', $error);
						} else if ($user['state'] != '1') {
							$error['error'] = "该账户所在用户组存在异常！禁止登陆！";
							$this->load->view('login.html', $error);
						}

					}
				} else {
					$error['error'] = "账户不存在！";
					$this->load->view('login.html', $error);
				}

			}
		}else{
			$this->load->view('404.html');
		}
	}

	//公司负责人登录
	function companyLogin(){
		
		$this->load->view('companyLogin.html');

	}

	function companyLand(){
		if ($_POST) {
			$username = $this->input->post('name');
			$pass = $this->input->post('pass');

			if (empty($username || empty($pass))) {
				$error['error'] = "用户名或密码不能为空！";
				$this->load->view('companyLogin.html', $error);
			} else {
				//获取用户
				$user = $this->public_model->select_comapny_user($username);
				if (!empty($user)) {
					if (!empty($user)) {
						if ($user['passWord'] != md5($pass)) {
							$error['error'] = "密码错误!请重新登陆！";
							$this->load->view('companyLogin.html', $error);
						} else {
							$this->session->set_tempdata('users', $user, 7200);
							$this->session->set_userdata('menus', $user['perm']);
							$this->session->set_tempdata('uId', '1', 7200);
							redirect('Home/index');
						}
					} else {
						$error['error'] = "该用户不存在，请重新登陆！";
						$this->load->view('companyLogin.html', $error);
					}
				} else {
					$error['error'] = "账户不存在！";
					$this->load->view('companyLogin.html', $error);
				}
			}
		} else {
			$this->load->view('404.html');
		}
	}
	

	//销售人员登陆
	function salesLogin(){
		if ($_POST) {
			$username = $this->input->post('name');
			$pass = $this->input->post('pass');

			if (empty($username || empty($pass))) {
				$error['error'] = "用户名或密码不能为空！";
				$this->load->view('login.html', $error);
			} else {
				//获取用户
				$user = $this->public_model->select_info('sales_user', 'phone', $username);
				if (!empty($user)) {
					if ($user['isDel'] != '1') {
						if (!empty($user)) {
							if ($user['password'] != md5($pass)) {
								$error['error'] = "密码错误!请重新登陆！";
								$this->load->view('login.html', $error);
							} else {
							

								$this->session->set_tempdata('users', $user, 7200);
								$this->session->set_userdata('menus', $user['perm']);
								$this->session->set_tempdata('uId', '1', 7200);
								redirect('Home/index');
							}
						} else {
							$error['error'] = "该用户不存在，请重新登陆！";
							$this->load->view('login.html', $error);
						}
					} else {
						if ($user['isDel'] == '1') {
							$error['error'] = "该账户存在异常！禁止登陆！";
						}

					}

				} else {
					$error['error'] = "账户不存在！";
					$this->load->view('login.html', $error);
				}
			}
		} else {
			$this->load->view('404.html');
		}
	}

	//修改个人资料
	function editInfo()
	{
		if ($_POST) {
			$data = $this->input->post();
			$user = $this->public_model->ret_userInfo('hj_admin_user', 'loginNum', $data['loginNum'], $this->session->users['userId']);
			if (empty($user)) {
				if (!empty($data['password'])) {
					$data['password'] = md5($data['password']);
				} else {
					unset($data['password']);
				}
				if ($this->public_model->updata('hj_admin_user', 'userId', $this->session->users['userId'], $data)) {
					$arr = array(
						'log_url' => $this->uri->uri_string(),
						'user_id' => $this->session->users['userId'],
						'username' => $this->session->users['userName'],
						'log_ip' => get_client_ip(),
						'log_status' => '1',
						'log_message' => "修改资料成功,用户id是:" . $data['userId'],
					);
					add_system_log($arr);
					echo "<script>alert('操作成功');window.location.href='" . site_url('/Home/index') . "'</script>";
				} else {
					$arr = array(
						'log_url' => $this->uri->uri_string(),
						'user_id' => $this->session->users['userId'],
						'username' => $this->session->users['userName'],
						'log_ip' => get_client_ip(),
						'log_status' => '0',
						'log_message' => "修改资料失败,用户id是:" . $data['userId'],
					);
					add_system_log($arr);
					echo "<script>alert('操作失败');window.location.href='" . site_url('/Login/editInfo') . "'</script>";

				}
			} else {
				echo "<script>alert('用户登陆账户已注册！');window.location.href='" . site_url('/Login/editInfo') . "'</script>";
				exit;
			}
		} else {
			$data['users'] = $this->public_model->select_info('hj_admin_user', 'userId', $this->session->users['userId']);

			$data['menu'] = 'index';
			$this->load->view('userInfo.html', $data);
		}
	}


	//退出登录
	function login_out(){
		$this->session->sess_destroy();
		$this->load->view('login.html');
	}

}
 ?>