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
       <meta charset="utf-8" />
			<link rel="stylesheet" type="text/css" href="css/reset.css" media="all" />
			<link rel="stylesheet" type="text/css" href="css/main.css" media="all" />
			<link rel="stylesheet" type="text/css" href="css/dialog.css" media="all" />
			<script type="text/javascript" src="js/zepto.js"></script>
			<script type="text/javascript" src="js/dialog_min.js"></script>
			<script type="text/javascript" src="js/player_min.js"></script>
			<script type="text/javascript" src="js/main.js"></script>
			<script type="text/javascript" src="script/zp.js"></script>
             <title>
            </title>
        <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
		<meta content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport">
        <meta name="Keywords" content="" />
        <meta name="Description" content="" />
        <!-- Mobile Devices Support @begin -->
            <meta content="application/xhtml+xml;charset=UTF-8" http-equiv="Content-Type">
            <meta content="no-cache,must-revalidate" http-equiv="Cache-Control">
            <meta content="no-cache" http-equiv="pragma">
            <meta content="0" http-equiv="expires">
            <meta content="telephone=no, address=no" name="format-detection">
            <meta content="width=device-width, initial-scale=1.0" name="viewport">
            <meta name="apple-mobile-web-app-capable" content="yes" /> <!-- apple devices fullscreen -->
            <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
        <!-- Mobile Devices Support @end -->
    </head>
 <body >
    
 
<div class="body pb_10">
	<section class="stage">
		<img src="image/stage.jpg" />
		 <div id="shape" class="cube on">
	        <div class="plane one" id="one" ><span   onclick="sqdh('one')" ><figure  >&nbsp;</figure></span></div>
	        <div class="plane two" id="two" ><span   onclick="sqdh('two')"><figure >&nbsp;</figure></span></div>
	        <div class="plane three" id="three" ><span  onclick="sqdh('three')"><figure >&nbsp;</figure></span></div>
	      </div>
	      <div id="hit" class="hit"><img src="image/1.png" /></div>
	</section>
		<section>
		<div class="instro_wall">	
			<article>
				<div style="line-height:200%">
					
<h6 style="color:yellow">活动时间 </h6><br> 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2014年12月12日到2015年1月11日 <br>
<h6 style="color:yellow">活动奖项 </h6><br>  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;最高可获得1000元现金奖励 <br>
<h6 style="color:yellow">活动说明</h6> <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;当天加权投资金额超过6W即可获得1次砸蛋机会 <br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;更多详情请关注官网公告 <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;最终解释权归鑫隆创投所有   <br>
		</div>
			</article>
					</div>
	</section>

