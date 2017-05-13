<%@ page language="java" import="java.util.*,api.*,net.sf.json.*" pageEncoding="UTF-8"  contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--   v1.6.6.2 RDPROJECT-140 yl 2013-10-23 start-->
<title>账户充值 - 鑫隆创投</title>
<meta name="description" content="账户充值，鑫隆创投p2p网贷平台" />
<meta name="keywords" content="鑫隆创投,网络借贷,网络借贷平台,网上借贷,P2P网络借贷,P2P网上借贷,赚钱,本金保障,高收益,投资,借贷,理财,个人借贷,民间借贷,P2P借贷,贷款,信用贷款" />
<!--   v1.6.6.2 RDPROJECT-140 yl 2013-10-23 end-->
<meta property="qc:admins" content="554625745667411336375" />
<meta name="description" content="鑫隆创投,第三方民间借贷信息平台,p2p网上借贷平台。提供百分百本金保障,为投资、理财人士提供安全、高收益的投资理财产品,为中小企业提供无抵押信用贷款、房产抵押贷款等服务。" />
<meta name="keywords" content="鑫隆创投,网络借贷,网络借贷平台,网上借贷,P2P网络借贷,P2P网上借贷,赚钱,本金保障,高收益,投资,借贷,理财,个人借贷,民间借贷,P2P借贷,贷款,信用贷款" />
<link rel="stylesheet" href="/themes/soonmes_xinlongdai/media/css/base-style.css" type="text/css" />
<link rel="stylesheet" href="/themes/soonmes_xinlongdai/media/css/style.css" type="text/css" />
<link rel="stylesheet" href="/themes/soonmes_xinlongdai/media/css/jquery-ui.css" type="text/css" media="all" />
<link rel="stylesheet" href="/themes/soonmes_xinlongdai/media/css/modal.css" type="text/css" media="all" />
<link rel="stylesheet" href="/plugins/ueditor/themes/default/css/ueditor.css" type="text/css" media="all" />
<link rel="stylesheet" href="/plugins/ueditor/third-party/codemirror/codemirror.css" type="text/css" media="all" />
<script type="text/javascript" src="/themes/soonmes_xinlongdai/media/js/jquery.js"></script>
<script type="text/javascript" src="/themes/soonmes_xinlongdai/media/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/themes/soonmes_xinlongdai/media/js/user-libjs-1.0.js"></script>
<script type="text/javascript" src="/plugins/ueditor/third-party/codemirror/codemirror.js"></script>
</head><body>
<div id="head">
     <div class="clearfix"  id="head-content">
        <div class="logo">
            <a href="/">
                <img src="/themes/soonmes_xinlongdai/images/logo.png">
            </a>
        </div>
     </div>
             
	<div id="main">
	<!-- #main start-->
	<div class="mainbox clearfix">
			<!--左边的导航user_left 开始-->
			<div class="user_left">
<div class="clearfix">
    <div class="user_menus"> 
    
       
        
          
             
  
       
    </div>


</div>
<script type="text/javascript">
    $(".user_menus").toggleNav({allShow:true});
</script>
			</div>
		

					<div class="user_help alert">
                    * 温馨提示：网上银行充值过程中请耐心等待,充值成功后，请不要关闭浏览器,充值成功后返回鑫隆创投,
                    充值金额才能打入您的帐号。


