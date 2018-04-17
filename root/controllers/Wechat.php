<?php 
defined('BASEPATH') OR exit('No direct script access allowed');
require_once(APPPATH.'controllers/Default_Controller.php');

/**
*    公众号管理
*/
class Wechat extends Default_Controller
{	
	public $wechat = "wxCatchv1_biz"; //公总号
	public $cates = "wxCatchv1_biz_classify";//分类
	public $claim = "wxCatchv1_biz_claim";//认领
	public $member = "wxCatchv1_member_user";//用户
	public $news = "wxCatchv1_biz_news";//文章
    public $upWechat = "wxCatchv1_biz_updata";
    public $spread = "wxCatchv1_biz_spread";//推广
    public $activity = "wxCatchv1_biz_activity"; //活动


	function __construct()
	{
		parent::__construct();
		$this->load->model('public_model');
	}


	//提交待审核
	function WechatAudited(){
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
        
        $total = count($this->public_model->select_where($this->wechat,'status','0','createTime','desc'));
        $config['total_rows'] = $total;
    
        $this->load->library('pagination');//加载ci pagination类
        $listpage =  $this->public_model->select_where_page($this->wechat,'status','0','createTime','asc',$current_page,$config['per_page']);
		$this->pagination->initialize($config);
        $menu = array('wechat','WechatAudited');

        $data = array('lists'=>$listpage,'pages' => $this->pagination->create_links(),'menu'=>$menu);
        $this->load->view('accountsAdmin/accouts.html',$data);
	}

    //搜索提交待审核
    function searchWechatAudited(){
        $config['per_page'] = 10;
        //获取页码
        $current_page=intval($this->input->get("size"));//index.php 后数第4个/

        $sear = trim($this->input->get('sear'));
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

        if(!empty($time)){
            $t = $time . ' 00:00:00';
            $e = $endtime . ' 23:59:59';
        }else{
            $t = '';
            $e = '';
        }

        if(!empty($sear) && empty($t)){
            $query = $this->db->like('wxNumber',$sear,'both')->or_like('bizName',$sear,'both')->where('status','0')->order_by('createTime','desc')->get($this->wechat);
            $list = $query->result_array();
            $config['total_rows'] = count($list);
            $query1 = $this->db->like('wxNumber',$sear,'both')->or_like('bizName',$sear,'both')->where('status','0')->order_by('createTime','asc')->limit($config['per_page'],$current_page)->get($this->wechat);
            $listpage = $query1->result_array();

        }else if(empty($sear) && !empty($t)){
            $query = $this->db->where('createTime >=',$t)->where('createTime <=',$e)->where('status','0')->order_by('createTime','desc')->get($this->wechat);
            $list = $query->result_array();
            $config['total_rows'] = count($list);
            $query1 = $this->db->where('createTime >=',$t)->where('createTime <=',$e)->where('status','0')->order_by('createTime','asc')->limit($config['per_page'],$current_page)->get($this->wechat);
            $listpage = $query1->result_array();
        }else if(!empty($sear) && !empty($t)){
            $query = $this->db->like('wxNumber',$sear,'both')->or_like('bizName',$sear,'both')->where('createTime >=',$t)->where('createTime <=',$e)->where('status','0')->order_by('createTime','desc')->get($this->wechat);
            $list = $query->result_array();
            $config['total_rows'] = count($list);
            $query1 = $this->db->like('wxNumber',$sear,'both')->or_like('bizName',$sear,'both')->where('createTime >=',$t)->where('createTime <=',$e)->where('status','0')->order_by('createTime','asc')->limit($config['per_page'],$current_page)->get($this->wechat);
            $listpage = $query1->result_array();
        }else if(empty($sear) && empty($t)){
            $total = count($this->public_model->select_where($this->wechat,'status','0','createTime','desc'));
            $config['total_rows'] = $total;
            $listpage =  $this->public_model->select_where_page($this->wechat,'status','0','createTime','asc',$current_page,$config['per_page']);
        }

        $config['page_query_string'] = TRUE;//关键配置
        // $config['reuse_query_string'] = FALSE;
        $config['query_string_segment'] = 'size';
        $config['base_url'] = site_url('/Wechat/searchWechatAudited?').'sear='.$sear.'&starttime='.$time.'&endtime='.$endtime;

        // //分页数据\
        $this->load->library('pagination');//加载ci pagination类

        $this->pagination->initialize($config);
        $menu = array('wechat','WechatAudited');

        $data = array('lists'=>$listpage,'pages' => $this->pagination->create_links(),'menu'=>$menu);
        $this->load->view('accountsAdmin/accouts.html',$data);
    }

	//审核
	function verify(){
		$id = intval($this->uri->segment(3));
		$type = intval($this->uri->segment(4));
		if($id == '0'){
			$this->laod->view('404.html');
		}else{
			//获取公众号详情
			$data['wechat'] = $this->public_model->select_info($this->wechat,'id',$id);
			//获取公众号分类
			$data['cates'] = $this->public_model->select($this->cates,'');
			$data['type'] = $type;
            $data['menu'] = array('wechat','WechatAudited');
			$this->load->view('accountsAdmin/verify.html',$data);
		}
	}

	//审核操作
	function auditOperation(){
		if($_POST){
			$data = $this->input->post();
             if($data['status'] == '1'){
                $title = '审核通过！';
                if(strpos($data['newsLink'],'_biz') !== false){
                    $arr = parse_url($data['newsLink']);
                    $arr_query = convertUrlQuery($arr['query']);
                    $data['_biz'] = $arr_query['__biz'].'==';
                }else{
                    echo "<script>alert('文章链接错误！！');history.back(-1);</script>";exit;
                }
            }else{
                $title = '审核不通过！';
            }
          
			if(!empty($_FILES['img1']['name'])){
                $config['upload_path']      = 'upload/wechat/';
                $config['allowed_types']    = 'gif|jpg|png|jpeg';
                $config['max_size']     = 5120;
                $config['file_name'] = date('y-m-d_His');
                $this->load->library('upload', $config);
                // 上传
                if(!$this->upload->do_upload('img1')) {
                    echo "<script>alert('头像上传失败！');history.back(-1);</script>";exit;
                }else{
                    $data['headerPic'] = 'upload/wechat/'.$this->upload->data('file_name');
                }
            }
            //二维码
            if(!empty($_FILES['img2']['name'])){
                $config['upload_path']      = 'upload/wechat/';
                $config['allowed_types']    = 'gif|jpg|png|jpeg';
                $config['max_size']     = 5120;
                $config['file_name'] = date('y-m-d_His');
                $this->load->library('upload', $config);
                // 上传
                if(!$this->upload->do_upload('img2')) {
                    echo "<script>alert('二维码上传失败！');history.back(-1);</script>";exit;
                }else{
                    $data['qrCode'] = 'upload/wechat/'.$this->upload->data('file_name');
                }
            }

            // $data['status'] = '1';
           
  		
  			unset($data['type']);
           
            if($this->public_model->updata($this->wechat,'id',$data['id'],$data)){
        		$arr = array(
		                'log_url'=>$this->uri->uri_string(),
		                'user_id'=> $this->session->users['id'],
		                'username'=>$this->session->users['username'],
		                'log_ip'=>get_client_ip(),
		                'log_status'=>'1',
		                'log_message'=>'提交待审核公众号'.$title."成功,公众号站内id是".$data['id'],
		        );
                add_system_log($arr);
                echo "<script>alert('操作成功！');window.location.href='".site_url('/Wechat/WechatAudited')."'</script>";exit;
					
            }else{
            	$arr = array(
		                'log_url'=>$this->uri->uri_string(),
		                'user_id'=> $this->session->users['id'],
		                'username'=>$this->session->users['username'],
		                'log_ip'=>get_client_ip(),
		                'log_status'=>'0',
		                'log_message'=>'提交待审核公众号'.$title."失败,公众号站内id是".$data['id'],
		        );
                add_system_log($arr);
                echo "<script>alert('操作失败！');history.back(-1);</script>";exit;			
            }
			

		}else{
			$this->load->view('404.html');
		}
	}

