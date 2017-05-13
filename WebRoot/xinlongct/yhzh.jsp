<%@ page language="java" import="java.util.*,api.*,net.sf.json.*" pageEncoding="UTF-8"  contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta charset="utf-8">
<meta name="apple-mobile-web-app-capable" content="yes" />

<title>银行账号</title>


<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

<link rel="stylesheet" href="http://xlct.vc400.cn/statics/css/xlct/bass.css">
<link rel="stylesheet" href="http://xlct.vc400.cn/statics/css/xlct/list.css">


<%

String oauth_token = (String)session.getAttribute("oauth_token");
String uid = (String)session.getAttribute("user_id");
String username = (String)session.getAttribute("username");

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
		JSONArray array = contentJson.getJSONArray(key);
	    object = array.getJSONObject(0);
	    flag = false ;
	}
}
if(flag){
	response.sendRedirect("zhanghao.jsp");
}
%>
</head>


<body>



<div class="none"></div>

<!--  投资内容  -->




<!--  1楼 投资  -->
   
<div class="yhzh">

<table border="0" width="100%" cellpadding="0" cellspacing="0">
  <tr class="yhzh_title">
    <td id="br" width="33%" class="daishou_tit_td">登陆用户名</td>
    <td id="br" width="33%" class="daishou_tit_td">开户银行</td>
    <td id="b" width="33%" class="daishou_tit_td">银行账号</td>
  </tr>
  <tr>
    <td id="br"><%= username %></td>
    <td id="br"><%= object.get("bankname") %></td>
    <td id="br"><%=object.getString("bankaccount") %></td>
  </tr>
</table>


</div>


<!--  list_box end  -->


<div class="bot_none"></div>


<div class="foot">
   <ul class="foot_ul">
       <li style=" width:25%;"><a href="http://liaowuhen.duapp.com/xinlongct/list_toubiao.jsp" data-ajax="false"><img src="http://xlct.vc400.cn/statics/css/xlct/image/geren_1.png"><p>充值提现</a></li>
       <li style=" width:25%;"><a href="http://liaowuhen.duapp.com/xinlongct/zjjl.jsp" data-ajax="false"><img src="http://xlct.vc400.cn/statics/css/xlct/image/geren_2.png"><p>资金记录</a></li>
       <li style=" width:25%;"><a href="http://liaowuhen.duapp.com/xinlongct/yhzh.jsp" data-ajax="false"><img src="http://xlct.vc400.cn/statics/css/xlct/image/geren_3.png"><p>银行账号</a></li> 
       <li style=" width:25%;"><a href="http://liaowuhen.duapp.com/xinlongct/zhanghao.jsp" data-ajax="false"><img src="http://xlct.vc400.cn/statics/css/xlct/image/geren_4.png"><p>用户积分</a></li>
    </ul>


</div>



</body>
</html>