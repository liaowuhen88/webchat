package main;

import wechatPojo.AccessToken;  
import wechatPojo.Button;  
import wechatPojo.CommonButton;  
import wechatPojo.ComplexButton;  
import wechatPojo.Menu;  
import wechatPojo.ViewButton;
import wechatUtil.WeixinUtil;  
import org.slf4j.Logger;  
import org.slf4j.LoggerFactory;  
 
	/** 
	 * 菜单管理器类 
	 *  
	 * @author liufeng 
	 * @date 2013-08-08 
	 */  
	public class MenuManager {  
	    private static Logger log = LoggerFactory.getLogger(MenuManager.class);  
	  
	    public static void main(String[] args) {  
	        // 第三方用户唯一凭证   
	        String appId = "wxb339fd4317defe3e";  
           // 第三方用户唯一凭证密钥    
	        String appSecret = "f07e8a21a06246fea67d50c29ef11134 ";  
	  
	        // 调用接口获取access_token   
	        AccessToken at = WeixinUtil.getAccessToken(appId, appSecret);  
	  
	        if (null != at) {  
	            // 调用接口创建菜单   
	            int result = WeixinUtil.createMenu(getMenu(), at.getToken());  
	  
	            // 判断菜单创建结果   
	            if (0 == result)  
	                log.info("菜单创建成功！");  
	            else  
	                log.info("菜单创建失败，错误码：" + result);  
	        }  
	    }  
	  
	    /** 
	     * 组装菜单数据 
	     *  
	     * @return 
	     */  
	    private static Menu getMenu() {  
	  
	        ViewButton btn11 = new ViewButton();
	        btn11.setName("我要投资");  
	        btn11.setType("view");  
	        btn11.setUrl("http://liaowuhen.duapp.com/xinlongct/list_pic.jsp"); 
	        
	        ViewButton btn12 = new ViewButton();
	        btn12.setName("投标记录");  
	        btn12.setType("view");  
	        btn12.setUrl("http://liaowuhen.duapp.com/xinlongct/list_pic.jsp"); 

	        ViewButton btn21 = new ViewButton();
	        btn21.setName("员工登陆");   
	        btn21.setType("view");  
	        btn21.setUrl("http://meidiserver.duapp.com/meidiserver/dengluN.jsp"); 
	        
	        ViewButton btn22 = new ViewButton();
	        btn22.setName("我的账号");  
	        btn22.setType("view");  
	        btn22.setUrl("http://liaowuhen.duapp.com/xinlongct/list_toubiao.jsp"); 
	        
           /*CommonButton btn21 = new CommonButton();  
	        btn21.setName("微网页");  
	        btn21.setType("click");  
	        btn21.setKey("微网页");  */
	    
	        /*CommonButton btn22 = new CommonButton();  
	        btn22.setName("经典游戏");  
	        btn22.setType("click");  
	        btn22.setKey("22");  
	  
	        CommonButton btn23 = new CommonButton();  
	        btn23.setName("美女电台");  
	        btn23.setType("click");  
	        btn23.setKey("23");  
	  
           CommonButton btn24 = new CommonButton();  
	        btn24.setName("人脸识别");  
	        btn24.setType("click");  
	        btn24.setKey("24");  
	  
	        CommonButton btn25 = new CommonButton();  
	        btn25.setName("聊天唠嗑");  
	        btn25.setType("click");  
	        btn25.setKey("25");  
	        
	        
	         ComplexButton mainBtn3 = new ComplexButton();  
	        mainBtn3.setName("员工签到");  
	        mainBtn3.setSub_button(new Button[] { btn10 });  
	  
	  */
	        /*CommonButton btn31 = new CommonButton();  
	        btn31.setName("公告信息");  
	        btn31.setType("click");  
	        btn31.setKey("公告信息");  */
	     /*   
	        ViewButton btn10 = new ViewButton();
	        btn10.setName("公告信息");  
	        btn10.setType("view");  
	        btn10.setUrl("http://liaowuhen.duapp.com/xinlongct/list_gonggao.jsp");
            	        
          
	  
	        ComplexButton mainBtn1 = new ComplexButton();  
	        mainBtn1.setName("微官网");  
	        mainBtn1.setSub_button(new Button[] { });  
	  
	        ComplexButton mainBtn2 = new ComplexButton();  
	        mainBtn2.setName("员工登陆");  
	        mainBtn2.setSub_button(new Button[] { btn21  });  
	  
	        ComplexButton mainBtn3 = new ComplexButton();  
	        mainBtn3.setName("员工签到");  
	        mainBtn3.setSub_button(new Button[] {  });  
	     */
	        /** 
	         * 这是公众号xiaoqrobot目前的菜单结构，每个一级菜单都有二级菜单项<br> 
	         *  
	         * 在某个一级菜单下没有二级菜单的情况，menu该如何定义呢？<br> 
	         * 比如，第三个一级菜单项不是“更多体验”，而直接是“幽默笑话”，那么menu应该这样定义：<br> 
	         * menu.setButton(new Button[] { mainBtn1, mainBtn2, btn33 }); 
	         */ 
	        ViewButton mainBtn1 = new ViewButton();
	        btn21.setName("微官网");   
	        btn21.setType("view");  
	        btn21.setUrl("");  
	         
	        
	        ViewButton mainBtn2 = new ViewButton();
	        btn21.setName("员工登陆");   
	        btn21.setType("view");  
	        btn21.setUrl("http://meidiserver.duapp.com/meidiserver/dengluN.jsp"); 
	      

	        ViewButton mainBtn3 = new ViewButton();
	        btn21.setName("员工签到");   
	        btn21.setType("view");  
	        btn21.setUrl(""); 
	      
	        
	        Menu menu = new Menu();  
	        menu.setButton(new Button[] { mainBtn1, mainBtn2, mainBtn3 });  
	  
	        return menu;  
	    }  
	}  
