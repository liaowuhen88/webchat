<%@ page language="java" import="java.util.*,api.*,net.sf.json.*,java.text.SimpleDateFormat" pageEncoding="UTF-8"%>
<%
String oauth_token = (String)session.getAttribute("oauth_token");
String uid = (String)session.getAttribute("user_id");

if("".equals(oauth_token) || "null".equals(oauth_token) || null == oauth_token){
	  response.sendRedirect("dengluN.jsp");
	  return ;
}

int pageCount = 1;
%> 

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta charset="utf-8">
<meta name="apple-mobile-web-app-capable" content="yes" />

<title>代收明细</title>


<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<script type="text/javascript" src="script/jquery-1.7.2.min.js"></script>
<link rel="stylesheet" href="http://xlct.vc400.cn/statics/css/xlct/bass.css">
<link rel="stylesheet" href="http://xlct.vc400.cn/statics/css/xlct/list.css">
<script type="text/javascript">


var pageCount = <%=pageCount%>;
var oauth_token = "<%=oauth_token%>";
var uid = "<%=uid%>";

$(function(){
	$(window).bind("scroll", function(){ 
		//当滚动条滚动时
		showload();
		}); 
		ajax(pageCount);
	}) ;
    
//获取数据

function showload(){ 
     var scrollTop = $(this).scrollTop();
     var scrollHeight = $(document).height();
     var windowHeight = $(this).height();
     if(scrollTop + windowHeight == scrollHeight){ 
	     ajax(pageCount);
       } 
     } 

function ajax(page){
	
	$.ajax({ 
        type: "post", 
         url: "CommonServlet",
         data:"method=collection&page="+pageCount+"&oauth_token="+oauth_token+"&uid="+uid,
         dataType: "", 
         success: function (data) {
         pageCount++;
         $("#collection").append(data); 
           }, 
         error: function (XMLHttpRequest, textStatus, errorThrown) { 
        // alert(errorThrown); 
            } 
           });

        }
//showload();
//绑定事件

</script>
</head>

<body>

<div class="none"></div>

<!--  投资内容  -->
<table border="0" width="100%" cellpadding="0" cellspacing="0">
  <tr>
     <td id="brt"  class="chongzhi_tit" width="25%" ><a href="http://liaowuhen.duapp.com/xinlongct/txjl.jsp">提现记录</a></td>
     <td id="brt"  class="chongzhi_tit_r" width="25%" ><a href="http://liaowuhen.duapp.com/xinlongct/dsmx.jsp">代收明细</a></td>
     <td id="brlt"  class="chongzhi_tit" width="25%"><a href="http://liaowuhen.duapp.com/xinlongct/zjjl.jsp">资金流水</a></td>
     <td id="brlt"  class="chongzhi_tit" width="25%"><a href="http://liaowuhen.duapp.com/xinlongct/hkjl.jsp">已还明细</a></td>
  </tr>
</table>

<!--  1楼 投资  -->
   
<div class="box_xx">
    <div class="box_xx_tit_A"></div>
    <div id = "collection">



</div>

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