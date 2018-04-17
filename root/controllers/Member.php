<?php 
defined('BASEPATH') OR exit('No direct script access allowed');
require_once(APPPATH.'controllers/Default_Controller.php');

/**
*    用户管理
*/
class Member extends Default_Controller
{
	public $member = "admin_user";
	public $group = "admin_user_group";
    public $company = 'admin_company';
    public $department = 'admin_department';
	function __construct()
	{
		parent::__construct();
        $this->load->model('public_model');
		$this->load->helper('search_helper');
    }
    

    //公司管理
    function company(){
        $config['per_page'] = 10;
        //获取页码
        $current_page = intval($this->uri->segment(3));//index.php 后数第4个/
        //配置
        $config['base_url'] = site_url('/Member/company');
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

        $total = count($this->public_model->select($this->company, 'createTime'));
        $config['total_rows'] = $total;

        $this->load->library('pagination');//加载ci pagination类
        $listpage = $this->public_model->select_page($this->company, 'createTime', $current_page, $config['per_page']);
        $this->pagination->initialize($config);

        $data = array('lists' => $listpage, 'pages' => $this->pagination->create_links());
		//获取我的公众号
  //       echo "<pre>";
  //       var_dump($data);
		// exit;
        // $data['menu'] = 'memberList';
        $this->load->view('member/companyList.html', $data);
    }



	//用户列表
	function index(){
        $config['per_page'] = 10;
        //获取页码
        $current_page=intval($this->uri->segment(3));//index.php 后数第4个/
        //配置
        $config['base_url'] = site_url('/Member/index');
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

        $config['first_link']= '首页';

        $config['next_link']= '»';

        $config['prev_link']= '«';

        $config['last_link']= '末页';
        $config['num_links'] = 4;
        
        $total = count($this->public_model->select($this->member,'createTime'));
        $config['total_rows'] = $total;
    
        $this->load->library('pagination');//加载ci pagination类
        $listpage =  $this->public_model->select_page($this->member,'createTime',$current_page,$config['per_page']);
		$this->pagination->initialize($config);

        $data = array('lists'=>$listpage,'pages' => $this->pagination->create_links());
		//获取我的公众号
  //       echo "<pre>";
  //       var_dump($data);
		// exit;
         $data['menu'] = 'memberList';
		$this->load->view('userAdmin/users.html',$data);
	}

	//编辑用户
	function edit_users(){
		if($_POST){
			$data = $this->input->post();

			if($data['password'] == ''){
				unset($data['password']);
			}else{
				$data['password'] = md5($data['password']);
			}

			//根据用户名获取用户
			$user = $this->public_model->ret_userInfo($this->member,'username',$data['username'],$data['user_id']);
			if(!empty($user)){
				echo "<script>alert('用户名已注册！');window.location.href='".site_url('/Member/index')."'</script>";exit;
				
			}else{
				$users = $this->public_model->ret_userInfo($this->member,'email',$data['email'],$data['user_id']);
				if(!empty($users)){
					echo "<script>alert('邮箱已注册！');window.location.href='".site_url('/Member/index')."'</script>";exit;
				}else{

					if($this->public_model->updata($this->member,'user_id',$data['user_id'],$data)){
                       
					   	$arr = array(
			                'log_url'=>$this->uri->uri_string(),
			                'user_id'=> $this->session->users['id'],
			                'username'=>$this->session->users['username'],
			                'log_ip'=>get_client_ip(),
			                'log_status'=>'1',
			                'log_message'=>"修改用户信息成功,用户站内id是".$data['user_id'],
			            );
	                    add_system_log($arr);
	                    echo "<script>alert('操作成功！');window.location.href='".site_url('/Member/index')."'</script>";exit;
					}else{
						$arr = array(
			                'log_url'=>$this->uri->uri_string(),
			                'user_id'=> $this->session->users['id'],
			                'username'=>$this->session->users['username'],
			                'log_ip'=>get_client_ip(),
			                'log_status'=>'o',
			                'log_message'=>"修改了用户信息失败,用户站内id是".$data['user_id'],
			            );
	                    add_system_log($arr);
						echo "<script>alert('操作失败！');window.location.href='".site_url('/Member/index')."'</script>";exit;

					}
				}
			}
	
		}else{
			$this->load->view('404.html');
		}
	}

