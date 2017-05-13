package test;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.ObjectOutputStream;
import java.io.Reader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.util.Map;
import java.util.TreeMap;

import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.TrustManager;


/**
 * 兴隆创投微信api
 * @author erongdu-jiekou
 *
 * 2014-2-24
 *
 */
public class CopyOfTest2 extends BaseTest{

	private static final String appkey = "3457D0F10A5E0DA4";
	/**
	 * @param args
	 * @throws Exception
	 */
	public static void main(String[] args) throws Exception {
		 oauth_token();  //oauth_token=de4705f0a73534ace3b83df4dfb01e46&user_id=4061;
		// register();
		gaomai();
		 //basic();
		 resetpassword();
		
		// rechargelist();
		
		// CashList();
		 //log();
		
		// borrowlist();
		// collectionlist();
		// noticelist();
		// noticegetcontent();
		// investlist();
		//investlist();
		// investcontent();
		// tenderlist();
		
		// getbiaolist();
		
		// investborrow();
		
		 initnewcash();
		// tonewcash();
		
		
	}
	// 体现
	private static void tonewcash() {
		String method ="/openapi/invest/tonewcash.html";
		String params = "?";
		Map<String, String> map = new TreeMap<String, String>();
		map.put("uid", "1873");
		map.put("appkey", appkey);
		map.put("oauth_token", "dd435fcee97006ed22cbaad98a65d387");
		
		map.put("money", "0");
		map.put("bankaccount", "6222100207086106");
		map.put("paypassword", "088367");
		params = getparams(params, map);
		
		try {
			send(method,params);
		} catch (ProtocolException e) {
			e.printStackTrace();
		}
	}

	private static void initnewcash() {
		String method ="/openapi/invest/initnewcash.html";
		String params = "?";
		Map<String, String> map = new TreeMap<String, String>();
		map.put("uid", "4061");
		map.put("appkey", appkey);
		map.put("oauth_token", "de4705f0a73534ace3b83df4dfb01e46");
		params = getparams(params, map);
		
		try {
			send(method,params);
		} catch (ProtocolException e) {
			e.printStackTrace();
		}
	}

	

	private static void tenderlist() {
		String method ="/openapi/invest/tenderlist.html";
		String params = "?";
		Map<String, String> map = new TreeMap<String, String>();
		map.put("bid", "2322");
		map.put("appkey", appkey);
	 
		params = getparams(params, map);
		
		try {
			send(method,params);
		} catch (ProtocolException e) {
			e.printStackTrace();
		}
	}

	private static void investcontent() {
		String method ="/openapi/invest/getcontent.html";
		String params = "?";
		Map<String, String> map = new TreeMap<String, String>();
		map.put("id", "2322");
		map.put("appkey", appkey);
	 
		params = getparams(params, map);
		
		try {
			send(method,params);
		} catch (ProtocolException e) {
			e.printStackTrace();
		}
	}
    
	public static void gaomai(){
		String method ="openapi/invest/toinvest.html";
		String params = "?";
		Map<String, String> map = new TreeMap<String, String>();
		map.put("appkey", appkey);
		map.put("oauth_token", "dd435fcee97006ed22cbaad98a65d387");
		map.put("uid", "1873");
		map.put("id", "5197");
		map.put("money", "10");
		//map.put("count", "10");
		map.put("paypassword", "088367");
		//map.put("pwd", "1");
		//map.put("minFlowMoney", appkey);
		
		
	 
		params = getparams(params, map);
		
		try {
			send(method,params);
		} catch (ProtocolException e) {
			e.printStackTrace();
	}
	}
	
	private static void investlist() {
		String method ="/openapi/invest/list.html";
		String params = "?";
		Map<String, String> map = new TreeMap<String, String>();
		map.put("page", "1");
		map.put("appkey", appkey);
	 
		params = getparams(params, map);
		
		try {
			send(method,params);
		} catch (ProtocolException e) {
			e.printStackTrace();
		}
	}

	private static String noticegetcontent() {
		String method ="/openapi/notice/getcontent.html";
		String params = "?";
		Map<String, String> map = new TreeMap<String, String>();
String str = "";
		map.put("appkey", appkey);
	    map.put("id", "258");

		params = getparams(params, map);
		
		try {
			str = send(method,params);
		} catch (ProtocolException e) {
			e.printStackTrace();
		}
		return str ;
	}

	private static void noticelist() {
		String method ="/openapi/notice/list.html";
		String params = "?";
		Map<String, String> map = new TreeMap<String, String>();

		map.put("appkey", appkey);
	

		params = getparams(params, map);
		
		try {
			send(method,params);
		} catch (ProtocolException e) {
			e.printStackTrace();
		}
	}

	private static void collectionlist() {
		String method ="/openapi/sitelog/collectionlist.html";
		String params = "?";
		Map<String, String> map = new TreeMap<String, String>();

		map.put("uid", "5532");
		map.put("oauth_token", "7d92c1f61d27b89f513f5b9d2c8ce113");
		map.put("appkey", appkey);
		map.put("page", "1");

		params = getparams(params, map);
		
		try {
			send(method,params);
		} catch (ProtocolException e) {
			e.printStackTrace();
		}
	}