</div>
<script>
    
	function sqdh(id){
		 //alert($("#ones"));
       
		 
     // width: 100%;
     // height: 100%;
     // display:block;
    //  background:url(img/egg.png) no-repeat center -8px;
    //  -webkit-background-size: 160% auto;
    //  pointer-events:none;
        $.ajax({ 
                    type: "post", 
                     url: "CommonServlet",
                     data:"method=lottery",
                     dataType: "",   
                     success: function (data) {
                    	var flag = data.split("_")[0];
                    	var time = data.split("_")[1];
                    	//flag = "true";   
                        if(flag == "true"){ 
                        $("#"+id+" >span>figure").css("background","url(css/img/2.png)");
                           var a = runzp(time);
                           var num = a.prize;
                           //num = 20;     
                                     // alert(a.message+"金额为"+num+"元");
                                     // return ;
                                      $.ajax({ 
                                          type: "post", 
                                           url: "CommonServlet",
                                           data:"method=lotteryadd&award="+num,
                                           dataType: "",    
                                           success: function (data) {
                                             alert(a.message+"金额为"+num+"元"+"\n"+data);
                                             }, 
                                           error: function (XMLHttpRequest, textStatus, errorThrown) { 
                                          // alert(errorThrown); 
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
		 
		
		//$("#"+id+" >span>figure").css("height","50%");
		//$("#"+id+" >span>figure").css("width","50%");
		//$("#"+id).css("background","url(image/1.png)");
		//$("#"+id).css({"background":"yellow","font-size":"200%"});
		//$("#"+id).remove(); 
		//$("#"+id).append("<img src='image/1.png' /> ");
		// .src = "images/play.png"
		
		
		
		
		
		
		
	}

	//领取
	function lq(arg){
		var d2 = new iDialog();
		d2.open({
			classList: "get",
			title:"",
			close:"",
			content:'<div class="header"><h6>SN码：'+arg.sn+'，'+arg.prize_type+'等奖</h6></div>\
				<table>\
					<tr><td><input type="text" id="d2_1" value="" placeholder="请输入联系人" maxlength="30" /></td></tr>\
					<tr><td><input type="text" id="d2_2" value="" placeholder="请输入手机号，以便领取奖品" maxlength="30" /></td></tr>\
				</table>',
			btns:[
				{id:"", name:"领取", onclick:"fn.call();", fn: function(self){
					var obj = {
						wxname: $.trim($("#d2_1").val()),
						tel: $.trim($("#d2_2").val()),
						lid:'',
						rid:0,
						wechaid:'',
						action:'add',
						sncode:arg.sn
					}
					$.ajax({
						url:"?g=Wap&m=Lottery&a=add",
						type:"POST",
						data:obj,
						dataType: "json",
						success: function(res){
							if (res.success == true) {
								self.die();
								lqcg();
							}else{
								console.log( );
							}
						}
					});
				}},
				{id:"", name:"关闭", onclick:"fn.call();", fn: function(self){
					if('no' != arg.loca){
						location.href = location.href + "&r="+Math.random();
					}
					self.die();
				},}
			]
		});
	}

	//结果
	function jg(arg){
		var d3 = new iDialog();
		d3.open({
			classList: "result",
			title:"",
			close:"",
			content:'<div class="header"><h5 style="color:#2f8ae5;font-size:16px;"></h6></div>\
				<table style="margin-top:60px;"><tr>\
					<td style="text-align:center"><label>'+arg.prize+'</label></td>\
				</tr></table>',
			btns:[
				{id:"", name:"领取奖品", onclick:"fn.call();", fn: function(self){
					self.die();
					lq(arg);
				}},
				{id:"", name:"关闭", onclick:"fn.call();", fn: function(self){
					location.href = location.href + "&r="+Math.random();
					self.die();
				},}
			]
		});
	}
	
	//领取结果-成功
	function lqcg(){
		var d5 = new iDialog();
		d5.open({
			classList: "success",
			title:"",
			close:"",
			content:'<div class="header"><h6>成功领取</h6></div>\
				<table><tr>\
					<td><img src="tpl/static/goldenEgg/wap/style/images/7.png" /></td>\
					<td style="width:170px;"><label>线下兑换请到指定地点，出示此SN码给我们的工作人确认兑换！</label></td>\
				</tr></table>',
			btns:[
				{id:"", name:"知道了", onclick:"fn.call();", fn: function(self){
					location.href = location.href + "&r="+Math.random();
					self.die();
				}},
			]
		});
	}

	//失败
	function lqsb(){
		var d6 = new iDialog();
		d6.open({
			classList: "failed",
			title:"",
			close:"",
			content:'<div class="header"></div>\
				<table><tr>\
					<td><img src="tpl/static/goldenEgg/wap/style/images/8.png" /></td>\
				</tr></table>',
			btns:[
				{id:"", name:"再砸一次", onclick:"fn.call();", fn: function(self){
					location.href = location.href + "&r="+Math.random();
				}},
			]
		});
	}
	
	window.alert = function(str){
		var d7 = new iDialog();
		d7.open({
			classList: "alert",
			title:"",
			close:"",
			content:str,
			btns:[
				{id:"", name:"确定", onclick:"fn.call();", fn: function(self){
					self.die();
				}},
			]
		});
	}
</script>

</body>
</html>