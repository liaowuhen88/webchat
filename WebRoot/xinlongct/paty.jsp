<%@ page language="java" import="java.util.*,api.*,net.sf.json.*,java.text.SimpleDateFormat" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta charset="utf-8">
<meta name="apple-mobile-web-app-capable" content="yes" />

<title>活动提交信息</title>
<style>

body {
    overflow-x: hidden;    -webkit-text-size-adjust: none;    font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;    color: #000;    margin: 0;    padding: 0;    font-size: 14px;    display: -webkit-box;
    background: #eee;
    /* We want to layout our first container vertically */
    -webkit-box-orient: vertical;
    /* we want our child elements to stretch to fit the container */
    -webkit-box-align: stretch;
}

rec{ color:#F00;}

img{ width:99%; height:auto; overflow:hidden; margin:0px auto;}


/* 头文件 */
.img { max-width:100%;height:auto; overflow:hidden; }
 
</style>

<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

</head>

<body>



<div class="none"></div>

<!--  投资内容  -->




<!--  1楼 投资  -->
   
<div class="box_xx">
   <div class="box_xx_tit_A">
   
   <br><br>
   
   </div>


<img src="image/a1.jpg">

<!--  1组  -->
<div class="table_box">

<form action="CommonServlet"  method = "post">
<input type="hidden" name="method" value="paty"/>
<table border="0" width="96%" cellpadding="0" cellspacing="0" style="margin:10px auto;">
   
    <tbody><tr class="daishou_title">
       <td width="30%" class="tc">登录名</td>
    <td width="70%" class="tc">
    <input type="text"   tabindex="2" size="18" value="" id="email" name="username"></td> 
      </tr>
  <tr class="daishou_title">
    <td width="30%" class="tc">电话</td>
    <td width="70%" class="tc">
    <input type="text"   tabindex="2" size="18" value="" id="email" name="phone">
    </td>

    

  </tr>		     	    
 <tr class="daishou_title">
    <td width="30%" class="tc">公司名称</td>
    <td width="70%" class="tc">
    <input type="text"   tabindex="2" size="18" value="" id="conpany" name="conpany">
    </td>
  </tr>			 	    
		
	
		
</tbody></table>
<div class="denglu_b"> <input type="submit" value="提交" /></div>	
</form>  


</div>
<!--  1组 end -->

<img src="image/a2.jpg">
<!--  2组  -->
<div class="table_box bg_2">

</div>
<!--  2组 end -->




</div>


<!--  list_box end  -->


<div class="bot_none"></div>


</body>
</html>