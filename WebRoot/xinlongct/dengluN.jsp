<%@ page language="java" import="java.util.*,api.*" pageEncoding="UTF-8"  contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta charset="utf-8">
<meta name="apple-mobile-web-app-capable" content="yes" />

<title>登陆</title>


<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<%@ include file="css.html"%>



</head>


<body>

<%  
String message = "";
  String result = request.getParameter("result");
 if(null == result || "null".equals(result)){
	 result = "";
 }
 if("denglu".equals(result)){
	 message = "用户名密码不正确";
 }else if("overdue".equals(result)){
	 message = "已过期";
 }else if("lock".equals(result)){
	 message = "账号被锁定";
 }else if ("exception".equals(result)){
	 message = "账号异常";
 } 
%>
<div class="none"></div>

<!--  zhanghao  -->

<div class="shwo_main">
     
   <!--   登陆开始   -->
<form action="LogInServlet" method ="post">
<!-- <input type="hidden" name="flag" value="lottery"/> 

 -->

 
  
<div class="denglu">
  <ul>
      <li><div class="denglu_l">账号：</div><div class="denglu_r"><input type="text"  tabindex="1" size="18" value=""  name="username"></div><%=message %></li>
      
      <li><div class="denglu_l">密码：</div><div class="denglu_r"><input type="password"  tabindex="2" size="18" value="" name="password"></div></li>
  </ul>
</div>   
   <!--   登陆结束   -->
     <!--  登陆  -->
    
    <div class="denglu_b"> <input type="submit" value="登陆" /></div>
    
      <!--  记住密码  -->
  
   </form> 
</div>

<!--  list_box end  -->
<div class="bot_none"></div>


</body>
</html>