	//修改用户状态
	function editState(){
		$id = intval($this->uri->segment(3));
		$state = intval($this->uri->segment(4));

		if($id == '0' || $state == '0'){
			$this->load->view('404.html');
		}else{
			$title = '';
			if($state == '1'){
				$title = '正常';
			}else if($state == '2'){
				$title = '封禁';
			}
			if(!empty($title)){
				$data['status'] = $state;
				if($this->public_model->updata($this->member,"user_id",$id,$data)){
					$arr = array(
		                'log_url'=>$this->uri->uri_string(),
		                'user_id'=> $this->session->users['id'],
		                'username'=>$this->session->users['username'],
		                'log_ip'=>get_client_ip(),
		                'log_status'=>'o',
		                'log_message'=>"修改了用户状态为".$title.",用户站内id是".$id,
		            );
	                add_system_log($arr);
					echo "<script>alert('操作成功！');window.location.href='".site_url('/Member/index')."'</script>";exit;

				}else{
					$arr = array(
		                'log_url'=>$this->uri->uri_string(),
		                'user_id'=> $this->session->users['id'],
		                'username'=>$this->session->users['username'],
		                'log_ip'=>get_client_ip(),
		                'log_status'=>'0',
		                'log_message'=>"修改了用户状态为".$title.",用户站内id是".$id,
		            );
	                add_system_log($arr);
					echo "<script>alert('操作失败！');window.location.href='".site_url('/Member/index')."'</script>";exit;
				}
			}
		}
	}

	//积分查询
	function integralList(){
        $id = intval($this->uri->segment('3'));
        if($id == '0'){
            $this->load->view('404.html');
        }else{
            $config['per_page'] = 10;
            //获取页码
            $current_page=intval($this->uri->segment(4));//index.php 后数第4个/
            //配置
            $config['base_url'] = site_url('/Member/integralList/'.$id);
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

            $config['first_link']= '首页';

            $config['next_link']= '»';

            $config['prev_link']= '«';

            $config['last_link']= '末页';
            $config['num_links'] = 4;
            
            $total = count($this->public_model->select_where($this->intreord,'user_id',$id,'createTime','desc'));
            $config['total_rows'] = $total;
        
            $this->load->library('pagination');//加载ci pagination类
            $listpage =  $this->public_model->select_where_page($this->intreord,'user_id',$id,'createTime','desc',$current_page,$config['per_page']);
            $this->pagination->initialize($config);
            $menu = 'memberList';

            $data = array('lists'=>$listpage,'pages' => $this->pagination->create_links(),'menu'=>$menu,'userid'=>$id);
            //获取我的公众号
    		
            
    		$this->load->view('userAdmin/integral.html',$data);
        }
	}

    //积分查询
    function searchIntegral(){
        $config['per_page'] = 10;
        //获取页码
        $current_page=intval($this->input->get("size"));//index.php 后数第4个/

        $type = $this->input->get('type');
        $userid = $this->input->get('user_id');
        //分页配置
        $config['full_tag_open'] = '<ul class="am-pagination tpl-pagination">';

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
        $config['first_link']= '首页';

        $config['next_link']= '下一页';

        $config['prev_link']= '上一页';

        $config['last_link']= '末页';

        if($type =='5'){
            $total = count($this->public_model->select_where($this->intreord,'user_id',$userid,'createTime','desc'));
            $config['total_rows'] = $total;
            $listpage =  $this->public_model->select_where_page($this->intreord,'user_id',$userid,'createTime','desc',$current_page,$config['per_page']);

        }else{
            $list = $this->public_model->select_where_many($this->intreord,'user_id',$userid,'type',$type,'createTime','desc');
       

            $config['total_rows'] = count($list);
            $listpage = $this->public_model->select_where_many($this->intreord,'user_id',$userid,'type',$type,'createTime','desc',$config['per_page'],$current_page);
        }



        $config['page_query_string'] = TRUE;//关键配置
        // $config['reuse_query_string'] = FALSE;
        $config['query_string_segment'] = 'size';
        $config['base_url'] = site_url('/Member/searchIntegral?').'type='.$type.'&user_id='.$userid;

        // //分页数据\
       
        
        $this->load->library('pagination');//加载ci pagination类

        $this->pagination->initialize($config);

        // var_dump($data);
  
        $menu = 'memberList';

        $data = array('lists'=>$listpage,'pages' => $this->pagination->create_links(),'menu'=>$menu,'userid'=>$userid);
            //获取我的公众号
            
            
        $this->load->view('userAdmin/integral.html',$data);
    }

