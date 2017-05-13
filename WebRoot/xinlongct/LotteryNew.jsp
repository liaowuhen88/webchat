<%@ page language="java" import="java.util.*,api.*,net.sf.json.*,java.text.SimpleDateFormat" pageEncoding="UTF-8"%>
<% 
  
  String oauth_token = (String)session.getAttribute("oauth_token");
  String uid = (String)session.getAttribute("user_id");

  %>

<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta charset="utf-8">
<meta name="apple-mobile-web-app-capable" content="yes" />
<title>抽奖砸金蛋:</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

<style type="text/css">
body{ margin:0px; padding:0px;background:#760203;}
.in_bg{ width:100%; height:auto; overflow:hidden; margin:0px auto; z-index:0; padding:0px;}

.egg{width:60%; height: auto; overflow:hidden; float:left; margin-left:20%; margin-top:12%;}

.eggList li{float:left;width:40%; height: auto; overflow:hidden; margin-left:3%;list-style-type:none;}
.eggList li img{ width:100%; height:auto; overflow:hidden;}
.eggList li span{position:absolute; width:30px; height:60px; left:60px; top:180px; color:#ff0; font-size:42px; font-weight:bold}
.eggList li.curr{background:url(image/egg_2.png) no-repeat bottom;cursor:default;z-index:400;}
.eggList li.curr sup{position:absolute;background:url(image/img-4.png) no-repeat;width:232px; height:181px;top:140px;left:-34px;z-index:800;}
.hammer{ width:14%;height: auto; position:absolute; z-index:20;left:47%;top:10%;}
.hammer img{ width:100%; height:auto; overflow:hidden;}
.resultTip{position:absolute; background:#ffc ;width:148px;padding:6px;z-index:500;top:200px; left:10px; color:#f60; text-align:center;overflow:hidden;display:none;z-index:500;}
.resultTip b{font-size:14px;line-height:24px;}

#main{ position:absolute; width:100%; height:auto; overflow:hidden;top:0px; z-index:10;}

 .in_top_word{ width:80%; height:auto; overflow:hidden; margin:0px auto; margin-top:40px; font-size:14px; color:#FFF; font-family:"微软雅黑";}
</style>
</head>

<body>

<table>
 <tr>
 <td><div class="in_bg"><img src="image/dan3.jpg" width="100%" height="auto" /></div></td>
 
 </tr>
 <tr></tr>
 
</table>


<div id="main">
	<div class="egg">
	        <p class="hammer" id="hammer"><img src="image/img-6.png"></p>
			<p class="resultTip" id="resultTip"><b id="result"></b></p>
		    <ul class="eggList">
			
			<li ><img  class="eggli" src="image/egg_1.png" /></li>
			<li ><img  class="eggli" src="image/egg_1.png" /> </li>
		</ul>
	</div>
</div>
 <div class="in_top_word">
    
    说明：<br/> 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;特等奖：1000元<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;一等奖：100元<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;二等奖：50元<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;三等奖：30元<br/>  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;四等奖：20元<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;五等奖：10元<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;当天投资加权金额累计超过6万元即可<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;获得一次抽奖机会（每天限1次）<br/>
    
    
</div>

<script type="text/javascript" src="script/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="script/zp.js"></script>

<script type="text/javascript">
function eggClick(obj) {
	var _this = obj;
	//$.getJSON("data.php",function(res){
		if(_this.hasClass("curr")){
			alert("蛋都碎了，别砸了！刷新再来.");
			return false;
		}
		$.ajax({ 
            type: "post", 
             url: "CommonServlet",
             data:"method=lottery",
             dataType: "",    
             success: function (data) {
                data = "true"; 
                 var a = runzp();
                if(data == "true"){
                	$(obj).children("span").hide();
                	//alert(_this.position().top);
                	$(".hammer").css({"top":_this.position().top,"left":_this.position().left});
            		$(".hammer").animate({
            			"top":_this.position().top,
            			"left":_this.position().left
            			},30,function(){ 
            				//$(".eggli").attr("src","image/egg_2.png");
            				_this.find("img").attr("src","image/egg_2.png");
            				//_this.addClass("curr"); //蛋碎效果
            				//_this.find("sup").show(); //金花四溅
            				$(".hammer").hide(); 
            				$('.resultTip').css({display:'block',left:_this.position().left,opacity:0}).animate({top: '50px',opacity:1},0,function(){
            					$("#result").html("恭喜，您中得"+a.prize+"!");
            					return ;
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

            				});	
            			} 
            		);
                }else {
                	alert("对不起，您不满足条件，不能抽奖");
                	return ;
                }
               }, 
             error: function (XMLHttpRequest, textStatus, errorThrown) { 
            // alert(errorThrown); 
                } 
               });
		
		
		//_this.unbind('click');
		
	//});
}


$(".eggList li").click(function() {
	eggClick($(this));
});

$(".eggList li").hover(function() {
	var posL = $(this).position().left + $(this).width();
	$("#hammer").show().css('left', posL);
});
</script>


</body>

</html> 
