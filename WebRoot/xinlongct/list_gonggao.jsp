<%@ page language="java" import="java.util.*,api.*,net.sf.json.*" pageEncoding="UTF-8"  contentType="text/html;charset=utf-8"%>
<%
int pageCount = 1;
%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta charset="utf-8">
<meta name="apple-mobile-web-app-capable" content="yes" />

<title>公告信息</title>


<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

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
         data:"method=notice&page="+pageCount,
         dataType: "", 
         success: function (data) {
         pageCount++;
         
         $("#list").append(data); 
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

<!--  list_box  -->

<div class="list_main">
   <ul id ="list">
   </ul>
</div>

<!--  list_box end  -->

<div class="bot_none"></div>

<div class="foot">
   <ul class="foot_ul">
       <li style=" width:33%;"><a href="http://liaowuhen.duapp.com/xinlongct/list_gonggao.jsp" data-ajax="false"><img src="http://xlct.vc400.cn/statics/css/xlct/image/gonggao_1.png"><p>网站公告</a></li>
       <li style=" width:33%;"><a href="http://liaowuhen.duapp.com/xinlongct/xnjz.jsp" data-ajax="false"><img src="http://xlct.vc400.cn/statics/css/xlct/image/gonggao_2.png"><p>项目进展</a></li>
       <li style=" width:33%;"><a href=" http://xlct.vc400.cn/" data-ajax="false"><img src="http://xlct.vc400.cn/statics/css/xlct/image/gonggao_3.png"><p>首页</a></li>
    </ul>
</div>

</body>
</html>