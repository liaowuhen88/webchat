<%@ page language="java" import="java.util.*,api.*,net.sf.json.*" pageEncoding="UTF-8"  contentType="text/html;charset=utf-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta charset="utf-8">
<meta name="apple-mobile-web-app-capable" content="yes" />

<title>购买</title>
<meta content="{$head[keywords]}" name="keywords" />
<meta content="{$head[description]}" name="description" />
<base href="{SITE_URL}" />

<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<style type="text/css">
.goumai{ width:99%; height:220px; line-height:40px; border:1px solid #aaa;
    -moz-border-radius: 5px;      /* Gecko browsers */
    -webkit-border-radius: 5px;   /* Webkit browsers */
    border-radius:5px;            /* W3C syntax */}
	
	.goumai ul{ margin:0px; padding:0px;}
   .goumai li{ display:block; float:left; width:99%; margin-left:0.5%; border-bottom:1px solid #aaa; }
   .goumai_l{ width:auto; float:left; padding-left:2%;}
     .goumai_r{ width:auto; float:left;}


.goumai_b{ width:99%; height:40px; margin:10px auto; line-height:40px; font-size:24px; text-align:center; background: #930;
    -moz-border-radius: 5px;      /* Gecko browsers */
    -webkit-border-radius: 5px;   /* Webkit browsers */
    border-radius:5px;            /* W3C syntax */}
  .goumai_b a{ text-decoration:none; color: #fff;}
  
  
   .goumai_c{ width:99%; height:20px; margin:10px auto;}
  .cheBor{ float:left; margin:0 5px; border: #FF0000 1px solid; width:15px; height:15px; overflow:hidden; background:#FFF;}
  .cheBor1{margin:-1px;*margin:0px}
  
 </style>


<%@ include file="css.html"%>
</head>

<body>
<%
String oauth_token = (String)session.getAttribute("oauth_token");
String uid = (String)session.getAttribute("user_id");
if("".equals(oauth_token) || "null".equals(oauth_token) || null == oauth_token){	
	  response.sendRedirect("dengluN.jsp");
	  return ;
}
String result = "";
String id = request.getParameter("id");
System.out.println("*****"+id);
String minFlowMoney = request.getParameter("minFlowMoney");
String islib = request.getParameter("islib");
String biaoType = request.getParameter("biaoType");
String acc_usemoney = "0";
String message = "";

JSONObject contentJson ;
ApiMethod  api = new ApiMethod();
String content = api.basicUser(oauth_token, uid);
System.out.println(content);
if(!"".equals(content)){
	  if(!content.contains("{")){
		  String[] list = content.split("&");
		  if("0".equals(uid)){
				 if(list.length == 2){
					result = "denglu"; 
				 }else {
					 result = "overdue";   //过期
					 session.invalidate();
					 response.sendRedirect("dengluN.jsp?result="+result);
					 return;
				 }
			 }else if ("12".equals(uid)){
				 result = "lock";
				 session.invalidate();
				 response.sendRedirect("dengluN.jsp?result="+result);
				 return;
			 }
		  }else if(content.contains("{")){
			   contentJson = JSONObject.fromObject(content);
			   acc_usemoney = contentJson.getString("acc_usemoney");
			   
			   message = request.getParameter("message");
		  }
	  }
%> 
<div class="none"></div>
 
<!--  zhanghao  -->

<div class="shwo_main">
<script type="text/javascript" src="script/jquery-1.7.2.min.js"></script>
<script type="text/javascript">

function buy(){
	var money = $("#money").val();
	if(null != money && "" != money){
		//alert(money);
		if(isNaN(money)){
			alert("投标金额,请输入大于100的整数");
			return ;
		}else { 
			var result = money - 100 ;
			 if( 0 > result){
				 alert("投标金额,请输入大于100的整数");
				 return ;
			 }
		}
	}
	  
	
	var count = $("#count").val();
	if(null != count && "" != count){
		if(isNaN(count)){
			alert("投标份数,请输入数字");
			return ;
		} 
	}
	 
	$("#mypost").submit();
	
}

</script>
 
   <!--   登陆开始   -->
<form action="ToubiaoBuyServlet"  method ="post" id="mypost">

<div class="goumai">
  <ul>
       <input type="hidden" name="id" value= "<%=id%>" />
       <input type="hidden" name="acc_usemoney" value=<%=acc_usemoney %>/>
      <li><div class="denglu_l">项目id：</div><div class="denglu_r" >#<%=id %></div></li>
      
      <li><div class="denglu_l">可用余额：</div><div class="denglu_r"><%= acc_usemoney%></div></li>
      <% if(biaoType.equals("4")){  
    	   %>
    	    <li><div class="denglu_l">投标份数：</div><div class="denglu_r"><input type="text"  tabindex="1" size="18"  id="count" name="count"></div></li>
       
      <%}else { 
    	   %>  
    	   <li><div class="denglu_l">投标金额：</div><div class="denglu_r"><input type="text"  tabindex="1" size="18"  id="money" name="money"></div></li>
      
      <%
      }
      %>
      
      <li><div class="denglu_l">支付密码：</div><div class="denglu_r"><input type="password"  tabindex="2" size="18"  id="paypassword" name="paypassword"></div></li>
    <% if("1".equals(islib)){
    	%>
      
       <li><div class="denglu_l">定向标密码：</div><div class="denglu_r"><input type="password"  tabindex="2" size="18" value="" id="emaill" name="pwd"></div></li>
     <%  
     }
     %>
    <% 
     if("error".equals(message)){
	 %>
	 <li><div class="denglu_l"></div><div class="denglu_r" ><lable class="id" ><%="提交错误" %></lable></div></li>
  <%  
     }
     %>
  </ul>
</div>   
   <!--   登陆结束   -->
     <!--  登陆  -->
    <div class="goumai_b"><input type="button" value="提交"  onclick="buy()"/></div>
 </form>    
      <!--  记住密码  
    <div class="goumai_c"><input name="" type="checkbox" value="" class="cheBor1" />记住密码</div>
    -->
</div>
<!--  list_box end  -->
<div class="bot_none"></div>




</body>
</html>