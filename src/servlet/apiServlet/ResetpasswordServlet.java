package servlet.apiServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.Iterator;

import javax.jms.Session;
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
public class ResetpasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 4440739483644821986L;

	/**
	 * 确认请求来自微信服务器
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		// 微信加密签名
		// 随机字符串
		String result = "";
		String mima="";
		String uid = (String)request.getSession().getAttribute("uid");
		String oauth_token = (String) request.getSession().getAttribute("oauth_token");
		if("".equals(oauth_token) || "null".equals(oauth_token) || null == oauth_token){	
			  response.sendRedirect("dengluN.jsp");
			  return ;
		  }
		
		String password = request.getParameter("pasword");
		String Npassword = request.getParameter("Npassword");
		String cardNo = request.getParameter("cardNo");
		ApiMethod  api = new ApiMethod();
		String str = api.resetpassword(uid,oauth_token,password,Npassword,cardNo);
	   
		JSONObject json = JSONObject.fromObject(str);
System.out.println(json);
		Iterator<String> keys= json.keys();
		while(keys.hasNext()){
			String key = keys.next();
			if("oauth_token".equals(key)){
				String oauth = json.getString("oauth_token");
				if("0".equals(oauth)){
					String oauth_error_msg = json.getString("oauth_error_msg");
					request.getSession().setAttribute("oauth_error_msg", oauth_error_msg);
					//oauth_error_msg = URLEncoder.encode(oauth_error_msg, "UTF-8");
					//response.sendRedirect("jieguo.jsp?oauth_error_msg="+oauth_error_msg);	
					response.sendRedirect("jieguo.jsp");
				}
			}else if("resCode".equals(key)){
				  String resCode = json.getString("resCode");
				 mima =  json.getString("resMsg");
				// mima = URLEncoder.encode(mima, "UTF-8");
				 request.getSession().setAttribute("mima", mima);
				   request.getSession().setAttribute("resCode", resCode);
				 // response.sendRedirect("tiXianjieguo.jsp?tixian="+tixian+"&resCode="+resCode);
				   response.sendRedirect("mimajieguo.jsp");
				 // response.sendRedirect("toubiaojieguo.jsp?mima="+mima+"&resCode="+resCode);
				//response.sendRedirect("jieguo.jsp?result"+result);
				return ;
			}
		}
		
		
		//PrintWriter out = response.getWriter();
		// 通过检验signature对请求进行校验，若校验成功则原样返回echostr，表示接入成功，否则接入失败
       // System.out.println("User"+str);
		//out.write(user_id+"\n");
		//out.write(oauth_token+"\n");
	//	out.write(str);
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
