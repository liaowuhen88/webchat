<%@ page language="java" import="java.util.*,api.*,net.sf.json.*" pageEncoding="UTF-8"  contentType="text/html;charset=utf-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta charset="utf-8">
<meta name="apple-mobile-web-app-capable" content="yes" />

<title>提取现金</title>

<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

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
String content = ApiMethod.initnewcash(uid, oauth_token);
JSONObject  contentJson = JSONObject.fromObject(content);
Iterator<String> keys= contentJson.keys();
JSONObject object = null;
boolean flag = true;
while(keys.hasNext()){
	String key = keys.next();
	if("bankList".equals(key)){ 
		try{
			JSONArray array = contentJson.getJSONArray(key);
		    object = array.getJSONObject(0);
		    flag = false ; 
		}catch(Exception e){ 
			out.print(contentJson.get("resMsg"));  
			 return ;
		}
		
	}
}
if(flag){
	response.sendRedirect("zhanghao.jsp");
}

//String username = request.getParameter("username");
String username = (String)session.getAttribute("username");
String acc_total = request.getParameter("acc_total");
String acc_usemoney = request.getParameter("acc_usemoney");
String acc_nousemoney = request.getParameter("acc_nousemoney");

%>
<div class="none"></div>

<!--  zhanghao  -->

<div class="shwo_main">
   
   <!--   登陆开始   -->
<form action="ExtractCashServlet"  method ="post">

<div class="goumai">
  <ul>
      <li><div class="denglu_l">用户名：</div><div class="denglu_r" ><%=username %></div></li>
      
      <li><div class="denglu_l">账户总额：</div><div class="denglu_r"><%= acc_total%>元</div></li>
      
      <li><div class="denglu_l">可用余额：</div><div class="denglu_r"><%= acc_usemoney%>元</div></li>
      
      <li><div class="denglu_l">冻结总额：</div><div class="denglu_r"><%= acc_usemoney%>元</div></li>
     
      <li><div class="denglu_l">银行账号：</div><div class=""><input type="hidden"  tabindex="1" size="18"  value="<%=object.getString("bankaccount") %>" id="CarNum" name="CarNum"><%= object.get("bankname") %>(尾号<%= object.getString("bankaccount").substring(object.getString("bankaccount").length()-4, object.getString("bankaccount").length())%>)</div></li>
      
      <li><div class="denglu_l">支付密码：</div><div class=""><input type="password"  tabindex="2" size="18"  id="paypassword" name="paypassword"></div></li>
     
   
       <li><div class="denglu_l">提现金额：</div><div class="denglu_r"><input type="text"  tabindex="2" size="18" value="" id="money" name="money"></div></li>
 
  </ul>
</div>   
   <!--   登陆结束   -->
     <!--  登陆  -->
    <div class="extraCash_b"><input type="submit" value="提交" /></div>
   
      <!--  记住密码  -->
  </form>   
</div>

<div class="bot_none"></div>

</body>
</html>