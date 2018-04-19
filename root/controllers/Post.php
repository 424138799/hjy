<?php 
defined('BASEPATH') or exit('No direct script access allowed');
require_once(APPPATH . 'controllers/Default_Controller.php');

/**
 *    网站首页
 */
class Post extends Default_Controller
{

    public $developers = 'developers';//开发商
    public $company = 'sales_company';//销售公司
    public $salesUser = 'sales_user';
    public $business = 'business';
    public $member = 'admin_user';


    function __construct()
    {
        parent::__construct();
    }

    //开发商
    function developers(){
        $config['per_page'] = 10;
        //获取页码
        $current_page = intval($this->uri->segment(3));//index.php 后数第4个/
        //配置
        $config['base_url'] = site_url('/Post/developers');
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

        $total = count($this->public_model->select($this->developers, 'createTime'));
        $config['total_rows'] = $total;

        $this->load->library('pagination');//加载ci pagination类
        $listpage = $this->public_model->select_page($this->developers, 'createTime', $current_page, $config['per_page']);
        $this->pagination->initialize($config);

        $data = array('lists' => $listpage, 'pages' => $this->pagination->create_links());


        $this->load->view('post/developers.html',$data);
    }

    //新增开发商信息
    function addDevel(){
        if($_POST){
            $data = $this->input->post();
            if (!empty($_FILES['file']['name'])) {
                $config['upload_path'] = 'upload/developers/';
                $config['allowed_types'] = 'gif|jpg|png|jpeg';
                $config['max_size'] = 5120;
                $config['file_name'] = date('y-m-d_His');
                $this->load->library('upload', $config);
                // 上传
                if (!$this->upload->do_upload('file')) {
                    echo "<script>alert('文件上传失败！');history.back(-1);</script>";
                    exit;
                } else {
                    $data['licensePic'] = 'upload/developers/' . $this->upload->data('file_name');
                }
            }

            if ($this->public_model->insert($this->developers, $data)) {
                $arr = array(
                    'log_url' => $this->uri->uri_string(),
                    'user_id' => $this->session->users['userId'],
                    'username' => $this->session->users['userName'],
                    'log_ip' => get_client_ip(),
                    'log_status' => '1',
                    'log_message' => "新增开发商成功,开发商名称是：" . $data['title'],
                );
                add_system_log($arr);
                echo "<script>alert('操作成功！');window.location.href='" . site_url('/Post/developers') . "'</script>";
                exit;
            } else {
                $arr = array(
                    'log_url' => $this->uri->uri_string(),
                    'user_id' => $this->session->users['userId'],
                    'username' => $this->session->users['userName'],
                    'log_ip' => get_client_ip(),
                    'log_status' => '0',
                    'log_message' => "新增开发商失败,开发商名称是：" . $data['title'],
                );
                add_system_log($arr);
                echo "<script>alert('操作失败！');window.location.href='" . site_url('/Post/developers') . "'</script>";
                exit;
            }
        }else{
            //获取用户
            $data['users'] = $this->public_model->select($this->member,'userId','desc');
            $this->load->view('post/addDevel.html',$data);
        }
    }

