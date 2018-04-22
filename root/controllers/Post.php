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
    public $salesUser = 'sales_user';//销售人员
    public $business = 'business';//商家
    public $member = 'admin_user';//用户
    public $village = 'village';//小区
    public $bank = 'bank';//小区
    public $carPark = 'car_parking';//小区


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
        $menu = array('village', 'developers');

        $data = array('lists' => $listpage, 'pages' => $this->pagination->create_links(),'menu'=>$menu);


        $this->load->view('post/developers.html',$data);
    }
    //开发商搜索
    function searchDevel(){
        $config['per_page'] = 10;
        //获取页码
        $current_page = intval($this->input->get("size"));//index.php 后数第4个/
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
        $config['first_link'] = '首页';

        $config['next_link'] = '下一页';

        $config['prev_link'] = '上一页';

        $config['last_link'] = '末页';

        $list = $this->public_model->searchLike($this->developers,'title',$sear);
       
        $config['total_rows'] = count($list);

        $config['page_query_string'] = true;//关键配置
        // $config['reuse_query_string'] = FALSE;
        $config['query_string_segment'] = 'size';
        $config['base_url'] = site_url('/Post/searchDevel?') . "sear=" . $sear;

        // //分页数据\
        $listpage = $this->public_model->searchLikePage($this->developers, 'title',$sear, $config['per_page'], $current_page);
        $this->load->library('pagination');//加载ci pagination类

        $this->pagination->initialize($config);

        // var_dump($data);
        $menu = array('village', 'developers');

        $data = array('lists' => $listpage, 'pages' => $this->pagination->create_links(), 'menu' => $menu);
        $this->load->view('post/developers.html', $data);

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
                    $licensePic = 'upload/developers/' . $this->upload->data('file_name');
                     //骑牛上次
                    $data['licensePic'] = qiniu($licensePic, 'developers');
                    unlink($licensePic);

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
            $data['menu'] = array('village', 'developers');

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
                    $licensePic = 'upload/developers/' . $this->upload->data('file_name');
                    $data['licensePic'] = qiniu($licensePic, 'developers');
                    unlink($licensePic);
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
                $data['menu'] = array('village', 'developers');

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
        $menu = array('village', 'salesCompany');

        $data = array('lists' => $listpage, 'pages' => $this->pagination->create_links(),'menu'=>$menu);

        $this->load->view('post/salesCompany.html',$data);
    }
    //搜索销售公司
    function searchSalesCompany(){
        $config['per_page'] = 10;
        //获取页码
        $current_page = intval($this->input->get("size"));//index.php 后数第4个/
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
        $config['first_link'] = '首页';

        $config['next_link'] = '下一页';

        $config['prev_link'] = '上一页';

        $config['last_link'] = '末页';

        $list = $this->public_model->searchLike($this->company, 'companyName', $sear);

        $config['total_rows'] = count($list);

        $config['page_query_string'] = true;//关键配置
        // $config['reuse_query_string'] = FALSE;
        $config['query_string_segment'] = 'size';
        $config['base_url'] = site_url('/Post/searchSalesCompany?') . "sear=" . $sear;

        // //分页数据\
        $listpage = $this->public_model->searchLikePage($this->company, 'companyName', $sear, $config['per_page'], $current_page);
        $this->load->library('pagination');//加载ci pagination类

        $this->pagination->initialize($config);

        // var_dump($data);
        $menu = array('village', 'salesCompany');

        $data = array('lists' => $listpage, 'pages' => $this->pagination->create_links(), 'menu' => $menu);
        $this->load->view('post/salesCompany.html', $data);

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
                    $licensePic = 'upload/company/' . $this->upload->data('file_name');
                    $data['licensePic'] = qiniu($licensePic, 'salesCompany');
                    unlink($licensePic);
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
            $data['menu'] = array('village', 'salesCompany');

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
                    $licensePic = 'upload/company/' . $this->upload->data('file_name');
                    $data['licensePic'] = qiniu($licensePic, 'salesCompany');
                    unlink($licensePic);
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
                $data['menu'] = array('village', 'salesCompany');

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
        $menu = array('village', 'salesUser');

        $data = array('lists' => $listpage, 'pages' => $this->pagination->create_links(),'menu'=>$menu);

        $this->load->view('post/salesUser.html',$data);
    }
    //销售人员
    function searchSalesUser(){
        $config['per_page'] = 10;
        //获取页码
        $current_page = intval($this->input->get("size"));//index.php 后数第4个/
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
        $config['first_link'] = '首页';

        $config['next_link'] = '下一页';

        $config['prev_link'] = '上一页';

        $config['last_link'] = '末页';

        $list = $this->public_model->searchManyLike($this->salesUser, 'userName','phone', $sear);

        $config['total_rows'] = count($list);

        $config['page_query_string'] = true;//关键配置
        // $config['reuse_query_string'] = FALSE;
        $config['query_string_segment'] = 'size';
        $config['base_url'] = site_url('/Post/searchSalesUser?') . "sear=" . $sear;

        // //分页数据\
        $listpage = $this->public_model->searchManyLikePage($this->salesUser, 'userName','phone', $sear, $config['per_page'], $current_page);
        $this->load->library('pagination');//加载ci pagination类

        $this->pagination->initialize($config);

        // var_dump($data);
        $menu = array('village', 'salesUser');

        $data = array('lists' => $listpage, 'pages' => $this->pagination->create_links(), 'menu' => $menu);
        $this->load->view('post/salesUser.html', $data);
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
                    $headPic = 'upload/user/' . $this->upload->data('file_name');
                    $data['headPic'] = qiniu($headPic, 'userHeader');
                    unlink($headPic);
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
            $data['menu'] = array('village', 'salesUser');

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
                    $headPic = 'upload/user/' . $this->upload->data('file_name');
                    $data['headPic'] = qiniu($headPic, 'userHeader');
                    unlink($headPic);
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
                $data['menu'] = array('village', 'salesUser');

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
        $menu = array('village', 'business');

        $data = array('lists' => $listpage, 'pages' => $this->pagination->create_links(),'menu'=>$menu);

        $this->load->view('post/business.html',$data);
    }
    //搜索商家
    function searchBusiness(){
        $config['per_page'] = 10;
        //获取页码
        $current_page = intval($this->input->get("size"));//index.php 后数第4个/
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
        $config['first_link'] = '首页';

        $config['next_link'] = '下一页';

        $config['prev_link'] = '上一页';

        $config['last_link'] = '末页';

        $list = $this->public_model->searchLike($this->business, 'title', $sear);

        $config['total_rows'] = count($list);

        $config['page_query_string'] = true;//关键配置
        // $config['reuse_query_string'] = FALSE;
        $config['query_string_segment'] = 'size';
        $config['base_url'] = site_url('/Post/searchBusiness?') . "sear=" . $sear;

        // //分页数据\
        $listpage = $this->public_model->searchLikePage($this->business, 'title', $sear, $config['per_page'], $current_page);
        $this->load->library('pagination');//加载ci pagination类

        $this->pagination->initialize($config);

        // var_dump($data);
        $menu = array('village', 'business');

        $data = array('lists' => $listpage, 'pages' => $this->pagination->create_links(), 'menu' => $menu);
        $this->load->view('post/business.html', $data);
    }



    //新增商家
    function addHusiness(){
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
                    $logo = 'upload/user/' . $this->upload->data('file_name');
                    $data['logo'] = qiniu($logo, 'bisinessLogo');
                    unlink($logo);
                }
            }

            if ($this->public_model->insert($this->business, $data)) {
                $arr = array(
                    'log_url' => $this->uri->uri_string(),
                    'user_id' => $this->session->users['userId'],
                    'username' => $this->session->users['userName'],
                    'log_ip' => get_client_ip(),
                    'log_status' => '1',
                    'log_message' => "新增商家成功,商家名称是：" . $data['title'],
                );
                add_system_log($arr);
                echo "<script>alert('操作成功！');window.location.href='" . site_url('/Post/business') . "'</script>";
                exit;
            } else {
                $arr = array(
                    'log_url' => $this->uri->uri_string(),
                    'user_id' => $this->session->users['userId'],
                    'username' => $this->session->users['userName'],
                    'log_ip' => get_client_ip(),
                    'log_status' => '0',
                    'log_message' => "新增商家失败,商家名称是：" . $data['title'],
                );
                add_system_log($arr);
                echo "<script>alert('操作失败！');window.location.href='" . site_url('/Post/business') . "'</script>";
                exit;
            }                            
        }else{
            $data['menu'] = array('village', 'business');

            $this->load->view('post/addBusiness.html',$data);
        }
    }

    //编辑商家
    function editHusiness(){
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
                    $logo = 'upload/user/' . $this->upload->data('file_name');
                    $data['logo'] = qiniu($logo, 'bisinessLogo');
                    unlink($logo);
                }
            }
           
            if ($this->public_model->updata($this->business,'id',$data['id'],$data)) {
                $arr = array(
                    'log_url' => $this->uri->uri_string(),
                    'user_id' => $this->session->users['userId'],
                    'username' => $this->session->users['userName'],
                    'log_ip' => get_client_ip(),
                    'log_status' => '1',
                    'log_message' => "编辑商家成功,商家名称是：" . $data['title'].',商家id是：'.$data['id'],
                );
                add_system_log($arr);
                echo "<script>alert('操作成功！');window.location.href='" . site_url('/Post/business') . "'</script>";
                exit;
            } else {
                $arr = array(
                    'log_url' => $this->uri->uri_string(),
                    'user_id' => $this->session->users['userId'],
                    'username' => $this->session->users['userName'],
                    'log_ip' => get_client_ip(),
                    'log_status' => '0',
                    'log_message' => "编辑商家失败,商家名称是：" . $data['title'] . ',商家id是：' . $data['id'],
                );
                add_system_log($arr);
                echo "<script>alert('操作失败！');window.location.href='" . site_url('/Post/business') . "'</script>";
                exit;
            }
        } else {
            $id = intval($this->uri->segment(3));
            if($id != '0'){
                //获取信息
                $data['buesion'] = $this->public_model->select_info($this->business,'id',$id);

                $data['menu'] = array('village', 'business');

                $this->load->view('post/editBusiness.html',$data);
            }else{
                $this->load->view('404.html');
            }

        }
    }

    //删除商家
    function delHusiness(){
        if($_POST){
            $data = $this->input->post();
            if($this->public_model->delete($this->business,'id',$data['id'])){
                $arr = array(
                    'log_url' => $this->uri->uri_string(),
                    'user_id' => $this->session->users['userId'],
                    'username' => $this->session->users['userName'],
                    'log_ip' => get_client_ip(),
                    'log_status' => '1',
                    'log_message' => "删除商家成功,商家名称是：" . $data['name'] . ',商家id是：' . $data['id'],
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
                    'log_message' => "删除商家失败,商家名称是：" . $data['name'] . ',商家id是：' . $data['id'],
                );
                add_system_log($arr);
                echo "2";
                exit;
            }

        }else{
            echo "3";
        }
    }

    //小区管理
    function village(){
        $config['per_page'] = 10;
        //获取页码
        $current_page = intval($this->uri->segment(3));//index.php 后数第4个/
        //配置
        $config['base_url'] = site_url('/Post/village');
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

        $total = count($this->public_model->select($this->village, 'updataTime'));
        $config['total_rows'] = $total;

        $this->load->library('pagination');//加载ci pagination类
        $listpage = $this->public_model->select_page($this->village, 'updataTime', $current_page, $config['per_page']);
        $this->pagination->initialize($config);



        $menu = array('village', 'village');

        $data = array('lists' => $listpage, 'pages' => $this->pagination->create_links(),'menu'=>$menu);
        $this->load->view('post/village.html',$data);
    }
    //搜索小区
    function searchVillage()
    {
        $config['per_page'] = 10;
        //获取页码
        $current_page = intval($this->input->get("size"));//index.php 后数第4个/
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
        $config['first_link'] = '首页';

        $config['next_link'] = '下一页';

        $config['prev_link'] = '上一页';

        $config['last_link'] = '末页';

        $list = $this->public_model->searchLike($this->village, 'villageTitle', $sear);

        $config['total_rows'] = count($list);

        $config['page_query_string'] = true;//关键配置
        // $config['reuse_query_string'] = FALSE;
        $config['query_string_segment'] = 'size';
        $config['base_url'] = site_url('/Post/searchVillage?') . "sear=" . $sear;

        // //分页数据\
        $listpage = $this->public_model->searchLikePage($this->village, 'villageTitle', $sear, $config['per_page'], $current_page);
        $this->load->library('pagination');//加载ci pagination类

        $this->pagination->initialize($config);

        // var_dump($data);
        $menu = array('village', 'village');

        $data = array('lists' => $listpage, 'pages' => $this->pagination->create_links(), 'menu' => $menu);
        $this->load->view('post/village.html', $data);
    }

    //新增小区信息
    function addVillage(){
        if($_POST){
            $data = $this->input->post();
            $data['createUser'] = $this->session->users['userId'];
            if (!empty($_FILES['file']['name'])) {
                $config['upload_path'] = 'upload/village/';
                $config['allowed_types'] = 'gif|jpg|png|jpeg';
                $config['max_size'] = 5120;
                $config['file_name'] = date('y-m-d_His');
                $this->load->library('upload', $config);
                // 上传
                if (!$this->upload->do_upload('file')) {
                    echo "<script>alert('文件上传失败！');history.back(-1);</script>";
                    exit;
                } else {
                    $logo = 'upload/village/' . $this->upload->data('file_name');
                    $data['logo'] = qiniu($logo, 'villageLogo');
                    unlink($logo);
                    
                }
            }

            if ($this->public_model->insert($this->village, $data)) {
                $arr = array(
                    'log_url' => $this->uri->uri_string(),
                    'user_id' => $this->session->users['userId'],
                    'username' => $this->session->users['userName'],
                    'log_ip' => get_client_ip(),
                    'log_status' => '1',
                    'log_message' => "新增小区信息成功,小区名称是：" . $data['villageTitle'],
                );
                add_system_log($arr);
                echo "<script>alert('操作成功！');window.location.href='" . site_url('/Post/village') . "'</script>";
                exit;
            } else {
                $arr = array(
                    'log_url' => $this->uri->uri_string(),
                    'user_id' => $this->session->users['userId'],
                    'username' => $this->session->users['userName'],
                    'log_ip' => get_client_ip(),
                    'log_status' => '0',
                    'log_message' => "新增小区信息失败,小区名称是：" . $data['villageTitle'],
                );
                add_system_log($arr);
                echo "<script>alert('操作失败！');window.location.href='" . site_url('/Post/village') . "'</script>";
                exit;
            }      
        }else{

            //获取银行
            $data['bank'] = $this->public_model->select($this->bank,'createTime','desc');
            $data['devel'] = $this->public_model->select($this->developers,'createTime','desc');
                    //获取销售公司
            $data['company'] = $this->public_model->select_where($this->company, 'isDel', '0', 'createTime', 'desc');
           
            $data['menu'] = array('village', 'village');

            $this->load->view('post/addVillage.html',$data);
        }
    }
    //返回销售人员
    function retSalesUser(){
        if($_POST){
            $id = $this->input->post('cId');
            $salesUser = $this->public_model->select_where_many($this->salesUser,'c_id',$id, 'isDel','0','createTime','desc');
            if(!empty($salesUser)){
                echo json_encode($salesUser);
            }else{
                echo "2";
            }
        }else{
            echo "2";
        }
    }

    //修改小区
    function editVillage(){
        if ($_POST) {
            $data = $this->input->post();
            $data['updataUser'] = $this->session->users['userId'];
            $data['updataTime'] = date('Y-m-d H:i:s',time());
            if (!empty($_FILES['file']['name'])) {
                $config['upload_path'] = 'upload/village/';
                $config['allowed_types'] = 'gif|jpg|png|jpeg';
                $config['max_size'] = 5120;
                $config['file_name'] = date('y-m-d_His');
                $this->load->library('upload', $config);
                // 上传
                if (!$this->upload->do_upload('file')) {
                    echo "<script>alert('文件上传失败！');history.back(-1);</script>";
                    exit;
                } else {
                    $logo = 'upload/village/' . $this->upload->data('file_name');
                    $data['logo'] = qiniu($logo, 'villageLogo');
                    unlink($logo);
                }
            }

            if ($this->public_model->updata($this->village,'id',$data['id'],$data)) {
                $arr = array(
                    'log_url' => $this->uri->uri_string(),
                    'user_id' => $this->session->users['userId'],
                    'username' => $this->session->users['userName'],
                    'log_ip' => get_client_ip(),
                    'log_status' => '1',
                    'log_message' => "编辑小区信息成功,小区名称是：" . $data['villageTitle'].",小区编号是:".$data['id'],
                );
                add_system_log($arr);
                echo "<script>alert('操作成功！');window.location.href='" . site_url('/Post/village') . "'</script>";
                exit;
            } else {
                $arr = array(
                    'log_url' => $this->uri->uri_string(),
                    'user_id' => $this->session->users['userId'],
                    'username' => $this->session->users['userName'],
                    'log_ip' => get_client_ip(),
                    'log_status' => '0',
                    'log_message' => "编辑小区信息失败,小区名称是：" . $data['villageTitle'] . ",小区编号是:" . $data['id'],
                );
                add_system_log($arr);
                echo "<script>alert('操作失败！');window.location.href='" . site_url('/Post/village') . "'</script>";
                exit;
            }
        } else {
            $id = intval($this->uri->segment(3));
            if($id != '0'){
                $data['village'] = $this->public_model->select_info($this->village,'id',$id);
                  //获取银行
                $data['bank'] = $this->public_model->select($this->bank, 'createTime', 'desc');
                $data['devel'] = $this->public_model->select($this->developers, 'createTime', 'desc');
                $data['company'] = $this->public_model->select_where($this->company, 'isDel', '0', 'createTime', 'desc');
                $data['salesUser'] = $this->public_model->select_where_many($this->salesUser,'c_id',$data['village']['salesCompany'] ,'isDel', '0', 'createTime', 'desc');

                $data['menu'] = array('village', 'village');

                $this->load->view('post/editVillage.html', $data);
            }else{
                $this->load->view('404.html');
            }
          
        }
    }

    //
    function delVillage(){
        if($_POST){
            $data = $this->input->post();
            if($this->public_model->delete($this->village,'id',$data['id'])){
                $arr = array(
                    'log_url' => $this->uri->uri_string(),
                    'user_id' => $this->session->users['userId'],
                    'username' => $this->session->users['userName'],
                    'log_ip' => get_client_ip(),
                    'log_status' => '1',
                    'log_message' => "删除小区信息成功,小区名称是：" . $data['name'] . ",小区编号是:" . $data['id'],
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
                    'log_message' => "删除小区信息失败,小区名称是：" . $data['name'] . ",小区编号是:" . $data['id'],
                );
                add_system_log($arr);
                echo "2";
                exit;
            }
        }else{
            echo "3";
        }
    }





    //车位管理
    function carPark(){
        $config['per_page'] = 10;
        //获取页码
        $current_page = intval($this->uri->segment(3));//index.php 后数第4个/
        //配置
        $config['base_url'] = site_url('/Post/carPark');
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

        $total = count($this->public_model->select($this->carPark, 'createTime'));
        $config['total_rows'] = $total;

        $this->load->library('pagination');//加载ci pagination类
        $listpage = $this->public_model->select_page($this->carPark, 'createTime', $current_page, $config['per_page']);
        $this->pagination->initialize($config);
        $menu = array('village', 'carPark');

        
        $data = array('lists' => $listpage, 'pages' => $this->pagination->create_links(),'menu'=>$menu);

        $this->load->view('post/carPark.html',$data);
    } 

      //搜索车位
    function searchCarPark()
    {
        $config['per_page'] = 10;
        //获取页码
        $current_page = intval($this->input->get("size"));//index.php 后数第4个/
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
        $config['first_link'] = '首页';

        $config['next_link'] = '下一页';

        $config['prev_link'] = '上一页';

        $config['last_link'] = '末页';

        $list = $this->public_model->searchLike($this->carPark, 'carTitle', $sear);

        $config['total_rows'] = count($list);

        $config['page_query_string'] = true;//关键配置
        // $config['reuse_query_string'] = FALSE;
        $config['query_string_segment'] = 'size';
        $config['base_url'] = site_url('/Post/searchCarPark?') . "sear=" . $sear;

        // //分页数据\
        $listpage = $this->public_model->searchLikePage($this->carPark, 'carTitle', $sear, $config['per_page'], $current_page);
        $this->load->library('pagination');//加载ci pagination类

        $this->pagination->initialize($config);

        // var_dump($data);
        $menu = array('village', 'carPark');

        $data = array('lists' => $listpage, 'pages' => $this->pagination->create_links(), 'menu' => $menu);
        $this->load->view('post/carPark.html', $data);
    }

    //新增车位
    function addCarPark(){
        if($_POST){
            $data = $this->input->post();
            $data['createUser'] = $this->session->users['userId'];
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
                    $data['logo'] = qiniu($logo, 'carPark');
                    unlink($logo);
                }
            }

            if ($this->public_model->insert($this->carPark, $data)) {
                $arr = array(
                    'log_url' => $this->uri->uri_string(),
                    'user_id' => $this->session->users['userId'],
                    'username' => $this->session->users['userName'],
                    'log_ip' => get_client_ip(),
                    'log_status' => '1',
                    'log_message' => "新增车位信息成功,车位名称是：" . $data['carTitle'],
                );
                add_system_log($arr);
                echo "<script>alert('操作成功！');window.location.href='" . site_url('/Post/carPark') . "'</script>";
                exit;
            } else {
                $arr = array(
                    'log_url' => $this->uri->uri_string(),
                    'user_id' => $this->session->users['userId'],
                    'username' => $this->session->users['userName'],
                    'log_ip' => get_client_ip(),
                    'log_status' => '0',
                    'log_message' => "新增车位信息失败,车位名称是：" . $data['carTitle'],
                );
                add_system_log($arr);
                echo "<script>alert('操作失败！');window.location.href='" . site_url('/Post/carPark') . "'</script>";
                exit;
            }      
        }else{
            //获取小区信息
            $data['village'] = $this->public_model->select($this->village,'createTime','desc');
            $data['menu'] = array('village', 'carPark');

            $this->load->view('post/addCarPark.html',$data);
        }
    }


    //编辑车位
    function editCarPark(){
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
                    $data['logo'] = qiniu($logo, 'carPark');
                    unlink($logo);
                }
            }
 
            if ($this->public_model->updata($this->carPark,'carId',$data['carId'], $data)) {
                $arr = array(
                    'log_url' => $this->uri->uri_string(),
                    'user_id' => $this->session->users['userId'],
                    'username' => $this->session->users['userName'],
                    'log_ip' => get_client_ip(),
                    'log_status' => '1',
                    'log_message' => "编辑车位信息成功,车位名称是：" . $data['carTitle'].',车位id是：'.$data['carId'],
                );
                add_system_log($arr);
                echo "<script>alert('操作成功！');window.location.href='" . site_url('/Post/carPark') . "'</script>";
                exit;
            } else {
                $arr = array(
                    'log_url' => $this->uri->uri_string(),
                    'user_id' => $this->session->users['userId'],
                    'username' => $this->session->users['userName'],
                    'log_ip' => get_client_ip(),
                    'log_status' => '0',
                    'log_message' => "编辑车位信息失败,车位名称是：" . $data['carTitle'] . ',车位id是：' . $data['carId'],
                );
                add_system_log($arr);
                echo "<script>alert('操作失败！');window.location.href='" . site_url('/Post/carPark') . "'</script>";
                exit;
            } 
        }else{
            $id = intval($this->uri->segment(3));
            if($id != '0'){
                $data['car'] = $this->public_model->select_info($this->carPark,'carId',$id);


                $data['village'] = $this->public_model->select($this->village, 'createTime', 'desc');
                $data['menu'] = array('village', 'carPark');

                $this->load->view('post/editCarPark.html',$data);
            }else{
                $this->load->view('404.html');
            }
        }
    }
    
    //删除车位
    function delCarPark(){
        if($_POST){
            $data = $this->input->post();
            if ($this->public_model->delete($this->carPark, 'carId', $data['id'])) {
                $arr = array(
                    'log_url' => $this->uri->uri_string(),
                    'user_id' => $this->session->users['userId'],
                    'username' => $this->session->users['userName'],
                    'log_ip' => get_client_ip(),
                    'log_status' => '1',
                    'log_message' => "删除车位信息成功,车位名称是：" . $data['name'] . ",车位id是:" . $data['id'],
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
                    'log_message' => "删除车位信息失败,车位名称是：" . $data['name'] . ",车位id是:" . $data['id'],
                );
                add_system_log($arr);
                echo "2";
                exit;
            }
            
        }else{
            echo "3";
        }
    }


    //上传图片
    function uploadImg()
    {
        $error = '0';
        $data = array();
        $i  = '0';
        foreach ($_FILES as $key => $value) {
            if (!empty($value['name'])) {
                $config['upload_path'] = 'upload/news/';
                $config['allowed_types'] = 'gif|jpg|png|jpeg';
                $config['max_size'] = 5120;
                $config['file_name'] = date('y-m-d_His');
                $this->load->library('upload', $config);
            // 上传
                if (!$this->upload->do_upload($key)) {
                    $error = "1";
                } else {
                    $imgfile = 'upload/news/' . $this->upload->data('file_name');
                    // var_dump($imgfile);
                    $data[$i]['url'] = qiniu($imgfile, 'carPark');
                    unlink($imgfile);
                    time_sleep_until(time()+1);
                }
            }
            $i++;
        }
        // var_dump($data);
        if(!empty($data)){
            $arr = $data;
            echo json_encode($arr);
        }
    }


}