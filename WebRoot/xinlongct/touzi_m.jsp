<%@ page language="java" import="java.util.*,api.*,net.sf.json.*,java.text.DecimalFormat" pageEncoding="UTF-8"  contentType="text/html;charset=utf-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta charset="utf-8">
<meta name="apple-mobile-web-app-capable" content="yes" />

<title>投资</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<style type="text/css">
.touzi_b{ width:99%; height:80px; margin:0px auto; margin-top:10px;}
    .touzi_b_l{ float:left; width:40%; height:40%; overflow:hidden;}
	.touzi_b_r{ float:right; width:35%;height:auto; overflow:hidden;}
 </style>
	 
<%@ include file="css.html"%>
</head>


<body>



<div class="none"></div>

<!--  投资内容  -->

<div class="shwo_main">
 
<!--  1楼 投资  -->
<%
DecimalFormat df = new DecimalFormat("#.0");
String id = request.getParameter("id");
String name = request.getParameter("name");
String awardHtml = request.getParameter("awardHtml")+"%";
String apr = request.getParameter("apr");
String time_limit = request.getParameter("time_limit");
String islib = request.getParameter("islib");
String biaoType = request.getParameter("biaoType");
if(Integer.valueOf(time_limit) > 18){
	time_limit += "天";
}else {
	time_limit += "月";
}
String scale = request.getParameter("scalee");
ApiMethod  api = new ApiMethod();
String content = api.investcontent(id);
JSONObject contentJson = JSONObject.fromObject(content);
JSONObject conte = contentJson.getJSONObject("getContent");
System.out.println(conte);
String account = conte.getString("account");
String contentC = conte.getString("content");

System.out.println(awardHtml);
String credit_pic = conte.getString("credit_pic");
String credit_jifen = conte.getString("credit_jifen");
String lavetime = conte.getString("lave_time");
String title = conte.getString("title");
String scales = conte.getString("scale")+"%";
String use = conte.getString("use");
String username = conte.getString("username");
String verify_time = conte.getString("verify_time");
String invest_type = conte.getString("invest_type");
String invest = "";
	 if(invest_type.equals("1")){
		 invest = "到期全额还款";
		 time_limit = conte.getString("time_limit_day")+"天";
	 }else if(invest_type.equals("2")){
		 invest = "系统自动还款";
		 time_limit = "系统自动还款";
	 }else if(invest_type.equals("3")){
		 invest = "按月分期还款";
		 time_limit = conte.getString("time_limit")+"月";
		 time_limit = "系统自动还款";
	 }else if(invest_type.equals("4")){
		 invest = "按月付息到期还本";
		 time_limit = conte.getString("time_limit")+"月";
	 }else if(invest_type.equals("5")){
		 invest = "一次性还款";
		 time_limit = conte.getString("time_limit")+"月";
	 }
	 
   
	 
 String lowest_account = conte.getString("lowest_account"); 	 
 String  minFlowMoney = conte.getString("minFlowMoney");
 String alreadyFlow = conte.getString("alreadyFlow");
 String laveFlow = conte.getString("laveFlow");
 String lavaMoney = Integer.valueOf(minFlowMoney)*Integer.valueOf(laveFlow)+"";


%>
   
<div class="touzi_a">
   <div class="touzi_a_l"><img src="image/pic.jpg"></div>


   <div class="touzi_a_r">
        <div class="touzi_a_r_a"><%=title %></div>
        <div class="touzi_a_r_b"></div> 
        <div class="touzi_a_r_c"><%=id%></div>
        <div class="touzi_a_r_c">发布日期：<%= verify_time %></div>
   </div>
   
</div>

<div class="line_tz"></div>
<!--  2楼 投资  -->

<div class="touzi_b">
      <div class="touzi_b_l">
           <ul>
               <li>借款金额：<span class="red">¥<%=account %></span></li>
               <li>流转周期：<span class="red"><%=time_limit%></span></li>
               <li>还款方式：<span class="red"><%= invest%></span></li>
           </ul> 
      </div>
      <div class="touzi_b_r">
           <ul>
               <li>年利率：<span class="red"><%=apr+"%"%></span></li>
               <li>奖励：<span class="red"><%= awardHtml%></span></li>
           </ul> 
      </div>
       <div class="list_box_r_bot">
            <div class="list_box_r_box_a">完成度</div>
            <div class="list_box_r_bor_b" >
            
            <span  class="bar_span"  style = "width:<%=name%>%; "> 
            </span>
            </div>
            <div class="list_box_r_box_a"><%=name %>%</div>
       
       </div>
       
</div>

<!--  2楼 end  -->
<div class="line_tz"></div>

<!--  3楼 投资  -->

<div class="touzi_c">
      <div class="touzi_c_l">
           <ul>
              <li>最小投标额：<span class="red"><%=lowest_account %></span></li>
              <li>投标金额：<span class="red"><%=df.format(Double.valueOf(account)*Double.valueOf(scales.substring(0,scales.length()-1))/100)%>元</span></li>
              
           </ul>       
      </div>
        
       <div class="touzi_c_r">
            <ul>
               <li>总共金额：<span class="red"><%=account %>元</span></li>
               <li>剩余金额：<span class="red"><%=df.format(Double.valueOf(account)*(1-(Double.valueOf(scales.substring(0,scales.length()-1)))/100)) %>元</span></li>
          
           </ul>
 
       </div>
       
       
       
       
</div>    
    
 <!-- 3楼 end  -->
<div class="line_tz"></div>   
    

    
 <!-- 4楼 stard  -->
<div class="touzi_d">
<%= contentC%>

</div>   

 
</div>
   <div class="tixian"> <a href="touzi_buy.jsp?id=<%=id%>&minFlowMoney=<%=minFlowMoney%>&biaoType=<%=biaoType%>&islib=<%=islib %>"  class="tixian"> 投标   </a></div>

<!--  list_box end  -->
<div class="bot_none"></div>
</body>
</html>