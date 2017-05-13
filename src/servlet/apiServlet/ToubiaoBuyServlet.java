package servlet.apiServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import api.ApiMethod;

/**
 * 核心请求处理类
 * 
 * @author liufeng
 * @date 2013-05-18
 */
public class ToubiaoBuyServlet extends HttpServlet {
	private static final long serialVersionUID = 4440739483644821986L;

	/**
	 * 确认请求来自微信服务器
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		String oauth_token = (String)request.getSession().getAttribute("oauth_token");
		 String uid = (String)request.getSession().getAttribute("user_id");
		 if("".equals(oauth_token) || "null".equals(oauth_token) || null == oauth_token){	
			  response.sendRedirect("dengluN.jsp");
			  return ;
		  }
		 // 微信加密签名
		String result = "";
		String goumai = "";
	
		String id = request.getParameter("id");
		System.out.println(id);
		// 时间戳
		String password = request.getParameter("paypassword");
		String pwd = request.getParameter("pwd");
		String count = request.getParameter("count");
		String money = request.getParameter("money");
		String minFlowMoney = request.getParameter("minFlowMoney");
		ApiMethod  api = new ApiMethod();
		String content = api.gaomai(oauth_token,uid,id,money,count,password,pwd);
		
		//System.out.println("aaaa"+content);
		  if(!"".equals(content)){
			  if(!content.contains("{")){
				  String[] list = content.split("&");
				  if("0".equals(uid)){
						 if(list.length == 2){
							result = "denglu"; 
						 }else {
							 result = "overdue";   //过期
							 request.getSession().invalidate();
							 response.sendRedirect("dengluN.jsp?result="+result);
							 return;
						 }
					 }else if ("12".equals(uid)){
						 result = "lock";
						 request.getSession().invalidate();
						 response.sendRedirect("dengluN.jsp?result="+result);
						 return;
					 }
				  }else if(content.contains("{")){
					  JSONObject contentJson = JSONObject.fromObject(content);
					  String resCode = contentJson.getString("resCode");
					  goumai =  contentJson.getString("resMsg");
					 // goumai = URLEncoder.encode(goumai, "UTF-8");
					  request.getSession().setAttribute("goumai", goumai);
					   request.getSession().setAttribute("resCode", resCode);
					 // response.sendRedirect("tiXianjieguo.jsp?tixian="+tixian+"&resCode="+resCode);
					   response.sendRedirect("toubiaojieguo.jsp");
					 // response.sendRedirect("toubiaojieguo.jsp?goumai="+goumai+"&resCode="+resCode);
				  }
			  }else if("".equals(content) && null == content && "null".equals(content)){
				  response.sendRedirect("toubiaojieguo.jsp?goumai=goumai");
				return;
			  }else {
				  result = "exception";
				  response.sendRedirect("jieguo.jsp?goumai=goumai");
			  }
		 
		
		//response.sendRedirect("ToubiaoBuy.jsp");
		// 随机数
	    
		// 随机字符串
	   /* String str = ApiMethod.register(username,password,email);
	    JSONObject json = JSONObject.fromObject(str); 
	    System.out.println(json);
	    Iterator<String> keys=json.keys();
	    while(keys.hasNext()){
	    	String key = keys.next();
	    	String value = json.getString(key);
	    	System.out.println(key);
	    	System.out.println(value);
	    } 	
	   */
		//PrintWriter out = response.getWriter();
		// 通过检验signature对请求进行校验，若校验成功则原样返回echostr，表示接入成功，否则接入失败
        //System.out.println("RegistServlet"+str);
		//out.write(str);
		//out.close();
		//out = null;
	}

	/**
	 * 处理微信服务器发来的消息
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 将请求、响应的编码均设置为UTF-8（防止中文乱码）
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		// 调用核心业务类接收消息、处理消息
		doGet(request,response);

		// 响应消息
	
	}

}
