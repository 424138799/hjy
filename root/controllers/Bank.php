<?php 
defined('BASEPATH') or exit('No direct script access allowed');
require_once(APPPATH . 'controllers/Default_Controller.php');
/**
 *    推广位和活动管理
 */
class Bank extends Default_Controller
{

    //
    public $bank = 'bank';
    public $bankUser = 'bank_user';
    public $adminUser = 'admin_user';


    function __construct()
    {
        parent::__construct();
        $this->load->model('Public_model');


    }


    function bankList(){
        $config['per_page'] = 10;
        //获取页码
        $current_page = intval($this->uri->segment(3));//index.php 后数第4个/
        //配置
        $config['base_url'] = site_url('/Bank/bankList');
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
            $total = count($this->Public_model->select($this->bank, 'id', 'desc'));
            $config['total_rows'] = $total;
            $listpage = $this->Public_model->select_page($this->bank, 'id', $current_page, $config['per_page']);

        }else{
            if ($this->session->users['pId'] == '0') {
                //总负责人
                $sql = "select userId from hj_admin_user where createUser = " . $this->session->users['userId'];
                $a = $this->db->query($sql);
                $list = $a->result_array();
                if (!empty($list)) {
                    $str = toString($list);

                    $sql1 = "select id from hj_bank where createUserId = " . $this->session->users['userId'] . " or createUserId in(" . $str . ")";
                    $query = $this->db->query($sql1);
                    $config['total_rows'] = count($query->result_array());
                    $sql2 = "select * from hj_bank where createUserId = " . $this->session->users['userId'] . " or createUserId in(" . $str . ") order by createTime desc";
                    $query1 = $this->db->query($sql2);
                    $listpage = $query1->result_array();
                }else{
                    $sql1 = "select id from hj_bank where createUserId = " . $this->session->users['userId'];
                    $query = $this->db->query($sql1);
                    $config['total_rows'] = count($query->result_array());
                    $sql2 = "select * from hj_bank where createUserId = " . $this->session->users['userId'] . " order by createTime desc";
                    $query1 = $this->db->query($sql2);
                    $listpage = $query1->result_array();
                }
            } else {
                //员工
                $total = count($this->public_model->select_where($this->bank, 'createUserId', $this->session->users['userId'], 'createTime', 'desc'));
                $config['total_rows'] = $total;
                $listpage = $this->public_model->select_where_page($this->bank, 'createUserId', $this->session->users['userId'], 'createTime', 'desc', $current_page, $config['per_page']);
            }
        }   
      

        $this->load->library('pagination');//加载ci pagination类
        $this->pagination->initialize($config);

        //获取负责人
        $duty = $this->public_model->select_where($this->adminUser,'status','1', 'createTime','desc');


        $menu = array('village', 'bankList');
        $data = array('lists' => $listpage, 'pages' => $this->pagination->create_links(),'menu'=>$menu,'duty'=>$duty);
     