    //编辑开发商
    function editDevelopers(){
        if ($_POST) {
            $data = $this->input->post();
            if (!empty($_FILES['file']['name'])) {
                $config['upload_path'] = 'upload/developers/';
                $config['allowed_types'] = 'gif|jpg|png|jpeg';
                $config['max_size'] = 5120;
                $config['file_name'] = date('y-m-d_His');
                $this->load->library('upload', $config);
                // 上传
                if (!$this->upload->do_upload('file')) {
                    echo "<script>alert('文件上传失败！');history.back(-1);</script>";
                    exit;
                } else {
                    $data['licensePic'] = 'upload/developers/' . $this->upload->data('file_name');
                }
            }

            if ($this->public_model->updata($this->developers, 'id',$data['id'],$data)) {
                $arr = array(
                    'log_url' => $this->uri->uri_string(),
                    'user_id' => $this->session->users['userId'],
                    'username' => $this->session->users['userName'],
                    'log_ip' => get_client_ip(),
                    'log_status' => '1',
                    'log_message' => "编辑开发商成功,开发商名称是：" . $data['title'].',开发商id是：'.$data['id'],
                );
                add_system_log($arr);
                echo "<script>alert('操作成功！');window.location.href='" . site_url('/Post/developers') . "'</script>";
                exit;
            } else {
                $arr = array(
                    'log_url' => $this->uri->uri_string(),
                    'user_id' => $this->session->users['userId'],
                    'username' => $this->session->users['userName'],
                    'log_ip' => get_client_ip(),
                    'log_status' => '0',
                    'log_message' => "编辑开发商失败,开发商名称是：" . $data['title'] . ',开发商id是：' . $data['id'],
                );
                add_system_log($arr);
                echo "<script>alert('操作失败！');window.location.href='" . site_url('/Post/developers') . "'</script>";
                exit;
            }
        } else {
            $id = intval($this->uri->segment(3));
            if($id != 0){
                //获取
                $data['devel'] = $this->public_model->select_info($this->developers,'id',$id);
                //获取用户
                $data['users'] = $this->public_model->select($this->member, 'userId', 'desc');
                $this->load->view('post/editDevel.html', $data);
            }else{
                $this->load->view('404.html');
            }
            
        }
    }
    //删除开发商信息
    function delDevelopers(){
        if($_POST){
            $data = $this->input->post();
            if($this->public_model->delete($this->developers,'id',$data['id'])){
                $arr = array(
                    'log_url' => $this->uri->uri_string(),
                    'user_id' => $this->session->users['userId'],
                    'username' => $this->session->users['userName'],
                    'log_ip' => get_client_ip(),
                    'log_status' => '1',
                    'log_message' => "删除开发商成功,开发商名称是：" . $data['name'] . ',开发商id是：' . $data['id'],
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
                    'log_message' => "删除开发商失败,开发商名称是：" . $data['name'] . ',开发商id是：' . $data['id'],
                );
                add_system_log($arr);
                echo "2";
                exit;
            }
        }else{
            echo "3";
        }
    }



    //销售公司
    function salesCompany(){
        $config['per_page'] = 10;
        //获取页码
        $current_page = intval($this->uri->segment(3));//index.php 后数第4个/
        //配置
        $config['base_url'] = site_url('/Post/salesCompany');
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

        $this->load->view('post/salesCompany.html',$data);
    }

    //新增销售公司
    function AddCompany(){
        if($_POST){
            $data = $this->input->post();
            if (!empty($_FILES['file']['name'])) {
                $config['upload_path'] = 'upload/company/';
                $config['allowed_types'] = 'gif|jpg|png|jpeg';
                $config['max_size'] = 5120;
                $config['file_name'] = date('y-m-d_His');
                $this->load->library('upload', $config);
                // 上传
                if (!$this->upload->do_upload('file')) {
                    echo "<script>alert('文件上传失败！');history.back(-1);</script>";
                    exit;
                } else {
                    $data['licensePic'] = 'upload/company/' . $this->upload->data('file_name');
                }
            }

            if ($this->public_model->insert($this->company, $data)) {
                $arr = array(
                    'log_url' => $this->uri->uri_string(),
                    'user_id' => $this->session->users['userId'],
                    'username' => $this->session->users['userName'],
                    'log_ip' => get_client_ip(),
                    'log_status' => '1',
                    'log_message' => "新增销售公司成功,销售公司名称是：" . $data['companyName'],
                );
                add_system_log($arr);
                echo "<script>alert('操作成功！');window.location.href='" . site_url('/Post/salesCompany') . "'</script>";
                exit;
            } else {
                $arr = array(
                    'log_url' => $this->uri->uri_string(),
                    'user_id' => $this->session->users['userId'],
                    'username' => $this->session->users['userName'],
                    'log_ip' => get_client_ip(),
                    'log_status' => '0',
                    'log_message' => "新增销售公司失败,销售公司名称是：" . $data['companyName'],
                );
                add_system_log($arr);
                echo "<script>alert('操作失败！');window.location.href='" . site_url('/Post/salesCompany') . "'</script>";
                exit;
            }
        }else{
            //获取用户
            $data['users'] = $this->public_model->select($this->member, 'userId', 'desc');
            $this->load->view('post/addCompany.html', $data);
        }
    }

