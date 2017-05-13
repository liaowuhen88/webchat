<%@ page language="java" import="java.util.*,api.*" pageEncoding="UTF-8"  contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta charset="utf-8">
<meta name="apple-mobile-web-app-capable" content="yes" />

<title>登陆</title>
<meta content="{$head[keywords]}" name="keywords" />
<meta content="{$head[description]}" name="description" />
<base href="{SITE_URL}" />

<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

<link rel="stylesheet" href="http://w1.91phone.com.cn/statics/css/xlct/bass.css">
<link rel="stylesheet" href="http://w1.91phone.com.cn/statics/css/xlct/list.css">


</head>


<body>
<script type="text/javascript" src="script/jquery-1.7.2.min.js"></script>
<script type="text/javascript">

function Submit(){
	var username = $("#username").val();
	var password = $("#password").val();
	$.ajax({ 
        type: "post", 
         url: "LogInServlet",
         data:"username="+username+"&password="+password,
         dataType: "", 
         success: function (data) {
        	 if(data == "true"){
        		 location.href = "zhanghao.jsp";
        	 }else{
        		 alert("密码错误"); 
        	 }
        	 
         $("#list").append(data); }, 
         error: function (XMLHttpRequest, textStatus, errorThrown) { 
        // alert(errorThrown); 
            } 
           });
        }  

</script>


<div class="none"></div>

<!--  zhanghao  -->

<div class="shwo_main">
   
   <!--   登陆开始   -->
<form action="/LogInServlet" method ="post">
<div class="denglu">
  <ul>
      <li><div class="denglu_l">账号：</div><div class="denglu_r"><input type="text" aria-required="true" tabindex="1" size="18" value="" id="username" name="author"></div></li>
      
      <li><div class="denglu_l">密码：</div><div class="denglu_r"><input type="text" aria-required="true" tabindex="2" size="18" value="" id="password" name="email"></div></li>
  
  </ul>
</div>   
   <!--   登陆结束   -->
     <!--  登陆  -->
    
    <div class="denglu_b"> <a  href="javascript:void(0)"  onclick="Submit()">登陆</a></div>
    
      <!--  记住密码  -->
    <div class="denglu_c"><input name="" type="checkbox" value="" class="cheBor1" />记住密码</div>
   </form> 
</div>

<!--  list_box end  -->
<div class="bot_none"></div>

<div class="foot">
   <ul class="foot_ul">
       <li><img src="image/b1.png"><p>我要投资</li>
       <li><img src="image/b2.png"><p>我要借款</li>
       <li><img src="image/b3.png"><p>我的账号</li>
       <li><img src="image/b4.png"><p>交易记录</li>
       <li><img src="image/b5.png"><p>公告说明</li>
   
   </ul>


</div>




</body>
</html>