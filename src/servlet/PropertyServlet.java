package servlet;

import java.io.IOException;  
import java.io.PrintWriter;  
  
import javax.servlet.ServletException;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  

import org.apache.log4j.Logger;
  
import service.CoreService;  
import service.MysqlBasic;
import course.SignUtil;  

/** 
 * 核心请求处理类 
 *  
 * @author liufeng 
 * @date 2013-05-18 
 */  
public class PropertyServlet extends HttpServlet { 
	public static Logger logger = Logger.getLogger("java");
    private static final long serialVersionUID = 4440739483644821986L;  

/** 
 * 确认请求来自微信服务器 
     */  
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
        // 微信加密签名   

    }  
  
    /** 
     * 处理微信服务器发来的消息 
     */  
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
    // 将请求、响应的编码均设置为UTF-8（防止中文乱码）   
        request.setCharacterEncoding("UTF-8");  
        response.setCharacterEncoding("UTF-8");  
        String property = request.getParameter("property");
        response.sendRedirect("property.jsp?property="+property);
        logger.info("message");
        MysqlBasic.database();
        // 调用核心业务类接收消息、处理消息   
    }  
  
}
