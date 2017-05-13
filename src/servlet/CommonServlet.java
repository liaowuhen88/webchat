package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;
import java.util.Iterator;

import javax.jms.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.DB;

import net.sf.json.JSONObject;

import api.ApiMethod;
import api.service.Service;

/**
 * 核心请求处理类
 * 
 * @author liufeng
 * @date 2013-05-18
 */
public class CommonServlet extends HttpServlet {
	private static final long serialVersionUID = 4440739483644821986L;

	/**
	 * 确认请求来自微信服务器
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String str = "";
		String method = request.getParameter("method");
		Service service = new Service();
		
		if(method.equals("list_pic")){
			String page = request.getParameter("page");
			str =  service.getList_pic("1",page);
		}else if(method.equals("log")){ 
			String page = request.getParameter("page");
			String oauth_token = request.getParameter("oauth_token");
			String uid = request.getParameter("uid");
			//System.out.println(oauth_token);
			//System.out.println(uid);
			str =  service.getLog(uid, oauth_token, page);
			if("0".equals(str)){
				response.sendRedirect("dengluN.jsp");	
			}
		}else if(method.equals("collection")){ 
			String page = request.getParameter("page");
			String oauth_token = request.getParameter("oauth_token");
			String uid = request.getParameter("uid");

			str =  service.getCollection(uid, oauth_token, page);
			if("0".equals(str)){
				response.sendRedirect("dengluN.jsp");	
			}
		}else if(method.equals("collectionH")){ 
			String page = request.getParameter("page");
			String oauth_token = request.getParameter("oauth_token");
			String uid = request.getParameter("uid");

			str =  service.getCollectionH(uid, oauth_token, page);
			if("0".equals(str)){
				response.sendRedirect("dengluN.jsp");	
			}
		}else if(method.equals("CashList")){ 
			String page = request.getParameter("page");
			String oauth_token = request.getParameter("oauth_token");
			String uid = request.getParameter("uid");
			str =  service.getCashList(uid, oauth_token, page);
			if("0".equals(str)){
				response.sendRedirect("dengluN.jsp");	
			}
		}else if(method.equals("huankuan")){
			String page = request.getParameter("page");
			str =  service.getList_pic("10",page);
		}else if(method.equals("huankuan_end")){
			String page = request.getParameter("page");
			str =  service.getList_pic("12",page);
		}else if(method.equals("notice")){
			String page = request.getParameter("page");
			str = service.getNoticelist(method,page);
			System.out.println(str);
		}else if(method.equals("fbyg")){
			String page = request.getParameter("page");
			str = service.getNoticelist(method,page);
		}else if(method.equals("resetpassword")){ //lottery
			String uid = (String)request.getSession().getAttribute("user_id");
			String oauth_token = (String) request.getSession().getAttribute("oauth_token");
			String password = request.getParameter("pasword");
			String Npassword = request.getParameter("Npassword");
			String cardNo = request.getParameter("cardNo");
			str = ApiMethod.resetpassword(uid,oauth_token,password,Npassword,cardNo);
		}else if(method.equals("lottery")){ //
			String uid = (String)request.getSession().getAttribute("user_id");
			String oauth_token = (String) request.getSession().getAttribute("oauth_token");
			String content = ApiMethod.choujia(uid, oauth_token);
			JSONObject json = JSONObject.fromObject(content);
			String lottery = (String)request.getSession().getAttribute("lottery");
			str = json.getString("flag")+"_"+lottery;  
		}else if(method.equals("lotteryadd")){ //
			Date time = new Date();
			String lottery = time.getMonth()+""+time.getDate();
			String uid = (String)request.getSession().getAttribute("user_id");
			String oauth_token = (String) request.getSession().getAttribute("oauth_token");
			String award = request.getParameter("award");
			String content = ApiMethod.lotteryadd(uid, oauth_token,award);
			request.getSession().setAttribute("lottery", lottery);
			System.out.println(content);
			JSONObject json = JSONObject.fromObject(content);
			str = json.getString("message");  
		}else if(method.equals("paty")){ 
			String username = request.getParameter("username");
			String phone = request.getParameter("phone");
			String conpeny = request.getParameter("conpany");
			Connection conn = DB.getConn();
			String sql = "insert into xlactivity (id, xlusername,phone,conpeny) VALUES (null,?,?,?)";
			PreparedStatement pstmt = DB.prepare(conn, sql);
			try {
				pstmt.setString(1, username);
				pstmt.setString(2, phone);
				pstmt.setString(3, conpeny);
				System.out.println(pstmt);
				pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DB.close(pstmt);
				DB.close(conn);
			}
			
		}
		
		PrintWriter out = response.getWriter();
		// 通过检验signature对请求进行校验，若校验成功则原样返回echostr，表示接入成功，否则接入失败
       // System.out.println("RegistServlet"+str);
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