    //编辑销售公司
    function editCompany(){
        if($_POST){
            $data = $this->input->post();
            if (!empty($_FILES['file']['name'])) {
                $config['upload_path'] = 'upload/company/';
                $config['allowed_types'] = 'gif|jpg|png|jpeg';
                $config['max_size'] = 5120;
                $config['file_name'] = date('y-m-d_His');
                $this->load->library('upload', $config);
                // 上传
                if (!$this->upload->do_upload('file')) {
                    echo "<script>alert('文件上传失败！');history.back(-1);</script>";
                    exit;
                } else {
                    $data['licensePic'] = 'upload/company/' . $this->upload->data('file_name');
                }
            }

            if ($this->public_model->updata($this->company,'id',$data['id'], $data)) {
                $arr = array(
                    'log_url' => $this->uri->uri_string(),
                    'user_id' => $this->session->users['userId'],
                    'username' => $this->session->users['userName'],
                    'log_ip' => get_client_ip(),
                    'log_status' => '1',
                    'log_message' => "编辑销售公司成功,销售公司名称是：" . $data['companyName'],
                );
                add_system_log($arr);
                echo "<script>alert('操作成功！');window.location.href='" . site_url('/Post/salesCompany') . "'</script>";
                exit;
            } else {
                $arr = array(
                    'log_url' => $this->uri->uri_string(),
                    'user_id' => $this->session->users['userId'],
                    'username' => $this->session->users['userName'],
                    'log_ip' => get_client_ip(),
                    'log_status' => '0',
                    'log_message' => "编辑销售公司失败,销售公司名称是：" . $data['companyName'],
                );
                add_system_log($arr);
                echo "<script>alert('操作失败！');window.location.href='" . site_url('/Post/salesCompany') . "'</script>";
                exit;
            }
        }else{
            $id = intval($this->uri->segment(3));
            if($id != '0'){
                //获取信息
                $data['company'] = $this->public_model->select_info($this->company,'id',$id);
                //
                $data['users'] = $this->public_model->select($this->member, 'userId', 'desc');
                $this->load->view('post/editCompany.html', $data);
            }else{
                $this->load->view('404.html');
            }
          
        }
    }
    //删除销售公司
    function delCompany(){
        if($_POST){
            $data = $this->input->post();
            if ($this->public_model->delete($this->company, 'id', $data['id'])) {
                $arr = array(
                    'log_url' => $this->uri->uri_string(),
                    'user_id' => $this->session->users['userId'],
                    'username' => $this->session->users['userName'],
                    'log_ip' => get_client_ip(),
                    'log_status' => '1',
                    'log_message' => "删除销售公司成功,销售公司名称是：" . $data['name'] . ',开发商id是：' . $data['id'],
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
                    'log_message' => "删除销售公司失败,销售公司名称是：" . $data['name'] . ',开发商id是：' . $data['id'],
                );
                add_system_log($arr);
                echo "2";
                exit;
            }
        }else{
            echo "3";
        }
    }


    //销售人员
    function salesUser(){
        $config['per_page'] = 10;
        //获取页码
        $current_page = intval($this->uri->segment(3));//index.php 后数第4个/
        //配置
        $config['base_url'] = site_url('/Post/salesUser');
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

        $total = count($this->public_model->select($this->salesUser, 'createTime'));
        $config['total_rows'] = $total;

        $this->load->library('pagination');//加载ci pagination类
        $listpage = $this->public_model->select_page($this->salesUser, 'createTime', $current_page, $config['per_page']);
        $this->pagination->initialize($config);

        $data = array('lists' => $listpage, 'pages' => $this->pagination->create_links());

        $this->load->view('post/salesUser.html',$data);
    }

    //新增销售人员
    function addSalesUser(){
        if ($_POST) {
            $data = $this->input->post();
            if (!empty($_FILES['file']['name'])) {
                $config['upload_path'] = 'upload/user/';
                $config['allowed_types'] = 'gif|jpg|png|jpeg';
                $config['max_size'] = 5120;
                $config['file_name'] = date('y-m-d_His');
                $this->load->library('upload', $config);
                // 上传
                if (!$this->upload->do_upload('file')) {
                    echo "<script>alert('文件上传失败！');history.back(-1);</script>";
                    exit;
                } else {
                    $data['headPic'] = 'upload/user/' . $this->upload->data('file_name');
                }
            }

            if ($this->public_model->insert($this->salesUser, $data)) {
                $arr = array(
                    'log_url' => $this->uri->uri_string(),
                    'user_id' => $this->session->users['userId'],
                    'username' => $this->session->users['userName'],
                    'log_ip' => get_client_ip(),
                    'log_status' => '1',
                    'log_message' => "新增销售人员成功,销售公司名称是：" . $data['c_id'].',销售人员名称是：'.$data['userName'],
                );
                add_system_log($arr);
                echo "<script>alert('操作成功！');window.location.href='" . site_url('/Post/salesUser') . "'</script>";
                exit;
            } else {
                $arr = array(
                    'log_url' => $this->uri->uri_string(),
                    'user_id' => $this->session->users['userId'],
                    'username' => $this->session->users['userName'],
                    'log_ip' => get_client_ip(),
                    'log_status' => '0',
                    'log_message' => "新增销售人员失败,销售公司名称是：" . $data['c_id'] . ',销售人员名称是：' . $data['userName'],
                );
                add_system_log($arr);
                echo "<script>alert('操作失败！');window.location.href='" . site_url('/Post/salesUser') . "'</script>";
                exit;
            }
        } else {
            //获取用户
            $data['company'] = $this->public_model->select($this->company, 'createTime', 'desc');
            $this->load->view('post/addSalesUser.html', $data);
        }
    }

