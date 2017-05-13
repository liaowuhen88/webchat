<%@ page language="java" import="java.util.*,api.*,net.sf.json.*,java.text.SimpleDateFormat" pageEncoding="UTF-8"%>
<% 
  
  String oauth_token = (String)session.getAttribute("oauth_token");
  String uid = (String)session.getAttribute("user_id");
 
  if("".equals(oauth_token) || "null".equals(oauth_token) || null == oauth_token){	
	  response.sendRedirect("dengluN.jsp");
	  return ;
  }
 
  %>

<!DOCTYPE html>
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta charset="utf-8">
<meta name="apple-mobile-web-app-capable" content="yes" />
 
<title>活动提交信息</title>

<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

<script type="text/javascript" src="script/jquery-1.7.2.min.js"></script>

<script type="text/javascript" src="script/jQueryRotate.2.2.js"></script>

<script type="text/javascript" src="script/jquery.easing.min.js"></script>
 
<script type="text/javascript" src="script/zp.js"></script>

<style type="text/css">

body {
 
    background: url(image/bg.png) 0 0 repeat;

}

 

.rotate-content {

    width: 270px;

    position: relative;

    height: 270px;

    background: url(activity-lottery-bg.png)

        no-repeat 0 0;

    background-size: 100% 100%;

    margin: 0 auto

}

 

.rotate-con-pan {

    background: url(image/221.jpg) 

        no-repeat 0 0;

    background-size: 100% 100%;

    position: relative;

    width: 255px;

    height: 255px;

    padding-top: 15px;

    box-sizing: border-box;

    -moz-box-sizing: border-box;

    -webkit-box-sizing: border-box;

    margin: 0 auto

}

 

.rotate-con-zhen {

    width: 112px;

    height: 224px;

    background: url(image/start.png)

        no-repeat 0 0;

    background-size: 100% 100%;

    margin: 0 auto

}

 

</style>

</head>


<body>

<div class="rotate-content">

           <div class="rotate-con-pan">

                <div class="rotate-con-zhen"></div>

            </div>

   </div>

</body>

<script type="text/javascript">

$(function(){

    $(".rotate-con-zhen").rotate({

        bind:{

            click:function(){
          
                
            	$.ajax({ 
                    type: "post", 
                     url: "CommonServlet",
                     data:"method=lottery",
                     dataType: "",   
                     success: function (data) {
                        //data = "true"; 
                        if(data == "true"){
  
                           var a = runzp();

                           $(".rotate-con-zhen").rotate({

                                  duration:3000,

                                  angle: 0,

                                  animateTo:1440+a.angle,

                                  easing: $.easing.easeOutSine,

                                  callback: function(){

                                     // alert(a.message+"金额为"+a.prize+"元");
                                      //return ;
                                      $.ajax({ 
                                          type: "post", 
                                           url: "CommonServlet",
                                           data:"method=lotteryadd&award="+a.prize,
                                           dataType: "",    
                                           success: function (data) {
                                             alert(a.message+"金额为"+a.prize+"元"+data);
                                          	  
                                             }, 
                                           error: function (XMLHttpRequest, textStatus, errorThrown) { 
                                          // alert(errorThrown); 
                                              } 
                                             }); 
   
                                  }

                           });	
                        }else {
                        	alert("对不起，您不满足条件，不能抽奖");
                        	return ;
                        }
                    	 
                       }, 
                     error: function (XMLHttpRequest, textStatus, errorThrown) { 
                    // alert(errorThrown); 
                        } 
                       });
        	
            }

        }

    }); 

});

function send(count){
	$.ajax({ 
        type: "post", 
         url: "CommonServlet",
         data:"method=lotteryadd&award="+a.prize,
         dataType: "",   
         success: function (data) {
           alert(data);
        	 
           }, 
         error: function (XMLHttpRequest, textStatus, errorThrown) { 
        // alert(errorThrown); 
            } 
           }); 
}
</script>
说明：<br/> 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;特等奖：1000元<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;一等奖：100元<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;二等奖：50元<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;三等奖：30元<br/>  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;四等奖：20元<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;五等奖：10元<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;当天投资加权金额累计超过6万元即可<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;获得一次抽奖机会（每天限1次）<br/>
</html> 
