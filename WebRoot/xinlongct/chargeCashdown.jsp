<%@ page language="java" import="java.util.*,api.*,net.sf.json.*" pageEncoding="UTF-8"  contentType="text/html;charset=utf-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta charset="utf-8">
<meta name="apple-mobile-web-app-capable" content="yes" />

<title>账号充值</title>
<%@ include file="css.html"%>

<style type="text/css">
.goumai{ width:99%; height:1500px; line-height:40px; border:1px solid #aaa;
    -moz-border-radius: 5px;      /* Gecko browsers */
    -webkit-border-radius: 5px;   /* Webkit browsers */
    border-radius:5px;            /* W3C syntax */}
	

</style>
<script type="text/javascript" src="script/jquery-1.7.2.min.js"></script>

<script type="text/javascript">

function checkedd(){
	var money = $("#money").val();
	var a = $.isNumeric(money);
	return a;
	var money = $("#money").val();
}



</script>
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
	String bank_names = request.getParameter("bank_name");
	//System.out.println(money);
	//System.out.println(bank_names);
	String str = ApiMethod.rechargedownSub(uid, oauth_token, money, bank_names);
	JSONObject  resu = JSONObject.fromObject(str);
	String resMsgs = resu.getString("resMsg");
	session.setAttribute("resMsgs", resMsgs);
	response.sendRedirect("chargeCashjieguo.jsp");
	System.out.println(str);
	//response.sendRedirect("http://www.xinlongct.com/openapi/user/torecharge.html?AppKey="+ApiMethod.appkey+"&oauth_token="+oauth_token+"&uid="+uid+"&money="+money+"&payment="+bank_names);
	   return ;
}

System.out.println(1);
String content = ApiMethod.rechargedown(uid, oauth_token);
System.out.println(2);
System.out.println(content+"******");

JSONObject  contentJson = JSONObject.fromObject(content);

Iterator<String> keys= contentJson.keys();
JSONArray array = null;
boolean flag = true;
while(keys.hasNext()){
	String key = keys.next();
	if("offbankList".equals(key)){
	  array = contentJson.getJSONArray(key);
	  flag = false ;
	}
}

String username = (String)session.getAttribute("username");
String acc_total = request.getParameter("acc_total");
String acc_usemoney = request.getParameter("acc_usemoney");
String acc_nousemoney = request.getParameter("acc_nousemoney");

%>
<div class="none"></div>

<!--  zhanghao  -->

<div class="shwo_main">
   
   <!--   登陆开始   -->
<form action="chargeCashdown.jsp"  method ="post"  onsubmit="return checkedd()">
  <input type="hidden" name="charge" value="charge"/>
  
  <table border="0" width="100%" cellpadding="0" cellspacing="0">
  
      <%
        int br = 0;
       for(int i=0;i<array.size();i++){
    	   br++;
    	   JSONObject object = array.getJSONObject(i);
    	   String bank_name = object.getString("bank_name");
    	   String bank_realname = object.getString("bank_realname");
    	   String payment = object.getString("payment");
    	   String branch = object.getString("branch");
    	   String account = object.getString("account");
    	   %>  	  
         <tr>
         <td id="t" width="10%"><input type="radio" name="bank_name" value="<%=payment %>" /></td>
         <td id="brt" width="90%"> <p><%=account %>
         <br>
               <%=branch %> &nbsp;&nbsp;&nbsp; </p>   法人账户:<%=bank_realname%></td>
    
         </tr>
    	 <%
       }
    	 %> 
    	 <tr>
     <td width="30%">充值金额</td>
     <td width="70%"><input type="text"  tabindex="2" size="18" value="" id="money" name="money"></td>
    
   </tr>
	</table>
  <div class="charge_b"><input type="submit" value="提交" /></div>
 
   <!--   登陆结束   -->
     <!--  登陆  -->
    
    
      <!--  记住密码  -->

  </form>   
</div>

<div class="bot_none"></div>

</body>
</html>