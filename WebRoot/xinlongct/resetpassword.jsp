<%@ page language="java" import="java.util.*,api.*" pageEncoding="UTF-8"  contentType="text/html;charset=utf-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta charset="utf-8">
<meta name="apple-mobile-web-app-capable" content="yes" />

<title>密码修改</title>
<meta content="{$head[keywords]}" name="keywords" />
<meta content="{$head[description]}" name="description" />
<base href="{SITE_URL}" />

<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<%@ include file="css.html"%>

</head>


<body>

<%
String message = request.getParameter("message");
%>

<div class="none"></div>

<!--  zhanghao  -->

<div class="shwo_main">
   
   <!--   登陆开始   -->
   
<form action="ResetpasswordServlet"  method ="post">
<div class="xgmm">
  <ul>
      <li><div class="denglu_l">身份证号：</div><div class="denglu_r"><input type="text"  tabindex="1" size="18" value="" id="author" name="cardNo"></div></li>
      
      <li><div class="denglu_l">旧密码：</div><div class="denglu_r"><input type="text"  tabindex="2" size="18" value="" id="email" name="password"></div></li>
      <li><div class="denglu_l">新密码：</div><div class="denglu_r"><input type="text"  tabindex="2" size="18" value="" id="email" name="Npassword"></div></li>
      
      </ul>

</div>   
    
    

   <!--   登陆结束   -->
     <!--  登陆  -->
    <div class="denglu_b"><input type="submit" value="提交" /></div>
    
    
  </form>  
</div>


<!--  list_box end  -->

<div class="bot_none"></div>

<%@ include file="foot.html"%>


</body>
</html>