        $this->load->view('bank/bankList.html',$data);
    }

    //新增银行信息
    function addBank(){
        if ($_POST) {
            $data = $this->input->post();
            $data['createUserId'] = $this->session->users['userId'];
            if ($this->Public_model->insert($this->bank, $data)) {
                $arr = array(
                    'log_url' => $this->uri->uri_string(),
                    'user_id' => $this->session->users['userId'],
                    'username' => $this->session->users['userName'],
                    'log_ip' => get_client_ip(),
                    'log_status' => '1',
                    'log_message' => "新增银行成功,银行名称：" . $data['bankName'],
                );
                add_system_log($arr);
                echo "<script>alert('操作成功！');window.location.href='" . site_url('/Bank/bankList') . "'</script>";
                exit;
            } else {
                $arr = array(
                    'log_url' => $this->uri->uri_string(),
                    'user_id' => $this->session->users['userId'],
                    'username' => $this->session->users['userName'],
                    'log_ip' => get_client_ip(),
                    'log_status' => '0',
                    'log_message' => "新增银行失败,银行名称：" . $data['bankName'],
                );
                add_system_log($arr);
                echo "<script>alert('操作失败！');window.location.href='" . site_url('/Bank/bankList') . "'</script>";
                exit;
            }
        } else {
            $this->load->view('404.html');
        }
    }

    //编辑
    function editBank(){
        if ($_POST) {
            $data = $this->input->post();
            if ($this->Public_model->updata($this->bank,'id',$data['id'], $data)) {
                $arr = array(
                    'log_url' => $this->uri->uri_string(),
                    'user_id' => $this->session->users['userId'],
                    'username' => $this->session->users['userName'],
                    'log_ip' => get_client_ip(),
                    'log_status' => '1',
                    'log_message' => "编辑银行成功,银行名称：" . $data['bankName'],
                );
                add_system_log($arr);
                echo "<script>alert('操作成功！');window.location.href='" . site_url('/Bank/bankList') . "'</script>";
                exit;
            } else {
                $arr = array(
                    'log_url' => $this->uri->uri_string(),
                    'user_id' => $this->session->users['userId'],
                    'username' => $this->session->users['userName'],
                    'log_ip' => get_client_ip(),
                    'log_status' => '0',
                    'log_message' => "编辑银行失败,银行名称：" . $data['bankName'],
                );
                add_system_log($arr);
                echo "<script>alert('操作失败！');window.location.href='" . site_url('/Bank/bankList') . "'</script>";
                exit;
            }
        } else {
            $this->load->view('404.html');
        }
    }
    //删除
    function delBank(){
        if ($_POST) {
            $id = $this->input->post('id');
            if ($this->Public_model->delete($this->bank, 'id', $id)) {
                $arr = array(
                    'log_url' => $this->uri->uri_string(),
                    'user_id' => $this->session->users['userId'],
                    'username' => $this->session->users['userName'],
                    'log_ip' => get_client_ip(),
                    'log_status' => '1',
                    'log_message' => "删除银行成功,银行编号是：" . $id,
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
                    'log_message' => "删除银行失败,银行编号是：" . $id,
                );
                add_system_log($arr);
                echo "2";
                exit;
            }
        } else {
            echo "3";
            exit;
        }
    }

    //银行人员
    function bankPersonnel(){
        $config['per_page'] = 10;
        //获取页码
        $current_page = intval($this->uri->segment(3));//index.php 后数第4个/
        //配置
        $config['base_url'] = site_url('/Bank/bankPersonnel');
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
            $total = count($this->Public_model->select($this->bankUser, 'uId', 'desc'));
            $config['total_rows'] = $total;
            $listpage = $this->Public_model->select_page($this->bankUser, 'uId', $current_page, $config['per_page']);

        }else{
            if ($this->session->users['pId'] == '0') {
                //总负责人
                $sql = "select userId from hj_admin_user where createUser = " . $this->session->users['userId'];
                $a = $this->db->query($sql);
                $list = $a->result_array();
                if(!empty($list)){
                    $str = toString($list);
                    $sql1 = "select uid from hj_bank_user where createUserId = " . $this->session->users['userId'] . " or createUserId in(" . $str . ")";
                    $query = $this->db->query($sql1);
                    $config['total_rows'] = count($query->result_array());
                    $sql2 = "select * from hj_bank_user where createUserId = " . $this->session->users['userId'] . " or createUserId in(" . $str . ") order by createTime desc";
                    $query1 = $this->db->query($sql2);
                    $listpage = $query1->result_array();

                }else{
                    $sql1 = "select uid from hj_bank_user where createUserId = " . $this->session->users['userId'];
                    $query = $this->db->query($sql1);
                    $config['total_rows'] = count($query->result_array());
                    $sql2 = "select * from hj_bank_user where createUserId = " . $this->session->users['userId']." order by createTime desc";
                    $query1 = $this->db->query($sql2);
                    $listpage = $query1->result_array();
                }
               
            } else {
                //员工
                $total = count($this->public_model->select_where($this->bankUser, 'createUserId', $this->session->users['userId'], 'createTime', 'desc'));
                $config['total_rows'] = $total;
                $listpage = $this->public_model->select_where_page($this->bankUser, 'createUserId', $this->session->users['userId'], 'createTime', 'desc', $current_page, $config['per_page']);
            }
        }
       

        $this->load->library('pagination');//加载ci pagination类
        $this->pagination->initialize($config);
        //获取所有人员
        $bankUser = $this->Public_model->select($this->bank,'id','desc');
        $menu = array('village', 'bankPersonnel');
        $data = array('lists' => $listpage, 'pages' => $this->pagination->create_links(),'bankUser'=> $bankUser,'menu'=>$menu);

        $this->load->view('bank/bankUser.html', $data);
    }

    //新增银行人员
    function addBankUser(){
        if ($_POST) {
            $data = $this->input->post();
            $data['createUserId'] = $this->session->users['userId'];
            $user = $this->public_model->select_info($this->bankUser, 'linkPhone', $data['linkPhone']);
            if (!empty($user)) {
                echo "<script>alert('手机账户已注册！');window.location.href='" . site_url('/Bank/bankPersonnel') . "'</script>";
                exit;

            } else {
                $data['password'] = md5($data['password']);
                if ($this->Public_model->insert($this->bankUser, $data)) {
                    $arr = array(
                        'log_url' => $this->uri->uri_string(),
                        'user_id' => $this->session->users['userId'],
                        'username' => $this->session->users['userName'],
                        'log_ip' => get_client_ip(),
                        'log_status' => '1',
                        'log_message' => "新增银行管理人员成功,银行编号是：" . $data['bankId'].',银行管理人员名称是：'.$data['userName'],
                    );
                    add_system_log($arr);
                    echo "<script>alert('操作成功！');window.location.href='" . site_url('/Bank/bankPersonnel') . "'</script>";
                    exit;
                } else {
                    $arr = array(
                        'log_url' => $this->uri->uri_string(),
                        'user_id' => $this->session->users['userId'],
                        'username' => $this->session->users['userName'],
                        'log_ip' => get_client_ip(),
                        'log_status' => '0',
                        'log_message' => "新增银行管理人员失败,银行编号是：" . $data['bankId'] . ',银行管理人员名称是：' . $data['userName'],
                    );
                    add_system_log($arr);
                    echo "<script>alert('操作失败！');window.location.href='" . site_url('/Bank/bankPersonnel') . "'</script>";
                    exit;
                }
            }
        } else {
            $this->load->view('404.html');
        }
    }

    //编辑银行人员
    function editBankUser(){
        if ($_POST) {
            $data = $this->input->post();
            $user = $this->public_model->retBankUserInfo($this->bankUser, 'linkPhone', $data['linkPhone'], $data['uId']);
            if (empty($user)) {
                if (!empty($data['password'])) {
                    $data['password'] = md5($data['password']);
                } else {
                    unset($data['password']);
                }
                if ($this->Public_model->updata($this->bankUser,'uId',$data['uId'], $data)) {
                    $arr = array(
                        'log_url' => $this->uri->uri_string(),
                        'user_id' => $this->session->users['userId'],
                        'username' => $this->session->users['userName'],
                        'log_ip' => get_client_ip(),
                        'log_status' => '1',
                        'log_message' => "编辑银行管理人员成功,银行编号是：" . $data['bankId'] . ',银行管理人员名称是：' . $data['userName'],
                    );
                    add_system_log($arr);
                    echo "<script>alert('操作成功！');window.location.href='" . site_url('/Bank/bankPersonnel') . "'</script>";
                    exit;
                } else {
                    $arr = array(
                        'log_url' => $this->uri->uri_string(),
                        'user_id' => $this->session->users['userId'],
                        'username' => $this->session->users['userName'],
                        'log_ip' => get_client_ip(),
                        'log_status' => '0',
                        'log_message' => "编辑银行管理人员失败,银行编号是：" . $data['bankId'] . ',银行管理人员名称是：' . $data['userName'],
                    );
                    add_system_log($arr);
                    echo "<script>alert('操作失败！');window.location.href='" . site_url('/Bank/bankPersonnel') . "'</script>";
                    exit;
                }
            }else{
                echo "<script>alert('用户手机账户已注册！');window.location.href='" . site_url('/bank/bankPersonnel') . "'</script>";
                exit;
            }
        } else {
            $this->load->view('404.html');
        }
    }  

    //删除信息
    function delBankUser(){
        if ($_POST) {
            $id = $this->input->post('id');
            if ($this->Public_model->delete($this->bankUser, 'uId', $id)) {
                $arr = array(
                    'log_url' => $this->uri->uri_string(),
                    'user_id' => $this->session->users['userId'],
                    'username' => $this->session->users['userName'],
                    'log_ip' => get_client_ip(),
                    'log_status' => '1',
                    'log_message' => "删除银行管理人员成功,银行人员编号是：" . $id,
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
                    'log_message' => "删除银行管理人员失败,银行人员编号是：" . $id,
                );
                add_system_log($arr);
                echo "2";
                exit;
            }
        } else {
            echo "3";
            exit;
        }
    }


    //返回银行信息
    // function retBankList(){
    //     if($_POST){

    //     }
    // }




}

?>