	//修改待审核
	function editAudited(){
		$config['per_page'] = 10;
        //获取页码
        $current_page=intval($this->uri->segment(3));//index.php 后数第4个/
        //配置
        $config['base_url'] = site_url('/Wechat/editAudited');
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
        
        $total = count($this->public_model->select_where($this->upWechat,'status','0','createTime','desc'));
        $config['total_rows'] = $total;
    
        $this->load->library('pagination');//加载ci pagination类
        $listpage =  $this->public_model->select_where_page($this->upWechat,'status','0','createTime','asc',$current_page,$config['per_page']);
		$this->pagination->initialize($config);
        $menu = array('wechat','editAudited');
        $data = array('lists'=>$listpage,'pages' => $this->pagination->create_links(),'menu'=>$menu);

        $this->load->view('accountsAdmin/editVerify.html',$data);

	}

     //搜索修改待审核
    function searchEditAudited(){
        $config['per_page'] = 10;
        //获取页码
        $current_page=intval($this->input->get("size"));//index.php 后数第4个/

        $sear = trim($this->input->get('sear'));
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

        if(!empty($time)){
            $t = $time . ' 00:00:00';
            $e = $endtime . ' 23:59:59';
        }else{
            $t = '';
            $e = '';
        }

        if(!empty($sear) && empty($t)){
            $query = $this->db->like('wxNumber',$sear,'both')->or_like('bizName',$sear,'both')->where('status','0')->order_by('createTime','desc')->get($this->upWechat);
            $list = $query->result_array();
            $config['total_rows'] = count($list);
            $query1 = $this->db->like('wxNumber',$sear,'both')->or_like('bizName',$sear,'both')->where('status','0')->order_by('createTime','asc')->limit($config['per_page'],$current_page)->get($this->upWechat);
            $listpage = $query1->result_array();

        }else if(empty($sear) && !empty($t)){
            $query = $this->db->where('createTime >=',$t)->where('createTime <=',$e)->where('status','0')->order_by('createTime','desc')->get($this->upWechat);
            $list = $query->result_array();
            $config['total_rows'] = count($list);
            $query1 = $this->db->where('createTime >=',$t)->where('createTime <=',$e)->where('status','0')->order_by('createTime','asc')->limit($config['per_page'],$current_page)->get($this->upWechat);
            $listpage = $query1->result_array();
        }else if(!empty($sear) && !empty($t)){
            $query = $this->db->like('wxNumber',$sear,'both')->or_like('bizName',$sear,'both')->where('createTime >=',$t)->where('createTime <=',$e)->where('status','0')->order_by('createTime','desc')->get($this->upWechat);
            $list = $query->result_array();
            $config['total_rows'] = count($list);
            $query1 = $this->db->like('wxNumber',$sear,'both')->or_like('bizName',$sear,'both')->where('createTime >=',$t)->where('createTime <=',$e)->where('status','0')->order_by('createTime','asc')->limit($config['per_page'],$current_page)->get($this->upWechat);
            $listpage = $query1->result_array();
        }else if(empty($sear) && empty($t)){
            $total = count($this->public_model->select_where($this->upWechat,'status','0','createTime','desc'));
            $config['total_rows'] = $total;
            $listpage =  $this->public_model->select_where_page($this->upWechat,'status','0','createTime','asc',$current_page,$config['per_page']);
        }

        $config['page_query_string'] = TRUE;//关键配置
        // $config['reuse_query_string'] = FALSE;
        $config['query_string_segment'] = 'size';
        $config['base_url'] = site_url('/Wechat/searchEditAudited?').'sear='.$sear.'&starttime='.$time.'&endtime='.$endtime;

        // //分页数据\
        $this->load->library('pagination');//加载ci pagination类

        $this->pagination->initialize($config);
        $menu = array('wechat','editAudited');
        $data = array('lists'=>$listpage,'pages' => $this->pagination->create_links(),'menu'=>$menu);

        $this->load->view('accountsAdmin/editVerify.html',$data);
    }

    //修改审核
    function edit_Wechat(){
        $id = intval($this->uri->segment(3));
        $type = intval($this->uri->segment(4));
        if($id == '0'){
            $this->laod->view('404.html');
        }else{
            //获取公众号详情
            $data['wechat'] = $this->public_model->select_info($this->upWechat,'id',$id);
            //获取公众号分类
            $data['cates'] = $this->public_model->select($this->cates,'');
            $data['type'] = $type;
            $data['menu'] = array('wechat','editAudited');
            $this->load->view('accountsAdmin/upVerify.html',$data);
        }
    }

