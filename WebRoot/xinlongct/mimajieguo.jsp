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
String  resCode = (String)session.getAttribute("resCode");
String  mima = (String)session.getAttribute("mima");
  //mima
  String tmp = request.getParameter("name");
  //tmp = new String(tmp.getBytes("ISO-8859-1"), "UTF-8");
  // 提取现金
 // String tixian = new String((request.getParameter("tixian").getBytes("ISO-8859-1")),"utf-8");
//String message = request.getParameter("message");
 //String resCode = request.getParameter("resCode");
// goumai 
 //String mima = new String((request.getParameter("mima").getBytes("ISO-8859-1")),"utf-8");
 String result = request.getParameter("result");

%>

<!--  zhanghao  -->

<div class="shwo_main">
   
   <!--   登陆开始   -->
   <%if("1".equals(resCode)){
	   %>
	    申请成功
	<%   
    } else {
    	
   %>
	    申请失败
  <% 
  }%>
   <br>
   <%=mima %>
</div>


<%@ include file="foot.html"%>
</body>
</html>