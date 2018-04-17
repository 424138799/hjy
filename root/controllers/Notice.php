<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require_once(APPPATH.'controllers/Default_Controller.php');

/**
*    公告+充值纪录
*/
class Notice extends Default_Controller
{
	public $notice = "wxCatchv1_system_notice";//公告
	public $charge = "wxCatchv1_integral_recharge";//充值纪录
    public $member = "wxCatchv1_member_user";//充值纪录
	public $logExport = "wxCatchv1_system_log";//日志
	function __construct()
	{
		parent::__construct();
		$this->load->model('public_model');
	}


	function noticeList(){
		$config['per_page'] = 10;
        //获取页码
        $current_page=intval($this->uri->segment(3));//index.php 后数第4个/
        //配置
        $config['base_url'] = site_url('/Wechat/WechatAudited');
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
        
        $total = count($this->public_model->select($this->notice,'u_id'));
        $config['total_rows'] = $total;
    
        $this->load->library('pagination');//加载ci pagination类
        $listpage = $this->public_model->select_page($this->notice,'u_id',$current_page,$config['per_page']);
		$this->pagination->initialize($config);

        $data = array('lists'=>$listpage,'pages' => $this->pagination->create_links());
        $data['menu'] = 'noticeList';

        $this->load->view('billboard.html',$data);
	}

	//新增公告
	function addNotice(){
		if($_POST){
			$data = $this->input->post();
			if($this->public_model->insert($this->notice,$data)){
				$arr = array(
		                'log_url'=>$this->uri->uri_string(),
		                'user_id'=> $this->session->users['id'],
		                'username'=>$this->session->users['username'],
		                'log_ip'=>get_client_ip(),
		                'log_status'=>'1',
		                'log_message'=>"新增公告成功,公告内容：".$data['content'],
		        );
                add_system_log($arr);
                echo "<script>alert('操作成功！');window.location.href='".site_url('/Notice/noticeList')."'</script>";exit;
			}else{
				$arr = array(
		                'log_url'=>$this->uri->uri_string(),
		                'user_id'=> $this->session->users['id'],
		                'username'=>$this->session->users['username'],
		                'log_ip'=>get_client_ip(),
		                'log_status'=>'0',
		                'log_message'=>"新增公告失败,公告内容：".$data['content'],
		        );
                add_system_log($arr);
                echo "<script>alert('操作失败！');window.location.href='".site_url('/Notice/noticeList')."'</script>";exit;
			}
		}else{
			$this->load->view('404.html');
		}
	}

	//编辑
	function editNotice(){
		if($_POST){
			$data = $this->input->post();
			if($this->public_model->updata($this->notice,'u_id',$data['u_id'],$data)){
				$arr = array(
		                'log_url'=>$this->uri->uri_string(),
		                'user_id'=> $this->session->users['id'],
		                'username'=>$this->session->users['username'],
		                'log_ip'=>get_client_ip(),
		                'log_status'=>'1',
		                'log_message'=>"编辑公告成功,公告内容：".$data['content'],
		        );
                add_system_log($arr);
                echo "<script>alert('操作成功！');window.location.href='".site_url('/Notice/noticeList')."'</script>";exit;
			}else{
				$arr = array(
		                'log_url'=>$this->uri->uri_string(),
		                'user_id'=> $this->session->users['id'],
		                'username'=>$this->session->users['username'],
		                'log_ip'=>get_client_ip(),
		                'log_status'=>'0',
		                'log_message'=>"编辑公告失败,公告内容：".$data['content'],
		        );
                add_system_log($arr);
                echo "<script>alert('操作失败！');window.location.href='".site_url('/Notice/noticeList')."'</script>";exit;
			}
		}else{
			$this->load->view('404.html');
		}
	}
	//删除公告
	function delNotice(){
		if($_POST){
			$id = $this->input->post('id');

			if($this->public_model->delete($this->notice,'u_id',$id)){
				$arr = array(
		                'log_url'=>$this->uri->uri_string(),
		                'user_id'=> $this->session->users['id'],
		                'username'=>$this->session->users['username'],
		                'log_ip'=>get_client_ip(),
		                'log_status'=>'1',
		                'log_message'=>"删除公告成功,公告站内id是：".$id,
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
		                'log_message'=>"删除公告失败,公告站内id是：".$id,
		        );
                add_system_log($arr);
                echo "2";exit;
			}


		}else{
			echo "2";
		}
	}