    //编辑销售人员
    function editSalesUser(){
        if($_POST){
            $data = $this->input->post();
            if (!empty($_FILES['file']['name'])) {
                $config['upload_path'] = 'upload/user/';
                $config['allowed_types'] = 'gif|jpg|png|jpeg';
                $config['max_size'] = 5120;
                $config['file_name'] = date('y-m-d_His');
                $this->load->library('upload', $config);
                // 上传
                if (!$this->upload->do_upload('file')) {
                    echo "<script>alert('文件上传失败！');history.back(-1);</script>";
                    exit;
                } else {
                    $data['headPic'] = 'upload/user/' . $this->upload->data('file_name');
                }
            }
            if ($this->public_model->updata($this->salesUser,'id',$data['id'],$data)) {
                $arr = array(
                    'log_url' => $this->uri->uri_string(),
                    'user_id' => $this->session->users['userId'],
                    'username' => $this->session->users['userName'],
                    'log_ip' => get_client_ip(),
                    'log_status' => '1',
                    'log_message' => "编辑销售人员成功,销售公司ID是：" . $data['c_id'] . ',销售人员名称是：' . $data['userName'],
                );
                add_system_log($arr);
                echo "<script>alert('操作成功！');window.location.href='" . site_url('/Post/salesUser') . "'</script>";
                exit;
            } else {
                $arr = array(
                    'log_url' => $this->uri->uri_string(),
                    'user_id' => $this->session->users['userId'],
                    'username' => $this->session->users['userName'],
                    'log_ip' => get_client_ip(),
                    'log_status' => '0',
                    'log_message' => "编辑销售人员失败,销售公司ID是：" . $data['c_id'] . ',销售人员名称是：' . $data['userName'],
                );
                add_system_log($arr);
                echo "<script>alert('操作失败！');window.location.href='" . site_url('/Post/salesUser') . "'</script>";
                exit;
            }
        } else {
            $id = intval($this->uri->segment(3));
            if($id != '0'){
                $data['users'] = $this->public_model->select_info($this->salesUser,'id',$id); 
                 //获取用户
                $data['company'] = $this->public_model->select($this->company, 'createTime', 'desc');
                $this->load->view('post/editSalesUser.html', $data);
            }else{
                $this->load->view('404.html');
            }
           
        }
    }
    //删除销售人员
    function delSalesUser(){
        if($_POST){
            $data = $this->input->post();
            if($this->public_model->delete($this->salesUser,'id',$data['id'])){
                $arr = array(
                    'log_url' => $this->uri->uri_string(),
                    'user_id' => $this->session->users['userId'],
                    'username' => $this->session->users['userName'],
                    'log_ip' => get_client_ip(),
                    'log_status' => '1',
                    'log_message' => "删除销售人员成功,销售人员id是：" . $data['id'] . ',销售人员名称是：' . $data['name'],
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
                    'log_message' => "删除销售人员失败,销售人员id是：" . $data['id'] . ',销售人员名称是：' . $data['name'],
                );
                add_system_log($arr);
                echo "2";
                exit;
            }
        }else{
            echo "3";
        }
    }


    //商家
    function business(){

        $config['per_page'] = 10;
        //获取页码
        $current_page = intval($this->uri->segment(3));//index.php 后数第4个/
        //配置
        $config['base_url'] = site_url('/Post/business');
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

        $total = count($this->public_model->select($this->business, 'createTime'));
        $config['total_rows'] = $total;

        $this->load->library('pagination');//加载ci pagination类
        $listpage = $this->public_model->select_page($this->business, 'createTime', $current_page, $config['per_page']);
        $this->pagination->initialize($config);

        $data = array('lists' => $listpage, 'pages' => $this->pagination->create_links());

        $this->load->view('post/business.html',$data);
    }

    //新增商家
    function addHusiness(){
        if($_POST){

        }else{

            $this->load->view('post/addBusiness.html');
        }
    }

    //编辑商家
    function editHusiness(){

    }

    //删除商家
    function delHusiness(){

    }



    //小区管理
    function village(){
        $this->load->view('post/village.html');

    }
    //车位管理
    function carPark(){
        $this->load->view('post/carPark.html');
    } 


}