    //修改待审核 
    function upwechatInfo(){
        if($_POST){
            $data = $this->input->post();
            if($data['status'] == '1'){
                if(strpos($data['newsLink'],'_biz') !== false){
                    $arr = parse_url($data['newsLink']);
                    $arr_query = convertUrlQuery($arr['query']);
                    $data['_biz'] = $arr_query['__biz'].'==';
                }else{
                    echo "<script>alert('文章链接错误！！');history.back(-1);</script>";exit;
                }
            }
            if(!empty($_FILES['img1']['name'])){
                $config['upload_path']      = 'upload/wechat/';
                $config['allowed_types']    = 'gif|jpg|png|jpeg';
                $config['max_size']     = 5120;
                $config['file_name'] = date('y-m-d_His');
                $this->load->library('upload', $config);
                // 上传
                if(!$this->upload->do_upload('img1')) {
                    echo "<script>alert('头像上传失败！');history.back(-1);</script>";exit;
                }else{
                    $data['headerPic'] = 'upload/wechat/'.$this->upload->data('file_name');
                }
            }
            //二维码
            if(!empty($_FILES['img2']['name'])){
                $config['upload_path']      = 'upload/wechat/';
                $config['allowed_types']    = 'gif|jpg|png|jpeg';
                $config['max_size']     = 5120;
                $config['file_name'] = date('y-m-d_His');
                $this->load->library('upload', $config);
                // 上传
                if(!$this->upload->do_upload('img2')) {
                    echo "<script>alert('二维码上传失败！');history.back(-1);</script>";exit;
                }else{
                    $data['qrCode'] = 'upload/wechat/'.$this->upload->data('file_name');
                }
            }
            $name = "修改待审核公众号"; 
            $upid = $data['upid'];
            unset($data['type'],$data['upid']);

            // $data['status'] = '1';
            if($data['status'] == '1'){
                $title = '审核通过！';
                if($this->public_model->updata($this->wechat,'id',$data['id'],$data)){
                    $id = $data['id'];
                    unset($data['id'],$data['_biz']);
                    $this->public_model->updata($this->upWechat,'id',$upid,$data);
                    $arr = array(
                            'log_url'=>$this->uri->uri_string(),
                            'user_id'=> $this->session->users['id'],
                            'username'=>$this->session->users['username'],
                            'log_ip'=>get_client_ip(),
                            'log_status'=>'1',
                            'log_message'=>$name.$title."成功,公众号站内id是".$id,
                    );
                    add_system_log($arr);
                    echo "<script>alert('操作成功！');window.location.href='".site_url('/Wechat/editAudited')."'</script>";exit;
                    
                }else{
                    $arr = array(
                            'log_url'=>$this->uri->uri_string(),
                            'user_id'=> $this->session->users['id'],
                            'username'=>$this->session->users['username'],
                            'log_ip'=>get_client_ip(),
                            'log_status'=>'0',
                            'log_message'=>$name.$title."失败,公众号站内id是".$data['id'],
                    );
                    add_system_log($arr);
                    echo "<script>alert('操作失败！');history.back(-1);</script>";exit;          
                }
            }else{
                $title = '审核不通过！';
                unset($data['_biz']);
                //获取
                $wec = $this->public_model->select_info($this->wechat,'id',$data['id']);

               if($this->public_model->updata($this->upWechat,'id',$upid,$data)){
                    //        审核状态。 1通过。0待审   2不通过 3修改待审核\n
                    if($wec['status'] != '1'){
                        $a['status'] = '2';
                        $this->public_model->updata($this->wechat,'id',$data['id'],$a);
                    }
                    $arr = array(
                            'log_url'=>$this->uri->uri_string(),
                            'user_id'=> $this->session->users['id'],
                            'username'=>$this->session->users['username'],
                            'log_ip'=>get_client_ip(),
                            'log_status'=>'1',
                            'log_message'=>$name.$title."成功,公众号站内id是".$data['id'],
                    );
                    add_system_log($arr);
                    echo "<script>alert('操作成功！');window.location.href='".site_url('/Wechat/editAudited')."'</script>";exit;
                        
                }else{
                    $arr = array(
                            'log_url'=>$this->uri->uri_string(),
                            'user_id'=> $this->session->users['id'],
                            'username'=>$this->session->users['username'],
                            'log_ip'=>get_client_ip(),
                            'log_status'=>'0',
                            'log_message'=>$name.$title."失败,公众号站内id是".$data['id'],
                    );
                    add_system_log($arr);
                    echo "<script>alert('操作失败！');history.back(-1);</script>";exit;          
                }
            }
           

           
            

        }else{
            $this->load->view('404.html');
        }
    }





    //删除修改待审核
    function del_upWechat(){
        if($_POST){
            $id = $this->input->post('id');
            if($this->public_model->delete($this->upWechat,'id',$id)){
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=> $this->session->users['id'],
                    'username'=>$this->session->users['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'1',
                    'log_message'=>"删除修改待审核公众号成功,公众号站内id是".$id,
                );
                add_system_log($arr);
                echo "1";
                exit;
            }else{
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=> $this->session->users['id'],
                    'username'=>$this->session->users['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'1',
                    'log_message'=>"删除修改待审核公众号失败,公众号站内id是".$id,
                );
                add_system_log($arr);
                echo "2";
                exit;
            }       
        }else{
            echo "2";
        }
    }

      //  审核状态。 1通过。0待审   2不通过 3修改待审核\n
	//认领待审核
	function claimAudited(){
		$config['per_page'] = 10;
        //获取页码
        $current_page=intval($this->uri->segment(3));//index.php 后数第4个/
        //配置
        $config['base_url'] = site_url('/Wechat/claimAudited');
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
        
        $total = count($this->public_model->select_where($this->claim,'status','0','createTime','desc'));
        $config['total_rows'] = $total;
    
        $this->load->library('pagination');//加载ci pagination类
        $listpage =  $this->public_model->select_where_page($this->claim,'status','0','createTime','asc',$current_page,$config['per_page']);
		$this->pagination->initialize($config);
        $menu = array('wechat','claimAudited');
        $data = array('lists'=>$listpage,'pages' => $this->pagination->create_links(),'menu'=>$menu);

        $this->load->view('accountsAdmin/waitVerify.html',$data);
	}
    //搜索认领
    function searchClaimAudited(){
        $config['per_page'] = 10;
        //获取页码
        $current_page=intval($this->input->get("size"));//index.php 后数第4个/

        $sear = trim($this->input->get('sear'));
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

        if(!empty($time)){
            $t = $time . ' 00:00:00';
            $e = $endtime . ' 23:59:59';
        }else{
            $t = '';
            $e = '';
        }

        if(!empty($sear) && empty($t)){
            $query = $this->db->like('wxNumber',$sear,'both')->or_like('bizName',$sear,'both')->where('status','0')->order_by('createTime','desc')->get($this->claim);
            $list = $query->result_array();
            $config['total_rows'] = count($list);
            $query1 = $this->db->like('wxNumber',$sear,'both')->or_like('bizName',$sear,'both')->where('status','0')->order_by('createTime','asc')->limit($config['per_page'],$current_page)->get($this->claim);
            $listpage = $query1->result_array();

        }else if(empty($sear) && !empty($t)){
            $query = $this->db->where('createTime >=',$t)->where('createTime <=',$e)->where('status','0')->order_by('createTime','desc')->get($this->claim);
            $list = $query->result_array();
            $config['total_rows'] = count($list);
            $query1 = $this->db->where('createTime >=',$t)->where('createTime <=',$e)->where('status','0')->order_by('createTime','asc')->limit($config['per_page'],$current_page)->get($this->claim);
            $listpage = $query1->result_array();
        }else if(!empty($sear) && !empty($t)){
            $query = $this->db->like('wxNumber',$sear,'both')->or_like('bizName',$sear,'both')->where('createTime >=',$t)->where('createTime <=',$e)->where('status','0')->order_by('createTime','desc')->get($this->claim);
            $list = $query->result_array();
            $config['total_rows'] = count($list);
            $query1 = $this->db->like('wxNumber',$sear,'both')->or_like('bizName',$sear,'both')->where('createTime >=',$t)->where('createTime <=',$e)->where('status','0')->order_by('createTime','asc')->limit($config['per_page'],$current_page)->get($this->claim);
            $listpage = $query1->result_array();
        }else if(empty($sear) && empty($t)){
            $total = count($this->public_model->select_where($this->claim,'status','0','createTime','desc'));
            $config['total_rows'] = $total;
            $listpage =  $this->public_model->select_where_page($this->claim,'status','0','createTime','asc',$current_page,$config['per_page']);
        }

        $config['page_query_string'] = TRUE;//关键配置
        // $config['reuse_query_string'] = FALSE;
        $config['query_string_segment'] = 'size';
        $config['base_url'] = site_url('/Wechat/searchClaimAudited?').'sear='.$sear.'&starttime='.$time.'&endtime='.$endtime;

        // //分页数据\
        $this->load->library('pagination');//加载ci pagination类

        $this->pagination->initialize($config);
         $menu = array('wechat','claimAudited');
        $data = array('lists'=>$listpage,'pages' => $this->pagination->create_links(),'menu'=>$menu);

        $this->load->view('accountsAdmin/waitVerify.html',$data);
    }

