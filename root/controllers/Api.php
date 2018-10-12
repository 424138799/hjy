<?php 
defined('BASEPATH') or exit('No direct script access allowed');

/**
 *    网站首页
 */
class Api extends CI_Controller
{
   public $banner = 'system_banner';//banner
   public $village = 'village';//小区
   public $salesUser = "sales_user";
   public $sendApply = "send_apply";
   function __construct()
   {
       parent::__construct();
       $this->load->model('public_model');
   }
   //根据公司返回职位
    function retCompanyDear()
    {
        if ($_POST) {
            $id = $this->input->post('cId');
            $lists = $this->public_model->select_where('admin_department', 'cId', $id, 'id', 'desc');
            if (!empty($lists)) {
                echo json_encode($lists);
            } else {
                echo "2";
            }
        }
    }

    //
    function retSalesUser()
    {
        if ($_POST) {
            $id = $this->input->post('cId');
            $salesUser = $this->public_model->select_where_many($this->salesUser, 'c_id', $id, 'isDel', '0', 'createTime', 'desc');
            if (!empty($salesUser)) {
                echo json_encode($salesUser);
            } else {
                echo "2";
            }
        } else {
            echo "2";
        }
    }

   //七牛上传token
   function QiniuToken(){
       if($_POST){
            $this->load->library('Qiniu');
            $accessKey = "qjWkScOlHQsxnSMyAYScOwCBgWljlwaOuqMmXAg2";
            $secretKey = "hj-sLlpzxyKIbGd4T97iXQscj9UG2-Yx2siA0kXg";
            $bucket = "hengjiyuan-wx";

            $auth = new Qiniu\Auth($accessKey, $secretKey);
            $token = $auth->uploadToken($bucket);
            if (!empty($token)) {
                $arr = array(
                    'error' => '0',
                    'data' => $token,
                );
                echo json_encode($arr);
            } else {
                $arr = array(
                    'error' => '2',
                    'data' => '',
                );
                echo json_encode($arr);
            }

       }else{
            $arr = array(
                'error' => '2',
                'errorData' => '请求错误！',
                'data' => '',
            );
            echo json_encode($arr); 
       }
    
   }

   //login小程序登陆
   function salesUserLogin(){
        if($_POST){
            $phone = $this->input->post('phone');
            $password = $this->input->post('password');
            if (empty($phone || empty($password))) {
                $arr = array(
                    'error' => '2',
                    'errorData' => '账户密码不能为空',
                    'data' => '',
                );
                echo json_encode($arr);
            } else{
                $user = $this->public_model->select_info($this->salesUser, 'phone', $phone);
                // var_dump($user);
                if(!empty($user)){
                    if($user['password'] != md5($password)){
                        $arr = array(
                            'error' => '2',
                            'errorData' => '密码错误！',
                            'data' => '',
                        );
                        echo json_encode($arr);
                    }else{
                        $arr = array(
                            'error' => '0',
                            'errorData' => '',
                            'data' => $user,
                        );
                        echo json_encode($arr);
                    }
                }else{
                    $arr = array(
                        'error' => '2',
                        'errorData' => '没有该用户，请联系管理员！',
                        'data' => '',
                    );
                    echo json_encode($arr);
                }
            }
        }else{
            $arr = array(
                'error' => '2',
                'errorData' => '请求错误！',
                'data' => '',
            );
            echo json_encode($arr);
        }
   }
    
   //banner
   function bannerList(){
       if($_POST){
            $bannerList = $this->public_model->select($this->banner,'bannerId','desc');
            if(!empty($bannerList)){
                $arr = array(
                    'error' => '0',
                    'data' => $bannerList,
                );
                echo json_encode($arr);
            }else{
                $arr = array(
                    'error' => '2',
                    'data' => '',
                );
                echo json_encode($arr);
            }
       }else{
           $arr = array(
               'error'=>'2',
               'data'=>'',
           );
           echo json_encode($arr);
       }
   }


