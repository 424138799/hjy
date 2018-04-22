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
        $this->db->select('a.loginNum,a.userName,a.password,a.userId,a.status,a.gId,b.perm,b.status as state');
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
    	$query = $this->db->where($where,$id)->where('userId !=',$id2)->get($table);
        return $query->row_array();
    }

    //银行人员id
    function retBankUserInfo($table, $where, $id, $id2)
    {
        $query = $this->db->where($where, $id)->where('uId !=', $id2)->get($table);
        return $query->row_array();
    }
    //销售
    function retSalesUserInfo($table, $where, $id, $id2)
    {
        $query = $this->db->where($where, $id)->where('id !=', $id2)->get($table);
        return $query->row_array();
    }
    //但字段模糊搜索
    function searchLike($table,$zi,$sear){
        $query = $this->db->like($zi,$sear,'both')->get($table);
        return $query->result_array();
    }
    function searchLikePage($table,$zi,$sear,$size,$page){
        $query = $this->db->like($zi,$sear,'both')->limit($size,$page)->get($table);
        return $query->result_array();
    }
    //
    function searchManyLike($table, $zi,$tow, $sear)
    {
        $query = $this->db->like($zi, $sear, 'both')->or_like($tow,$sear,'both')->get($table);
        return $query->result_array();
    }
    function searchManyLikePage($table, $zi,$tow, $sear, $size, $page)
    {
        $query = $this->db->like($zi, $sear, 'both')->or_like($tow, $sear, 'both')->limit($size, $page)->get($table);
        return $query->result_array();
    }



    //返回按揭申请
    function retSendApply(){
        $this->db->select('a.*,b.vId,b.carNum,c.villageTitle');
        $this->db->from('hj_send_apply as a', 'left');
        $this->db->join('hj_car_parking as b', 'a.carId = b.carId', 'inner');
        $this->db->join('hj_village as c', 'b.vId = c.id', 'inner');
        $query = $this->db->get();

        return $query->result_array();
    }
    function retSendApplyPage($size,$page)
    {
        $this->db->select('a.*,b.vId,b.carNum,c.villageTitle');
        $this->db->from('hj_send_apply as a', 'left');
        $this->db->join('hj_car_parking as b', 'a.carId = b.carId', 'inner');
        $this->db->join('hj_village as c', 'b.vId = c.id', 'inner');
        $query = $this->db->limit($page,$size)->get();

        return $query->result_array();
    }
      //返回按揭申请
    function searSendApply($state)
    {
        $this->db->select('a.*,b.vId,b.carNum,c.villageTitle');
        $this->db->from('hj_send_apply as a', 'left');
        $this->db->join('hj_car_parking as b', 'a.carId = b.carId', 'inner');
        $this->db->join('hj_village as c', 'b.vId = c.id', 'inner');
        $query = $this->db->where('a.examineState',$state)->get();

        return $query->result_array();
    }
    function searSendApplyPage($state,$size, $page)
    {
        $this->db->select('a.*,b.vId,b.carNum,c.villageTitle');
        $this->db->from('hj_send_apply as a', 'left');
        $this->db->join('hj_car_parking as b', 'a.carId = b.carId', 'inner');
        $this->db->join('hj_village as c', 'b.vId = c.id', 'inner');
        $query = $this->db->where('a.examineState', $state)->limit($page, $size)->get();

        return $query->result_array();
    }

    //跟据银行返回数据
    function retBankApply($id){
        $this->db->select('a.*,b.vId,b.carNum,c.villageTitle');
        $this->db->from('hj_send_apply as a', 'left');
        $this->db->join('hj_car_parking as b', 'a.carId = b.carId', 'inner');
        $this->db->join('hj_village as c', 'b.vId = c.id', 'inner');
        $query = $this->db->where('c.bankId',$id)->get();

        return $query->result_array();
    }
    function retBankApplyPage($id,$size, $page)
    {
        $this->db->select('a.*,b.vId,b.carNum,c.villageTitle');
        $this->db->from('hj_send_apply as a', 'left');
        $this->db->join('hj_car_parking as b', 'a.carId = b.carId', 'inner');
        $this->db->join('hj_village as c', 'b.vId = c.id', 'inner');
        $query = $this->db->where('c.bankId', $id)->limit($page,$size)->get();

        return $query->result_array();
    }

    //sear
    function searBankApply($id,$state)
    {
        $this->db->select('a.*,b.vId,b.carNum,c.villageTitle');
        $this->db->from('hj_send_apply as a', 'left');
        $this->db->join('hj_car_parking as b', 'a.carId = b.carId', 'inner');
        $this->db->join('hj_village as c', 'b.vId = c.id', 'inner');
        $query = $this->db->where('c.bankId', $id)->where('a.examineState',$state)->get();

        return $query->result_array();
    }
    function searBankApplyPage($id,$state, $size, $page)
    {
        $this->db->select('a.*,b.vId,b.carNum,c.villageTitle');
        $this->db->from('hj_send_apply as a', 'left');
        $this->db->join('hj_car_parking as b', 'a.carId = b.carId', 'inner');
        $this->db->join('hj_village as c', 'b.vId = c.id', 'inner');
        $query = $this->db->where('c.bankId', $id)->where('a.examineState', $state)->limit($page, $size)->get();

        return $query->result_array();
    }






}




 ?>