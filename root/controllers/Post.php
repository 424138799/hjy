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
                    echo "<script>alert('头像上传失败！');history.back(-1);</script>";
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
                    'log_message' => "新增开发商失败,银行名称：" . $data['title'],
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




    //销售公司
    function salesCompany(){

        $this->load->view('post/salesCompany.html');
    }

    //销售人员
    function salesUser(){
        $this->load->view('post/salesUser.html');
    }
    //商家
    function business(){
        $this->load->view('post/business.html');

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