   //小区列表
   function villageList(){
       if($_POST){
            $id = $this->input->post('userId');
            $list = $this->public_model->select_where($this->village, 'status', '1',  'createTime', 'desc');
            var_dump($list);
            if(!empty($list)){
                $arr = array(
                    'error' => '0',
                    'errorData' => '',
                    'data' => $list,
                );
                echo json_encode($arr);
            } else {
                $arr = array(
                    'error' => '2',
                    'errorData' => '暂无数据！',
                    'data' => '',
                );
                echo json_encode($arr);
            }
       }else{
            $arr = array(
                'error' => '2',
                'errorData' => '请求错误！',
                'data' => '',
            );
            echo json_encode($arr);
       }
   }

   //首页停车位
   function homeCarPark(){
       if($_POST){
            $id = $this->input->post('userId');

            // $this->db->select('a.*,b.id as villId,b.salesUserId');
            // $this->db->from('hj_village as b', 'left');
            // $this->db->from('hj_car_parking as a','inner');
            // $query = $this->db->where('b.id', 'a.vId')->where('b.salesUserId',$id)->order_by('a.carId','desc')->get();
            $sql = "SELECT `a`.`salesUserId`, `b`.* FROM `hj_village` as `a`, `hj_car_parking` as `b` WHERE `a`.`id` = `b`.`vId` AND `a`.`salesUserId` = '".$id."' ORDER BY `b`.`carId` DESC";
            $query = $this->db->query($sql);
            $list = $query->result_array();
            
            if (!empty($list)) {
                $arr = array(
                    'error' => '0',
                    'errorData' => '',
                    'data' => $list,
                );
                echo json_encode($arr);
            } else {
                $arr = array(
                    'error' => '2',
                    'errorData' => '暂无数据！',
                    'data' => '',
                );
                echo json_encode($arr);
            }
        } else {
            $arr = array(
                'error' => '2',
                'errorData' => '请求错误！',
                'data' => '',
            );
            echo json_encode($arr);
        
       }
   }

   //小区信息
   function villageInfo(){
       if($_POST){
            $id = $this->input->post('vId');
            $info = $this->public_model->selectVig($id);
            $list = $this->public_model->select_where('hj_car_parking', 'vId', $id, 'carId', 'desc');
            $info['respons'] = $info['userName'];
           
            if (!empty($info)) {
                $arr = array(
                    'error' => '0',
                    'errorData' => '',
                    'data' =>array(
                        'info'=>$info,
                        'carPark'=> $list,
                    ),
                );
                echo json_encode($arr);
            } else {
                $arr = array(
                    'error' => '2',
                    'errorData' => '暂无数据！',
                    'data' => '',
                );
                echo json_encode($arr);
            }
       }else{
            $arr = array(
                'error' => '2',
                'errorData' => '请求错误！',
                'data' => '',
            );
            echo json_encode($arr);
       }
   }

   //申请按揭
   function sendApply(){
        if($_POST){
             $data = $this->input->post();

            //获取小区提成信息
            $this->db->select('a.id,a.brokerage,a.bankExtract,a.customerExtract,a.serviceExtract,b.vId,a.dId');
            $this->db->from('hj_car_parking as b','left');
            $this->db->join('hj_village as a','a.id = b.vId','inner');
            $query = $this->db->where('b.carId',$data['carId'])->get();
            $vi = $query->row_array();

            $data['extractPrice'] = $vi['brokerage'];//销售提成
            $data['serviceExtract'] = $vi['serviceExtract'];//业务提成
            $data['customerExtract'] = $vi['customerExtract'];//客户提成
            $data['bankExtract'] = $vi['bankExtract'];//银行提成
            $data['dId'] = $vi['dId'];//银行提成
            $data['vId'] = $vi['id'];//银行提成
        

             $data['sendTime'] = date('Y-m-d H:i:s',time());
             if($this->public_model->insert($this->sendApply,$data)){
                $arr = array(
                    'error' => '0',
                    'errorData' => '',
                    'data' => '提交成功',
                );
                echo json_encode($arr);
             }else{
                $arr = array(
                    'error' => '2',
                    'errorData' => '提交失败',
                    'data' => '',
                );
                echo json_encode($arr);
             }
        }else{
            $arr = array(
                'error' => '2',
                'errorData' => '请求错误！',
                'data' => '',
            );
            echo json_encode($arr);
        }
   }

