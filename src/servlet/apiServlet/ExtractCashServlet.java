package servlet.apiServlet;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import api.ApiMethod;

/**
 * 核心请求处理类
 * 
 * @author liufeng
 * @date 2013-05-18
 */
public class ExtractCashServlet extends HttpServlet {
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
		
		String money = request.getParameter("money");
		String bankaccount = request.getParameter("CarNum");
		String paypassword = request.getParameter("paypassword");
		ApiMethod  api = new ApiMethod();
		String content = api.tonewcash(uid, oauth_token, money, bankaccount, paypassword);
		JSONObject contentJson ;
		String tixian = "";
		String resCode = "";
		String result = "";
		//ApiMethod  api = new ApiMethod();
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
				  } else if(content.contains("{")){
					   contentJson = JSONObject.fromObject(content);
					   Iterator<String> keys= contentJson.keys();
					   while(keys.hasNext()){
						   String key = keys.next();
						   if("resCode".equals(key)){
							  resCode = contentJson.getString("resCode");
						   }
						   if("resMsg".equals(key)){
							   tixian = contentJson.getString("resMsg");
						   }
					   }
					   //System.out.println(message);
					 //  tixian = URLEncoder.encode(tixian, "UTF-8");
					   request.getSession().setAttribute("tixian", tixian);
					   request.getSession().setAttribute("resCode", resCode);
					 // response.sendRedirect("tiXianjieguo.jsp?tixian="+tixian+"&resCode="+resCode);
					   response.sendRedirect("tiXianjieguo.jsp");
					   return ;
					   
			   }
					   			 
	  }

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