	//认领审核
	function editClaimAudited(){
		$id = intval($this->uri->segment(3));
		if($id =='0'){
			$this->load->view('404.html');
		}else{
			//获取公众号详情
			$claim = $this->public_model->select_info($this->claim,'id',$id);
			//获取公众号详情
			$data['wechat'] = $this->public_model->select_info($this->wechat,'id',$claim['bizId']);
			//获取公众号分类
			$data['cates'] = $this->public_model->select($this->cates,'');
			$data['claim'] = $claim;
            $data['menu'] = array('wechat','claimAudited');

			$this->load->view('accountsAdmin/editClaim.html',$data);
		}	
	}

	//认领审核操作
	function claimOperation(){
		if($_POST){
			$data = $this->input->post();
            if($data['status'] == '1'){
                $title = '审核通过！';
                $status = '1';
                $cid = $data['cid'];
                if(strpos($data['newsLink'],'_biz') !== false){
                    $arr = parse_url($data['newsLink']);
                    $arr_query = convertUrlQuery($arr['query']);
                    $data['_biz'] = $arr_query['__biz'].'==';
                }else{
                    echo "<script>alert('文章链接错误！！');history.back(-1);</script>";exit;
                }
            }else{
                $title = '审核不通过！';
                $status = '2';
                $cid = $data['cid'];
                unset($data['status']);
            }
           
			if(!empty($_FILES['img1']['name'])){
                $config['upload_path']      = 'upload/wechat/';
                $config['allowed_types']    = 'gif|jpg|png|jpeg';
                $config['max_size']     = 5120;
                $config['file_name'] = date('y-m-d_His');
                $this->load->library('upload', $config);
                // 上传
                if(!$this->upload->do_upload('img1')) {
                    echo "<script>alert('头像上传失败！');history.back(-1);</script>";exit;
                }else{
                    $data['headerPic'] = 'upload/wechat/'.$this->upload->data('file_name');
                }
            }
            //二维码
            if(!empty($_FILES['img2']['name'])){
                $config['upload_path']      = 'upload/wechat/';
                $config['allowed_types']    = 'gif|jpg|png|jpeg';
                $config['max_size']     = 5120;
                $config['file_name'] = date('y-m-d_His');
                $this->load->library('upload', $config);
                // 上传
                if(!$this->upload->do_upload('img2')) {
                    echo "<script>alert('二维码上传失败！');history.back(-1);</script>";exit;
                }else{
                    $data['qrCode'] = 'upload/wechat/'.$this->upload->data('file_name');
                }
            }




            if($status == '1'){
                $users = $this->public_model->select_info($this->member,'email',$data['email']);
                if(!empty($users)){
                	$data['user_id'] = $users['user_id'];
                	unset($data['cid'],$data['email']);
    	            if($this->public_model->updata($this->wechat,'id',$data['id'],$data)){
    	            	$s['status'] = $status;
    	            	$this->public_model->updata($this->claim,'id',$cid,$s);

    	        		$arr = array(
    			                'log_url'=>$this->uri->uri_string(),
    			                'user_id'=> $this->session->users['id'],
    			                'username'=>$this->session->users['username'],
    			                'log_ip'=>get_client_ip(),
    			                'log_status'=>'1',
    			                'log_message'=>"审核认领公众号,".$title.",公众号站内id是".$data['id'],
    			        );
    	                add_system_log($arr);
    	                echo "<script>alert('操作成功！');window.location.href='".site_url('/Wechat/claimAudited')."'</script>";exit;
    						
    	            }else{
    	            	$arr = array(
    			                'log_url'=>$this->uri->uri_string(),
    			                'user_id'=> $this->session->users['id'],
    			                'username'=>$this->session->users['username'],
    			                'log_ip'=>get_client_ip(),
    			                'log_status'=>'0',
    			                'log_message'=>"审核认领公众号,".$title.",公众号站内id是".$data['id'],
    			        );
    	                add_system_log($arr);
    	                echo "<script>alert('操作失败！');history.back(-1);</script>";exit;			
    	            }
    	        }else{

    	        	echo "<script>alert('邮箱用户不存在！');history.back(-1);</script>";exit;		
    	        }
            }else{
                $s['status'] = $status;
                if($this->public_model->updata($this->claim,'id',$cid,$s)){
                    $arr = array(
                                'log_url'=>$this->uri->uri_string(),
                                'user_id'=> $this->session->users['id'],
                                'username'=>$this->session->users['username'],
                                'log_ip'=>get_client_ip(),
                                'log_status'=>'1',
                                'log_message'=>"审核认领公众号,".$title.",公众号站内id是".$data['id'],
                        );
                        add_system_log($arr);
                        echo "<script>alert('操作成功！');window.location.href='".site_url('/Wechat/claimAudited')."'</script>";exit;
                }else{
                    $arr = array(
                                'log_url'=>$this->uri->uri_string(),
                                'user_id'=> $this->session->users['id'],
                                'username'=>$this->session->users['username'],
                                'log_ip'=>get_client_ip(),
                                'log_status'=>'1',
                                'log_message'=>"审核认领公众号,".$title.",公众号站内id是".$data['id'],
                    );
                    add_system_log($arr);
                    echo "<script>alert('操作失败！');history.back(-1);</script>";exit;          
                            
                }
            }
			

		}else{
			$this->load->view('404.html');
		}
	}



