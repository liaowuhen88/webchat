package test;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.ObjectOutputStream;
import java.io.Reader;
import java.net.HttpURLConnection;
import java.net.ProtocolException;
import java.net.URL;
import java.util.Map;

import org.apache.log4j.Logger;


public class BaseTest {
	protected final static Logger logger = Logger.getLogger(BaseTest.class);
	protected static String HOSTURL = "http://www.xinlongct.com";
	

	private static final String CHARSET = "UTF-8";
	/**
	 *
	 * @throws ProtocolException 
	 */
	protected static String  send(String method,String params) throws ProtocolException{
		long time = System.currentTimeMillis();
		//System.out.println("method开始："+DateUtil.dateStrYYYYMMDDHHMMSS(DateUtils.getNowTimeStr()));
		String urlPath = HOSTURL+method;
		System.out.println(urlPath+"?"+params);
		StringBuffer sb = new StringBuffer();
		try {
			byte[] postData = params.getBytes("UTF-8");
			URL url = new URL(urlPath);
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
			connection.setRequestProperty("Connection", "Keep-Alive");
			connection.setRequestProperty("Charset", "UTF-8");
			connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
			connection.setRequestProperty("Content-Length", String.valueOf(postData.length));
			
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

			reader.close();
			connection.disconnect();
			System.out.println("jieguo:" + sb.toString());
		} catch (IOException e) {
			System.out.println(e);
			logger.debug("method访问异常"+e.getMessage());
		}
	
		System.out.println(System.currentTimeMillis()-time);
		return sb.toString() ;
		//stem.out.println("getuser结束："+DateUtil.dateStrYYYYMMDDHHMMSS(DateUtils.getNowTimeStr()));
	}
	
	protected static String getparams(String params, Map<String, String> map) {
		StringBuilder builder = new StringBuilder();
		for (Map.Entry<String, String> entry : map.entrySet()) {

			builder.append("&"+entry.getKey() + "=" + entry.getValue()) ;
		}
		String str = builder.toString();
		logger.info(str);
		return str.substring(1,str.length());
		
	}
}
