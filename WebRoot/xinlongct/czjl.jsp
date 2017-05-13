<%@ page language="java" import="java.util.*,api.*,net.sf.json.*" pageEncoding="UTF-8"  contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta charset="utf-8">
<meta name="apple-mobile-web-app-capable" content="yes" />

<title>充值记录</title>


<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<%@ include file="css.html"%>


</head>


<body>



<div class="none"></div>

<!--  投资内容  -->
<table border="0" width="100%" cellpadding="0" cellspacing="0">
  <tr>
      <td id="brt"  class="chongzhi_tit" width="25%" ><a href="http://liaowuhen.duapp.com/xinlongct/txjl.jsp">提现记录</a></td>
      <td id="brt"  class="chongzhi_tit" width="25%" ><a href="http://liaowuhen.duapp.com/xinlongct/dsmx.jsp">代收明细</a></td>
      <td id="brlt"  class="chongzhi_tit" width="25%"><a href="http://liaowuhen.duapp.com/xinlongct/zjjl.jsp">资金流水</a></td>
      <td id="brlt"  class="chongzhi_tit_r" width="25%"><a href="http://liaowuhen.duapp.com/xinlongct/czjl.jsp">充值记录</a></td>

  </tr>
</table>



<!--  1楼 投资  -->
   
<div class="box_xx">
   <div class="box_xx_tit_A"></div>

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
String content = ApiMethod.rechargelist(uid, oauth_token, "1");
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
		}else if("rechargeList".equals(key)){
			JSONArray collectionList = contentJson.getJSONArray(key);
			for(int i=0;i<collectionList.size();i++){
			
				JSONObject collection = collectionList.getJSONObject(i);
				String type = collection.getString("type");
				if("1".equals(type)){
					type = "网上充值";
				}else if("2".equals(type)){
					type = "线下充值";
				}
				//String account = collection.getString("account");
				//String credited = collection.getString("credited");
				//String total = collection.getString("total");
			    String money = collection.getString("money");
			    String status = collection.getString("status");
			    String remark = collection.getString("remark");
			   //http://liaowuhen.duapp.com/xinlongct/dengluN.jsp
			    // 1为成功，2失败，0为审核中,3用户取消
			    if("1".equals(status)){
			    	status = "成功";
			    }else if("2".equals(status)){
			    	status = "失败";
			    }else if("0".equals(status)){
			    	status = "审核中";
			    }
			    //String coll = collection.getString("collection");
			    String addtime = collection.getString("addtime");
			  
			  %>




<table border="0" width="100%" cellpadding="0" cellspacing="0">
  <tr class="daishou_title">
    <td id="br" width="25%" class="daishou_tit_td">充值类型</td>
    <td id="br" width="25%" class="daishou_tit_td"><%=type %></td>
    <td id="br" width="25%" class="daishou_tit_td">充值金额</td>   
    <td id="br" width="25%" class="daishou_tit_td"><%=money %></td>
    
  </tr>
  <tr>
    <td id="br">充值时间</td>
    <td id="br"><%=addtime %></td>
    <td id="br">状态</td>
    <td id="br"><%=status %></td>
    
  </tr>
</table>

<table border="0" width="100%" cellpadding="0" cellspacing="0">
  <tr class="daishou_title">
    <td id="br" width="25%" class="daishou_tit_td">备注</td>
    <td id="br" width="75%" class="daishou_tit_td"><%=remark %></td>
    
    
  </tr>
  
</table>

			  <% 
			  
			  
			} 
		}
	}
%>


</div>


<!--  list_box end  -->


<div class="bot_none"></div>

<div class="foot">
   <ul class="foot_ul">
       <li style=" width:25%;"><a href="http://liaowuhen.duapp.com/xinlongct/list_toubiao.jsp" data-ajax="false"><img src="http://xlct.vc400.cn/statics/css/xlct/image/geren_1.png"><p>充值提现</a></li>
       <li style=" width:25%;"><a href="http://liaowuhen.duapp.com/xinlongct/zjjl.jsp" data-ajax="false"><img src="http://xlct.vc400.cn/statics/css/xlct/image/geren_2.png"><p>资金记录</a></li>
       <li style=" width:25%;"><a href="http://liaowuhen.duapp.com/xinlongct/yhzh.jsp" data-ajax="false"><img src="http://xlct.vc400.cn/statics/css/xlct/image/geren_3.png"><p>银行账号</a></li>
       <li style=" width:25%;"><a href="http://liaowuhen.duapp.com/xinlongct/list_toubiao.jsp" data-ajax="false"><img src="http://xlct.vc400.cn/statics/css/xlct/image/geren_4.png"><p>用户积分</a></li>
 
    </ul>


</div>




</body>
</html>