	//审核通过
	function WechatList(){
		$config['per_page'] = 10;
        //获取页码
        $current_page=intval($this->uri->segment(3));//index.php 后数第4个/
        //配置
        $config['base_url'] = site_url('/Wechat/WechatList');
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
        
        $total = count($this->public_model->select_where($this->wechat,'status','1','createTime','desc'));
        $config['total_rows'] = $total;
    
        $this->load->library('pagination');//加载ci pagination类
        $listpage =  $this->public_model->select_where_page($this->wechat,'status','1','createTime','desc',$current_page,$config['per_page']);
		$this->pagination->initialize($config);

        $menu = array('wechat','WechatList');
        $data = array('lists'=>$listpage,'pages' => $this->pagination->create_links(),'menu'=>$menu);

        $this->load->view('accountsAdmin/accoutsHad.html',$data);


	}

    //已审核搜索
    function searchWechatList(){
        $config['per_page'] = 10;
        //获取页码
        $current_page=intval($this->input->get("size"));//index.php 后数第4个/

        $sear = trim($this->input->get('sear'));
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

        if(!empty($time)){
            $t = $time . ' 00:00:00';
            $e = $endtime . ' 23:59:59';
        }else{
            $t = '';
            $e = '';
        }

        if(!empty($sear) && empty($t)){
            $query = $this->db->like('wxNumber',$sear,'both')->or_like('bizName',$sear,'both')->where('status','1')->order_by('createTime','desc')->get($this->wechat);
            $list = $query->result_array();
            $config['total_rows'] = count($list);
            $query1 = $this->db->like('wxNumber',$sear,'both')->or_like('bizName',$sear,'both')->where('status','1')->order_by('createTime','desc')->limit($config['per_page'],$current_page)->get($this->wechat);
            $listpage = $query1->result_array();

        }else if(empty($sear) && !empty($t)){
            $query = $this->db->where('createTime >=',$t)->where('createTime <=',$e)->where('status','1')->order_by('createTime','desc')->get($this->wechat);
            $list = $query->result_array();
            $config['total_rows'] = count($list);
            $query1 = $this->db->where('createTime >=',$t)->where('createTime <=',$e)->where('status','1')->order_by('createTime','desc')->limit($config['per_page'],$current_page)->get($this->wechat);
            $listpage = $query1->result_array();
        }else if(!empty($sear) && !empty($t)){
            $query = $this->db->like('wxNumber',$sear,'both')->or_like('bizName',$sear,'both')->where('createTime >=',$t)->where('createTime <=',$e)->where('status','1')->order_by('createTime','desc')->get($this->wechat);
            $list = $query->result_array();
            $config['total_rows'] = count($list);
            $query1 = $this->db->like('wxNumber',$sear,'both')->or_like('bizName',$sear,'both')->where('createTime >=',$t)->where('createTime <=',$e)->where('status','1')->order_by('createTime','desc')->limit($config['per_page'],$current_page)->get($this->wechat);
            $listpage = $query1->result_array();
        }else if(empty($sear) && empty($t)){
            $total = count($this->public_model->select_where($this->wechat,'status','1','createTime','desc'));
            $config['total_rows'] = $total;
            $listpage =  $this->public_model->select_where_page($this->wechat,'status','1','createTime','desc',$current_page,$config['per_page']);
        }

        $config['page_query_string'] = TRUE;//关键配置
        // $config['reuse_query_string'] = FALSE;
        $config['query_string_segment'] = 'size';
        $config['base_url'] = site_url('/Wechat/searchWechatList?').'sear='.$sear.'&starttime='.$time.'&endtime='.$endtime;

        // //分页数据\
        $this->load->library('pagination');//加载ci pagination类

        $this->pagination->initialize($config);
        $menu = array('wechat','WechatList');
        $data = array('lists'=>$listpage,'pages' => $this->pagination->create_links(),'menu'=>$menu);

        $this->load->view('accountsAdmin/accoutsHad.html',$data);
    }




	//审核未通过
	function notAudited(){
		$config['per_page'] = 10;
        //获取页码
        $current_page=intval($this->uri->segment(3));//index.php 后数第4个/
        //配置
        $config['base_url'] = site_url('/Wechat/notAudited');
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
        
        $total = count($this->public_model->select_where($this->wechat,'status','2','createTime','desc'));
        $config['total_rows'] = $total;
    
        $this->load->library('pagination');//加载ci pagination类
        $listpage =  $this->public_model->select_where_page($this->wechat,'status','2','createTime','desc',$current_page,$config['per_page']);
		$this->pagination->initialize($config);
        $menu = array('wechat','notAudited');
        $data = array('lists'=>$listpage,'pages' => $this->pagination->create_links(),'menu'=>$menu);

        $this->load->view('accountsAdmin/failedVerify.html',$data);
	}
     function searchNotAudited(){
        $config['per_page'] = 10;
        //获取页码
        $current_page=intval($this->input->get("size"));//index.php 后数第4个/

        $sear = trim($this->input->get('sear'));
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

        if(!empty($time)){
            $t = $time . ' 00:00:00';
            $e = $endtime . ' 23:59:59';
        }else{
            $t = '';
            $e = '';
        }

        if(!empty($sear) && empty($t)){
            $query = $this->db->like('wxNumber',$sear,'both')->or_like('bizName',$sear,'both')->where('status','2')->order_by('createTime','desc')->get($this->wechat);
            $list = $query->result_array();
            $config['total_rows'] = count($list);
            $query1 = $this->db->like('wxNumber',$sear,'both')->or_like('bizName',$sear,'both')->where('status','2')->order_by('createTime','desc')->limit($config['per_page'],$current_page)->get($this->wechat);
            $listpage = $query1->result_array();

        }else if(empty($sear) && !empty($t)){
            $query = $this->db->where('createTime >=',$t)->where('createTime <=',$e)->where('status','2')->order_by('createTime','desc')->get($this->wechat);
            $list = $query->result_array();
            $config['total_rows'] = count($list);
            $query1 = $this->db->where('createTime >=',$t)->where('createTime <=',$e)->where('status','2')->order_by('createTime','desc')->limit($config['per_page'],$current_page)->get($this->wechat);
            $listpage = $query1->result_array();
        }else if(!empty($sear) && !empty($t)){
            $query = $this->db->like('wxNumber',$sear,'both')->or_like('bizName',$sear,'both')->where('createTime >=',$t)->where('createTime <=',$e)->where('status','2')->order_by('createTime','desc')->get($this->wechat);
            $list = $query->result_array();
            $config['total_rows'] = count($list);
            $query1 = $this->db->like('wxNumber',$sear,'both')->or_like('bizName',$sear,'both')->where('createTime >=',$t)->where('createTime <=',$e)->where('status','2')->order_by('createTime','desc')->limit($config['per_page'],$current_page)->get($this->wechat);
            $listpage = $query1->result_array();
        }else if(empty($sear) && empty($t)){
            $total = count($this->public_model->select_where($this->wechat,'status','2','createTime','desc'));
            $config['total_rows'] = $total;
            $listpage =  $this->public_model->select_where_page($this->wechat,'status','2','createTime','desc',$current_page,$config['per_page']);
        }

        $config['page_query_string'] = TRUE;//关键配置
        // $config['reuse_query_string'] = FALSE;
        $config['query_string_segment'] = 'size';
        $config['base_url'] = site_url('/Wechat/searchNotAudited?').'sear='.$sear.'&starttime='.$time.'&endtime='.$endtime;

        // //分页数据\
        $this->load->library('pagination');//加载ci pagination类

        $this->pagination->initialize($config);
        $menu = array('wechat','notAudited');
        $data = array('lists'=>$listpage,'pages' => $this->pagination->create_links(),'menu'=>$menu);

        $this->load->view('accountsAdmin/failedVerify.html',$data);
    }




