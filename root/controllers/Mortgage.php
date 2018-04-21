<?php 
defined('BASEPATH') or exit('No direct script access allowed');
require_once(APPPATH . 'controllers/Default_Controller.php');

/**
 *    网站首页
 */
class Mortgage extends Default_Controller
{

    public $sendApply = 'send_apply'; 
    function __construct()
    {
        parent::__construct();
    }

    // 按揭申请
    function applyList(){
        //
        $config['per_page'] = 10;
        //获取页码
        $current_page = intval($this->uri->segment(3));//index.php 后数第4个/
        //配置
        $config['base_url'] = site_url('/Mortgage/applyList');
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

        $total = count($this->public_model->retSendApply());
        $config['total_rows'] = $total;

        $this->load->library('pagination');//加载ci pagination类
        $listpage = $this->public_model->retSendApplyPage($current_page, $config['per_page']);
        $this->pagination->initialize($config);


        $menu ='applyList';
        $data = array('lists' => $listpage, 'pages' => $this->pagination->create_links(), 'menu' => $menu);

        $this->load->view('mortgage/applyList.html',$data);
    }
    //审核
    function editApply(){
        if($_POST){
            $data = $this->input->post();
            if($this->public_model->updata($this->sendApply,'mId',$data['mId'],$data)){
                $arr = array(
                    'log_url' => $this->uri->uri_string(),
                    'user_id' => $this->session->users['userId'],
                    'username' => $this->session->users['userName'],
                    'log_ip' => get_client_ip(),
                    'log_status' => '1',
                    'log_message' => "审核信息成功,申请信息ID是" . $data['mId'],
                );
                add_system_log($arr);
                echo "<script>alert('操作成功！');window.location.href='" . site_url('/Mortgage/applyList') . "'</script>";
                exit;
            }else{
                $arr = array(
                    'log_url' => $this->uri->uri_string(),
                    'user_id' => $this->session->users['userId'],
                    'username' => $this->session->users['userName'],
                    'log_ip' => get_client_ip(),
                    'log_status' => '0',
                    'log_message' => "审核信息成功,申请信息ID是" . $data['mId'],
                );
                add_system_log($arr);
                echo "<script>alert('操作成功！');window.location.href='" . site_url('/Mortgage/applyList') . "'</script>";
                exit;
            }
        }else{
            $this->load->view('404.html');
        }
    }
    
    //业务提成
    function commision(){
        $data['menu'] = array('member', 'commision');
    
        $this->load->view('mortgage/commision.html',$data);
    }
    //小区提成
    function villageCommision(){
        $data['menu'] = array('member', 'villageCommision');

        $this->load->view('mortgage/villageCommision.html',$data);
    }


}