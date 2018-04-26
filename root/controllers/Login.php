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
		// $this->load->helper('captcha');
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




	//退出登录
	function login_out(){
		$this->session->sess_destroy();
		$this->load->view('login.html');
	}

}
 ?>