</div>
		<div class="user_right_border">
			<div class="l" style="font-weight:bold;">真实姓名：</div>
			<div class="c">王志凤</div>
		</div>
		
		<div class="user_right_border">
			<div class="l" style="font-weight:bold;">联系Email：</div>
			<div class="c">*****56725@qq.com</div>
		</div>
		<form action="" method="post" name="form1"  onsubmit = "return check();" target="_blank">
		<div id="returnpay">
		<div class="user_right_border">
		
			<div class="l" style="font-weight:bold;">充值方式：</div>
			<div class="c" style="vertical-align:middle">
				<!-- 是否启用网上充值 -->
				<span style="line-height:22px; vertical-align:top; height:22px"><input type="radio" name="type"  id="type"  class="input_border" checked="checked" onClick="change_type(1)" value="1"  /> 网上充值<br></span>
				<span style="line-height:22px; vertical-align:top; height:22px"><input type="radio" name="type"  id="type" class="input_border"  value="2"  onclick="change_type(2)" /> 线下充值 </span>
			</div>
		</div>
		<div class="user_right_border">
			<div class="l" style="font-weight:bold;">充值金额：</div>
			<div class="c">
				<input type="text" name="money"  class="input_border" value="" size="10" onKeyUp="value=value.replace(/[^0-9.]/g,''),commit(this);" maxlength="9" /> 元 <span id="realacc">实际入账：<font color="#FF0000" id="real_money">0</font> 元</span>
			</div>
		</div>
                    <div id="type_net" class="disnone">
			<div class="user_right_border">
				<div class="l" style="font-weight:bold;">充值类型：</div>
				<div class="c">
						<font color="red">以下银行是使用个人网上银行支付，只需开通个人网上银行即可!</font>
		<style type="text/css">

		#ban table td{height:40px; line-height:40px;padding-right:30px;padding-bottom:10px; width:165px;}
		#ban table img{width:125px; height:33px;float:right;}

		</style>
		<div id="ban">
                     	<!-- 以下为直连，直连一次只支持一种支付方式 -->
						<!-- 
						 <tr>
						   <td width="150"><input type="radio" name="payment1" value="1025_w" />
                           <img src="/data/bank/ICBC_OUT.gif" border="0"/></td>
                           <td width="150"><input type="radio" name="payment1" value="00004_s" />
                           <img src="/data/bank/ICBC_OUT.gif" border="0"/></td>
						   <td width="150"><input type="radio" name="payment1" value="00083_s">
						   <img src="/data/bank/BOC_OUT.gif" border="0"/></td>
						   <td  width="150"><input type="radio" name="payment1" value="00015_s"/>
                          <img src="/data/bank/CCB_OUT.gif" border="0"/></td>
						 </tr>
						 <tr>
						   <td><input type="radio" name="payment1" value="00017_s"/>	
						   <img src="/data/bank/ABC_OUT.gif" border="0"/></td>
						   <td><input type="radio" name="payment1" value="00021_s"/>
						   <img src="/data/bank/CMB_OUT.gif" border="0"/></td>
						   <td><input type="radio" name="payment1" value="00052_s" />
						   <img src="/data/bank/GDB_OUT.gif" border="0"/></td>
						 </tr>
						 <tr>
						   <td><input type="radio" name="payment1" value="00013_s"/>
						   <img src="/data/bank/CMBC_OUT.gif" border="0"/></td>
						   <td><input type="radio" name="payment1" value="00057_s"/>
						   <img src="/data/bank/CEB_OUT.gif" border="0"/></td>
						   <td><input type="radio" name="payment1" value="00016_s"/>
						   <img src="/data/bank/CIB_OUT.gif" border="0"/></td>
						 </tr>
						 <tr>
						   <td><input type="radio" name="payment1" value="00051_s"/>
						   <img src="/data/bank/yz.jpg" border="0"/></td>
						   <td><input type="radio" name="payment1" value="00041_s"/>
                           <img src="/data/bank/hx.jpg" border="0"/></td>
						   <td><input type="radio" name="payment1" value="00005_s"/>
						   <img src="/data/bank/COMM_OUT.gif" border="0"/></td>
						 </tr>
						 <tr>
						   <td><input type="radio" name="payment1" value="00054_s"/>
						   <img src="/data/bank/CITIC_OUT.gif" border="0"/></td>
						   <td><input type="radio" name="payment1" value="00032_s">
						   <img src="/data/bank/pf.jpg" border="0"/></td>
						   <td><input type="radio" name="payment1" value="00023_s">
						   <img src="/data/bank/SZFZ_OUT.gif" border="0"/></td>
						 </tr> -->
						 
						 <!-- 易生支付 v1.6.5.5 RDPROJECT-148 xx 2013-09-23 start -->
						 <!-- 
						 <tr>
                           <td width="150"><input type="radio" name="payment1" value="ICBC_yisheng" />
                           <img src="/data/bank/ICBC_OUT.gif" border="0"/></td>
						   <td width="150"><input type="radio" name="payment1" value="BOC_yisheng">
						   <img src="/data/bank/BOC_OUT.gif" border="0"/></td>
						   <td  width="150"><input type="radio" name="payment1" value="CCB_yisheng"/>
                          <img src="/data/bank/CCB_OUT.gif" border="0"/></td>
						 </tr>
						 <tr>
						   <td><input type="radio" name="payment1" value="ABC_yisheng"/>	
						   <img src="/data/bank/ABC_OUT.gif" border="0"/></td>
						   <td><input type="radio" name="payment1" value="CMB_yisheng"/>
						   <img src="/data/bank/CMB_OUT.gif" border="0"/></td>
						   <td><input type="radio" name="payment1" value="GDB_yisheng" />
						   <img src="/data/bank/GDB_OUT.gif" border="0"/></td>
						 </tr>
						 <tr>
						   <td><input type="radio" name="payment1" value="CMBC_yisheng"/>
						   <img src="/data/bank/CMBC_OUT.gif" border="0"/></td>
						   <td><input type="radio" name="payment1" value="CEB_yisheng"/>
						   <img src="/data/bank/CEB_OUT.gif" border="0"/></td>
						   <td><input type="radio" name="payment1" value="CIB_yisheng"/>
						   <img src="/data/bank/CIB_OUT.gif" border="0"/></td>
						 </tr>
						 <tr>
						   <td><input type="radio" name="payment1" value="PSBC_yisheng"/>
						   <img src="/data/bank/yz.jpg" border="0"/></td>
						   <td><input type="radio" name="payment1" value="HXB_yisheng"/>
                           <img src="/data/bank/hx.jpg" border="0"/></td>
						   <td><input type="radio" name="payment1" value="HSBC_yisheng"/>
						   <img src="/data/bank/COMM_OUT.gif" border="0"/></td>
						 </tr>
						 <tr>
						   <td><input type="radio" name="payment1" value="CITIC_yisheng"/>
						   <img src="/data/bank/CITIC_OUT.gif" border="0"/></td>
						   <td><input type="radio" name="payment1" value="SPDB_yisheng">
						   <img src="/data/bank/pf.jpg" border="0"/></td>
						 </tr>
						  -->
						 <!-- v1.6.5.5 RDPROJECT-148 xx 2013-09-23 end -->
						 <!-- 双乾支付 v1.6.6.2 RDPROJECT-283 lhm 2013-10-21 start -->
						 <!--v1.6.6.2  RDPROJECT-169  wcw 2013-10-28 start-->
                         <ul class="bank_list clearfix">
                         
                                 <li>
                                   <input type="radio" name="payment1" value="1025_w" />
                                   <img src="/data/bank/ICBC_OUT.gif" border="0"/>
                                 </li>
                                 <li>
                                   <input type="radio" name="payment1" value="104_w" />
                                   <img src="/data/bank/BOC_OUT.gif" border="0"/>
                                 </li>
                                 <li>
                                   <input type="radio" name="payment1" value="105_w" />
                                   <img src="/data/bank/CCB_OUT.gif" border="0"/>
                                 </li>
                                 <li>
                                   <input type="radio" name="payment1" value="103_w" />
                                   <img src="/data/bank/ABC_OUT.gif" border="0"/>
                                 </li>
                                 <li>
                                   <input type="radio" name="payment1" value="3080_w" />
                                   <img src="/data/bank/CMB_OUT.gif" border="0"/>
                                 </li>
                                 <li>
                                   <input type="radio" name="payment1" value="306_w" />
                                   <img src="/data/bank/GDB_OUT.gif" border="0"/>
                                 </li>
                                 <li>
                                   <input type="radio" name="payment1" value="305_w" />
                                   <img src="/data/bank/CMBC_OUT.gif" border="0"/>
                                 </li>
                                 <li>
                                   <input type="radio" name="payment1" value="311_w" />
                                   <img src="/data/bank/hx.jpg" border="0"/>
                                 </li>
                                 <li>
                                   <input type="radio" name="payment1" value="307_w" />
                                   <img src="/data/bank/SPABANK_OUT.gif" border="0"/>
                                 </li>
                                 <li>
                                   <input type="radio" name="payment1" value="313_w" />
                                   <img src="/data/bank/CITIC_OUT.gif" border="0"/>
                                 </li>
                                 <li>
                                   <input type="radio" name="payment1" value="314_w" />
                                   <img src="/data/bank/pf.jpg" border="0"/>
                                 </li>
                                 <li>
                                   <input type="radio" name="payment1" value="302_w" />
                                   <img src="/data/bank/NBBANK_OUT.gif" border="0"/>
                                 </li>
                                 <li>
                                   <input type="radio" name="payment1" value="301_w" />
                                   <img src="/data/bank/COMM_OUT.gif" border="0"/>
                                 </li>
                                 <li>
                                   <input type="radio" name="payment1" value="312_w" />
                                   <img src="/data/bank/CEB_OUT.gif" border="0"/>
                                 </li>
                         </ul>
						 <!--v1.6.6.2  RDPROJECT-169  wcw 2013-10-28 end-->
						 
						 <!-- <tr>
                           <td width="150"><input type="radio" name="payment1" value="ICBC_95epay" />
                           <img src="/data/bank/ICBC_OUT.gif" border="0"/></td>
						   <td width="150"><input type="radio" name="payment1" value="BOC_95epay">
						   <img src="/data/bank/BOC_OUT.gif" border="0"/></td>
						   <td  width="150"><input type="radio" name="payment1" value="CCB_95epay"/>
                          <img src="/data/bank/CCB_OUT.gif" border="0"/></td>
						 </tr>
						 <tr>
						   <td><input type="radio" name="payment1" value="ABC_95epay"/>	
						   <img src="/data/bank/ABC_OUT.gif" border="0"/></td>
						   <td><input type="radio" name="payment1" value="CMB_95epay"/>
						   <img src="/data/bank/CMB_OUT.gif" border="0"/></td>
						   <td><input type="radio" name="payment1" value="GDB_95epay" />
						   <img src="/data/bank/GDB_OUT.gif" border="0"/></td>
						 </tr>
						 <tr>
						   <td><input type="radio" name="payment1" value="CMBC_95epay"/>
						   <img src="/data/bank/CMBC_OUT.gif" border="0"/></td>
						   <td><input type="radio" name="payment1" value="CEB_95epay"/>
						   <img src="/data/bank/CEB_OUT.gif" border="0"/></td>
						   <td><input type="radio" name="payment1" value="CIB_95epay"/>
						   <img src="/data/bank/CIB_OUT.gif" border="0"/></td>
						 </tr>
						 <tr>
						   <td><input type="radio" name="payment1" value="PSBC_95epay"/>
						   <img src="/data/bank/yz.jpg" border="0"/></td>
						   <td><input type="radio" name="payment1" value="HXB_95epay"/>
                           <img src="/data/bank/hx.jpg" border="0"/></td>
						   <td><input type="radio" name="payment1" value="HSBC_95epay"/>
						   <img src="/data/bank/COMM_OUT.gif" border="0"/></td>
						 </tr>
						 <tr>
						   <td><input type="radio" name="payment1" value="CITIC_95epay"/>
						   <img src="/data/bank/CITIC_OUT.gif" border="0"/></td>
						   <td><input type="radio" name="payment1" value="SPDB_95epay">
						   <img src="/data/bank/pf.jpg" border="0"/></td>
						 </tr> -->
						 <!-- v1.6.6.2 RDPROJECT-283 lhm 2013-10-21 end -->
                     	<table width="100%" cellpadding="3" cellspacing="3">

					   </table>
					</div>
				<!--v1.6.6.2  RDPROJECT-169  wcw 2013-10-28 start-->
					
							<span style="line-height:22px; vertical-align:top; height:22px">
								<input type="radio" name="payment1" class="input_border" value="chinabank_pay" id="payment1"/> 网银在线
								<input type="hidden" name="payname13" value="网银在线" /><br/>
							</span>
							<span style="line-height:22px; vertical-align:top; height:22px">
								<input type="radio" name="payment1" class="input_border" value="gopay" id="payment1"/> 国付宝
								<input type="hidden" name="payname13" value="国付宝" /><br/>
							</span>
							<span style="line-height:22px; vertical-align:top; height:22px">
								<input type="radio" name="payment1" class="input_border" value="ecpsspay" id="payment1"/> 汇潮支付
								<input type="hidden" name="payname13" value="汇潮支付" /><br/>
							</span>
							<span style="line-height:22px; vertical-align:top; height:22px">
								<input type="radio" name="payment1" class="input_border" value="baofoo_pay" id="payment1"/> 宝付
								<input type="hidden" name="payname13" value="宝付" /><br/>
							</span>
							<span style="line-height:22px; vertical-align:top; height:22px">
								<input type="radio" name="payment1" class="input_border" value="ips_pay" id="payment1"/> 环迅
								<input type="hidden" name="payname13" value="环迅" /><br/>
							</span>
				 <!--v1.6.6.2  RDPROJECT-169  wcw 2013-10-28 end-->


				</div>
			</div>
		</div>

		<div id="type_now" style="display:none">
			<div class="user_right_border">
                                
				<div class="l" style="font-weight:bold;">充值银行：
                                </div>
                                
				<div class="c" style="width:540px;">
                                    <div>
                                <font color="red">线下充值如遇到问题，请马上与在线客服联系：<br>
