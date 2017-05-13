<%@ page language="java" import="java.util.*,api.*,net.sf.json.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta charset="utf-8">
<meta name="apple-mobile-web-app-capable" content="yes" />

<title>投标</title>


<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<%@ include file="css.html"%>

</head>
<body>
<div class="none"></div>
<!--  list_box  -->
<div class="list_main">
    <ul> 
    
<% 
//{,"id":17338,
//"money":"1000.000000","tender_account":"1000.00",}
 String bid = request.getParameter("bid");  //tenderList
 ApiMethod  api = new ApiMethod();
 String content = api.tenderlist(bid);
 JSONObject contentJson = JSONObject.fromObject(content);
 String str = contentJson.getString("tenderList");
 // JSONArray tenderList = contentJson.getJSONArray("tenderList");
 JSONArray tenderList = JSONArray.fromObject(str);
 for(int i=0;i<tenderList.size();i++){
	 JSONObject tender = tenderList.getJSONObject(i);
	 String addtime = tender.getString("addtime");
	 String username = tender.getString("username");
	 String money = tender.getString("money");
	 String tender_account = tender.getString("tender_account");
%>
 
        <li>
         <div class="list_m_l"><div class="list_m_tit"><span class="red"><%=money %></span></div><div class="list_m_time">投标人：<%=username %></div></div>
         <div class="list_m_r"><div class="list_m_tit">有效：<span class="red"><%=tender_account %></span></div><div class="list_m_time"><%=addtime%></div></div>
         </li>   
         
 <%	 
     }
 %>
    </ul>

</div>



<!--  list_box end  -->















<div class="bot_none"></div>

<%@ include file="foot.html"%>


</body>
</html>