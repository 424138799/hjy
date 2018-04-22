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
        $data['menu'] = array('member', 'commision');
    
        $this->load->view('mortgage/commision.html',$data);
    }
    //小区提成
    function villageCommision(){
        $data['menu'] = array('member', 'villageCommision');

        $this->load->view('mortgage/villageCommision.html',$data);
    }


}