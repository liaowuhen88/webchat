package servlet.apiServlet;

import java.io.IOException;
import java.io.PrintWriter;
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
public class OauthTokenServlet extends HttpServlet {
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
		// 随机字符串
		ApiMethod  api = new ApiMethod();
	    String str = api.register(username,password); 
	    JSONObject json = JSONObject.fromObject(str); 
	    System.out.println(json);
	    Iterator<String> keys=json.keys();
	    while(keys.hasNext()){
	    	String key = keys.next();
	    	String value = json.getString(key);
	    	System.out.println(key);
	    	System.out.println(value);
	    } 	
	   
		PrintWriter out = response.getWriter();
		// 通过检验signature对请求进行校验，若校验成功则原样返回echostr，表示接入成功，否则接入失败
        System.out.println("RegistServlet"+str);
		out.write(str);
		out.close();
		out = null;
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