	//删除公众号
	function delWechat(){

		if($_POST){
			$id = $this->input->post('id');
			$type = $this->input->post('type');
			if($type == '1'){
				$title = '提交待审核';
			}else if($type == '2'){
				$title = "修改待审核";
			}else if($type == '3'){
				$title = "审核通过的";
			}else if($type == '4'){
				$title = "审核未通过的";
			}

            // $wechat = $this->public_model->select_info($this->wechat,'id',$id);

            // $res = $this->public_model->select_where($this->news,'_biz',$wechat['_biz'],'updata_time','desc');

            //导出文件

			if($this->public_model->delete($this->wechat,'id',$id)){
                $this->public_model->delete($this->news,'_biz',$wechat['_biz']);
                $this->public_model->delete($this->spread,'bizId',$wechat['id']);
                $this->public_model->delete($this->activity,'bizId',$wechat['_biz']);
				$arr = array(
	                'log_url'=>$this->uri->uri_string(),
	                'user_id'=> $this->session->users['id'],
	                'username'=>$this->session->users['username'],
	                'log_ip'=>get_client_ip(),
	                'log_status'=>'1',
	                'log_message'=>"删除".$title."公众号成功,公众号站内id是".$id,
			    );
	            add_system_log($arr);
	            echo "1";

	            exit;
			}else{
				$arr = array(
	                'log_url'=>$this->uri->uri_string(),
	                'user_id'=> $this->session->users['id'],
	                'username'=>$this->session->users['username'],
	                'log_ip'=>get_client_ip(),
	                'log_status'=>'1',
	                'log_message'=>"删除".$title."公众号失败,公众号站内id是".$id,
			    );
	            add_system_log($arr);
	            echo "2";
	            exit;
			}		
		}else{
			echo "2";
		}
	}

