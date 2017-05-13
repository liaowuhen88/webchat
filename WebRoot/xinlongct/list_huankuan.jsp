<%@ page language="java" import="java.util.*,api.*,net.sf.json.*" pageEncoding="UTF-8"  contentType="text/html;charset=utf-8"%>
<%
String exsit = request.getParameter("exsit");
System.out.println("*********"+exsit);
if("exsit".equals(exsit)){
	session.removeAttribute("oauth_token");
	session.removeAttribute("uid");
	session.invalidate();
}
String path = request.getContextPath();
String flag =(String)request.getAttribute("flag");
int pageCount = 1;
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta charset="utf-8">
<meta name="apple-mobile-web-app-capable" content="yes" />

<title>我要投资</title>


<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

<style type="text/css">
.left {
	float: left;
	width: 100%;
	height: 70px;
}

.islib{
    width: 20px;
    height: 20px;
    overflow: hidden;
}
</style>
<%@ include file="css.html"%>

<script type="text/javascript" src="script/jquery-1.7.2.min.js"></script>
<script type="text/javascript">


var pageCount = <%=pageCount%>;

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
         data:"method=huankuan&page="+pageCount,
         dataType: "", 
         success: function (data) {
         pageCount++;
         $("#list_pic").append(data); 
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
    <!--  list_head  -->
    <body>
<div class="list_head">
<ul>
  <li><a href="">利率</a></li>
  <li class="list_head_m"><a href="">金额</a></li>
  <li><a href="">进度</a></li>
</ul>
</div>

<div class="none" id ="list_pic">
  
  
 </div>  

<div class="foot">
   <ul class="foot_ul">
       <li style=" width:25%;"><a href=" http://liaowuhen.duapp.com/xinlongct/list_pic.jsp" data-ajax="false"><img src="http://xlct.vc400.cn/statics/css/xlct/image/mingxi_1.png"><p>招标中</a></li>
       <li style=" width:25%;"><a href="http://liaowuhen.duapp.com/xinlongct/list_huankuan.jsp" data-ajax="false"><img src="http://xlct.vc400.cn/statics/css/xlct/image/mingxi_2.png"><p>还款中</a></li>
       <li style=" width:25%;"><a href=" http://liaowuhen.duapp.com/xinlongct/list_huankuan_end.jsp" data-ajax="false"><img src="http://xlct.vc400.cn/statics/css/xlct/image/mingxi_3.png"><p>已还款</a></li>
       <li style=" width:25%;"><a href="http://xlct.vc400.cn/" data-ajax="false"><img src="http://xlct.vc400.cn/statics/css/xlct/image/mingxi_4.png"><p>首页</a></li>
 
    </ul>
</div>
  </body>
</html>
