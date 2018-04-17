<?php 
/**
*    公用函数库
*/
class public_model extends CI_Model
{
	
	function __construct()
	{
		parent::__construct();
	}


   //新增数据
   function insert($table,$data){
        return $this->db->insert($table,$data);
   }
   //新增返回id
   function insert_id($table,$data){
        $this->db->insert($table,$data);
        return $this->db->insert_id();
    }
    //编辑操作
    function updata($table,$where,$id,$data){
        return $this->db->where($where,$id)->update($table,$data);
    }

    //删除操作
    function delete($table,$where,$id){
        return $this->db->where($where,$id)->delete($table);
    }

    //查询
    function select($table,$sort){
        $query = $this->db->order_by($sort,'asc')->get($table);
        return $query->result_array();
    }
    //分页
    function select_page($table,$sort,$size,$page){
    	$query = $this->db->order_by($sort,'desc')->limit($page,$size)->get($table);
        return $query->result_array();
    }

    //查询某一条数据
    function select_info($table,$where,$id){
        $query = $this->db->where($where,$id)->get($table);
        return $query->row_array();
    }
    //查询用户信息
    function select_admin_user($where){
        $this->db->select('a.loginNum,a.userName,a.password,a.userId,a.status,a.g_id,b.status as state');
        $this->db->from('hj_admin_user as a','left');
        $this->db->from('hj_admin_user_group as b','inntr');
        $query = $this->db->where('a.loginNum',$where)->get();
        return $query->row_array();
    }


    //多条件查询一条数据
    function select_where_info($table,$where,$id,$where1,$id1){
        $query = $this->db->where($where,$id)->where($where1,$id1)->get($table);
        return $query->row_array();
    }
    
    //查询limit
    function select_where_limit($table,$where,$id,$sort,$limit){
        $query = $this->db->where($where,$id)->order_by($sort,'desc')->limit($limit)->get($table);
        return $query->result_array();
    }

    //条件查询
    function select_where($table,$where,$id,$sort,$desc){
        $query = $this->db->where($where,$id)->order_by($sort,$desc)->get($table);
        return $query->result_array();
    }

    //条件分页查询
    function select_where_page($table,$where,$id,$sort,$desc,$size,$page){
        $query = $this->db->where($where,$id)->order_by($sort,$desc)->limit($page,$size)->get($table);
        return $query->result_array();
    }


    //多条件查询
    function select_where_many($table,$where,$id,$where2,$id2,$sort,$desc){
        $query = $this->db->where($where,$id)->where($where2,$id2)->order_by($sort,$desc)->get($table);
        return $query->result_array();
    }

    //返回数据到用户
    function ret_userInfo($table,$where,$id,$id2){
    	$query = $this->db->where($where,$id)->where('user_id !=',$id2)->get($table);
        return $query->row_array();
    }

    //返回文章数据
    function retArticeleList_page($size,$page){
        $sql = "select id,title from wxCatchv1_biz_news where status ='1' and isCollected='1' order by id desc limit $size,$page";
        $query = $this->db->query($sql);
        return $query->result_array();
    }
    function retArticeleList(){
        $sql = "select id,title from wxCatchv1_biz_news where status ='1' and isCollected='1'";
        $query = $this->db->query($sql);
        $res= $query->result_array();
        return count($res);
    }


	//分页多条件查询
    function select_where_many_page($table,$where,$id,$where2,$id2,$sort,$desc,$size,$page){
        $query = $this->db->where($where,$id)->where($where2,$id2)->order_by($sort,$desc)->limit($page,$size)->get($table);
        return $query->result_array();
    }
    //functii
    function select_like($table,$title,$id,$sear){
        $query = $this->db->like($title,$sear,'both')->or_like($id,$sear,'both')->get($table);
        return $query->result_array();
    }
    function select_like_page($table,$title,$id,$sear,$size,$page){
        $query = $this->db->like($title,$sear,'both')->or_like($id,$sear,'both')->limit($page,$size)->get($table);
        return $query->result_array();
    }
    //wehrelike
    function select_wherelike($table,$title,$id,$sear,$status){
        $query = $this->db->where('status',$status)->like($title,$sear,'both')->or_like($id,$sear,'both')->get($table);
        return $query->result_array();
    }
    function select_wherelike_page($table,$title,$id,$sear,$status,$size,$page){
        $query = $this->db->where('status',$status)->like($title,$sear,'both')->or_like($id,$sear,'both')->limit($page,$size)->get($table);
        return $query->result_array();
    }

    //返回未爬的文章信息
    function selectContNot($table,$where,$id){
        $query = $this->db->where($where,$id)->where('isCollected','0')->get($table);
        return $query->result_array();
    }
     
    //返回文章条数
    function retContentNum($table){
        $sql = "SELECT count(*) FROM $table";
        $query = $this->db->query($sql);
        return $query->row_array();
    }
    //查询推荐位
    function recommendWechat($type,$bizid,$time){
        $query = $this->db->where('type',$type)->where('bizId',$bizid)->where('endTime >=',$time)->get('wxCatchv1_biz_spread');
        return $query->row_array();
    }
    //编辑推荐
    function editrecommendWechat($id,$type,$bizid,$time){
        $query = $this->db->where('id !=',$id)->where('type',$type)->where('bizId',$bizid)->where('endTime >=',$time)->get('wxCatchv1_biz_spread');
        return $query->row_array();
    }
}




 ?>