	private static void borrowlist() {
		String method ="/openapi/sitelog/borrowlist.html";
		String params = "?";
		Map<String, String> map = new TreeMap<String, String>();

		map.put("uid", "4061");
		map.put("oauth_token", "de4705f0a73534ace3b83df4dfb01e46");
		map.put("appkey", appkey);
		map.put("page", "1");

		params = getparams(params, map);
		
		try {
			send(method,params);
		} catch (ProtocolException e) {
			e.printStackTrace();
		}
	}

	private static void log() {
		String method ="/openapi/sitelog/log.html";
		String params = "?";
		Map<String, String> map = new TreeMap<String, String>();

		//map.put("uid", "4061");
		//map.put("oauth_token", "de4705f0a73534ace3b83df4dfb01e46");
		map.put("uid", "5480");
		map.put("oauth_token", "3ad2f9747b169f146629e0b0f9cf2528");
		map.put("appkey", appkey);
		map.put("page", "1");

		params = getparams(params, map);
		
		try {
			send(method,params);
		} catch (ProtocolException e) {
			e.printStackTrace();
		}
	}

	private static void CashList() {
		String method ="/openapi/sitelog/cashlist.html";
		String params = "?";
		Map<String, String> map = new TreeMap<String, String>();

		map.put("uid", "4061");
		map.put("oauth_token", "de4705f0a73534ace3b83df4dfb01e46");
		map.put("appkey", appkey);
		map.put("page", "1");

		params = getparams(params, map);
		
		try {
			send(method,params);
		} catch (ProtocolException e) {
			e.printStackTrace();
		}
	}

	private static void rechargelist() {
		String method ="/openapi/sitelog/rechargelist.html";
		String params = "?";
		Map<String, String> map = new TreeMap<String, String>();

		map.put("uid", "4061");
		map.put("oauth_token", "de4705f0a73534ace3b83df4dfb01e46");
		map.put("appkey", appkey);
		map.put("page", "1");

		params = getparams(params, map);
		
		try {
			send(method,params);
		} catch (ProtocolException e) {
			e.printStackTrace();
		}
	}

	/**
	 * {"resCode":"1"}
	 */
	private static void resetpassword() {
		
		String method ="/openapi/account/resetpassword.html";
		String params = "?";
		Map<String, String> map = new TreeMap<String, String>();

		map.put("uid", "4061");
		map.put("oauth_token", "de4705f0a73534ace3b83df4dfb01e46");
		map.put("appkey", appkey);
		map.put("pswd", "123456");
		map.put("newpswd", "111111");
		map.put("cardNo", "430623198206214519");
		params = getparams(params, map);
		
		try {
			send(method,params);
		} catch (ProtocolException e) {
			e.printStackTrace();
		}
	}

	private static void basic() {
		// jieguo:{"acc_accountownmoney":"0.00","acc_awardtotal":"0.00","acc_borrowTotal":"0.00","acc_collectInterest":"0.00","acc_collection":"0.00","acc_credit":"0.00","acc_credituse":"0.00","acc_newestcollectdate":"","acc_newestcollectmoney":"0.00","acc_newestrepaydate":"","acc_newestrepaymoney":"0.00","acc_nousemoney":"0.00","acc_repaytotal":"0.00","acc_total":"0.00","acc_usemoney":"0.00","acc_yesinterest":"0.00","avatar_url":"/data/www/www.xinlongct.com/data/images/avatar/noavatar_middle.gif","uid":"5503","user_group":"1","username":"傲气凌神"}
		String method ="/openapi/account/basic.html";
		String params = "?";
		Map<String, String> map = new TreeMap<String, String>();
        //map.put("uid", "5503");
        //map.put("oauth_token", "4a3e2e323519dd5229273ad10ecc16af");
		map.put("uid", "4061");
		map.put("oauth_token", "de4705f0a73534ace3b83df4dfb01e46");
		map.put("appkey", appkey);
		params = getparams(params, map);
		
		try {
			send(method,params);
		} catch (ProtocolException e) {
			e.printStackTrace();
		}
	}

	private static void oauth_token() {
		String method ="/openapi/oauth/oauth_token.html";
		String params = "?";
		Map<String, String> map = new TreeMap<String, String>();

		map.put("username", "志在必得");
		map.put("password", "088367wang");
		map.put("appkey", appkey);
		params = getparams(params, map);
		
		try {
			send(method,params);
		} catch (ProtocolException e) {
			e.printStackTrace();
		}
	}
	
	private static void register() {
		String method ="/openapi/oauth/register.html";
		String params = "?";
		Map<String, String> map = new TreeMap<String, String>();

		map.put("email", "29675063@qq.com");
		map.put("password", "liaowuhen2");
		map.put("username", "liaowuhen2");
		map.put("appkey", appkey);
		params = getparams(params, map);
		
		try {
			send(method,params);
		} catch (ProtocolException e) {
			e.printStackTrace();
		}
	}
}
