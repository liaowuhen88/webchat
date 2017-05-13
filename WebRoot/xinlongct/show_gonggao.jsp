<%@ page language="java" import="java.util.*,api.*,net.sf.json.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta charset="utf-8">
<meta name="apple-mobile-web-app-capable" content="yes" />

<title>公告信息</title>
<meta content="{$head[keywords]}" name="keywords" />
<meta content="{$head[description]}" name="description" />
<base href="{SITE_URL}" />

<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

<%@ include file="css.html"%>

</head>


<body>
<% 
 String id = request.getParameter("id");
ApiMethod  api = new ApiMethod();
 String content = api.noticegetcontent(id);
 JSONObject contentJson = JSONObject.fromObject(content);
 JSONObject conte = contentJson.getJSONObject("getContent");
 
 String contentVlue = conte.getString("content");
 contentVlue =  contentVlue.replaceAll("<p>", "");
 contentVlue =  contentVlue.replaceAll("</p>", "");
 contentVlue =  contentVlue.replaceAll("style=\"float:none;\"", "");
  String contents = "";
  String src = "";
  String[] list = contentVlue.split("/>");
 for(int i=0;i<list.length;i++){
	 String[] listt = list[i].split("\"");
	 if(listt.length >2){
		src = listt[1];
	 }
	 System.out.println(list[i]);
	 System.out.println(listt.length);
	 contents += "<a href=\""+src+"\">"+list[i]+"/></a>";
}
 String title = conte.getString("title");
 String addtime = conte.getString("addtime");
 System.out.println(contents);

%>


<div class="none"></div>

<!--  list_box  -->

<div class="shwo_main">


    <div class="show_tit"><%=title %><br><span class="show_time"><%=addtime %></span></div>
    <div class="show_cont">
     <%=contents %>
    
    </div>
</div>



<!--  list_box end  -->


<div class="foot">
   <ul class="foot_ul">
       <li style=" width:25%;"><a href="http://liaowuhen.duapp.com/xinlongct/list_gonggao.jsp" data-ajax="false"><img src="http://xlct.vc400.cn/statics/css/xlct/image/gonggao_1.png"><p>网站公告</a></li>
       <li style=" width:25%;"><a href="http://liaowuhen.duapp.com/xinlongct/xnjz.jsp" data-ajax="false"><img src="http://xlct.vc400.cn/statics/css/xlct/image/gonggao_2.png"><p>项目进展</a></li>
       <li style=" width:25%;"><a href=" http://xlct.vc400.cn/" data-ajax="false"><img src="http://xlct.vc400.cn/statics/css/xlct/image/gonggao_3.png"><p>首页</a></li>

    </ul>
</div>













<div class="bot_none"></div>


</body>
</html>