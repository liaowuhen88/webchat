<%@ page language="java" import="java.util.*,api.*,net.sf.json.*" pageEncoding="UTF-8"  contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta charset="utf-8">
<meta name="apple-mobile-web-app-capable" content="yes" />

<title>账号</title>


<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

<%@ include file="css.html"%>
</head>
<body>

<div class="none"></div>

<!--  zhanghao  -->

<div class="shwo_main">
  <% 
  
  String oauth_token = (String)session.getAttribute("oauth_token");
  String uid = (String)session.getAttribute("user_id");
  String username = "";
  String result = "";
  String Intuser_group = "";
  String acc_total = "";
  String acc_usemoney = "";
  String acc_nousemoney = "";
  String acc_collection = "";
  String acc_newestcollectmoney="";
  String user_group = "";
  if("".equals(oauth_token) || "null".equals(oauth_token) || null == oauth_token){	
	  response.sendRedirect("dengluN.jsp");
	  return ;
  }
  
  JSONObject contentJson ;
  String content = ApiMethod.basicUser(oauth_token, uid);
  
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
			
		 System.out.println(content);
			   contentJson = JSONObject.fromObject(content);
			   username = contentJson.getString("username");
			   session.setAttribute("username", username);
			   Intuser_group = contentJson.getString("user_group");
			   acc_total = contentJson.getString("acc_total");
			   acc_usemoney = contentJson.getString("acc_usemoney");
			   acc_nousemoney = contentJson.getString("acc_nousemoney");
			   acc_newestcollectmoney = contentJson.getString("acc_newestcollectmoney");
			   acc_collection = contentJson.getString("acc_collection");
			   String calculus_total = contentJson.getString("calculus_total");
			   String calculus_use = contentJson.getString("calculus_use");
			    String calculus_used = contentJson.getString("calculus_used");   // 消费积分
               session.setAttribute("calculus_total", calculus_total);
               session.setAttribute("calculus_use", calculus_use);
               session.setAttribute("calculus_used", calculus_used);
			   if("1".equals(Intuser_group)){
			  	 user_group = "普通会员";
			   }else if("2".equals(Intuser_group)){
			  	 user_group = "vip会员";
			   }
		  }
	  }else if("".equals(content) && null == content && "null".equals(content)){
		  response.sendRedirect("dengluN.jsp?result="+result);
		return;
	  }else {
		  result = "exception";
		  response.sendRedirect("dengluN.jsp?result="+result);
	  }
 
// String acc_total = contentJson.getString("acc_total");
%>
   <!--   账号信息   -->
   <div class="zh_a">
       <div class="zh_a_top">
            <div class="zh_a_top_l"><img src="image/c1.png"></div>
            <div class="zh_a_top_r"><span class="zh_name"><%=username%></span><br>用户组：<%=user_group %></div>
       
       </div>
       
       <div class="zh_a_bot">
           <ul>
              
              <li>总额&nbsp;&nbsp;¥<%=acc_total %></li>
              <li>可用&nbsp;&nbsp;¥<%=acc_usemoney %></li>
              <li>冻结&nbsp;&nbsp;¥<%=acc_nousemoney %></li>
              <li>待收&nbsp;&nbsp;¥<%=acc_collection %></li>
           </ul>
       
       
       </div>
   
   
   </div>
    
    <!--  账号end  -->
     
    <div class="tixian"><a href="extractCash.jsp?acc_total=<%=acc_total %>&acc_usemoney=<%=acc_usemoney %>&acc_nousemoney=<%=acc_nousemoney %>" >提现</a></div>   
     <div class="tixian"><a href="chargeCash.jsp" >线上充值</a></div> 
       <div class="tixian"><a href="chargeCashdown.jsp" >线下充值</a></div> 
      <div class="tixian"><a href="resetpassword.jsp" >密码修改</a></div> 
    <!--  代收款  -->
    
    <div class="zh_c">
    <!--  <ul>
        <li><a href="mingxi.jsp?id=<%=uid%> "><img src="image/daishou.png"><span class="zh_c_nam">待收明细</span></a></li>
       
        
    </ul>   
    -->
    </div>   
     <!--  退出  -->
    
    <div class="tuichu"> <a href="list_pic.jsp?exsit=exsit" >退出</a></div>   
</div>

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