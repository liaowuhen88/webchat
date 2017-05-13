<%@ page language="java" import="java.util.*,api.*,net.sf.json.*,java.text.SimpleDateFormat" pageEncoding="UTF-8"  contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta charset="utf-8">
<meta name="apple-mobile-web-app-capable" content="yes" />

<title>已还记录</title>


<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

<link rel="stylesheet" href="http://xlct.vc400.cn/statics/css/xlct/bass.css">
<link rel="stylesheet" href="http://xlct.vc400.cn/statics/css/xlct/list.css">


</head>


<body>
<div class="none"></div>
<table border="0" width="100%" cellpadding="0" cellspacing="0">
  <tr>
    <td id="brt"  class="chongzhi_tit" width="25%" ><a href="http://liaowuhen.duapp.com/xinlongct/txjl.jsp">提现记录</a></td>
         <td id="brt"  class="chongzhi_tit" width="25%" ><a href="http://liaowuhen.duapp.com/xinlongct/dsmx.jsp">代收明细</a></td>
      <td id="brlt"  class="chongzhi_tit_r" width="25%"><a href="http://liaowuhen.duapp.com/xinlongct/zjjl.jsp">资金流水</a></td>
     <td id="brlt"  class="chongzhi_tit" width="25%"><a href="http://liaowuhen.duapp.com/xinlongct/czjl.jsp">充值记录</a></td>

  </tr>
</table>

<%
String oauth_token = (String)session.getAttribute("oauth_token");
String uid = (String)session.getAttribute("user_id");
// System.out.println(oauth_token);
if("".equals(oauth_token) || "null".equals(oauth_token) || null == oauth_token){
	  response.sendRedirect("dengluN.jsp");
	  return ;
	 // response.encodeRedirectURL("denglu.jsp");
}
String result = "";    
System.out.println(uid);  
String content = ApiMethod.collection(uid,oauth_token,"1");
System.out.println(content);
try{
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
		}else if("collectList".equals(key)){
			JSONArray collectionList = contentJson.getJSONArray(key);
			for(int i=0;i<collectionList.size();i++){
			
				JSONObject collection = collectionList.getJSONObject(i);
				String remark = collection.getString("remark");
				String type = collection.getString("type");
				String money = collection.getString("money");
				String total = collection.getString("total");
			    String use_money = collection.getString("use_money");
			    String no_use_money = collection.getString("no_use_money");
			    String coll = collection.getString("collection");
			    String addtime = collection.getString("addtime");
			    String statues  = "";
			    
			  %>
			  
			     
<div class="box_xx">
    <div class="box_xx_tit"><%=type %></div>





<table border="0" width="100%" cellpadding="0" cellspacing="0">
  <tr class="daishou_title">
    <td id="br" width="25%" class="daishou_tit_td">操作金额</td>
    <td id="br" width="25%" class="daishou_tit_td"><%=money %></td>
    <td id="br" width="25%" class="daishou_tit_td">总金额</td>   
    <td id="br" width="25%" class="daishou_tit_td"><%=total %></td>
    
  </tr>
  <tr>
    <td id="br">可用金额</td>
    <td id="br"><%=use_money %></td>
    <td id="br">冻结金额</td>
    <td id="br"><%=no_use_money %></td>
    
  </tr>
</table>

<table border="0" width="100%" cellpadding="0" cellspacing="0">
  <tr class="daishou_title">
    <td id="br" width="25%" class="daishou_tit_td">备注</td>
    <td id="br" width="75%" class="daishou_tit_td"><%=remark %></td>
  </tr>
  
</table>




</div>
			  
			  
			  
			  
			  
			  
			  
			  <% 
			  
			   
			} 
		}
   
	}
}catch(Exception e){
	
}
%>



<!--  投资内容  -->


<!--  1楼 投资  -->
  

<!--  list_box end  -->


<div class="bot_none"></div>

<div class="foot">
   <ul class="foot_ul">
       <li style=" width:25%;"><a href="http://liaowuhen.duapp.com/xinlongct/zhanghao.jsp" data-ajax="false"><img src="http://xlct.vc400.cn/statics/css/xlct/image/geren_1.png"><p>充值提现</a></li>
       <li style=" width:25%;"><a href="http://liaowuhen.duapp.com/xinlongct/txjl.jsp" data-ajax="false"><img src="http://xlct.vc400.cn/statics/css/xlct/image/geren_2.png"><p>交易记录</a></li>
       <li style=" width:25%;"><a href="http://liaowuhen.duapp.com/xinlongct/yhjf.jsp" data-ajax="false"><img src="http://xlct.vc400.cn/statics/css/xlct/image/geren_4.png"><p>用户积分</a></li>
       <li style=" width:25%;"><a href="http://xlct.vc400.cn/" data-ajax="false"><img src="http://xlct.vc400.cn/statics/css/xlct/image/geren_3.png"><p>首页</a></li>
  
    </ul>


</div>



</body>
</html>