   //我的提交审核信息
   function mySendApply(){
       if($_POST){
            $userId = $this->input->post('userId');

            $this->db->select('a.*,b.vId,b.carNum,c.villageTitle');
            $this->db->from('hj_send_apply as a', 'left');
            $this->db->join('hj_car_parking as b','a.carId = b.carId','inner');
            $this->db->join('hj_village as c','b.vId = c.id','inner');
            $query = $this->db->where('a.salesId',$userId)->order_by('a.sendTime','desc')->get();
            $list = $query->result_array();
            // $list = $this->public_model->select_where($this->sendApply, 'salesId',$userId,'sendTime','desc');
            if (!empty($list)) {
                $arr = array(
                    'error' => '0',
                    'errorData' => '',
                    'data' => $list,
                );
                echo json_encode($arr);
            } else {
                $arr = array(
                    'error' => '2',
                    'errorData' => '暂无数据！',
                    'data' => '',
                );
                echo json_encode($arr);
            }
       }else{
            $arr = array(
                'error' => '2',
                'errorData' => '请求错误！',
                'data' => '',
            );
            echo json_encode($arr);
       }
   }


   //修改密码
   function editUserPwd(){
       if($_POST){
            $data = $this->input->post();
            //获取用户信息
            $user = $this->public_model->select_info($this->salesUser,'phone',$data['phone']);
            //判断密码是否正常
            if($user['password'] == md5($data['password'])){
               $arr = array('password'=>md5($data['pwd']));
               if($this->public_model->updata($this->salesUser,'phone',$data['phone'],$arr)){
                    $arr = array(
                        'error' => '0',
                        'errorData' => '',
                        'data' => '修改成功！',
                    );
                    echo json_encode($arr);
               }else{
                    $arr = array(
                        'error' => '2',
                        'errorData' => '修改失败！',
                        'data' => '',
                    );
                    echo json_encode($arr);
               }
            }else{
                $arr = array(
                    'error' => '2',
                    'errorData' => '原密码错误',
                    'data' => '',
                );
                echo json_encode($arr);
            }
       }else{
            $arr = array(
                'error' => '2',
                'errorData' => '请求错误！',
                'data' => '',
            );
            echo json_encode($arr);
       }

    }

           
    //按揭详情
    function sendApplyInfo()
    {
        if($_POST){
            $id = $this->input->post('mId');
            $this->db->select('a.*,b.vId,b.carNum,c.villageTitle');
            $this->db->from('hj_send_apply as a', 'left');
            $this->db->join('hj_car_parking as b', 'a.carId = b.carId', 'inner');
            $this->db->join('hj_village as c', 'b.vId = c.id', 'inner');
            $query = $this->db->where('a.mId', $id)->get();
            $list = $query->row_array();
            if (!empty($list)) {
                $arr = array(
                    'error' => '0',
                    'errorData' => '',
                    'data' => $list,
                );
                echo json_encode($arr);
            } else {
                $arr = array(
                    'error' => '2',
                    'errorData' => '暂无数据！',
                    'data' => '',
                );
                echo json_encode($arr);
            }

        }else{
            $arr = array(
                'error' => '2',
                'errorData' => '请求错误！',
                'data' => '',
            );
            echo json_encode($arr);
        }
    }

