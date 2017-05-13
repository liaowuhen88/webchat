package servlet.apiServlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import api.ApiMethod;

/**
 * 核心请求处理类
 * 
 * @author liufeng
 * @date 2013-05-18
 */
public class LogInServlet extends HttpServlet {
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
		if(null == username || "null".equals(username) || "".equals(username) || null == password || "null".equals(password) || "".equals(password)){
			response.sendRedirect("dengluN.jsp");
		}
		String result = "";  
		
	    String str = ApiMethod.oauth_token(username,password);
	    HttpSession session = request.getSession();
	    String[] list = str.split("&");
	    String oauth_token = list[0].split("=")[1];
	    String user_id = list[1].split("=")[1];
	    if(!oauth_token.equals("0")){
	    	session.setAttribute("oauth_token", oauth_token);
		    session.setAttribute("user_id", user_id);
		    String flag = request.getParameter("flag");
		   // response.setContentType("text/html; charset=utf-8");
		   // ServletContext sc = getServletContext();
		   // RequestDispatcher rd = null;
		  //  rd = sc.getRequestDispatcher("/xinlongct/zhanghao.jsp"); //定向的页面
		   // rd.forward(request, response);
		    if("lottery".equals(flag)){  
		    	response.sendRedirect("Lottery.jsp");
		    	return ;
		    }
		    response.sendRedirect("zhanghao.jsp");
	    }else{
	    	 if("0".equals(user_id)){
	    		 if(list.length == 2){
	    			result = "denglu"; 
	    		 }else {
	    			 result = "overdue";   //过期
	    		 }
	    	 }else if ("12".equals(user_id)){
	    		result = "lock";
	    	 }
	    	 //session.invalidate();
	    	 response.sendRedirect("dengluN.jsp?result="+result);
	    	 return;
	    	// result = false+"";
	    }
	     //PrintWriter out = response.getWriter();
   	     //out.write(result);
   	     //out.close();
   	     //out = null;
		// 通过检验signature对请求进行校验，若校验成功则原样返回echostr，表示接入成功，否则接入失败
	    
		//request.getRequestDispatcher("xinlongct/denglu.jsp").forward(request, response);
	//System.out.println(oauth_token+user_id);
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