	//充值纪录
	function rechargeList(){
		$config['per_page'] = 10;
        //获取页码
        $current_page=intval($this->uri->segment(3));//index.php 后数第4个/
        //配置
        $config['base_url'] = site_url('/Notice/rechargeList');
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
        
        $total = count($this->public_model->select($this->charge,'id'));
        $config['total_rows'] = $total;

    
        $this->load->library('pagination');//加载ci pagination类
        $listpage = $this->public_model->select_page($this->charge,'id',$current_page,$config['per_page']);
		$this->pagination->initialize($config);
		$menu = 'rechargeList';

        $data = array('lists'=>$listpage,'pages' => $this->pagination->create_links(),'menu'=>$menu);
        $this->load->view('chargeRecord.html',$data);
	}

	//充值纪录搜索
	function searchCharge(){
		 $config['per_page'] = 10;
        //获取页码
        $current_page=intval($this->input->get("size"));//index.php 后数第4个/

        $username = $this->input->get('username');
        $time = $this->input->get('starttime');
        $endtime = $this->input->get('endtime');
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

        //获取用户id
        if(!empty($username)){
        	$user = $this->public_model->select_info($this->member,'username',$username);
        	$userid = $user['user_id'];
        }else{
        	$userid = '';
        }

        //时间啊
        if(!empty($time)){
        	$t = $time.' 00:00:00';
        	$e = $endtime.' 23:59:59';
        }else{
        	$t = '';
        	$e = '';
        }


        if(!empty($userid) && empty($t)){
        	$total = count($this->public_model->select_where($this->charge,'user_id',$userid,'id','desc'));

	        $config['total_rows'] = $total;

	        $listpage = $this->public_model->select_where_page($this->charge,'user_id',$userid,'id','desc',$current_page,$config['per_page']);

        }else if(empty($userid) && !empty($t)){
        	$query = $this->db->where('createTime >=',$t)->where('createTime <=',$e)->get($this->charge);
        	$res = $query->result_array();
        	$config['total_rows'] = count($res);

        	$query1 = $this->db->where('createTime >=',$t)->where('createTime <=',$e)->limit($config['per_page'],$current_page)->get($this->charge);
        	$listpage = $query1->result_array();

        }else if(!empty($userid) && !empty($t)){
        	$query = $this->db->where('user_id',$userid)->where('createTime >=',$t)->where('createTime <=',$e)->get($this->charge);
        	$res = $query->result_array();
        	$config['total_rows'] = count($res);

        	$query1 = $this->db->where('user_id',$userid)->where('createTime >=',$t)->where('createTime <=',$e)->limit($config['per_page'],$current_page)->get($this->charge);
        	$listpage = $query1->result_array();
        }else if(empty($userid) && empty($t)){
        	$total = count($this->public_model->select($this->charge,'id'));
        	$config['total_rows'] = $total;
        	$listpage = $this->public_model->select_page($this->charge,'id',$current_page,$config['per_page']);
        }
       
        $config['page_query_string'] = TRUE;//关键配置
        // $config['reuse_query_string'] = FALSE;
        $config['query_string_segment'] = 'size';
        $config['base_url'] = site_url('/Notice/searchCharge?').'username='.$username.'&starttime='.$time.'&endtime='.$endtime;

        // //分页数据\
       
        
        $this->load->library('pagination');//加载ci pagination类

        $this->pagination->initialize($config);

        // var_dump($data);
  
      	$menu = 'rechargeList';

        $data = array('lists'=>$listpage,'pages' => $this->pagination->create_links(),'menu'=>$menu);
        $this->load->view('chargeRecord.html',$data);
	}

