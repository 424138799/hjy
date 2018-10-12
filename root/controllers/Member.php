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
    public $systemNav = 'system_nav';
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
        $menu = array('member', 'company');

        $data = array('lists' => $listpage, 'pages' => $this->pagination->create_links(),'menu'=>$menu);
	
        $this->load->view('member/companyList.html', $data);
    }

    //新增公司
    function AddCompany(){
        if($_POST){
            $data = $this->input->post();
            if ($this->public_model->insert($this->company, $data)) {
                $arr = array(
                    'log_url' => $this->uri->uri_string(),
                    'user_id' => $this->session->users['userId'],
                    'username' => $this->session->users['userName'],
                    'log_ip' => get_client_ip(),
                    'log_status' => '1',
                    'log_message' => "新增公司信息成功,公司名称是" . $data['companyTitle'],
                );
                add_system_log($arr);
                echo "<script>alert('操作成功！');window.location.href='" . site_url('/Member/company') . "'</script>";
                exit;
            } else {
                $arr = array(
                    'log_url' => $this->uri->uri_string(),
                    'user_id' => $this->session->users['userId'],
                    'username' => $this->session->users['userName'],
                    'log_ip' => get_client_ip(),
                    'log_status' => 'o',
                    'log_message' => "新增公司信息失败,公司名称是" . $data['companyTitle'],
                );
                add_system_log($arr);
                echo "<script>alert('操作失败！');window.location.href='" . site_url('/Member/company') . "'</script>";
                exit;

            }
        }
    }

    //修改公司
    function editCompany(){
        if ($_POST) {
            $data = $this->input->post();
            if ($this->public_model->updata($this->company,'id',$data['id'] ,$data)) {
                $arr = array(
                    'log_url' => $this->uri->uri_string(),
                    'user_id' => $this->session->users['userId'],
                    'username' => $this->session->users['userName'],
                    'log_ip' => get_client_ip(),
                    'log_status' => '1',
                    'log_message' => "修改公司信息成功,公司名称是" . $data['companyTitle'],
                );
                add_system_log($arr);
                echo "<script>alert('操作成功！');window.location.href='" . site_url('/Member/company') . "'</script>";
                exit;
            } else {
                $arr = array(
                    'log_url' => $this->uri->uri_string(),
                    'user_id' => $this->session->users['userId'],
                    'username' => $this->session->users['userName'],
                    'log_ip' => get_client_ip(),
                    'log_status' => 'o',
                    'log_message' => "修改公司信息失败,公司名称是" . $data['companyTitle'],
                );
                add_system_log($arr);
                echo "<script>alert('操作失败！');window.location.href='" . site_url('/Member/company') . "'</script>";
                exit;

            }
        }
    }

    //删除
    function delCompany(){
        if ($_POST) {
            $id = $this->input->post('id');
            if ($this->public_model->delete($this->company, 'id', $id)) {
                $arr = array(
                    'log_url' => $this->uri->uri_string(),
                    'user_id' => $this->session->users['userId'],
                    'username' => $this->session->users['userName'],
                    'log_ip' => get_client_ip(),
                    'log_status' => '1',
                    'log_message' => "修改公司信息成功,公司id是" . $id,
                );
                add_system_log($arr);
                echo "1";
                exit;
            } else {
                $arr = array(
                    'log_url' => $this->uri->uri_string(),
                    'user_id' => $this->session->users['userId'],
                    'username' => $this->session->users['userName'],
                    'log_ip' => get_client_ip(),
                    'log_status' => '0',
                    'log_message' => "修改公司信息失败,公司id是" . $id,
                );
                add_system_log($arr);
                echo "2";
                exit;
            }
        }
    }

    //部门信息
    function department(){
        $config['per_page'] = 10;
        //获取页码
        $current_page = intval($this->uri->segment(3));//index.php 后数第4个/
        //配置
        $config['base_url'] = site_url('/Member/department');
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

        $total = count($this->public_model->select($this->department, 'createTime'));
        $config['total_rows'] = $total;

        $this->load->library('pagination');//加载ci pagination类
        $listpage = $this->public_model->select_page($this->department, 'createTime', $current_page, $config['per_page']);
        $this->pagination->initialize($config);
        //获取公司
        $company = $this->public_model->select($this->company, 'createTime');
        //获取用户
        $user = $this->public_model->select($this->member, 'createTime');

        $menu = array('member', 'department');


        $data = array('lists' => $listpage, 'pages' => $this->pagination->create_links(),'company'=>$company,'users'=>$user,'menu'=>$menu);

        $this->load->view('member/department.html', $data);
    }

    //新增部门信息
    function addDepartment(){
        if ($_POST) {
            $data = $this->input->post();
            if ($this->public_model->insert($this->department, $data)) {
                $arr = array(
                    'log_url' => $this->uri->uri_string(),
                    'user_id' => $this->session->users['userId'],
                    'username' => $this->session->users['userName'],
                    'log_ip' => get_client_ip(),
                    'log_status' => '1',
                    'log_message' => "新增部门信息成功,部门名称是" . $data['department'],
                );
                add_system_log($arr);
                echo "<script>alert('操作成功！');window.location.href='" . site_url('/Member/department') . "'</script>";
                exit;
            } else {
                $arr = array(
                    'log_url' => $this->uri->uri_string(),
                    'user_id' => $this->session->users['userId'],
                    'username' => $this->session->users['userName'],
                    'log_ip' => get_client_ip(),
                    'log_status' => '0',
                    'log_message' => "新增部门信息失败,部门名称是" . $data['department'],
                );
                add_system_log($arr);
                echo "<script>alert('操作失败！');window.location.href='" . site_url('/Member/department') . "'</script>";
                exit;
            }
        }
    }


    //修改部门信息
    function editDepartment(){
        if ($_POST) {
            $data = $this->input->post();
            if ($this->public_model->updata($this->department,'id',$data['id'], $data)) {
                $arr = array(
                    'log_url' => $this->uri->uri_string(),
                    'user_id' => $this->session->users['userId'],
                    'username' => $this->session->users['userName'],
                    'log_ip' => get_client_ip(),
                    'log_status' => '1',
                    'log_message' => "新增部门信息成功,部门名称是" . $data['department'],
                );
                add_system_log($arr);
                echo "<script>alert('操作成功！');window.location.href='" . site_url('/Member/department') . "'</script>";
                exit;
            } else {
                $arr = array(
                    'log_url' => $this->uri->uri_string(),
                    'user_id' => $this->session->users['userId'],
                    'username' => $this->session->users['userName'],
                    'log_ip' => get_client_ip(),
                    'log_status' => '0',
                    'log_message' => "新增部门信息失败,部门名称是" . $data['department'],
                );
                add_system_log($arr);
                echo "<script>alert('操作失败！');window.location.href='" . site_url('/Member/department') . "'</script>";
                exit;
            }
        }
    }

    //删除部门信息
    function delDepartment(){
        $id = $this->input->post('id');
        if ($this->public_model->delete($this->department, 'id', $id)) {
            $arr = array(
                'log_url' => $this->uri->uri_string(),
                'user_id' => $this->session->users['userId'],
                'username' => $this->session->users['userName'],
                'log_ip' => get_client_ip(),
                'log_status' => '1',
                'log_message' => "删除部门信息成功,部门id是" . $id,
            );
            add_system_log($arr);
            echo "1";
            exit;
        } else {
            $arr = array(
                'log_url' => $this->uri->uri_string(),
                'user_id' => $this->session->users['userId'],
                'username' => $this->session->users['userName'],
                'log_ip' => get_client_ip(),
                'log_status' => '0',
                'log_message' => "删除部门信息成功,部门id是：" . $id,
            );
            add_system_log($arr);
            echo "2";
            exit;
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


    //用户组
    function group(){
        if($this->session->users['type'] =='1'){
            $data['group'] = $this->public_model->select_where($this->group, 'pId', '0', 'gid', 'desc');
        }else{
            $data['group'] = $this->public_model->select_where($this->group, 'pId',$this->session->users['gId'],'gid','desc');
        }
        $data['menu'] = array('member', 'group');

        $this->load->view('member/group.html',$data);
    }

    //新增用户组
    function addGroup(){
        if($_POST){
            $data = $this->input->post();
            if ($this->session->users['type'] != '1') {
                $data['pId'] = $this->session->users['gId'];
            }
            if($this->public_model->insert($this->group,$data)){
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=> $this->session->users['userId'],
                    'username'=>$this->session->users['userName'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'1',
                    'log_message'=>'新增用户组成功',
                );
                add_system_log($arr);
                echo "<script>alert('操作成功！');window.location.href='".site_url('/Member/group')."'</script>";exit;
            }else{
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id' => $this->session->users['userId'],
                    'username' => $this->session->users['userName'],
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
            
            if($this->public_model->updata($this->group,'gid',$data['gid'],$data)){
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id' => $this->session->users['userId'],
                    'username' => $this->session->users['userName'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'1',
                    'log_message'=>'编辑用户组成功',
                );
                add_system_log($arr);
                echo "<script>alert('操作成功！');window.location.href='".site_url('/Member/group')."'</script>";exit;
            }else{
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id' => $this->session->users['userId'],
                    'username' => $this->session->users['userName'],
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
            if($this->public_model->delete($this->group,'gid',$id)){
                $this->public_model->delete($this->member,'gId',$id);
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id' => $this->session->users['userId'],
                    'username' => $this->session->users['userName'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'1',
                    'log_message'=>'删除用户组成功',
                );
                add_system_log($arr);
                echo "1";exit;
            }else{
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id' => $this->session->users['userId'],
                    'username' => $this->session->users['userName'],
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
            $group = $this->public_model->select_info($this->group,'gid',$id);
            // var_dump($group);
            $group_permission = json_decode($group['user_power'],true);
                //
            if ($this->session->users['type'] == '1') {

                $list = $this->public_model->select($this->systemNav,'id');
                $menus = subtree($list,$group_permission);
                $data['list'] = $menus;

            }else{   
                $list = json_decode($this->session->users['user_power'],true);
                $menus = subtree($list, $group_permission);

                $data['list'] = $menus;

            }
            $data['gid'] = $id;
            $data['menu'] = array('member','group');
            $this->load->view('member/jurisdiction.html',$data);
        }
    }
     function editJurisdiction(){
        if($_POST){
            $data = $this->input->post();
            $plateid = json_decode($data['perm'],true);

           

            foreach ($plateid as $key => $value) {
                
                $query = $this->db->where('id',$value)->get($this->systemNav);
                $menu[] = $query->row_array();
            }
            $arr = array();
            
            $menus = subtree($menu);

            foreach($menus as $key=>$value){
                if($value['status'] == '1'){
                    if($value['pid'] == '0'){
                        $menus_data[$value['id']]['value'] = $value;
                    }else{
                        $menus_data[$value['pid']]['value']['chick'][] = $value;
                    }
                }
            }
           
            
            $data['perm'] = json_encode($menus_data);
            $data['user_power'] = json_encode($menus);
            // echo "<pre>";
            // var_dump($data['user_power']);
            // exit;

            if($this->public_model->updata($this->group,'gid',$data['gid'],$data)){
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id' => $this->session->users['userId'],
                    'username' => $this->session->users['userName'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'1',
                    'log_message'=>'编辑用户组成功',
                );
                add_system_log($arr);
                echo "1";exit;
            }else{
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id' => $this->session->users['userId'],
                    'username' => $this->session->users['userName'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'0',
                    'log_message'=>'编辑用户组失败',
                );
                add_system_log($arr);
                echo "2";exit;
            }
        }
    }

    //后台用户管理
    function adminUser(){

        $config['per_page'] = 10;
        //获取页码
        $current_page = intval($this->uri->segment(3));//index.php 后数第4个/
        //配置
        $config['base_url'] = site_url('/Member/adminUser');
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
        if($this->session->users['type'] == '1'){
            $total = count($this->public_model->select($this->member, 'createTime'));
            $config['total_rows'] = $total;

            $this->load->library('pagination');//加载ci pagination类
            $listpage = $this->public_model->select_page($this->member, 'createTime', $current_page, $config['per_page']);
            $this->pagination->initialize($config);

            $group = $this->public_model->select($this->group, 'gid', 'desc');
            $menu = array('member', 'adminUser');

            $data = array('lists' => $listpage, 'pages' => $this->pagination->create_links(), 'group' => $group, 'menu' => $menu);
        }else{
            $menu = array('member', 'adminUser');
            $listpage = $this->public_model->select_where($this->member, 'createUser', $this->session->users['userId'],'userId','desc');

            $data = array('lists' => $listpage, 'pages' => '', 'menu' => $menu);
        }
       
        $this->load->view('member/adminUser.html',$data);
    }


    //新增后台用户
    function AddUser(){
        if($_POST){
            $data = $this->input->post();
			//根据用户名获取用户
            $user = $this->public_model->select_info($this->member, 'loginNum', $data['loginNum']);
            if (!empty($user)) {
                echo "<script>alert('用户登陆账户已注册！');window.location.href='" . site_url('/Member/adminUser') . "'</script>";
                exit;

            } else {
                 $data['password'] = md5($data['password']);
                 $data['createUser'] = $this->session->users['userId'];
                if ($this->public_model->insert($this->member, $data)) {
                    $arr = array(
                        'log_url' => $this->uri->uri_string(),
                        'user_id' => $this->session->users['userId'],
                        'username' => $this->session->users['userName'],
                        'log_ip' => get_client_ip(),
                        'log_status' => '1',
                        'log_message' => "新增用户信息成功,用户登陆账户是" . $data['loginNum'],
                    );
                    add_system_log($arr);
                    echo "<script>alert('操作成功！');window.location.href='" . site_url('/Member/adminUser') . "'</script>";
                    exit;
                } else {
                    $arr = array(
                        'log_url' => $this->uri->uri_string(),
                        'user_id' => $this->session->users['userId'],
                        'username' => $this->session->users['userName'],
                        'log_ip' => get_client_ip(),
                        'log_status' => 'o',
                        'log_message' => "新增用户信息失败,用户登陆账户是" . $data['loginNum'],
                    );
                    add_system_log($arr);
                    echo "<script>alert('操作失败！');window.location.href='" . site_url('/Member/adminUser') . "'</script>";
                    exit;

                }
            }

        }else{
            if($this->session->users['type'] == '1'){
                $data['group'] = $this->public_model->select($this->group,  'gid', 'desc');

            }else{
                $data['group'] = $this->public_model->select_where($this->group, 'pId', $this->session->users['gId'], 'gid', 'desc');
                $data['defi'] = $this->public_model->select_where($this->department, 'cId', $this->session->users['companyId'], 'id', 'desc');

            }
            $data['company'] = $this->public_model->select($this->company, 'createTime', 'desc');
            $data['menu'] = array('member', 'adminUser');

            $this->load->view('member/addUser.html', $data);
        }
    }
    //
   


    //修改
    function EditUser(){
        if($_POST){
            $data = $this->input->post();
            $user = $this->public_model->ret_userInfo($this->member, 'loginNum', $data['loginNum'],$data['userId']);        
            if(empty($user)){
                if (!empty($data['password'])) {
                    $data['password'] = md5($data['password']);
                } else {
                    unset($data['password']);
                }
               
                if ($this->public_model->updata($this->member, 'userId', $data['userId'], $data)) {
                    $arr = array(
                        'log_url' => $this->uri->uri_string(),
                        'user_id' => $this->session->users['userId'],
                        'username' => $this->session->users['userName'],
                        'log_ip' => get_client_ip(),
                        'log_status' => '1',
                        'log_message' => "编辑用户成功,用户id是:".$data['userId'],
                    );
                    add_system_log($arr);
                    echo "<script>alert('操作成功');window.location.href='" . site_url('/Member/adminUser') . "'</script>";
                } else {
                    $arr = array(
                        'log_url' => $this->uri->uri_string(),
                        'user_id' => $this->session->users['userId'],
                        'username' => $this->session->users['userName'],
                        'log_ip' => get_client_ip(),
                        'log_status' => '0',
                        'log_message' => "编辑用户失败,用户id是:" . $data['userId'],
                    );
                    add_system_log($arr);
                    echo "<script>alert('操作失败');window.location.href='" . site_url('/Member/adminUser') . "'</script>";

                }
            }else{
                echo "<script>alert('用户登陆账户已注册！');window.location.href='" . site_url('/Member/adminUser') . "'</script>";
                exit;
            }
        }else{
            $id = intval($this->uri->segment('3'));
            if($id != '0'){
                $users = $this->public_model->select_info($this->member,'userId',$id);
                
                if ($this->session->users['type'] == '1') {
                    $data['group'] = $this->public_model->select($this->group, 'gid', 'desc');
                    $data['company'] = $this->public_model->select($this->company, 'createTime', 'desc');

                } else {
                    $data['group'] = $this->public_model->select_where($this->group, 'pId', $this->session->users['gId'], 'gid', 'desc');
                }
                $data['menu'] = array('member', 'adminUser');
                $data['defi'] = $this->public_model->select_where($this->department,'cId', $users['companyId'],'id','desc');
                $data['users']= $users;

                $this->load->view('member/editUser.html', $data);
            }else{
                $this->load->view('404.html');
            }
        }
    }

    //删除
    function delUser(){
        if($_POST){
            $id = $this->input->post('id');
            $name = $this->input->post('name');
            if($id == '1'){
                echo "3";
                exit;
            }
            if($this->public_model->delete($this->member,'userId',$id)){
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                     'user_id'=> $this->session->users['userId'],
                    'username'=>$this->session->users['userName'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'1',
                    'log_message'=>"删除用户成功,用户id是:".$id.',用户名称是'.$name,
                );
                add_system_log($arr);
                echo "1";

            }else{
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                     'user_id'=> $this->session->users['userId'],
                    'username'=>$this->session->users['userName'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'0',
                    'log_message' => "删除用户失败,用户id是:" . $id . ',用户名称是' . $name,
                );
                add_system_log($arr);
                echo "2";
            }
        }
    }

    //个人资料
    function menberInfo(){
        
    }

    //公司总负责人
    // function companyUser(){
    //     $config['per_page'] = 10;
    //     //获取页码
    //     $current_page = intval($this->uri->segment(3));//index.php 后数第4个/
    //     //配置
    //     $config['base_url'] = site_url('/Member/companyUser');
    //     //分页配置
    //     $config['full_tag_open'] = '<ul class="am-pagination tpl-pagination"">';
    //     $config['full_tag_close'] = '</ul>';
    //     $config['first_tag_open'] = '<li>';

    //     $config['first_tag_close'] = '</li>';

    //     $config['prev_tag_open'] = '<li>';

    //     $config['prev_tag_close'] = '</li>';

    //     $config['next_tag_open'] = '<li>';

    //     $config['next_tag_close'] = '</li>';

    //     $config['cur_tag_open'] = '<li class="am-active"><a>';

    //     $config['cur_tag_close'] = '</a></li>';

    //     $config['last_tag_open'] = '<li>';

    //     $config['last_tag_close'] = '</li>';

    //     $config['num_tag_open'] = '<li>';

    //     $config['num_tag_close'] = '</li>';

    //     $config['first_link'] = '首页';

    //     $config['next_link'] = '»';

    //     $config['prev_link'] = '«';

    //     $config['last_link'] = '末页';
    //     $config['num_links'] = 4;

    //     $total = count($this->public_model->select('hj_company_user', 'createTime'));
    //     $config['total_rows'] = $total;

    //     $this->load->library('pagination');//加载ci pagination类
    //     $listpage = $this->public_model->select_page('hj_company_user', 'createTime', $current_page, $config['per_page']);
    //     $this->pagination->initialize($config);

    //     $group = $this->public_model->select($this->group, 'gid', 'desc');
    //     $menu = array('member', 'companyUser');
        
    //     $data = array('lists' => $listpage, 'pages' => $this->pagination->create_links(), 'group' => $group, 'menu' => $menu);
    //     $this->load->view('member/companyUser.html', $data);
    // }    

    // function addCompanyUser(){
    //     if($_POST){
    //         $data = $this->input->post();
    //         // $data['passWord'] = md5($data['passWord']);
    //         $user = $this->public_model->select_info('hj_company_user', 'loginNum', $data['loginNum']);
    //         if (!empty($user)) {
    //             echo "<script>alert('用户登陆账户已注册！');window.location.href='" . site_url('/Member/companyUser') . "'</script>";
    //             exit;

    //         } else {
    //             $data['passWord'] = md5($data['passWord']);
    //             if ($this->public_model->insert('hj_company_user', $data)) {
    //                 $arr = array(
    //                     'log_url' => $this->uri->uri_string(),
    //                     'user_id' => $this->session->users['userId'],
    //                     'username' => $this->session->users['userName'],
    //                     'log_ip' => get_client_ip(),
    //                     'log_status' => '1',
    //                     'log_message' => "新增公司负责人信息成功,用户登陆账户是" . $data['loginNum'],
    //                 );
    //                 add_system_log($arr);
    //                 echo "<script>alert('操作成功！');window.location.href='" . site_url('/Member/companyUser') . "'</script>";
    //                 exit;
    //             } else {
    //                 $arr = array(
    //                     'log_url' => $this->uri->uri_string(),
    //                     'user_id' => $this->session->users['userId'],
    //                     'username' => $this->session->users['userName'],
    //                     'log_ip' => get_client_ip(),
    //                     'log_status' => 'o',
    //                     'log_message' => "新增公司负责人信息失败,用户登陆账户是" . $data['loginNum'],
    //                 );
    //                 add_system_log($arr);
    //                 echo "<script>alert('操作失败！');window.location.href='" . site_url('/Member/companyUser') . "'</script>";
    //                 exit;

    //             }
    //         }

    //     }else{
    //         $data['group'] = $this->public_model->select($this->group, 'gid', 'desc');
    //         $data['company'] = $this->public_model->select($this->company, 'createTime', 'desc');
    //         $data['menu'] = array('member', 'companyUser');
    //         $this->load->view('member/addCompanyUser.html', $data);
    //     }
    // }

    // function editCompanyUser(){
    //     if($_POST){
    //         $data = $this->input->post();
    //         $user = $this->public_model->ret_CompanyuserInfo('hj_company_user', 'loginNum', $data['loginNum'], $data['id']);
    //         if (empty($user)) {
    //             if (!empty($data['password'])) {
    //                 $data['passWord'] = md5($data['passWord']);
    //             } else {
    //                 unset($data['passWord']);
    //             }

    //             if ($this->public_model->updata('hj_company_user', 'id', $data['id'], $data)) {
    //                 $arr = array(
    //                     'log_url' => $this->uri->uri_string(),
    //                     'user_id' => $this->session->users['userId'],
    //                     'username' => $this->session->users['userName'],
    //                     'log_ip' => get_client_ip(),
    //                     'log_status' => '1',
    //                     'log_message' => "编辑公司负责人成功,用户id是:" . $data['id'],
    //                 );
    //                 add_system_log($arr);
    //                 echo "<script>alert('操作成功');window.location.href='" . site_url('/Member/companyUser') . "'</script>";
    //             } else {
    //                 $arr = array(
    //                     'log_url' => $this->uri->uri_string(),
    //                     'user_id' => $this->session->users['userId'],
    //                     'username' => $this->session->users['userName'],
    //                     'log_ip' => get_client_ip(),
    //                     'log_status' => '0',
    //                     'log_message' => "编辑公司负责人失败,用户id是:" . $data['id'],
    //                 );
    //                 add_system_log($arr);
    //                 echo "<script>alert('操作失败');window.location.href='" . site_url('/Member/companyUser') . "'</script>";

    //             }
    //         } else {
    //             echo "<script>alert('用户登陆账户已注册！');window.location.href='" . site_url('/Member/companyUser') . "'</script>";
    //             exit;
    //         }
    //     }else{
    //         $id = intval($this->uri->segment(3));
    //         if ($id != '0') {
    //             $users = $this->public_model->select_info('hj_company_user', 'id', $id);

    //             $data['group'] = $this->public_model->select($this->group, 'gid', 'desc');
    //             $data['company'] = $this->public_model->select($this->company, 'createTime', 'desc');
    //             $data['menu'] = array('member', 'companyUser');
    //             $data['defi'] = $this->public_model->select_where($this->department, 'cId', $users['companyId'], 'id', 'desc');
    //             $data['users'] = $users;

    //             $this->load->view('member/editCompanyUser.html', $data);
    //         } else {
    //             $this->load->view('404.html');
    //         }
    //     }
      
    // }

}
 ?>