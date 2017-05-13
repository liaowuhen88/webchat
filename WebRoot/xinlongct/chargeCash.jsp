<%@ page language="java" import="java.util.*,api.*,net.sf.json.*" pageEncoding="UTF-8"  contentType="text/html;charset=utf-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta charset="utf-8">
<meta name="apple-mobile-web-app-capable" content="yes" />

<title>账号充值</title>
<%@ include file="css.html"%>

<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

</head>
  
<body>
<%
String oauth_token = (String)session.getAttribute("oauth_token");
String uid = (String)session.getAttribute("user_id");

if("".equals(oauth_token) || "null".equals(oauth_token) || null == oauth_token){	
	  response.sendRedirect("dengluN.jsp");
	  return ;
}
String charge = request.getParameter("charge");
//System.out.println("charge"+charge);
String resCode="";
String resMsg = "";
if("charge".equals(charge)){
	String money = request.getParameter("money");
	String bank_name = request.getParameter("bank_name");
	
	response.sendRedirect("http://www.xinlongct.com/openapi/user/torecharge.html?AppKey="+ApiMethod.appkey+"&oauth_token="+oauth_token+"&uid="+uid+"&money="+money+"&payment="+bank_name);
	   return ;
}
System.out.println(1);
String content = ApiMethod.recharge(uid, oauth_token);
System.out.println(2);
System.out.println(content+"******");

JSONObject  contentJson = JSONObject.fromObject(content);
Iterator<String> keys= contentJson.keys();
JSONArray array = null;
boolean flag = true;
while(keys.hasNext()){
	String key = keys.next();
	if("onlineBankList".equals(key)){
	  array = contentJson.getJSONArray(key);
	  flag = false ;
	}
}
if(flag){
	response.sendRedirect("zhanghao.jsp");
	return ;
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
<form action="chargeCash.jsp"  method ="post">
  <input type="hidden" name="charge" value="charge"/>
<div class="goumai">
     
     <ul>
      <%
        int br = 0;
       for(int i=0;i<array.size();i++){
    	   br++;
    	   JSONObject object = array.getJSONObject(i);
    	   String bank_name = object.getString("bank_name");
    	   String bank_value = object.getString("bank_value");
    	   %>  
    	  <li> <input type="radio" name="bank_name" value="<%=bank_value %>" />  <%=bank_name%> </li>

    	 <%
       }
    	 %> 
    	<li><div class="denglu_l">充值金额：</div><div class="denglu_r"><input type="text"  tabindex="2" size="18" value="" id="money" name="money"></div></li> 
  </ul>
</div>   
   <!--   登陆结束   -->
     <!--  登陆  -->
    <div class="charge_b"><input type="submit" value="提交" /></div>
   
      <!--  记住密码  -->

  </form>   
</div>

<div class="bot_none"></div>

</body>
</html>