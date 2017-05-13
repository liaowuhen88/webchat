<%@ page language="java" import="java.util.*,api.*" pageEncoding="UTF-8"  contentType="text/html;charset=utf-8"%>

<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta charset="utf-8">
<meta name="apple-mobile-web-app-capable" content="yes" />

<title>注册</title>
<%@ include file="css.html"%>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">



</head>


<body>

<%
String username = "";
String mail = "";
String message = request.getParameter("message");
if(null ==  message || "null".equals(message)){
	message = "";
}else if(message.equals("sameUser") ){
	username = "用户名已存在";
}else if (message.equals("mailError")){
	mail = "邮箱格式错误";
}else if (message.equals("samemail")){
	mail = "邮箱已存在";
}else if (message.equals("error!")){
	
}

%>

<div class="none"></div>

<!--  zhanghao  -->

<div class="shwo_main">
   
   <!--   登陆开始   -->
<form action="RegisterServlet"  method = "post">
<div class="xgmm">
  <ul>
      <li><div class="denglu_l">用户名：</div><div class="denglu_r"><input type="text"   tabindex="1" size="18" value="" id="author" name="username"></div><%=username %></li>
      <li><div class="denglu_l">密&nbsp;&nbsp;&nbsp;&nbsp;码：</div><div class="denglu_r"><input type="password"   tabindex="2" size="18" value="" id="email" name="password"></div></li>
      <li><div class="denglu_l">邮&nbsp;&nbsp;&nbsp;&nbsp;箱：</div><div class="denglu_r"><input type="text"   tabindex="2" size="18" value="" id="email" name="email"></div><%=mail %></li>
        
      </ul>
       
</div>   

   <!--   登陆结束   -->
     <!--  登陆  -->
    <div class="denglu_b"> <input type="submit" value="注册" /></div>
    
    
  </form>  
</div>



<!--  list_box end  -->















<div class="bot_none"></div>

<div class="foot">
   <ul class="foot_ul">
       <li style=" width:25%;"><a href="http://xlct.vc400.cn/" data-ajax="false"><img src="http://xlct.vc400.cn/statics/css/xlct/image/zhuce_1.png"><p>网站首页</a></li>
       <li style=" width:25%;"><a href="http://liaowuhen.duapp.com/xinlongct/list_gonggao.jsp" data-ajax="false"><img src="http://xlct.vc400.cn/statics/css/xlct/image/zhuce_2.png"><p>网站公告</a></li>
       <li style=" width:25%;"><a href="http://xlct.vc400.cn/index.php?m=content&c=index&a=show&catid=10&id=3" data-ajax="false"><img src="http://xlct.vc400.cn/statics/css/xlct/image/zhuce_3.png"><p>网站资费</a></li>
       <li style=" width:25%;"><a href="http://xlct.vc400.cn/index.php?m=content&c=index&a=show&catid=10&id=7" data-ajax="false"><img src="http://xlct.vc400.cn/statics/css/xlct/image/zhuce_4.png"><p>新手上路</a></li>
 
    </ul>


</div>



</body>
</html>