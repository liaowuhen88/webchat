package servlet.apiServlet;

import java.io.IOException;
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
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 4440739483644821986L;

	/**
	 * 确认请求来自微信服务器
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		// 微信加密签名
		String username = request.getParameter("username");
		// 时间戳
		String password = request.getParameter("password");
		// 随机数
		String email = request.getParameter("email");
		String messageR = "";
		String resMsg  = "";
		// 随机字符串
		ApiMethod  api = new ApiMethod(); 
	    String strr = api.register(username,password);
	    String resCode = "";
	    JSONObject json = JSONObject.fromObject(strr); 
	    
	    Iterator<String> keys= json.keys();
	    
	    while(keys.hasNext()){
	    	String key = keys.next();
	    	if("error".equals(key)){
	    		messageR = "error!"; 
	    		response.sendRedirect("register.jsp?message="+messageR);
	 	    	 return;
	    	}else if("resCode".equals(key)){
	    		resCode = json.getString("resCode");
	    	}else if("resMsg".equals(key)){
	    		resMsg = json.getString("resMsg");;
	    	}
	    } 	
	   // System.out.println(strr);
	   
	    if("1".equals(resCode)){
	    	 String str = api.oauth_token(username,password);
	 	     HttpSession session = request.getSession();
	 	     String[] list = str.split("&");
	 	     String oauth_token = list[0].split("=")[1];
	 	     String user_id = list[1].split("=")[1];
	 	     if(!oauth_token.equals("0")){
	 	    	session.setAttribute("oauth_token", oauth_token);
	 		    session.setAttribute("user_id", user_id);
	 		    
	 		    response.setContentType("text/html; charset=utf-8");
	 		    ServletContext sc = getServletContext();
	 		    RequestDispatcher rd = null;
	 		    rd = sc.getRequestDispatcher("/xinlongct/zhanghao.jsp"); //定向的页面
	 		    rd.forward(request, response);
	 		   // result = true+"";
	 		    System.out.println("LogInServlet");
	 	    }else{
	 	    	 session.invalidate();
	 	    	 response.sendRedirect("register.jsp");
	 	    	 return;
	 	    	// result = false+"";
	 	    }
	    }else {
	    	if("邮箱格式错误".equals(resMsg)){
	    		messageR = "mailError";
	    	}else if ("用户名已经存在".equals(resMsg)){
	    		messageR = "sameUser";
	    	}else if ("邮箱已经存在".equals(resMsg)){
	    		messageR = "samemail";
	    	}
	    	response.sendRedirect("register.jsp?message="+messageR);
	    	return ;
	    }
	    //System.out.println(json);
	   /* Iterator<String> keys=json.keys();
	    while(keys.hasNext()){
	    	String key = keys.next();
	    	String value = json.getString(key);

	    } 	*/
	   
		//PrintWriter out = response.getWriter();
		// 通过检验signature对请求进行校验，若校验成功则原样返回echostr，表示接入成功，否则接入失败
       // System.out.println("RegistServlet"+str);
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