    //删除公众号
    function delWechatCont(){
        $id = intval($this->uri->segment('3'));
        if($id == '0'){
            echo "<script>alert('非法访问！');window.location.href='".site_url('/Wechat/WechatList')."'</script>";exit;
        }else{
            $wechat = $this->public_model->select_info($this->wechat,'id',$id);

            $res = $this->public_model->select_where($this->news,'_biz',$wechat['_biz'],'update_time','desc');

            if(!empty($res)){
                    $this->load->library('excel');

                    $this->excel->setActiveSheetIndex(0);

                    $this->excel->getActiveSheet()->setTitle('ImportOrder');

                    $arr_title = array(
                        'A' => '自定义编号',
                        'B' => '微信名称',
                        'C' => '微信号',
                        'D' => '文章标题',
                        'E' => '站内链接',
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
                            $this->excel->getActiveSheet()->setCellValue('A' . $i,$i-1);  
                            $this->excel->getActiveSheet()->setCellValue('B' . $i, $wechat['bizName']);  
                            $this->excel->getActiveSheet()->setCellValue('C' . $i, $wechat['wxNumber']);  
                            $this->excel->getActiveSheet()->setCellValue('D' . $i, $booking['title']);  
                            $this->excel->getActiveSheet()->setCellValue('E' . $i, 'http://47.93.233.220:6789/index.php/content-'.$booking['id']);  

                            $i++;
                    }
                    $filename = $wechat['bizName'].'.xls'; //save our workbook as this file name

                   /// var_dump($filename);
                    if($this->public_model->delete($this->wechat,'id',$id)){
                        $this->public_model->delete($this->news,'_biz',$wechat['_biz']);
                        $this->public_model->delete($this->spread,'bizId',$wechat['id']);
                        $this->public_model->delete($this->activity,'bizId',$wechat['_biz']);
                        $arr = array(
                            'log_url'=>$this->uri->uri_string(),
                            'user_id'=> $this->session->users['id'],
                            'username'=>$this->session->users['username'],
                            'log_ip'=>get_client_ip(),
                            'log_status'=>'1',
                            'log_message'=>"删除".$wechat['bizName']."公众号成功,公众号站内id是".$id,
                        );
                        add_system_log($arr);
                        // echo "<script>alert('操作成功！');</script>";
                    }else{
                        $arr = array(
                            'log_url'=>$this->uri->uri_string(),
                            'user_id'=> $this->session->users['id'],
                            'username'=>$this->session->users['username'],
                            'log_ip'=>get_client_ip(),
                            'log_status'=>'1',
                            'log_message'=>"删除".$wechat['bizName']."公众号失败,公众号站内id是".$id,
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



	//删除认领待审核
	function delClaim(){
		if($_POST){
			$id = $this->input->post('id');
			if($this->public_model->delete($this->claim,'id',$id)){
				$arr = array(
	                'log_url'=>$this->uri->uri_string(),
	                'user_id'=> $this->session->users['id'],
	                'username'=>$this->session->users['username'],
	                'log_ip'=>get_client_ip(),
	                'log_status'=>'1',
	                'log_message'=>"删除认领公众号成功,公众号站内id是".$id,
			    );
	            add_system_log($arr);
	            echo "1";
	            exit;
			}else{
				$arr = array(
	                'log_url'=>$this->uri->uri_string(),
	                'user_id'=> $this->session->users['id'],
	                'username'=>$this->session->users['username'],
	                'log_ip'=>get_client_ip(),
	                'log_status'=>'1',
	                'log_message'=>"删除认领公众号失败,公众号站内id是".$id,
			    );
	            add_system_log($arr);
	            echo "2";
	            exit;
			}		
		}else{
			echo "2";
		}
	}

	//修改公众号
	function editWechat(){
		$id = intval($this->uri->segment(3));
		if($id == '0'){
			$this->load->view('404.html');

		}else{
			//获取公众号详情
			$data['wechat'] = $this->public_model->select_info($this->wechat,'id',$id);
			//获取公众号分类
			$data['cates'] = $this->public_model->select($this->cates,'');
            $data['menu'] = array('wechat','WechatList');
			$this->load->view('accountsAdmin/editAccountInfo.html',$data);
		}
	}
	//修改已审核
	function editWechatOperation(){
		if($_POST){
			$data = $this->input->post();
			if(!empty($_FILES['img1']['name'])){
                $config['upload_path']      = 'upload/wechat/';
                $config['allowed_types']    = 'gif|jpg|png|jpeg';
                $config['max_size']     = 5120;
                $config['file_name'] = date('y-m-d_His');
                $this->load->library('upload', $config);
                // 上传
                if(!$this->upload->do_upload('img1')) {
                    echo "<script>alert('头像上传失败！');history.back(-1);</script>";exit;
                }else{
                    $data['headerPic'] = 'upload/wechat/'.$this->upload->data('file_name');
                }
            }
            //二维码
            if(!empty($_FILES['img2']['name'])){
                $config['upload_path']      = 'upload/code/';
                $config['allowed_types']    = 'gif|jpg|png|jpeg';
                $config['max_size']     = 5120;
                $config['file_name'] = date('y-m-d_His');
                $this->load->library('upload', $config);
                // 上传
                if(!$this->upload->do_upload('img2')) {
                    echo "<script>alert('二维码上传失败！');history.back(-1);</script>";exit;
                }else{
                    $data['qrCode'] = 'upload/code/'.$this->upload->data('file_name');
                }
            }

            
            //
            if($this->public_model->updata($this->wechat,'id',$data['id'],$data)){
        		$arr = array(
		                'log_url'=>$this->uri->uri_string(),
		                'user_id'=> $this->session->users['id'],
		                'username'=>$this->session->users['username'],
		                'log_ip'=>get_client_ip(),
		                'log_status'=>'1',
		                'log_message'=>"修改已审核公众号信息成功,公众号站内id是".$data['id'],
		        );
                add_system_log($arr);
                echo "<script>alert('操作成功！');window.location.href='".site_url('/Wechat/WechatList')."'</script>";exit;
					
            }else{
            	$arr = array(
		                'log_url'=>$this->uri->uri_string(),
		                'user_id'=> $this->session->users['id'],
		                'username'=>$this->session->users['username'],
		                'log_ip'=>get_client_ip(),
		                'log_status'=>'0',
		                'log_message'=>"修改已审核公众号信息失败,公众号站内id是".$data['id'],
		        );
                add_system_log($arr);
                echo "<script>alert('操作失败！');history.back(-1);</script>";exit;			
            }
		}else{
			$this->load->view('404.html');
		}
	}


	//文章管理
	function articleList(){


		$config['per_page'] = 10;
        //获取页码
        $current_page=intval($this->uri->segment(3));//index.php 后数第4个/
        //配置
        $config['base_url'] = site_url('/Wechat/articleList');
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
        $total = $this->public_model->retArticeleList();
        $config['total_rows'] = $total;
    
        $this->load->library('pagination');//加载ci pagination类
        $listpage =  $this->public_model->retArticeleList_page($current_page,$config['per_page']);
		$this->pagination->initialize($config);
        $menu = array('wechat',"articleList");
        $data = array('lists'=>$listpage,'pages' => $this->pagination->create_links(),'menu'=>$menu);

        $this->load->view('accountsAdmin/accoutsArticle.html',$data);
	}

    //删除文章
    function delArticle(){
        $id = intval($this->uri->segment('3'));
        if($id == '0'){
            echo "<script>alert('非法访问！');window.location.href='".site_url('/Wechat/articleList')."'</script>";exit;
        }else{
            //
            $cont = $this->public_model->select_where($this->news,'id',$id,'','');



            if(!empty($cont)){
                    $this->load->library('excel');

                    $this->excel->setActiveSheetIndex(0);

                    $this->excel->getActiveSheet()->setTitle('ImportOrder');

                    $arr_title = array(
                        'A' => '站内ID',
                        'B' => '文章标题',
                        'C' => '站内链接',
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
                    foreach ($cont as $booking) {
                            $this->excel->getActiveSheet()->setCellValue('A' . $i, $booking['id']);  
                            $this->excel->getActiveSheet()->setCellValue('B' . $i, $booking['title']);  
                            $this->excel->getActiveSheet()->setCellValue('C' . $i, 'http://47.93.233.220:6789/index.php/content-'.$booking['id']);  

                            $i++;
                    }
                    $filename = $cont[0]['title'].'.xls'; //save our workbook as this file name

                   /// var_dump($filename);
                    if($this->public_model->delete($this->news,'id',$id)){
                        $arr = array(
                            'log_url'=>$this->uri->uri_string(),
                            'user_id'=> $this->session->users['id'],
                            'username'=>$this->session->users['username'],
                            'log_ip'=>get_client_ip(),
                            'log_status'=>'1',
                            'log_message'=>"删除文章成功,文章站内id是".$id,
                        );
                        add_system_log($arr);
                        // echo "<script>alert('操作成功！');</script>";
                    }else{
                        $arr = array(
                            'log_url'=>$this->uri->uri_string(),
                            'user_id'=> $this->session->users['id'],
                            'username'=>$this->session->users['username'],
                            'log_ip'=>get_client_ip(),
                            'log_status'=>'1',
                            'log_message'=>"删除文章失败,文章站内id是".$id,
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


	//文章编辑
	function editArticle(){
		if($_POST){
			$data = $this->input->post();

            $cont =$this->public_model->select_info($this->news,'id',$data['id']);
            $content = $data['content'];
            unset($data['content']);
			if($this->public_model->updata($this->news,'id',$data['id'],$data)){
                file_put_contents($cont['newLink'],$content);
                // exit;
				$arr = array(
		                'log_url'=>$this->uri->uri_string(),
		                'user_id'=> $this->session->users['id'],
		                'username'=>$this->session->users['username'],
		                'log_ip'=>get_client_ip(),
		                'log_status'=>'1',
		                'log_message'=>"修改文章成功,文章站内id是".$data['id'],
		        );
                add_system_log($arr);
                echo "<script>alert('操作成功！');window.location.href='".site_url('/Wechat/articleList')."'</script>";exit;	
			}else{
				$arr = array(
		                'log_url'=>$this->uri->uri_string(),
		                'user_id'=> $this->session->users['id'],
		                'username'=>$this->session->users['username'],
		                'log_ip'=>get_client_ip(),
		                'log_status'=>'0',
		                'log_message'=>"修改文章失败,文章站内id是".$data['id'],
		        );
                add_system_log($arr);
                echo "<script>alert('操作成功！');window.location.href='".site_url('/Wechat/editArticle／'.$data['id'])."'</script>";exit;
			}
		}else{
			$id = intval($this->uri->segment('3'));
			if($id == '0'){
				$this->load->view('404.html');
			}else{

				//获取文章详情
				$data['info'] = $this->public_model->select_info($this->news,'id',$id);
                $data['menu'] = array('wechat',"articleList");

				$this->load->view('accountsAdmin/articleEdit.html',$data);
			}
		}
	}

    //文章搜索
    function searchArticle(){
        $config['per_page'] = 10;
        //获取页码
        $current_page=intval($this->input->get("size"));//index.php 后数第4个/

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
        $config['first_link']= '首页';

        $config['next_link']= '下一页';

        $config['prev_link']= '上一页';

        $config['last_link']= '末页';


        if(strpos($sear,'index.php/content-') !== false){
            //获取ID
            $id = substr(strrchr($sear,'-'),'1');
            $list =$this->public_model->select_where($this->news,'id',$id,'','');

            $config['total_rows'] = count($list);
            $listpage = $this->public_model->select_where_page($this->news,'id',$id,'','',$current_page,$config['per_page']);
        
        }else{
            $list = $this->public_model->select_like($this->news,'title','id',$sear);
       
            $config['total_rows'] = count($list);
            $listpage = $this->public_model->select_like_page($this->news,'title','id',$sear,$current_page,$config['per_page']);

        }

        $config['page_query_string'] = TRUE;//关键配置
        // $config['reuse_query_string'] = FALSE;
        $config['query_string_segment'] = 'size';
        $config['base_url'] = site_url('/Wechat/searchArticle?').'sear='.$sear;

        // //分页数据
       
        
        $this->load->library('pagination');//加载ci pagination类

        $this->pagination->initialize($config);

        // var_dump($data);
  
        $menu = array('wechat',"articleList");


        $data = array('lists'=>$listpage,'pages' => $this->pagination->create_links(),'menu'=>$menu);
            //获取我的公众号

        $this->load->view('accountsAdmin/accoutsArticle.html',$data);
    }



	//上传文件
	function uploadImg(){
		$error = '0';
		if(!empty($_FILES['img']['name'])){
            $config['upload_path']      = 'upload/news/';
            $config['allowed_types']    = 'gif|jpg|png|jpeg';
            $config['max_size']     = 5120;
            $config['file_name'] = date('y-m-d_His');
            $this->load->library('upload', $config);
            // 上传
            if(!$this->upload->do_upload('img')) {
            	$error = "1";
            }else{
                $data[] = base_url().'upload/news/'.$this->upload->data('file_name');
            }
        }
        $arr = array('errno'=>$error,'data'=>$data);
        echo json_encode($arr);
	}

    //分类管理
    function cates(){
        
        $config['per_page'] = 10;
        //获取页码
        $current_page=intval($this->uri->segment(3));//index.php 后数第4个/
        //配置
        $config['base_url'] = site_url('/Wechat/cates');
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
        $total = $this->public_model->select_where($this->cates,'status','1','recommendSort','asc');
        $config['total_rows'] = count($total);
    
        $this->load->library('pagination');//加载ci pagination类
        $listpage =  $this->public_model->select_where_page($this->cates,'status','1','recommendSort','asc',$current_page,$config['per_page']);
        $this->pagination->initialize($config);
        $menu = array('wechat',"cates");
        $data = array('lists'=>$listpage,'pages' => $this->pagination->create_links(),'menu'=>$menu);


        // $data['cates'] = $this->public_model->select($this->cates,'recommendSort','asc');
       // $data['menu'] = array('wechat',"cates");

        $this->load->view('accountsAdmin/category.html',$data);
    }

    //新增分类
    function addcates(){
        if($_POST){
            $data = $this->input->post();
            if($this->public_model->insert($this->cates,$data)){
                $arr = array(
                        'log_url'=>$this->uri->uri_string(),
                        'user_id'=> $this->session->users['id'],
                        'username'=>$this->session->users['username'],
                        'log_ip'=>get_client_ip(),
                        'log_status'=>'1',
                        'log_message'=>"新增分类成功,分类名称是：".$data['name'],
                );
                add_system_log($arr);
                echo "<script>alert('操作成功！');window.location.href='".site_url('/Wechat/cates')."'</script>";exit; 
            }else{
                $arr = array(
                        'log_url'=>$this->uri->uri_string(),
                        'user_id'=> $this->session->users['id'],
                        'username'=>$this->session->users['username'],
                        'log_ip'=>get_client_ip(),
                        'log_status'=>'0',
                        'log_message'=>"新增分类失败,分类名称是：".$data['name'],
                );
                add_system_log($arr);
                echo "<script>alert('操作失败！');window.location.href='".site_url('/Wechat/cates')."'</script>";exit; 
            }
        }else{
            $this->load->view('404.html');
        }
    }

    //编辑分类
    function editcates(){
        if($_POST){
            $data = $this->input->post();
             if($this->public_model->updata($this->cates,'id',$data['id'],$data)){
                $arr = array(
                        'log_url'=>$this->uri->uri_string(),
                        'user_id'=> $this->session->users['id'],
                        'username'=>$this->session->users['username'],
                        'log_ip'=>get_client_ip(),
                        'log_status'=>'1',
                        'log_message'=>"修改分类成功,分类名称是：".$data['name'],
                );
                add_system_log($arr);
                echo "<script>alert('操作成功！');window.location.href='".site_url('/Wechat/cates')."'</script>";exit; 
            }else{
                $arr = array(
                        'log_url'=>$this->uri->uri_string(),
                        'user_id'=> $this->session->users['id'],
                        'username'=>$this->session->users['username'],
                        'log_ip'=>get_client_ip(),
                        'log_status'=>'0',
                        'log_message'=>"修改分类失败,分类名称是：".$data['name'],
                );
                add_system_log($arr);
                echo "<script>alert('操作失败！');window.location.href='".site_url('/Wechat/cates')."'</script>";exit; 
            }

        }else{
            $this->load->view('404.html');
        }
    }

    //删除分类
    function delCates(){
         if($_POST){
            $data = $this->input->post();
             if($this->public_model->updata($this->cates,'id',$data['id'],$data)){
                $arr = array(
                        'log_url'=>$this->uri->uri_string(),
                        'user_id'=> $this->session->users['id'],
                        'username'=>$this->session->users['username'],
                        'log_ip'=>get_client_ip(),
                        'log_status'=>'1',
                        'log_message'=>"删除分类成功,分类id是：".$data['id'],
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
                        'log_message'=>"删除分类失败,分类id是：".$data['id'],
                );
                add_system_log($arr);
                echo "2";exit; 
            }

        }else{
            $this->load->view('404.html');
        }
    }


    //抓取微信文章
    function GrabWechatCont(){
        if($_POST){
            set_time_limit(0);
            $id = $this->input->post('_biz');
           
            //获取公众号下所有文章
            // $cont = $this->public_model->selectContNot($this->news,'_biz',$id);
            // if(!empty($cont)){
            //     echo "1";
            //     foreach ($cont as $k => $v) {
            $post_data = array(
                // 'id'=>$v['id'],
                '_biz'=>$id,
                // 'link'=>$v['link'],
                // 'cover'=>$v['cover'],
            );
            $post = curl_post(WECHATSERVICE, $post_data);  
                // }
                echo "1";
            // }else{
            //     echo "3";
            // }

        }else{
            echo "2";
        }
    }



}