    //日志
    function LogExport(){
        $config['per_page'] = 10;
        //获取页码
        $current_page=intval($this->uri->segment(3));//index.php 后数第4个/
        //配置
        $config['base_url'] = site_url('/Notice/LogExport');
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
        
        $total = count($this->public_model->select($this->logExport,'log_id'));

        $config['total_rows'] = $total;

    
        $this->load->library('pagination');//加载ci pagination类
        $listpage = $this->public_model->select_page($this->logExport,'log_id',$current_page,$config['per_page']);
        $this->pagination->initialize($config);
        $menu = 'LogExport';

        $data = array('lists'=>$listpage,'pages' => $this->pagination->create_links(),'menu'=>$menu);
        $this->load->view('LogExport.html',$data);
    }

    //删除记录
    function delLog(){
        $id = intval($this->uri->segment('3'));
        if($id == '0'){
            echo "<script>alert('非法访问！');window.location.href='".site_url('/Notice/LogExport')."'</script>";exit;
        }else{
            $log = $this->public_model->select_info($this->logExport,'log_id',$id);

            if(!empty($log)){
                    $this->load->library('excel');

                    $this->excel->setActiveSheetIndex(0);

                    $this->excel->getActiveSheet()->setTitle('ImportOrder');

                    $arr_title = array(
                        'A' => '记录ID',
                        'B' => '操作用户id',
                        'C' => '操作用户名称',
                        'D' => '操作ip',
                        'E' => '操作时间',
                        'F' => '操作内容',
                        'G' => '操作状态',
                    );
                    //设置excel 表头
                    foreach ($arr_title as $key => $value) {

                        $this->excel->getActiveSheet()->setCellValue($key . '1', $value);

                        $this->excel->getActiveSheet()->getStyle($key . '1')->getFont()->setSize(13);

                        $this->excel->getActiveSheet()->getStyle($key . '1')->getFont()->setBold(true);

                       $this->excel->getActiveSheet()->getDefaultColumnDimension('A')->setWidth(20);

                        $this->excel->getActiveSheet()->getStyle($key . '1')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);

                    }

                  
                    $this->excel->getActiveSheet()->setCellValue('A2',$log['log_id']);  
                    $this->excel->getActiveSheet()->setCellValue('B2', $log['user_id']);  
                    $this->excel->getActiveSheet()->setCellValue('C2', $log['username']);  
                    $this->excel->getActiveSheet()->setCellValue('D2', $log['log_ip']);  
                    $this->excel->getActiveSheet()->setCellValue('E2', $log['log_time']);  
                    $this->excel->getActiveSheet()->setCellValue('F2', $log['log_message']);  
                    if($log['log_status'] == '1'){
                        $this->excel->getActiveSheet()->setCellValue('G2', '成功');  

                    }else{
                        $this->excel->getActiveSheet()->setCellValue('G2', '失败');  

                    }

  
                  
                    $filename = '系统日志.xls'; //save our workbook as this file name

                   /// var_dump($filename);
                    if($this->public_model->delete($this->logExport,'log_id',$id)){
                     
                        $arr = array(
                            'log_url'=>$this->uri->uri_string(),
                            'user_id'=> $this->session->users['id'],
                            'username'=>$this->session->users['username'],
                            'log_ip'=>get_client_ip(),
                            'log_status'=>'1',
                            'log_message'=>"删除日志成功,日志记录id是".$id,
                        );
                        add_system_log($arr);
                        // echo "<script>alert('操作成功！');</script>";
                    }else{
                        $arr = array(
                            'log_url'=>$this->uri->uri_string(),
                            'user_id'=> $this->session->users['id'],
                            'username'=>$this->session->users['username'],
                            'log_ip'=>get_client_ip(),
                            'log_status'=>'0',
                            'log_message'=>"删除日志失败,日志记录id是".$id,
                        );
                        add_system_log($arr);
                    } 

                    header('Content-Type: application/vnd.ms-excel'); //mime type

                    header('Content-Disposition: attachment;filename="' . $filename . '"'); //tell browser what's the file name

                    header('Cache-Control: max-age=0'); //no cache

                    $objWriter = PHPExcel_IOFactory::createWriter($this->excel, 'Excel5');

                    $objWriter->save('php://output');
                 
                     // return "1";
            }
        }
    }

    //导出
    function logDow(){
        if($_POST){
            $time = $this->input->post('time');
            $endtime = $this->input->post('endtime');
            if(!empty($time)){
                $t = $time.' 00:00:00';
                $e = $endtime.' 23:59:59';

                $query = $this->db->where('log_time >=',$t)->where('log_time <=',$e)->order_by('log_time','desc')->get($this->logExport);
                $res = $query->result_array();

                if(!empty($res)){
                    $this->load->library('excel');

                    $this->excel->setActiveSheetIndex(0);

                    $this->excel->getActiveSheet()->setTitle('ImportOrder');

                    $arr_title = array(
                        'A' => '记录ID',
                        'B' => '操作用户id',
                        'C' => '操作用户名称',
                        'D' => '操作ip',
                        'E' => '操作时间',
                        'F' => '操作内容',
                        'G' => '操作状态',
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
                    foreach ($res as $booking) {
                            $this->excel->getActiveSheet()->setCellValue('A'.$i,$booking['log_id']);  
                            $this->excel->getActiveSheet()->setCellValue('B'.$i, $booking['user_id']);  
                            $this->excel->getActiveSheet()->setCellValue('C'.$i, $booking['username']);  
                            $this->excel->getActiveSheet()->setCellValue('D'.$i, $booking['log_ip']);  
                            $this->excel->getActiveSheet()->setCellValue('E'.$i, $booking['log_time']);  
                            $this->excel->getActiveSheet()->setCellValue('F'.$i, $booking['log_message']);  
                            if($booking['log_status'] == '1'){
                                $this->excel->getActiveSheet()->setCellValue('G'.$i, '成功');  

                            }else{
                                $this->excel->getActiveSheet()->setCellValue('G'.$i, '失败');  

                            }
                            $i++;
                    }
                  
                  
                    $filename = '系统日志'.$time.'-'.$endtime.'.xls'; //save our workbook as this file name

                   /// var_dump($filename);
                 
                    $arr = array(
                        'log_url'=>$this->uri->uri_string(),
                        'user_id'=> $this->session->users['id'],
                        'username'=>$this->session->users['username'],
                        'log_ip'=>get_client_ip(),
                        'log_status'=>'1',
                        'log_message'=>"导出日志成功,日志记录是".$time.'至'.$endtime,
                    );
                    add_system_log($arr);
                  

                    header('Content-Type: application/vnd.ms-excel'); //mime type

                    header('Content-Disposition: attachment;filename="' . $filename . '"'); //tell browser what's the file name

                    header('Cache-Control: max-age=0'); //no cache

                    $objWriter = PHPExcel_IOFactory::createWriter($this->excel, 'Excel5');

                    $objWriter->save('php://output');
                }else{  
                    echo "<script>alert('未查到信息数据！');window.location.href='".site_url('/Notice/logExport')."'</script>";exit;

                }
            }else{
                echo "<script>alert('时间不能为空！');window.location.href='".site_url('/Notice/logExport')."'</script>";exit;
            }
        }else{
            echo "<script>alert('请求错误');window.location.href='".site_url('/Notice/logExport')."'</script>";exit;

        }
    }


}



?>