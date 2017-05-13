<%@ page language="java" import="java.util.*,api.*" pageEncoding="UTF-8"  contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta charset="utf-8">
<meta name="apple-mobile-web-app-capable" content="yes" />

<title>处理结果</title>

<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

<%@ include file="css.html"%>

</head>


<body>
<%
   
  //mima
  String tmp = request.getParameter("name");
 String result = request.getParameter("result");
 String  resCode = (String)session.getAttribute("resCode");
 String  oauth_error_msg = (String)session.getAttribute("oauth_error_msg");
%>

<!--  zhanghao  -->

<div class="shwo_main">
   
   <!--   登陆开始   -->
   <%if("1".equals(resCode)){
	   %>
	    申请成功
	<%   
    } else if("0".equals(resCode)){
    	
   %>
	    申请失败
	<% 
    }
   %>
   <br>
 <%=oauth_error_msg %>
</div>

<%@ include file="foot.html"%>
</body>
</html>