    //积分赠送
    function integralRe(){
        if($_POST){
            $data = $this->input->post();
            //获取用户信息
            $user = $this->public_model->select_info($this->member,'user_id',$data['user_id']);

            if($data['type'] == '6'){
                $title = "扣除用户积分";
                $data['integral'] = $data['number'];
                $data['balance'] = $user['integral'] - $data['number'];
            }else{
                $title = "赠送用户积分";

                $data['integral'] = $data['number'];
                $data['balance'] = $user['integral'] + $data['number'];
            }
            unset($data['number']);

            if($this->public_model->insert($this->intreord,$data)){
                $a['integral'] = $data['balance'];
                $this->public_model->updata($this->member,'user_id',$data['user_id'],$a);
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=> $this->session->users['id'],
                    'username'=>$this->session->users['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'1',
                    'log_message'=>$title."成功,用户站内id是".$data['user_id'],
                );
                add_system_log($arr);
                echo "<script>alert('操作成功！');window.location.href='".site_url('/Member/integralList/'.$data['user_id'])."'</script>";exit;

            }else{
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=> $this->session->users['id'],
                    'username'=>$this->session->users['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'o',
                    'log_message'=>$title."失败,用户站内id是".$data['user_id'],
                );
                add_system_log($arr);
                echo "<script>alert('操作失败！');window.location.href='".site_url('/Member/integralList/'.$data['user_id'])."'</script>";exit;

            }   
        }else{
            $this->load->view('404.html');
        }
    }


	//搜索用户
	function search_member(){

		$config['per_page'] = 10;
        //获取页码
        $current_page=intval($this->input->get("size"));//index.php 后数第4个/

        $time = $this->input->get('time');
        $endtime = $this->input->get('endtime');
        $status = $this->input->get('status');
        $sear = $this->input->get('sear');
        //分页配置
        $config['full_tag_open'] = '<ul class="am-pagination tpl-pagination">';

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
        $config['first_link']= '首页';

        $config['next_link']= '下一页';

        $config['prev_link']= '上一页';

        $config['last_link']= '末页';

        if(!empty($time)){
            $t = $time .' 00:00:00';
            $e = $endtime .' 23:59:59';
        }else{
            $t = '';
            $e = '';
        }

        $list = search_member($t,$e,$status,$sear);
      
        $config['total_rows'] = count($list);

        $config['page_query_string'] = TRUE;//关键配置
        // $config['reuse_query_string'] = FALSE;
        $config['query_string_segment'] = 'size';
        $config['base_url'] = site_url('/Member/search_member?').'time='.$time.'&endtime='.$endtime."&status=".$status."&sear=".$sear;

        // //分页数据\
        $listpage = search_member_page($t,$e,$status,$sear,$config['per_page'],$current_page);
        $this->load->library('pagination');//加载ci pagination类

        $this->pagination->initialize($config);

        // var_dump($data);
        $menu = 'memberList';
       
        $data = array('lists'=>$listpage,'pages' => $this->pagination->create_links(),'menu'=>$menu);
                 
        $this->load->view('userAdmin/users.html',$data);

	}

	    //权限管理
    function power(){
        $list = $this->public_model->select($this->table,'id');
        $menus = subtree($list);
        // echo "<pre>";
        // var_dump($menus);
        // exit;

        $data['menu'] = array('Jurisdiction','power');
        $data['list'] = $menus;
        $this->load->view('userAdmin/power.html',$data);
    }

