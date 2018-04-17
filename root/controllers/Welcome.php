<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Welcome extends CI_Controller {

    function __construct()
    {
        parent::__construct();
        $this->load->helper('public_helper');
    }



    /**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */

	function index(){

        $this->load->view('welcome_message.html');
    }

    function uploadFile(){

    	if($_POST){
    		$biz = $_POST['biz'];
    		$contid = $_POST['id'];     
    		$filePath = "htmlFile/".$biz.'/'.$contid;
    		
    		if (!file_exists($filePath)){
	            mkdirs($filePath);
	        }

	        if(move_uploaded_file($_FILES["file"]["tmp_name"],$filePath.'/'. $_FILES["file"]["name"])){
	        // 	$arr = array('state'=>'200','data'=>'1');
	        	echo json_encode(["state"=>"200","data"=>"0"]);
	        }else{
	        // 	$arr = array('state'=>'0','data'=>'0');
	        	echo json_encode(["state"=>"0","data"=>"0"]);

	        }
	         // echo json_encode(["biz"=>$biz,"contid"=>$contid]);

    	}else{
    		echo json_encode(["state"=>"0","data"=>"0"]);

    	}
    }
    
  


}
