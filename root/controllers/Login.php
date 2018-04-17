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

	//登陆
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
			
				if($user['status'] == '1' && $user['state'] == '1'){
					if (!empty($user)) {
						if ($user['password'] != md5($pass)) {
							$error['error'] = "密码错误!请重新登陆！";
							$this->load->view('login.html', $error);
						} else {
							$this->session->set_tempdata('users', $user, 7200);
                      //  $this->session->mark_as_temp('users', 7200);
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