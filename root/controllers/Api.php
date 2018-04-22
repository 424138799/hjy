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
            $list = $this->public_model->select_where_many($this->village, 'status', '1', 'salesUserId',$id, 'createTime', 'desc');
            
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
            $sql = "SELECT `a`.`salesUserId`, `b`.* FROM `hj_village` as `a`, `hj_car_parking` as `b` WHERE `a`.`id` = `b`.`vId` AND `a`.`salesUserId` = '2' ORDER BY `b`.`carId` DESC";
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
            $info = $this->public_model->select_info($this->village,'id',$id);
            $list = $this->public_model->select_where('hj_car_parking', 'vId', $id, 'carId', 'desc');
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
            $query = $this->db->where('a.salesId',$userId)->get();
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

}
