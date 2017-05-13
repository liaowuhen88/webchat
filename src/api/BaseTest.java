package api;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.HttpURLConnection;
import java.net.ProtocolException;
import java.net.URL;
import java.util.Map;
import java.util.TreeMap;

//import org.apache.log4j.Logger;


public class BaseTest {
	//protected final static Logger logger = Logger.getLogger(BaseTest.class);
	protected static String HOSTURL = "http://www.xinlongct.com"; 
	//protected static String HOSTURL = "http://scs.suning.com";

	private static final String CHARSET = "UTF-8";
	/**
	 *
	 * @throws ProtocolException 
	 */
	
	 
	
	 protected static String send(String method,String params) throws ProtocolException{
			long time = System.currentTimeMillis();
			String urlPath = HOSTURL+method;
			System.out.println("url:"+urlPath+"?"+params);
			StringBuffer sb = new StringBuffer();
			try {
				//byte[] postData = "abcd".getBytes("UTF-8");  // ziji xie
				byte[] postData = params.getBytes("UTF-8");
				URL url = new URL(urlPath);
				//URL url = new URL(HOSTURL);  //zoji de 
				HttpURLConnection connection;
				connection = (HttpURLConnection) url.openConnection();
			
				/*connection.setUseCaches(false);//
				connection.setDoOutput(true);
				connection.setConnectTimeout(3000);
//				connection.setReadTimeout(5000);
				connection.setRequestProperty("Connection", "Keep-Alive"); // 设置维持长连接
				connection.setRequestMethod("POST");
				connection.setRequestProperty("Content-type",
						"application/x-www-form-urlencoded");
				connection.setRequestProperty("Charset", CHARSET);
				//connection.setRequestProperty("User-Agent", "mpzhangdaibao");
				connection.setRequestProperty("Content-Length", String.valueOf(postData.length));
				connection.connect();*/
				connection.setConnectTimeout(3000);
				connection.setReadTimeout(3000);
				connection.setUseCaches(false);
				connection.setDoOutput(true); 
				connection.setRequestMethod("POST");
				//connection.setRequestMethod("get");  // 自己增加
				connection.setRequestProperty("Connection", "Keep-Alive");
				connection.setRequestProperty("Charset", "UTF-8");
				connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
			 	connection.setRequestProperty("Content-Length", String.valueOf(postData.length));
			 	
//				if(null != cookieVal && !"".equals(cookieVal)){  
//				   connection.setRequestProperty("Cookie", cookieVal); 
//				} 
				connection.connect();
				DataOutputStream outStream = new DataOutputStream(connection.getOutputStream());
				outStream.write(postData);
				outStream.flush();
				InputStream inputStream = connection.getInputStream();
				Reader reader = new InputStreamReader(inputStream, "UTF-8");
				BufferedReader bufferedReader = new BufferedReader(reader);
				String str = null;
				while ((str = bufferedReader.readLine()) != null) {
					sb.append(str); 
				}	
				System.out.println(sb);
				//cookieVal = connection.getHeaderField("Set-Cookie");  
				reader.close();
				connection.disconnect();
			} catch (IOException e) {
				System.out.println(e);
				//logger.debug("method访问异常"+e.getMessage());
			}
		
			System.out.println("time"+(System.currentTimeMillis()-time));
			return sb.toString();
		}
	
	 
	protected static String send2(String method,String params) throws ProtocolException{
		
		String cookieVal="";
		//register 1
		method = "/sps/portal/showLoginPage.action";
		params = "?";
		Map<String, String> map1 = new TreeMap<String, String>();

		map1.put("password", "1005949101");
		map1.put("userName", "sn26524316");

		params = getparams(params, map1);
		
		
		long time = System.currentTimeMillis();
		String urlPath = HOSTURL+method;
		System.out.println("url:"+urlPath+"?"+params);
		StringBuffer sb = new StringBuffer();
		try {
			//byte[] postData = "abcd".getBytes("UTF-8");  // ziji xie
			byte[] postData = params.getBytes("UTF-8");
			URL url = new URL(urlPath);
			//URL url = new URL(HOSTURL);  //zoji de 
			HttpURLConnection connection;
			connection = (HttpURLConnection) url.openConnection();
		
			/*connection.setUseCaches(false);//
			connection.setDoOutput(true);
			connection.setConnectTimeout(3000);
//			connection.setReadTimeout(5000);
			connection.setRequestProperty("Connection", "Keep-Alive"); // 设置维持长连接
			connection.setRequestMethod("POST");
			connection.setRequestProperty("Content-type",
					"application/x-www-form-urlencoded");
			connection.setRequestProperty("Charset", CHARSET);
			//connection.setRequestProperty("User-Agent", "mpzhangdaibao");
			connection.setRequestProperty("Content-Length", String.valueOf(postData.length));
			connection.connect();*/
			connection.setConnectTimeout(3000);
			connection.setReadTimeout(3000);
			connection.setUseCaches(false);
			connection.setDoOutput(true); 
			connection.setRequestMethod("POST");
			//connection.setRequestMethod("get");  // 自己增加
			connection.setRequestProperty("Connection", "Keep-Alive");
			connection.setRequestProperty("Charset", "UTF-8");
			connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
		 	connection.setRequestProperty("Content-Length", String.valueOf(postData.length));
			connection.connect();
			DataOutputStream outStream = new DataOutputStream(connection.getOutputStream());
			outStream.write(postData);
			outStream.flush();
			InputStream inputStream = connection.getInputStream();
			Reader reader = new InputStreamReader(inputStream, "UTF-8");
			BufferedReader bufferedReader = new BufferedReader(reader);
			String str = null;
			while ((str = bufferedReader.readLine()) != null) {
				sb.append(str); 
			}	
			System.out.println(sb);
			cookieVal = connection.getHeaderField("Set-Cookie");  
			reader.close();
			
			
			
			
			////register 2
			method ="/te/deliveryinformdetailcontroller/selectDeliveryInform.action"; 
			params = "?";
			str = "";
			Map<String, String> map2 = new TreeMap<String, String>();

	  
			map2.put("isinit", "N");
			map2.put("type", "10");
			map2.put("saleorderno", "00013383548901");
		
			params = getparams(params, map2);
			
			
			
			time = System.currentTimeMillis();
			urlPath = HOSTURL+method;
			System.out.println("url:"+urlPath+"?"+params);
			sb = new StringBuffer();
			try {
				//byte[] postData = "abcd".getBytes("UTF-8");  // ziji xie
				postData = params.getBytes("UTF-8");
				url = new URL(urlPath);
				//URL url = new URL(HOSTURL);  //zoji de 
				
				//HttpURLConnection connection;
				//connection = (HttpURLConnection) url.openConnection();
			
				/*connection.setUseCaches(false);//
				connection.setDoOutput(true);
				connection.setConnectTimeout(3000);
//				connection.setReadTimeout(5000);
				connection.setRequestProperty("Connection", "Keep-Alive"); // 设置维持长连接
				connection.setRequestMethod("POST");
				connection.setRequestProperty("Content-type",
						"application/x-www-form-urlencoded");
				connection.setRequestProperty("Charset", CHARSET);
				//connection.setRequestProperty("User-Agent", "mpzhangdaibao");
				connection.setRequestProperty("Content-Length", String.valueOf(postData.length));
				connection.connect();*/
				connection.setConnectTimeout(3000);
				connection.setReadTimeout(3000);
				//connection.setUseCaches(false);
				//connection.setDoOutput(true); 
				//connection.setRequestMethod("POST");
				//connection.setRequestMethod("get");  // 自己增加
				connection.setRequestProperty("Connection", "Keep-Alive");
				connection.setRequestProperty("Charset", "UTF-8");
				connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
			 	connection.setRequestProperty("Content-Length", String.valueOf(postData.length));
				connection.setRequestProperty("Cookie", cookieVal); 
				connection.connect();
				outStream = new DataOutputStream(connection.getOutputStream());
				outStream.write(postData);
				outStream.flush();
				inputStream = connection.getInputStream();
				reader = new InputStreamReader(inputStream, "UTF-8");
				bufferedReader = new BufferedReader(reader);
				str = null;
				while ((str = bufferedReader.readLine()) != null) {
					sb.append(str); 
				}	
				System.out.println(sb);
				cookieVal = connection.getHeaderField("Set-Cookie");  
				reader.close();	
			
			
			connection.disconnect();
			} catch (IOException e) {
				System.out.println(e);
				//logger.debug("method访问异常"+e.getMessage());
			}
		
			System.out.println("time"+(System.currentTimeMillis()-time));
			return sb.toString();
		} catch (IOException e) {
			System.out.println(e);
			//logger.debug("method访问异常"+e.getMessage());
		}
	
		System.out.println("time"+(System.currentTimeMillis()-time));
		return sb.toString();
	}
	
	protected static String getparams(String params, Map<String, String> map) {
		StringBuilder builder = new StringBuilder();
		for (Map.Entry<String, String> entry : map.entrySet()) {

			builder.append("&"+entry.getKey() + "=" + entry.getValue()) ;
		}
		String str = builder.toString();
		//logger.info(str);
		return str.substring(1,str.length());
		
	}
}
