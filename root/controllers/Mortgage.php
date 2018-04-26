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
        $this->load->helper('search_helper');
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
        $this->load->library('pagination');//加载ci pagination类

        if ($this->session->uId == '1') {
            $total = count($this->public_model->retSendApply());
            $config['total_rows'] = $total;
            $listpage = $this->public_model->retSendApplyPage($current_page, $config['per_page']);
        
        }elseif($this->session->uId == '2'){
            $total = count($this->public_model->retBankApply($this->session->users['bankId']));
            $config['total_rows'] = $total;
            $listpage = $this->public_model->retBankApplyPage($this->session->users['bankId'],$current_page, $config['per_page']);
        }

        $menu ='applyList';
        $data = array('lists' => $listpage, 'pages' => $this->pagination->create_links(), 'menu' => $menu);

        $this->load->view('mortgage/applyList.html',$data);
    }

    //搜索审核信息
    function searchApply(){
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

        if($sear == '5'){
            if ($this->session->uId == '1') {
                $total = count($this->public_model->retSendApply());
                $config['total_rows'] = $total;
                $listpage = $this->public_model->retSendApplyPage($current_page, $config['per_page']);

            } elseif ($this->session->uId == '2') {
                $total = count($this->public_model->retBankApply($this->session->users['bankId']));
                $config['total_rows'] = $total;
                $listpage = $this->public_model->retBankApplyPage($this->session->users['bankId'], $current_page, $config['per_page']);
            }
        }else{
            if ($this->session->uId == '1') {
                $list = $this->public_model->searSendApply($sear);
                $config['total_rows'] = count($list);
                $listpage = $this->public_model->searSendApplyPage($sear, $current_page, $config['per_page']);
            } elseif ($this->session->uId == '2') {
                $list = $this->public_model->searBankApply($this->session->users['bankId'],$sear);

                $config['total_rows'] = count($list);
                $listpage = $this->public_model->searBankApplyPage($this->session->users['bankId'] ,$sear,  $current_page, $config['per_page']);
            }

        }


        $config['page_query_string'] = true;//关键配置
        // $config['reuse_query_string'] = FALSE;
        $config['query_string_segment'] = 'size';
        $config['base_url'] = site_url('/Mortgage/searchApply?') . "sear=" . $sear;

        // //分页数据\
        $this->load->library('pagination');//加载ci pagination类

        $this->pagination->initialize($config);

        // var_dump($data);
        $menu = 'applyList';

        $data = array('lists' => $listpage, 'pages' => $this->pagination->create_links(), 'menu' => $menu);
        $this->load->view('mortgage/applyList.html', $data);
    }




    //审核
    function editApply(){
        if($_POST){
            $data = $this->input->post();
            $data['examineTime'] = date('Y-m-d H:i:s',time());
            if($this->public_model->updata($this->sendApply,'mId',$data['mId'],$data)){
                $arr = array(
                    'log_url' => $this->uri->uri_string(),
                    'user_id' => '',
                    'username' => $this->session->users['userName'],
                    'log_ip' => get_client_ip(),
                    'log_status' => '1',
                    'log_message' => "审核信息成功,申请信息ID是" . $data['mId'].'银行人员ID是：'. $this->session->users['uId'],
                );
                add_system_log($arr);
                echo "<script>alert('操作成功！');window.location.href='" . site_url('/Mortgage/applyList') . "'</script>";
                exit;
            }else{
                $arr = array(
                    'log_url' => $this->uri->uri_string(),
                    'user_id' => '',
                    'username' => $this->session->users['userName'],
                    'log_ip' => get_client_ip(),
                    'log_status' => '0',
                    'log_message' => "审核信息失败,申请信息ID是" . $data['mId'] . '银行人员ID是：' . $this->session->users['uId'],
                );
                add_system_log($arr);
                echo "<script>alert('操作失败！');window.location.href='" . site_url('/Mortgage/applyList') . "'</script>";
                exit;
            }
        }else{
            $this->load->view('404.html');
        }
    }
    
    //删除按揭申请
    function delApply(){
        if($_POST){
            $data = $this->input->post();
            if($this->public_model->delete($this->sendApply,'mId',$data['mId'])){
                $arr = array(
                    'log_url' => $this->uri->uri_string(),
                    'user_id' => $this->session->users['userId'],
                    'username' => $this->session->users['userName'],
                    'log_ip' => get_client_ip(),
                    'log_status' => '1',
                    'log_message' => "删除审核信息成功,申请信息ID是" . $data['mId'] . "申请人名称是：" . $data['name'],
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
                    'log_message' => "删除审核信息失败,申请信息ID是" . $data['mId']."申请人名称是：".$data['name'],
                );
                add_system_log($arr);
                echo "<script>alert('操作成功！');window.location.href='" . site_url('/Mortgage/applyList') . "'</script>";
                exit;
            }
        }else{
            $this->load->view('404.html');
        }
    }

    //导出按揭信息
    function downApply(){
        $id = intval($this->uri->segment('3'));
        if($id == '1'){
            if($this->session->uId == '1'){
                $list = $this->public_model->retSendApply();
            }else{
                $list =$this->public_model->retBankApply($this->session->users['bankId']);
            }
        
            if (!empty($list)) {
                $this->load->library('excel');

                $this->excel->setActiveSheetIndex(0);

                $this->excel->getActiveSheet()->setTitle('ImportOrder');

                $arr_title = array(
                    'A' => '自定义编号',
                    'B' => '会员名称',
                    'C' => '身份证号码',
                    'D' => '工作单位',
                    'E' => '岗位',
                    'F' => '年收入',
                    'G' => '电话',
                    'H' => '申请小区名称',
                    'I' => '车位编号',
                    'J' => '申请时间',
                    'K' => '审核状态',
                    'L' => '审核时间',
                    'M' => '审核意见',
                    // 'L' => '客户',
                );
                    //设置excel 表头
                foreach ($arr_title as $key => $value) {

                    $this->excel->getActiveSheet()->setCellValue($key . '1', $value);

                    $this->excel->getActiveSheet()->getStyle($key . '1')->getFont()->setSize(13);

                    $this->excel->getActiveSheet()->getStyle($key . '1')->getFont()->setBold(true);

                    $this->excel->getActiveSheet()->getDefaultColumnDimension('A')->setWidth(20);

                    $this->excel->getActiveSheet()->getStyle($key . '1')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);

                }

                $i = 2;
                foreach ($list as $booking) {
                    $this->excel->getActiveSheet()->setCellValue('A' . $i, $i - 1);
                    $this->excel->getActiveSheet()->setCellValue('B' . $i, $booking['name']);
                    $this->excel->getActiveSheet()->setCellValue('C' . $i, $booking['idCard']);
                    $this->excel->getActiveSheet()->setCellValue('D' . $i, $booking['workUnit']);
                    $this->excel->getActiveSheet()->setCellValue('E' . $i, $booking['duty']);
                    $this->excel->getActiveSheet()->setCellValue('F' . $i, $booking['income']);
                    $this->excel->getActiveSheet()->setCellValue('G' . $i, $booking['phone']);
                    $this->excel->getActiveSheet()->setCellValue('H' . $i, $booking['villageTitle']);
                    $this->excel->getActiveSheet()->setCellValue('I' . $i, $booking['carNum']);
                    $this->excel->getActiveSheet()->setCellValue('J' . $i, $booking['sendTime']);
                    if($booking['examineState'] =='1'){
                        $this->excel->getActiveSheet()->setCellValue('K' . $i, '审核通过');
                    }elseif($booking['examineState'] == '2'){
                        $this->excel->getActiveSheet()->setCellValue('K' . $i, '审核不通过');

                    }elseif($booking['examineState'] == '3'){
                        $this->excel->getActiveSheet()->setCellValue('K' . $i, '待定');

                    }else{
                        $this->excel->getActiveSheet()->setCellValue('K' . $i, '等待审核');
                    }
                    $this->excel->getActiveSheet()->setCellValue('L' . $i, $booking['examineTime']);
                    $this->excel->getActiveSheet()->setCellValue('M' . $i, $booking['examineContent']);

                    $i++;
                }
                $filename =  '车位按揭申请.xls'; //save our workbook as this file name

                header('Content-Type: application/vnd.ms-excel'); //mime type

                header('Content-Disposition: attachment;filename="' . $filename . '"'); //tell browser what's the file name

                header('Cache-Control: max-age=0'); //no cache

                $objWriter = PHPExcel_IOFactory::createWriter($this->excel, 'Excel5');

                $objWriter->save('php://output');
                if ($this->session->uId == '1') {
                    $arr = array(
                        'log_url' => $this->uri->uri_string(),

                        'user_id' => $this->session->users['userId'],
                        'username' => $this->session->users['userName'],
                        'log_ip' => get_client_ip(),
                        'log_status' => '1',
                        'log_message' => "导出按揭深审核信息成功",
                    );
                }else{
                        $arr = array(
                            'log_url' => $this->uri->uri_string(),

                            'user_id' => '',
                            'username' => $this->session->users['userName'],
                            'log_ip' => get_client_ip(),
                            'log_status' => '1',
                            'log_message' => "导出按揭深审核信息成功,银行人员ID是" . $this->session->users['uId'],
                        );
                }
                add_system_log($arr);
                // echo "<script>alert('导出成功！');window.location.href='" . site_url('/Mortgage/applyList') . "'</script>";
                exit;                 
            }



        }
    }



    //业务提成
    function commision(){
        $data['menu'] = array('finance', 'commision');
        $data['type'] = '';
    
        $this->load->view('mortgage/commision.html',$data);
    }

    //搜索业务提成
    function searchCommision(){

        $time = $this->input->get('time');
        $endtime = $this->input->get('endtime');
        $type = $this->input->get('type');
        if($type == '0' || $time =='' || $endtime == ''){
            echo "<script>alert('请选择用户类型或时间');window.location.href='" . site_url('/Mortgage/commision') . "'</script>";
            exit;
        }
       

        if (!empty($time)) {
            $t = $time . ' 00:00:00';
            $e = $endtime . ' 23:59:59';
        } else {
            $t = '';
            $e = '';
        }

        if ($type == '1') {
		    //销售人员
            $list = $this->public_model->select_where('hj_sales_user','isDel','0','createTime','desc');
            foreach ($list as $k=>$v) {
                //获取价格ximix
                $arr = userExtract('salesId',$v['id'],$t,$e, 'extractPrice');
                if($arr['price'] == '0'){
                    unset($list[$k]);
                }else{
                    $list[$k]['num'] = $arr['num']; 
                    $list[$k]['amount'] = $arr['price']; 
                }
            }
        } elseif ($type == '2') {
            //银行经理
            $list = $this->public_model->select_where('hj_bank_user', 'isDel', '1', 'createTime', 'desc');
            foreach ($list as $k => $v) {
                //获取价格ximix
                $arr = userExtract('bankId', $v['uId'], $t, $e, 'bankExtract');
                if ($arr['price'] == '0') {
                    unset($list[$k]);
                } else {
                    $list[$k]['num'] = $arr['num'];
                    $list[$k]['amount'] = $arr['price']; 
                }
            }

        } elseif ($type == '3') {
            //业务（开发商负责人）
            $list = $this->public_model->select_where('hj_developers', 'isDel','0','createTime','desc');
            // var_dump($devle);
            foreach ($list as $k => $v) {
                //获取用户ixmix
                $users = retUsername($v['blameId']);
                $list[$k]['userName'] = $users['userName'];
                $list[$k]['department'] = $users['department'];
                $list[$k]['duty'] = $users['duty'];
                //获取价格ximix
                $arr = userExtract('dId', $v['id'], $t, $e, 'serviceExtract');
                if ($arr['price'] == '0') {
                    unset($list[$k]);
                } else {
                    $list[$k]['num'] = $arr['num'];
                    $list[$k]['amount'] = $arr['price']; 
                }
            }
        } elseif ($type == '4') {
            //客户（小区负责人）
            $list = $this->public_model->select('hj_village', 'createTime','desc');       
            foreach($list as $k=>$v){
                $users = retUsername($v['respons']);
                $list[$k]['userName'] = $users['userName'];
                $list[$k]['department'] = $users['department'];
                $list[$k]['duty'] = $users['duty'];
                //获取价格ximix
                $arr = userExtract('vId', $v['id'], $t, $e, 'customerExtract');
                if ($arr['price'] == '0') {
                    unset($list[$k]);
                } else {
                    $list[$k]['num'] = $arr['num'];
                    $list[$k]['amount'] = $arr['price']; 
                }
            }     
        }
        // var_dump($list);
        // exit;
        $menu = array('finance', 'commision');
        $data = array('lists' => $list, 'time'=>$t,'endtime'=>$e,'menu' => $menu,'type'=>$type);
        $this->load->view('mortgage/commision.html', $data);
    }

    //到处记录
    function downExtract(){
        if($_POST){
            $time = $this->input->post('time');
            $endtime = $this->input->post('endtime');
            $type = $this->input->post('type');

            if ($type == '0' || $time == '' || $endtime == '') {
                echo "<script>alert('请选择用户类型或时间');window.location.href='" . site_url('/Mortgage/commision') . "'</script>";
                exit;
            }
            if (!empty($time)) {
                $t = $time . ' 00:00:00';
                $e = $endtime . ' 23:59:59';
            } else {
                $t = '';
                $e = '';
            }
            $arr_title = array(
                'A' => '自定义编号',
            );

            if ($type == '1') {
                $arr_title = array(
                    'B'=> '姓名',
                    'C'=> '销售公司名称',
                    'D'=> '岗位',
                    'E'=> '开始时间',
                    'F'=> '截至时间',
                    'G'=> '业务量',
                    'H'=> '提成总金额',
                );
		    //销售人员
                $list = $this->public_model->select_where('hj_sales_user', 'isDel', '0', 'createTime', 'desc');
                foreach ($list as $k => $v) {
                //获取价格ximix
                    $arr = userExtract('salesId', $v['id'], $t, $e, 'extractPrice');
                    if ($arr['price'] == '0') {
                        unset($list[$k]);
                    } else {
                        $list[$k]['num'] = $arr['num'];
                        $list[$k]['amount'] = $arr['price'];
                    }
                }
            } elseif ($type == '2') {
                $arr_title = array(
                    'B' => '姓名',
                    'C' => '银行名称',
                    'D' => '岗位',
                    'E' => '开始时间',
                    'F' => '截至时间',
                    'G' => '业务量',
                    'H' => '提成总金额',
                );
            //银行经理
                $list = $this->public_model->select_where('hj_bank_user', 'isDel', '1', 'createTime', 'desc');
                foreach ($list as $k => $v) {
                    
                //获取价格ximix
                    $arr = userExtract('bankId', $v['uId'], $t, $e, 'bankExtract');
                    if ($arr['price'] == '0') {
                        unset($list[$k]);
                    } else {
                        $list[$k]['num'] = $arr['num'];
                        $list[$k]['amount'] = $arr['price'];
                    }
                }

            } elseif ($type == '3') {
                $arr_title = array(
                    'B' => '开发商名称',
                    'C' => '姓名',
                    'D' => '部门',
                    'E' => '岗位',
                    'F' => '开始时间',
                    'G' => '截至时间',
                    'H' => '业务量',
                    'I' => '提成总金额',
                );
            //业务（开发商负责人）
                $list = $this->public_model->select_where('hj_developers', 'isDel', '0', 'createTime', 'desc');
            // var_dump($devle);
                foreach ($list as $k => $v) {
                //获取用户ixmix
                    $users = retUsername($v['blameId']);
                    $list[$k]['userName'] = $users['userName'];
                    $list[$k]['department'] = $users['department'];
                    $list[$k]['duty'] = $users['duty'];
                //获取价格ximix
                    $arr = userExtract('dId', $v['id'], $t, $e, 'serviceExtract');
                    if ($arr['price'] == '0') {
                        unset($list[$k]);
                    } else {
                        $list[$k]['num'] = $arr['num'];
                        $list[$k]['amount'] = $arr['price'];
                    }
                }
            } elseif ($type == '4') {
                $arr_title = array(
                    'B' => '小区名称',
                    'C' => '姓名',
                    'D' => '部门',
                    'E' => '岗位',
                    'F' => '开始时间',
                    'G' => '截至时间',
                    'H' => '业务量',
                    'I' => '提成总金额',
                );
            //客户（小区负责人）
                $list = $this->public_model->select('hj_village', 'createTime', 'desc');
                foreach ($list as $k => $v) {
                    $users = retUsername($v['respons']);
                    $list[$k]['userName'] = $users['userName'];
                    $list[$k]['department'] = $users['department'];
                    $list[$k]['duty'] = $users['duty'];
                //获取价格ximix
                    $arr = userExtract('vId', $v['id'], $t, $e, 'customerExtract');
                    if ($arr['price'] == '0') {
                        unset($list[$k]);
                    } else {
                        $list[$k]['num'] = $arr['num'];
                        $list[$k]['amount'] = $arr['price'];
                    }
                }
            }
          

            if(!empty($list)){
                $this->load->library('excel');

                $this->excel->setActiveSheetIndex(0);

                $this->excel->getActiveSheet()->setTitle('ImportOrder');
                    //设置excel 表头
                foreach ($arr_title as $key => $value) {

                    $this->excel->getActiveSheet()->setCellValue($key . '1', $value);

                    $this->excel->getActiveSheet()->getStyle($key . '1')->getFont()->setSize(13);

                    $this->excel->getActiveSheet()->getStyle($key . '1')->getFont()->setBold(true);

                    $this->excel->getActiveSheet()->getDefaultColumnDimension('A')->setWidth(20);

                    $this->excel->getActiveSheet()->getStyle($key . '1')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);

                }

                $i = 2;
                foreach ($list as $booking) {
                    
                    $this->excel->getActiveSheet()->setCellValue('A' . $i, $i - 1);
                    if($type == '1'){
                        $this->excel->getActiveSheet()->setCellValue('B' . $i, $booking['userName']);
                        $com = retSalesCompany ($booking['c_id']);
                        $this->excel->getActiveSheet()->setCellValue('C' . $i, $com['companyName']);
                        $this->excel->getActiveSheet()->setCellValue('D' . $i, '');
                        $this->excel->getActiveSheet()->setCellValue('E' . $i, $t);
                        $this->excel->getActiveSheet()->setCellValue('F' . $i, $e);
                        $this->excel->getActiveSheet()->setCellValue('G' . $i, $booking['num']);
                        $this->excel->getActiveSheet()->setCellValue('H' . $i, $booking['amount']);
                    }elseif($type == '2'){
                        $this->excel->getActiveSheet()->setCellValue('B' . $i, $booking['userName']);
                        $bankName = getBankName ($booking['uId']);
                        $this->excel->getActiveSheet()->setCellValue('C' . $i, $bankName);
                        $this->excel->getActiveSheet()->setCellValue('D' . $i, '');
                        $this->excel->getActiveSheet()->setCellValue('E' . $i, $t);
                        $this->excel->getActiveSheet()->setCellValue('F' . $i, $e);
                        $this->excel->getActiveSheet()->setCellValue('G' . $i, $booking['num']);
                        $this->excel->getActiveSheet()->setCellValue('H' . $i, $booking['amount']);
                    }elseif($type == '3'){
                        $this->excel->getActiveSheet()->setCellValue('B' . $i, $booking['title']);
                        $this->excel->getActiveSheet()->setCellValue('C' . $i, $booking['userName']);
                        $this->excel->getActiveSheet()->setCellValue('D' . $i, retUserDepartment($booking['department']));
                        $this->excel->getActiveSheet()->setCellValue('E' . $i, $booking['duty']);
                        $this->excel->getActiveSheet()->setCellValue('F' . $i, $t);
                        $this->excel->getActiveSheet()->setCellValue('G' . $i, $e);
                        $this->excel->getActiveSheet()->setCellValue('H' . $i, $booking['num']);
                        $this->excel->getActiveSheet()->setCellValue('I' . $i, $booking['amount']);
                    }elseif($type == '4'){
                        $this->excel->getActiveSheet()->setCellValue('B' . $i, $booking['villageTitle']);
                        $this->excel->getActiveSheet()->setCellValue('C' . $i, $booking['userName']);
                        $this->excel->getActiveSheet()->setCellValue('D' . $i, retUserDepartment($booking['department']));
                        $this->excel->getActiveSheet()->setCellValue('E' . $i, $booking['duty']);
                        $this->excel->getActiveSheet()->setCellValue('F' . $i, $t);
                        $this->excel->getActiveSheet()->setCellValue('G' . $i, $e);
                        $this->excel->getActiveSheet()->setCellValue('H' . $i, $booking['num']);
                        $this->excel->getActiveSheet()->setCellValue('I' . $i, $booking['amount']);
                    }
                  
                    $i++;
                }
                $filename = $time.'至'.$endtime.'的信息.xls'; //save our workbook as this file name

                header('Content-Type: application/vnd.ms-excel'); //mime type

                header('Content-Disposition: attachment;filename="' . $filename . '"'); //tell browser what's the file name

                header('Cache-Control: max-age=0'); //no cache

                $objWriter = PHPExcel_IOFactory::createWriter($this->excel, 'Excel5');

                $objWriter->save('php://output');
                // echo "<script>alert('导出成功！');window.location.href='" . site_url('/Mortgage/commision') . "'</script>";
                exit;
            }else{
                echo "<script>alert('暂无数据，请重新筛选！！');window.location.href='" . site_url('/Mortgage/commision') . "'</script>";
                exit;
            }

            //exit;

        }else{
            $this->load->view('404.html');
        }
    }


    //小区提成
    function villageCommision(){
   
  

        $data['menu'] = array('finance', 'villageCommision');
        $this->load->view('mortgage/villageCommision.html',$data);
    }

    //
    function villageExtract(){
        $time = $this->input->get('time');
        $endtime = $this->input->get('endtime');

        if($time == '' || $endtime == ''){
            echo "<script>alert('请选择时间段！');window.location.href='" . site_url('/Mortgage/villageCommision') . "'</script>";
            exit;
        }
        if (!empty($time)) {
            $t = $time . ' 00:00:00';
            $e = $endtime . ' 23:59:59';
        } else {
            $t = '';
            $e = '';
        }

        //获取所有小区
        $list = $this->public_model->select('hj_village','createTime','desc');


        $config['per_page'] = 10;
        //获取页码
        $current_page = intval($this->input->get("size"));//index.php 后数第4个/
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
        $config['total_rows'] = count($list);

        $config['page_query_string'] = true;//关键配置
        // $config['reuse_query_string'] = FALSE;
        $config['query_string_segment'] = 'size';
        $config['base_url'] = site_url('/Mortgage/villageExtract?') . 'time=' . $time . '&endtime=' . $endtime;

        // //分页数据\
        $listpage = $this->public_model->select_page('hj_village','createTime', $current_page, $config['per_page']);
       
        foreach ($listpage as $k => $v) {
            //获取
            $a= villageExtract('vId', $v['id'], $t, $e);
            $listpage[$k] = array_merge($v,$a);
        }
        $this->load->library('pagination');//加载ci pagination类

        $this->pagination->initialize($config);
        $menu = array('finance', 'villageCommision');
      
        $data = array('lists' => $listpage, 'pages' => $this->pagination->create_links(), 'menu' => $menu,'t'=>$t,'e'=>$e);
        // exit;
        $this->load->view('mortgage/villageCommision.html', $data);
    }

    //导出信息
    function downVillageExtract(){
        $time = $this->input->post('time');
        $endtime = $this->input->post('endtime');
        if ($time == '' || $endtime == '') {
            echo "<script>alert('请选择时间段！');window.location.href='" . site_url('/Mortgage/villageCommision') . "'</script>";
            exit;
        }
        if (!empty($time)) {
            $t = $time . ' 00:00:00';
            $e = $endtime . ' 23:59:59';
        } else {
            $t = '';
            $e = '';
        }
        $list = $this->public_model->select('hj_village', 'createTime', 'desc');
        if (!empty($list)) {
            foreach ($list as $k => $v) {
                //获取
                $a = villageExtract('vId', $v['id'], $t, $e);
                $list[$k] = array_merge($v, $a);
            }

            $arr_title = array(
                'A' => '编号',
                'B' => '小区名称',
                'C' => '开始时间',
                'D' => '截止时间',
                'E' => '销售数量',
                'F' => '销售人员',
                'G' => '销售公司',
                'H' => '单位提成金额',
                'I' => '业务经理',
                'J' => '单位提成金额',
                'K' => '银行经理',
                'L' => '单位提成金额',
                'M' => '客户经理',
                'N' => '单位提成金额',
                'O' => '提成总金额',
            );
           

            $this->load->library('excel');

            $this->excel->setActiveSheetIndex(0);

            $this->excel->getActiveSheet()->setTitle('ImportOrder');
                    //设置excel 表头
            foreach ($arr_title as $key => $value) {

                $this->excel->getActiveSheet()->setCellValue($key . '1', $value);

                $this->excel->getActiveSheet()->getStyle($key . '1')->getFont()->setSize(13);

                $this->excel->getActiveSheet()->getStyle($key . '1')->getFont()->setBold(true);

                $this->excel->getActiveSheet()->getDefaultColumnDimension('A')->setWidth(20);

                $this->excel->getActiveSheet()->getStyle($key . '1')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);

            }

            $i = 2;
            foreach ($list as $booking) {

                $this->excel->getActiveSheet()->setCellValue('A' . $i, $i - 1);
                $this->excel->getActiveSheet()->setCellValue('B' . $i, $booking['villageTitle']);
                $this->excel->getActiveSheet()->setCellValue('C' . $i, $t);
                $this->excel->getActiveSheet()->setCellValue('D' . $i, $e);
                $this->excel->getActiveSheet()->setCellValue('E' . $i, $booking['num']);
                $user = retSalesUser($booking['salesUserId']);
                $this->excel->getActiveSheet()->setCellValue('F' . $i, $user['userName']);
                $com = retSalesCompany($booking['salesCompany']);
                $this->excel->getActiveSheet()->setCellValue('G' . $i, $com['companyName']);
                $this->excel->getActiveSheet()->setCellValue('H' . $i, $booking['brokerage']);
                $del = develNameUser($booking['dId']);
                $name = retUsername($del['blameId']);
                $this->excel->getActiveSheet()->setCellValue('I' . $i, $name['userName']);
                $this->excel->getActiveSheet()->setCellValue('J' . $i, $booking['serviceExtract']);

                $this->excel->getActiveSheet()->setCellValue('K' . $i, getBankUserName($booking['bankUser']));
                $this->excel->getActiveSheet()->setCellValue('L' . $i, $booking['bankExtract']);
                $u = retUsername($booking['respons']);
                $this->excel->getActiveSheet()->setCellValue('M' . $i, $u['userName']);
                $this->excel->getActiveSheet()->setCellValue('N' . $i, $booking['customerExtract']);
                $this->excel->getActiveSheet()->setCellValue('O' . $i, $booking['extractAmount']+$booking['customerAmount']+$booking['serviceAmount']+$booking['bankAmount']);


                $i++;
            }
            $filename = $time . '至' . $endtime . '的小区统计信息.xls'; //save our workbook as this file name

            header('Content-Type: application/vnd.ms-excel'); //mime type

            header('Content-Disposition: attachment;filename="' . $filename . '"'); //tell browser what's the file name

            header('Cache-Control: max-age=0'); //no cache

            $objWriter = PHPExcel_IOFactory::createWriter($this->excel, 'Excel5');

            $objWriter->save('php://output');
                // echo "<script>alert('导出成功！');window.location.href='" . site_url('/Mortgage/commision') . "'</script>";
            exit;

        }else{
            echo "<script>alert('暂无信息！');window.location.href='" . site_url('/Mortgage/villageCommision') . "'</script>";
        }   



    }

    //提成挂历
    function putForward(){
          //
        $config['per_page'] = 10;
        //获取页码
        $current_page = intval($this->uri->segment(3));//index.php 后数第4个/
        //配置
        $config['base_url'] = site_url('/Mortgage/putForward');
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
        $this->load->library('pagination');//加载ci pagination类

        $total = count($this->public_model->select('hj_sales_forwork', 'reflectTime','desc'));
        $config['total_rows'] = $total;
        $listpage = $this->public_model->select_page('hj_sales_forwork', 'reflectTime', 'desc',$current_page, $config['per_page']);

     

        $menu = array('finance', 'putForward');
        $data = array('lists' => $listpage, 'pages' => $this->pagination->create_links(), 'menu' => $menu);

        $this->load->view('mortgage/putForward.html', $data);
    }

    //审核
    function editForward(){
        if($_POST){
            $data = $this->input->post();
            $data['examineTime'] = date('Y-m-d H:i:s');
            if($this->public_model->updata("hj_sales_forwork",'id',$data['id'],$data)){
                $arr = array(
                    'log_url' => $this->uri->uri_string(),
                    'user_id' => $this->session->users['userId'],
                    'username' => $this->session->users['userName'],
                    'log_ip' => get_client_ip(),
                    'log_status' => '1',
                    'log_message' => "审核提现信息成功,申请信息ID是" . $data['id'].',审核状态是：'.$data['status'],
                );
                add_system_log($arr);
                echo "<script>alert('操作成功！');window.location.href='" . site_url('/Mortgage/putForward') . "'</script>";
                exit;
            }else{
                $arr = array(
                    'log_url' => $this->uri->uri_string(),
                    'user_id' => $this->session->users['userId'],
                    'username' => $this->session->users['userName'],
                    'log_ip' => get_client_ip(),
                    'log_status' => '0',
                    'log_message' => "审核提现信息失败,申请信息ID是" . $data['id'] . ',审核状态是：' . $data['status'],
                );
                add_system_log($arr);
                echo "<script>alert('操作成功！');window.location.href='" . site_url('/Mortgage/putForward') . "'</script>";
                exit;
            }
        }else{

        }
    }



}