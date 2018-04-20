<?php 
defined('BASEPATH') or exit('No direct script access allowed');
require_once(APPPATH . 'controllers/Default_Controller.php');

/**
 *    网站首页
 */
class Mortgage extends Default_Controller
{
    function __construct()
    {
        parent::__construct();
    }

    // 按揭申请
    function applyList(){
        $data['menu'] ='applyList';
        $this->load->view('mortgage/applyList.html',$data);
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