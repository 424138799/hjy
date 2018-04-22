<?php
//模拟post
function curl_post($url, $post){
    $options = array(
        CURLOPT_RETURNTRANSFER =>true,
        CURLOPT_HEADER =>false,
        CURLOPT_POST =>true,
        CURLOPT_POSTFIELDS => $post,
    );
    $ch = curl_init($url);
    curl_setopt_array($ch, $options);
    $result = curl_exec($ch);
    curl_close($ch);
    return $result;
}
//解析url
function convertUrlQuery($query)
{
  $queryParts = explode('&', $query);
  $params = array();
  foreach ($queryParts as $param) {
    $item = explode('=', $param);
    @$params[$item[0]] = $item[1];
  }
  return $params;
}

//分类
function subtree($arr,$a = '',$id=0,$lev=1) {
    $subs = array(); // 子孙数组
    foreach($arr as $k=>$v) {
        if(!empty($a)){
            if(deep_in_array($v['id'],$a)){
                 $v['true'] = '1';
            }else{
                $v['true'] = '0';
            }   
        }         
        if($v['pid'] == $id) {
            $v['lev'] = $lev;
            $subs[] = $v; // 举例说找到array('id'=>1,'name'=>'安徽','parent'=>0),
            $subs = array_merge($subs,subtree($arr,$a,$v['id'],$lev+1));
        }
    }
    return $subs;
} 
function deep_in_array($value, $array) {   
    foreach($array as $item) {   

        if(!is_array($item)) {   
            if ($item == $value) {  
                return true;  
            } else {  
                continue;   
            }  
        }   
            
        if(in_array($value, $item)) {  
            return true;      
        } else if(deep_in_array($value, $item)) {  
            return true;      
        }  
    }   
    return false;   
}
//二维数组 去重
function second_array_unique_bykey($arr, $key){  
    $tmp_arr = array();  
    foreach($arr as $k => $v)  
    {  
        if(in_array($v[$key], $tmp_arr))   //搜索$v[$key]是否在$tmp_arr数组中存在，若存在返回true  
        {  
            unset($arr[$k]); //销毁一个变量  如果$tmp_arr中已存在相同的值就删除该值  
        }  
        else {  
            $tmp_arr[$k] = $v[$key];  //将不同的值放在该数组中保存  
        }  
   }  
   //ksort($arr); //ksort函数对数组进行排序(保留原键值key)  sort为不保留key值  
    return $arr;  
   }  


//新增系统日志
function add_system_log($data){
    $CI = &get_instance();
    $CI->db->insert('hj_system_log',$data);
    return true;
}
//返回ip
function get_client_ip() {
    $ip = $_SERVER['REMOTE_ADDR'];
    if (isset($_SERVER['HTTP_CLIENT_IP']) && preg_match('/^([0-9]{1,3}\.){3}[0-9]{1,3}$/', $_SERVER['HTTP_CLIENT_IP'])) {
        $ip = $_SERVER['HTTP_CLIENT_IP'];
    } elseif(isset($_SERVER['HTTP_X_FORWARDED_FOR']) AND preg_match_all('#\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}#s', $_SERVER['HTTP_X_FORWARDED_FOR'], $matches)) {
        foreach ($matches[0] AS $xip) {
            if (!preg_match('#^(10|172\.16|192\.168)\.#', $xip)) {
                $ip = $xip;
                break;
            }
        }
    }
    return $ip;
}
//获取银行名称
function getBankName($id){
    $CI = &get_instance();
    $query = $CI->db->where('id', $id)->get('hj_bank');
    $res = $query->row_array();
    return $res['bankName'];
}
//审核人员minc
function getBankUserName($id)
{
    $CI = &get_instance();
    $query = $CI->db->where('uId', $id)->get('hj_bank_user');
    $res = $query->row_array();
    return $res['userName'];
}

//返回用户信息
function retUsername($id){
    $CI = &get_instance();
    $query = $CI->db->where('userId',$id)->get('admin_user');
    $res = $query->row_array();
    return $res;
}
//返回公司名称
function retCompanyName($id)
{
    $CI = &get_instance();
    $query = $CI->db->where('id', $id)->get('admin_company');
    $res = $query->row_array();
    return $res;
}


//获取配置
function get_option($name = '') {
    $CI = &get_instance();
    $sql = "select value from wxCatchv1_system_configure where name='$name'";
    $query = $CI->db->query($sql);
    $value = $query->row_array();

    if ($value) {
        return $value['value'];
    }
    return NULL;
}

function mkdirs($dir, $mode = 0777)
{
    if (is_dir($dir) || @mkdir($dir, $mode)) return TRUE;
    if (!mkdirs(dirname($dir), $mode)) return FALSE;
 
    return @mkdir($dir, $mode);
}

function object_to_array($obj)
{
     $obj = (array)$obj;
     foreach ($obj as $k => $v)
     {
      if (gettype($v) == 'resource')
      {
       return;
      }
      if (gettype($v) == 'object' || gettype($v) == 'array')
      {
       $obj[$k] = (array)object_to_array($v);
      }
     }
     return $obj;
}
//七牛上传
function qiniu($path,$data)
{
    $CI = &get_instance();
    $CI->load->library('Qiniu');
    $accessKey = "qjWkScOlHQsxnSMyAYScOwCBgWljlwaOuqMmXAg2";
    $secretKey = "hj-sLlpzxyKIbGd4T97iXQscj9UG2-Yx2siA0kXg";
    $bucket = "hengjiyuan";

    $auth = new Qiniu\Auth($accessKey, $secretKey);

    $token = $auth->uploadToken($bucket);
    $type = substr($path, strrpos($path, '.') + 1); 
		//上传文件的本地路径
    $key = $data.time().'.'.$type;
    $uploadMgr = new Qiniu\Storage\UploadManager();

    list($ret, $err) = $uploadMgr->putFile($token, $key, $path);
    if ($err !== null) {
        echo "2";
    } else {
        return 'https://img.hengjiyuankeji.com/'.$ret['key'];
    }
}









 ?>