    //新增权限
    function add_power(){
        if($_POST){
            $data = $this->input->post();
            if($this->public_model->insert($this->table,$data)){
                //日志
                $arr = array(
                    'log_url'=>$this->uri->uri_string(), 
                    'user_id'=> $this->session->users['id'],
                    'username'=>$this->session->users['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'1',
                    'log_message'=>"新增权限成功,权限名称为".$data['name'],
                );
                add_system_log($arr);
                
                echo "<script>alert('操作成功！');window.location.href='".site_url('/Member/power')."'</script>";
            }else{
                  //日志
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=> $this->session->users['id'],
                    'username'=>$this->session->users['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'0',
                    'log_message'=>"新增权限失败,权限名称为".$data['name'],
                );
                add_system_log($arr);
                echo "<script>alert('操作失败！');window.location.href='".site_url('/Member/power')."'</script>";
            }
        }else{
            $this->load->view('404.html');
        }
    }
    //新增子权限
    function add_power_level(){
        
        if($_POST){
             $data = $this->input->post();
            if($this->public_model->insert($this->table,$data)){
                //日志
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=> $this->session->users['id'],
                    'username'=>$this->session->users['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'1',
                    'log_message'=>"新增权限成功,权限名称为".$data['name'],
                );
                add_system_log($arr);
                echo "1";
            }else{
                  //日志
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=> $this->session->users['id'],
                    'username'=>$this->session->users['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'0',
                    'log_message'=>"新增权限失败,权限名称为".$data['name'],
                );
                add_system_log($arr);
                echo "2";
            }
        }else{
            echo "2";
        }
    }

    //编辑权限
    function edit_power(){
           
        if($_POST){
             $data = $this->input->post();
            if($this->public_model->updata($this->table,'id',$data['id'],$data)){
                //日志
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=> $this->session->users['id'],
                    'username'=>$this->session->users['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'1',
                    'log_message'=>"编辑权限成功,权限名称为".$data['name'],
                );
                add_system_log($arr);
                echo "1";
            }else{
                  //日志
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=> $this->session->users['id'],
                    'username'=>$this->session->users['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'0',
                    'log_message'=>"编辑权限失败,权限名称为".$data['name'],
                );
                add_system_log($arr);
                echo "2";
            }
        }else{
            echo "2";
        }
    }


    //删除权限
    function del_power(){
        if($_POST){
              $data = $this->input->post();
               if($this->public_model->delete($this->table,'id',$data['id'])){
                //日志
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                   'user_id'=> $this->session->users['id'],
                    'username'=>$this->session->users['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'1',
                    'log_message'=>"删除权限成功",
                );
                add_system_log($arr);
                echo "1";
            }else{
                  //日志
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                     'user_id'=> $this->session->users['id'],
                    'username'=>$this->session->users['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'0',
                    'log_message'=>"编辑权限失败",
                );
                add_system_log($arr);
                echo "2";
            }
        }else{
            echo "2";
        }
    }

    //用户组
    function group(){

        $data['group'] = $this->public_model->select('wxCatchv1_system_group','');
        $data['menu'] = array('Jurisdiction','group');
        $this->load->view('userAdmin/group.html',$data);
    }

    //新增用户组
    function addGroup(){
        if($_POST){
            $data = $this->input->post();
            if($this->public_model->insert('wxCatchv1_system_group',$data)){
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=> $this->session->users['id'],
                    'username'=>$this->session->users['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'1',
                    'log_message'=>'新增用户组成功',
                );
                add_system_log($arr);
                echo "<script>alert('操作成功！');window.location.href='".site_url('/Member/group')."'</script>";exit;
            }else{
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=> $this->session->users['id'],
                    'username'=>$this->session->users['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'0',
                    'log_message'=>'新增用户组失败',
                );
                add_system_log($arr);
                echo "<script>alert('操作失败！');window.location.href='".site_url('/Member/group')."'</script>";exit;
            }
        }
    }
    function editGroup(){
        if($_POST){
            $data = $this->input->post();
            
            if($this->public_model->updata('wxCatchv1_system_group','gid',$data['gid'],$data)){
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=> $this->session->users['id'],
                    'username'=>$this->session->users['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'1',
                    'log_message'=>'编辑用户组成功',
                );
                add_system_log($arr);
                echo "<script>alert('操作成功！');window.location.href='".site_url('/Member/group')."'</script>";exit;
            }else{
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=> $this->session->users['id'],
                    'username'=>$this->session->users['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'0',
                    'log_message'=>'编辑用户组失败',
                );
                add_system_log($arr);
                echo "<script>alert('操作失败！');window.location.href='".site_url('/Member/group')."'</script>";exit;
            }
        }
    }
    function delGroup(){
        if($_POST){
            $id = $this->input->post('id');
            if($id == '1'){
                echo "3";
                exit;
            }
            if($this->public_model->delete('wxCatchv1_system_group','gid',$id)){
                $this->public_model->delete('wxCatchv1_system_user','g_id',$id);
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=> $this->session->users['id'],
                    'username'=>$this->session->users['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'1',
                    'log_message'=>'删除用户组成功',
                );
                add_system_log($arr);
                echo "1";exit;
            }else{
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=> $this->session->users['id'],
                    'username'=>$this->session->users['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'0',
                    'log_message'=>'删除用户组失败',
                );
                add_system_log($arr);
                echo "2";exit;
            }
        }
    }


    //编辑权限
    function GroupJurisdiction(){
        $id = intval($this->uri->segment(3));
        if($id == '0'){
            echo "<script>alert('请求错误！');window.location.href='".site_url('/Member/group')."'</script>";exit;
        }else{
            $group = $this->public_model->select_info('wxCatchv1_system_group','gid',$id);

            $group_permission = json_decode($group['perm'],true);

            //
            $list = $this->public_model->select($this->table,'id');
            $menus = subtree($list,$group_permission);
            $data['gid'] = $id;

            $data['menu'] = array('Jurisdiction','group');
            $data['list'] = $menus;
            $this->load->view('userAdmin/jurisdiction.html',$data);
        }
    }
     function editJurisdiction(){
        if($_POST){
            $data = $this->input->post();
            
            if($this->public_model->updata('wxCatchv1_system_group','gid',$data['gid'],$data)){
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=> $this->session->users['id'],
                    'username'=>$this->session->users['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'1',
                    'log_message'=>'编辑用户组成功',
                );
                add_system_log($arr);
                echo "1";exit;
            }else{
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=> $this->session->users['id'],
                    'username'=>$this->session->users['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'0',
                    'log_message'=>'编辑用户组失败',
                );
                add_system_log($arr);
                echo "2";exit;
            }
        }
    }

    //系统微信公总号
    function systemWechat(){
        $listpage = $this->public_model->select('wxCatchv1_system','id','desc');


        $data['lists'] = $listpage;
        $data['menu'] = 'systemWechat';

        $this->load->view('systemWechat.html',$data);
    }

    //新增微信号
    function addWechat(){
        if($_POST){
            $data = $this->input->post();
            if($this->public_model->insert('wxCatchv1_system',$data)){
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                     'user_id'=> $this->session->users['id'],
                    'username'=>$this->session->users['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'0',
                    'log_message'=>"新增系统微信号成功",
                );
                add_system_log($arr);
                echo "<script>alert('新增成功');window.location.href='".site_url('/Member/systemWechat')."'</script>";

            }else{
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                     'user_id'=> $this->session->users['id'],
                    'username'=>$this->session->users['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'0',
                    'log_message'=>"新增系统微信号失败",
                );
                add_system_log($arr);
                echo "<script>alert('新增失败！');window.location.href='".site_url('/Member/systemWechat')."'</script>";

            }
        }else{
             echo "<script>alert('请求失败！');window.location.href='".site_url('/Member/systemWechat')."'</script>";
             exit;
        }
    }

    function editWechat(){
        if($_POST){
            $data = $this->input->post();
            if($this->public_model->updata('wxCatchv1_system','id',$data['id'],$data)){
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                     'user_id'=> $this->session->users['id'],
                    'username'=>$this->session->users['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'0',
                    'log_message'=>"编辑系统微信号成功",
                );
                add_system_log($arr);
                echo "<script>alert('操作成功');window.location.href='".site_url('/Member/systemWechat')."'</script>";

            }else{
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                     'user_id'=> $this->session->users['id'],
                    'username'=>$this->session->users['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'0',
                    'log_message'=>"编辑系统微信号失败",
                );
                add_system_log($arr);
                echo "<script>alert('操作失败');window.location.href='".site_url('/Member/systemWechat')."'</script>";

            }
        }else{
             echo "<script>alert('请求失败！');window.location.href='".site_url('/Member/systemWechat')."'</script>";
             exit;
        }
    }

    function delWechat(){
        if($_POST){
            $id = $this->input->post('id');
            if($id == '1'){
                echo "<script>alert('该公众号不可删除！');window.location.href='".site_url('/Member/systemWechat')."'</script>";
                exit;
            }
            if($this->public_model->delete("wxCatchv1_system",'id',$id)){
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                     'user_id'=> $this->session->users['id'],
                    'username'=>$this->session->users['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'0',
                    'log_message'=>"删除系统微信号成功",
                );
                add_system_log($arr);
                echo "1";

            }else{
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                     'user_id'=> $this->session->users['id'],
                    'username'=>$this->session->users['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'0',
                    'log_message'=>"删除系统微信号失败",
                );
                add_system_log($arr);
                echo "2";

            }
        }else{
            echo "3";
        }
    }

    //后台用户管理
    function adminUser(){



        $listpage = $this->public_model->select('wxCatchv1_system_user','id','desc');
        $data['group'] = $this->public_model->select('wxCatchv1_system_group','gid','desc');


        $data['lists'] = $listpage;
        $data['menu'] = array('Jurisdiction','adminUser');

        $this->load->view('userAdmin/adminUser.html',$data);
    }


    //新增后台用户
    function AddUser(){
        if($_POST){
            $data = $this->input->post();
            $data['password'] = md5($this->input->post('password'));

            if($this->public_model->insert('wxCatchv1_system_user',$data)){
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                     'user_id'=> $this->session->users['id'],
                    'username'=>$this->session->users['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'1',
                    'log_message'=>"新增后台用户成功",
                );
                add_system_log($arr);
                echo "<script>alert('操作成功');window.location.href='".site_url('/Member/adminUser')."'</script>";

            }else{
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                     'user_id'=> $this->session->users['id'],
                    'username'=>$this->session->users['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'0',
                    'log_message'=>"新增后台用户失败",
                );
                add_system_log($arr);
                echo "<script>alert('操作失败');window.location.href='".site_url('/Member/adminUser')."'</script>";

            }

        }
    }
    //修改
    function EditUser(){
        if($_POST){
            $data = $this->input->post();
            $password = $this->input->post('password');
            if(!empty($password)){
                $data['password'] = md5($password);
            }else{
                unset($data['password']);
            }

            if($this->public_model->updata('wxCatchv1_system_user','id',$data['id'],$data)){
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                     'user_id'=> $this->session->users['id'],
                    'username'=>$this->session->users['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'1',
                    'log_message'=>"编辑后台用户成功",
                );
                add_system_log($arr);
                echo "<script>alert('操作成功');window.location.href='".site_url('/Member/adminUser')."'</script>";

            }else{
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                     'user_id'=> $this->session->users['id'],
                    'username'=>$this->session->users['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'0',
                    'log_message'=>"编辑后台用户失败",
                );
                add_system_log($arr);
                echo "<script>alert('操作失败');window.location.href='".site_url('/Member/adminUser')."'</script>";

            }

        }
    }

    //删除
    function delUser(){
        if($_POST){
            $id = $this->input->post('id');
            if($id == '1'){
                echo "3";
                exit;
            }
            if($this->public_model->delete('wxCatchv1_system_user','id',$id)){
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                     'user_id'=> $this->session->users['id'],
                    'username'=>$this->session->users['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'1',
                    'log_message'=>"删除后台用户成功",
                );
                add_system_log($arr);
                echo "1";

            }else{
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                     'user_id'=> $this->session->users['id'],
                    'username'=>$this->session->users['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'0',
                    'log_message'=>"删除后台用户失败",
                );
                add_system_log($arr);
                echo "2";

            }

        }
    }

}
 ?>