    //我的提成
    function myExtractPrice(){
        //
        if($_POST){
            $userId = $this->input->post('userId');
            //获取我负责的小区
            $village = $this->public_model->select_where('hj_village', 'salesUserId',$userId,'createTime','desc');
            // $arr = array('thisMonth', 'lastMonth');
            foreach ($village as $key => $val) {
                $arr['thisMonth'][$key]['villageTitle'] = $val['villageTitle'];
                $sql = "SELECT `a`.`mId`, `b`.`vId` FROM `hj_send_apply` as `a` INNER JOIN `hj_car_parking` as `b` ON `a`.`carId` = `b`.`carId` WHERE `b`.`vId` = '".$val['id']."' AND `salesId` = '".$userId. "' and DATE_FORMAT( a.sendTime, '%Y%m' ) = DATE_FORMAT( CURDATE( ) , '%Y%m' )";
               // $sql = "SELECT vid,extractPrice FROM hj_send_apply WHERE DATE_FORMAT( sendTime, '%Y%m' ) = DATE_FORMAT( CURDATE( ) , '%Y%m' ) and vId = '".$val['id']."'";
                $num = count($this->db->query($sql)->result_array());
                $arr['thisMonth'][$key]['num'] = $num;
                $arr['thisMonth'][$key]['price'] = $val['brokerage'];
                $arr['thisMonth'][$key]['amountPrice'] = $val['brokerage']*$num;
                //获取上一个月
                $arr['LastMonth'][$key]['villageTitle'] = $val['villageTitle'];

                $sql1 = "SELECT `a`.`mId`, `b`.`vId` from `hj_send_apply` as `a` INNER JOIN `hj_car_parking` as `b` ON `a`.`carId` = `b`.`carId` where `b`.`vId` = '" . $val['id'] . "' AND `salesId` = '" . $userId . "' and date_format(a.sendTime,'%Y-%m')=date_format(DATE_SUB(curdate(), INTERVAL 1 MONTH),'%Y-%m')";
                $num1 = count($this->db->query($sql1)->result_array());
            
                $arr['LastMonth'][$key]['num'] = $num1;
                $arr['LastMonth'][$key]['price'] = $val['brokerage'];
                $arr['LastMonth'][$key]['amountPrice'] = $val['brokerage'] * $num1;
                $month = date('m', strtotime('-1 month'));                
            }
            $month = date('m', strtotime('-1 month'));                
            $forwork = $this->public_model->select_where_info('hj_sales_forwork', 'userId', $userId, 'month', $month);
            if(!empty($forwork)){
                $arr['LastStatus'] = '1';
            }else{
                $arr['LastStatus'] = '0';
            }

            if(!empty($arr)){
                $data = array(
                    'error' => '0',
                    'errorData' => '',
                    'data' => $arr,
                );
                echo json_encode($data);
            }else{
                $data = array(
                    'error' => '2',
                    'errorData' => '没有数据！',
                    'data' => '',
                );
                echo json_encode($data);
            }
        }else{
            $arr = array(
                'error' => '2',
                'errorData' => '请求错误！',
                'data' => '',
            );
            echo json_encode($arr);
        }
    }

    //申请体现
    function sendRespons(){
        if($_POST){
            $data = $this->input->post();
            $data['reflectTime'] = date('Y-m-d H:i:s');
            $data['month'] = date('m', strtotime('-1 month'));
          
            if($this->public_model->insert('hj_sales_forwork',$data)){
                $data = array(
                    'error' => '0',
                    'errorData' => '',
                    'data' => '提交成功，等待审核',
                );
                echo json_encode($data);
            }else{
                $data = array(
                    'error' => '2',
                    'errorData' => '提交失败',
                    'data' => '',
                );
                echo json_encode($data);
            }
        }else{
            $arr = array(
                'error' => '2',
                'errorData' => '请求错误！',
                'data' => '',
            );
            echo json_encode($arr);
        }
    }

    //提现记录
    function responsList(){
        if($_POST){
            $userId = $this->input->post('userId');
            $list = $this->public_model->select_where('hj_sales_forwork', 'userId',$userId, 'reflectTime','desc');
            if(!empty($list)){
                $arr = array(
                    'error' => '0',
                    'errorData' => '',
                    'data' => $list,
                );
                echo json_encode($arr);
            }else{
                $arr = array(
                    'error' => '2',
                    'errorData' => '没有数据!',
                    'data' => '',
                );
                echo json_encode($arr);
            }
        }else{
            $arr = array(
                'error' => '2',
                'errorData' => '请求错误！',
                'data' => '',
            );
            echo json_encode($arr);
        }
    }

}