（1）单笔充值金额1万元以上（含）有千2奖励。（详情以当季公告为准）<br>
（2）<strong><font color="blue">有效充值登记时间为:周一至周六 8:30-20:00  周日 8:30-17:30，</font></strong><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;充值成功请和客服联系。
<br><br>
								</font></div>
					<div class="underline-bank">
					<!--v1.6.6.2  RDPROJECT-169  wcw 2013-10-28 start-->
						<input type="radio" name="payment2"  class="input_border" value="CCB" />6217 0000 6000 1671 856  中国建设银行股份有限公司天津环球金融中心支行  法人账户：周伯云<br/>
						<input type="radio" name="payment2"  class="input_border" value="BCM" />6222 6012 1001 2334 951  交通银行天津分行小白楼支行  法人账户：周伯云<br/>
						<input type="radio" name="payment2"  class="input_border" value="CMB" />6214 8502 2002 0579  招商银行天津分行解放路支行  法人账户：周伯云<br/>
						<input type="radio" name="payment2"  class="input_border" value="ABC" />6228 4800 2808 7858 974  中国农业银行股份有限公司天津金信支行  法人账户：周伯云<br/>
						<input type="radio" name="payment2"  class="input_border" value="ICBC" />6222 0203 0207 3301 202  中国工商银行股份有限公司天津锦州道金街支行  法人账户：周伯云<br/>
						<input type="radio" name="payment2"  class="input_border" value="ICBC" />6222 0803 0200 6361 940  中国工商银行商友卡（中国工商银行股份有限公司天津锦州道支行）  法人账户：周伯云<br/>
						<input type="radio" name="payment2"  class="input_border" value="BOC" />6217 8802 0000 0042 387  中国银行股份有限公司天津利民道支行  法人账户：周伯云<br/>
						<input type="radio" name="payment2"  class="input_border" value="HXB" />6226 3126 1025 2011  华夏银行天津和平支行  法人账户：周伯云<br/>
						<input type="radio" name="payment2"  class="input_border" value="CEB" />6226 6221 0454 4693  光大银行天津金融街支行  法人账户：周伯云<br/>
						<input type="radio" name="payment2"  class="input_border" value="CIB" />6229 0844 6101 1891 15  兴业银行股份有限公司天津和平支行  法人账户：周伯云<br/>
						<input type="radio" name="payment2"  class="input_border" value="PAB" />6230 5820 0000 4961 317  平安银行天津分行营业部  法人账户：周伯云<br/>
						<input type="radio" name="payment2"  class="input_border" value="CITIC" />6229 9814 2555 7777  中信银行天津分行营业部  法人账户：周伯云<br/>
				<!--v1.6.6.2  RDPROJECT-169  wcw 2013-10-28 end-->
					
				  </div>
				</div>
			</div>
			<div class="user_right_border">
				<div class="l" style="font-weight:bold;">线下充值备注：</div>
				<div class="c">
					<input type="text" name="remark"  class="input_border" value="" size="30" /><br>（请注明您的用户名，转账银行卡号和转账流水号，以及转账时间，谢谢配合）
				</div>
			</div>
		</div>
		<div class="user_right_border">
			<div class="l" style="font-weight:bold; float:left;">验证码：</div>
			<div class="c" >
				<input name="valicode" type="text" size="11" maxlength="5"  tabindex="3"  style="float:left;"/>&nbsp;<img src="/validimg.html" alt="点击刷新" onClick="this.src='/validimg.html?t=' + Math.random();" align="absmiddle" style="cursor:pointer; display:inline-block;zoom:1;*display:inline; *float:none;" />
			</div>
		</div>

		<div class="user_right_border">
			<div class="l" style="font-weight:bold;"></div>
			<div class="c">
				<input type="submit" class="btn-action"  name="name"  value="确认提交" size="30" /> 
			</div>
		</div>
		
		</div>
		</form>
		 <div id="modal_dialog" style="display: none" title="充值情况">
        	<p>如果您已经完成了充值，请继续以下步骤</p>
            <div class="">
        	<span id="close_wd">继续充值</span>　|　
			<a href="/member/account/recharge.html">查看充值记录</a>
            </div>
        </div>
		<script>
		function check(){
			var form_box = $("#recharge_form");
			var val=$('input:radio[name="type"]:checked').val();
			var money ="";
			var valicode;
			if(val==1){
				money = $("input[name='money']").val();
				valicode = $("input[name=valicode]").val();
				var payment1 = $("input[name='payment1']");
				if(!(money>0))
				{
					alert("线上充值金额不能低于0")
					return false;	
				}
				if(!payment1.is(":checked"))
				{
					alert("选择充值银行")
					return false;	
				}
				if(valicode=="")
				{
					alert("请输入验证码")
					return false;		
				}
				setTimeout(function(){
					show_recharge();
				},1000)
				
			}
			var val=$('input:radio[name="type"]:checked').val()
			if(val==2){
				money = $("input[name='money']").val();
				var payment2 = $("input[name='payment2']");
				valicode = $("input[name=valicode]").val();
				var lowmoney_now = parseInt($(".lowmoney_now").text());
				var now_remark = $("input[name='remark']").val();
				if(money<lowmoney_now)
				{
					alert("线下充值金额不能低于"+lowmoney_now)
					return false;	
				}
				if(!payment2.is(":checked"))
				{
					alert("选择线下充值银行")
					return false;	
				}
				if(now_remark=="")
				{
					alert("输入线下充值备注");
					return false;	
				}
				if(valicode=="")
				{
					alert("请输入验证码")
					return false;		
				}
				setTimeout(function(){
					show_recharge();
				},1000)
				
			}
			
			
			function show_recharge(){
				jQuery( "#modal_dialog" ).dialog({ autoOpen: false , modal: true ,height: 160,width:360 });
				jQuery( "#modal_dialog" ).dialog( "open" );
			}

		}
		$("#close_wd").click(function(){
			$(".ui-widget-overlay").remove();	
			$(".ui-dialog").remove();	
		})
		
		$(document).ready(function() {
			var val=$('input:radio[name="type"]:checked').val();
			if(val==2){
				$("#type_net").hide();
				$("#type_now").show();
			}
			if(val==1){
				$("#type_net").show();
				$("#type_now").hide();
			}
		});

			function change_type(type){
          
				if (type==2){
                                    
                                    document.getElementById("type_net").style.display="none";
                                    document.getElementById("type_now").style.display="";
                                    document.getElementById("realacc").style.display="none";
				    //$("#type_net").addClass("dishide");
				    //$("#type_now").removeClass();
				    //$("#realacc").hide();
				}else{
                                    document.getElementById("type_now").style.display="none";
                                    document.getElementById("type_net").style.display="";
                                    document.getElementById("realacc").style.display="";
				    //$("#type_now").addClass("dishide");
				    //$("#type_net").removeClass();
				    //$("#realacc").show();
				}
				
			}
		function payment (){
	 		var type = GetRadioValue("type");
			if (type==1){
				$("#returnpay").html("<font color='red'>请到打开的新页面充值</font>");
				
			}
			
		}
		function ctype(){
		var resualt=false;
		
			alert(document.form1.payment2.length);
			for(var i=0;i<document.form1.payment2.length;i++)
			{
				
				if(document.form1.payment2[i].checked)
				{
				  resualt=true;
				}
			}
			return resualt;
		}
        function commit(obj) {
            if (parseFloat(obj.value) > 0 ) 
            {
//                var realMoney = Math.round(parseFloat(obj.value)) / 100;

//                if (realMoney > 50) realMoney = 50;

//                document.getElementById("hspanReal").innerText = Math.round(parseFloat(obj.value)*10)/10 - realMoney;


                var realMoney=parseFloat(obj.value);
                /*
                if(realMoney>=5000)
                {
                    document.getElementById("real_money").innerText = realMoney - 50;
                }
                else 
                {
                    document.getElementById("real_money").innerText = parseInt(realMoney*0.99*100)/100;
                }
            }else{
				 var realMoney=parseFloat(obj.value);
                 document.getElementById("real_money").innerText = realMoney ;
			}
                        */
                        document.getElementById("real_money").innerText = realMoney ;
            }
        }
    </script>

    <div id="footer">
    <div class="footer-box clearfix">
            <div class="footer-box-list clearfix">
               
               
                
                <div class="clear"></div>
                <div  id="copyright">
                    <div class="copyright-text">
                        <!-- <div class="lianjie">
                            <a href="http://www.xinlongct.com/">鑫隆创投</a>　
                            |　<a href="/article/list.html?catalog=171" class="weibo">联系我们</a>　
                            |　<a href="http://www.erongdu.com/" class="weibo">开发平台</a>　
                            |　<a href="#" class="weibo">在线客服</a>　
                            |　<a href="#" class="weibo">网站地图</a>　
                            |　<a href="#" class="weibo">借贷宝</a>
                            　<script src="http://s19.cnzz.com/stat.php?id=5451485&web_id=5451485&show=pic" language="JavaScript"></script>
                           
                        </div> -->
                        <div style="padding-top:2px;" class="lianjie">
                                鑫隆创投-创建于贰零壹叁年 @2013 高通盛融（北京）投资基金管理有限公司
 版权所有
                        </div>
                        <div class="lianjie">
                            客户服务热线： 400-667-1177&nbsp;&nbsp;备案号：京ICP备13032285号
                        </div>
                    </div>
                    
                </div> 
        </div>
        <a href="http://www.xinlongct.com">
        <img src="/themes/soonmes_xinlongdai/images/logo2.png" alt="" style="float:right; margin-right:10px;width: 152px; display: block; margin-top:-10px;">
        </a>
    </div>
    <div class="footer_kexin" style="text-align:center;">
	<!--可信网站图片LOGO安装开始-->
