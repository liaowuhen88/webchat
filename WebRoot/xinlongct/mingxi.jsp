<%@ page language="java" import="java.util.*,api.*,net.sf.json.*,java.text.SimpleDateFormat" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta charset="utf-8">
<meta name="apple-mobile-web-app-capable" content="yes" />

<title>明细</title>


<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<%@ include file="css.html"%>

</head>

<body>

<div class="none"></div>

<!--  投资内容  -->

<!--  1楼 投资  -->


<table border="0" width="100%" cellpadding="0" cellspacing="0">
 <tr class="daishou_title">
    <td id="br" width="40%">标题</td>
    <td id="br" width="20%">应收时间</td>
    <td id="br" width="20%">总额</td>
    <td id="b" width="20%">状态</td>
  </tr>
<% 
 //  String id = request.getParameter("id");
String oauth_token = (String)session.getAttribute("oauth_token");
String uid = (String)session.getAttribute("user_id");
// System.out.println(oauth_token);
if("".equals(oauth_token) || "null".equals(oauth_token) || null == oauth_token){
	  System.out.println(1);
	  response.sendRedirect("dengluN.jsp");
	 // response.encodeRedirectURL("denglu.jsp");
}
 String result = "";    
 System.out.println(uid);
 ApiMethod api = new ApiMethod();
 String content = api.collectionlist(uid,oauth_token,"1");
 System.out.println(content);
 JSONObject contentJson = JSONObject.fromObject(content);
 Iterator<String> keys= contentJson.keys();
	while(keys.hasNext()){
		String key = keys.next();
		if("oauth_token".equals(key)){
			String oauth = contentJson.getString("oauth_token");
			if("0".equals(oauth)){
				//String oauth_error_msg = json.getString("oauth_error_msg");
				result = "mixi";
				response.sendRedirect("dengluN.jsp?result="+result);	
			}
		}else if("collectionList".equals(key)){
			JSONArray collectionList = contentJson.getJSONArray(key);
			for(int i=0;i<collectionList.size();i++){
				JSONObject collection = collectionList.getJSONObject(i);
				String borrow_name = collection.getString("borrow_name");
				String repay_time = collection.getString("repay_time");
				Date date = new Date(Long.valueOf(repay_time)*1000);
				SimpleDateFormat df2 = new SimpleDateFormat("yyyy-MM-dd");
				String time = df2.format(date);
			    String repay_account = collection.getString("repay_account");
			    String status = collection.getString("status");
			    String statues  = "";
			    if("0".equals(status)){
			    	statues = "等待还款";
			    }else if("".equals(status)){
			    	statues = "已还款";
			    }
		%>	    
<tr>
    <td id="br"><%=borrow_name %></td>
    <td id="br"><%=time %></td>
    <td id="br"><%=repay_account %></td>
    <td id="b"><%=statues %></td>
  </tr>			     	    
		 <%	    
			}
			
			
		}
	}
 

 
 //JSONObject conte = contentJson.getJSONObject("getContent");
// String contentVlue = conte.getString("content");
 //String title = conte.getString("title");
 //String addtime = conte.getString("addtime");

%>
   
 </table>

<!--  list_box end  -->

<div class="bot_none"></div>

<div class="foot">
   <ul class="foot_ul">
       <li style=" width:25%;"><a href=" http://liaowuhen.duapp.com/xinlongct/list_zhaobiao.jsp" data-ajax="false"><img src="http://xlct.vc400.cn/statics/css/xlct/image/mingxi_1.png"><p>招标中</a></li>
       <li style=" width:25%;"><a href="http://liaowuhen.duapp.com/xinlongct/list_huankuan.jsp" data-ajax="false"><img src="http://xlct.vc400.cn/statics/css/xlct/image/mingxi_2.png"><p>还款中</a></li>
       <li style=" width:25%;"><a href=" http://liaowuhen.duapp.com/xinlongct/list_huankuan_end.jsp" data-ajax="false"><img src="http://xlct.vc400.cn/statics/css/xlct/image/mingxi_3.png"><p>已还款</a></li>
       <li style=" width:25%;"><a href="http://xlct.vc400.cn/" data-ajax="false"><img src="http://xlct.vc400.cn/statics/css/xlct/image/mingxi_4.png"><p>首页</a></li>
 
    </ul>
</div>


</body>
</html>