<script src="http://kxlogo.knet.cn/seallogo.dll?sn=e14030511010247122lukt000000&size=0"></script>
<!--可信网站图片LOGO安装结束-->
<img src="/themes/soonmes_xinlongdai/images/jc2.jpg" style="margin-left:10px;">
<img src="/themes/soonmes_xinlongdai/images/jc1.jpg" style="margin-left:5px;">
	</div>
</div>

<script type="text/javascript" src="/themes/soonmes_xinlongdai/media/js/common.js"></script>
<script type="text/javascript">
    $("#nav").nav({childLi:".navul li.clearfix",childContent:".submenu",isTab:false});
    $(".fade-slidebox").fadeSlide();//全屏淡入淡出渐变
    $(".slidebar-successed").slideFn();
	$(".tzph_scroll").slideFn();
    $("#container").tabChange({childLi:"#tab li",childContent:"#myTabContent1 .list-tab-con",hoverClassName:"active",isClick:true});
    $("#container").tabChange({childLi:"#tab li",childContent:"#myTabContent .list-tab-con",hoverClassName:"active",isClick:true});
    $("[rel='tooltip']").tooltip();
</script>
<script>
	
	function AutoScroll(){
	  var _scroll = $(".friendcontent>ul");
	  //ul往左边移动300px
	  _scroll.animate({marginLeft:"-162px"},1000,function(){
		//把第一个li丢最后面去
		_scroll.css({marginLeft:0}).find("li:first").appendTo(_scroll);
	  });
	}
	$(function(){
	  //两秒后调用
	  var _scrolling=setInterval("AutoScroll()",2000);
	  $(".friendcontent>ul").hover(function(){
		//鼠标移动DIV上停止
		clearInterval(_scrolling);
	  },function(){
		//离开继续调用
		_scrolling=setInterval("AutoScroll()",2000);
	  });
	});
                
</script>
<script>
var con_id = Array();
function checkFormAll(form) {	
	if(form.allcheck.checked==true){
		con_id.length=0;
	}
	for (var i=1;i<form.elements.length;i++)    {
		 if(form.elements[i].type=="checkbox"){ 
            e=form.elements[i]; 
            e.checked=(form.allcheck.checked)?true:false; 
			if(form.allcheck.checked==true){
				con_id[con_id.length] = e.value;
			}else{
				con_id.length=0;
			}
        } 
	}
}
</script>
<!--<div style="margin:0 auto; width:131px;">
            <a href="http://webscan.360.cn/index/checkwebsite/url/www.zhaoshangdai.com"><img border="0" src="http://img.webscan.360.cn/status/pai/hash/c4e0e45f19710e3cc5e0d4d1ea2c041d"/></a>
</div>-->
