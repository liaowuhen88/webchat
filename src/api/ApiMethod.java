package api;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.net.ProtocolException;
import java.util.Map;
import java.util.TreeMap;

import javax.swing.JOptionPane;

//import org.apache.log4j.Logger;

/**
 * 兴隆创投微信api
 * @author erongdu-jiekou
 *
 * 2014-2-24
 *
 */
public class ApiMethod extends BaseTest{
	//protected final static Logger logger = Logger.getLogger(CopyOfTest2.class);
	public static final String appkey = "3457D0F10A5E0DA4";
	
	
	   
	public static void main(String args[]){ 
		//ApiMethod.register("1005949101", "sn26524316");  
		//register2();
		//register3(); 
		try {
			send2("1","2");
		} catch (ProtocolException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	  

	
	public  static String register3() {
		
		String method ="/te/deliveryinformdetailcontroller/selectDeliveryInform.action"; 
		String params = "?";
		String str = "";
		Map<String, String> map = new TreeMap<String, String>();

  
		map.put("isinit", "N");
		map.put("type", "10");
		map.put("saleorderno", "00013383548901");
	
		params = getparams(params, map);
		
		try {
			str =  send(method,params); 
		} catch (ProtocolException e) {
			e.printStackTrace();
			System.out.println(e);
		}
		return str;
	}
	
	public  static String register2() {
		String method ="/scs/Dispatcher"; 
		String params = "?";
		String str = "";
		Map<String, String> map = new TreeMap<String, String>();

	 // ''&username='-1'&password='-1'&mivalue='QJbYtmx32WUZfsK1kz+t/8ewYnVOAFL8d9i2YjiTReoX5sKPWnZ5w7olicTShk0h'" 
		map.put("pagename", "p_sophomepage");
		map.put("actionname", "login");
		map.put("languagecode", "cn");
		map.put("certvalidcode", "");
		map.put("SCSflag", "true");
		map.put("errorpasnum", "0"); 
		map.put("username", "-1"); 
		map.put("password", "-1");
		map.put("mivalue", "QJbYtmx32WUZfsK1kz+t/8ewYnVOAFL8d9i2YjiTReoX5sKPWnZ5w7olicTShk0h");
		params = getparams(params, map);
		
		try {
			str =  send(method,params); 
		} catch (ProtocolException e) {
			e.printStackTrace();
			System.out.println(e);
		}
		return str;
	}
	/**
	 * 提取现金
	 * @param args
	 * @throws Exception
	 */
	public static void openURL(String url) {
	    try {
	      browse(url);
	    } catch (Exception e) {
	      JOptionPane.showMessageDialog(null, "Error attempting to launch web browser:\n" + e.getLocalizedMessage());
	    }
	  }

	  public static void browse(String url) throws ClassNotFoundException, IllegalAccessException,
	          IllegalArgumentException, InterruptedException, InvocationTargetException, IOException,
	          NoSuchMethodException {
	    String osName = System.getProperty("os.name", "");
	    if (osName.startsWith("Mac OS")) {
	      Class fileMgr = Class.forName("com.apple.eio.FileManager");
	      Method openURL = fileMgr.getDeclaredMethod("openURL", new Class[]{String.class});
	      openURL.invoke(null, new Object[]{url});
	    } else if (osName.startsWith("Windows")) {
	      Runtime.getRuntime().exec("rundll32 url.dll,FileProtocolHandler " + url);
	    } else { // assume Unix or Linux
	      String[] browsers = {"firefox", "opera", "konqueror", "epiphany", "mozilla", "netscape"};
	      String browser = null;
	      for (int count = 0; count < browsers.length && browser == null; count++) {
	        if (Runtime.getRuntime().exec(new String[]{"which", browsers[count]}).waitFor() == 0) {
	          browser = browsers[count];
	        }
	      }
	      if (browser == null) {
	        throw new NoSuchMethodException("Could not find web browser");
	      } else {
	        Runtime.getRuntime().exec(new String[]{browser, url});
	      }
	    }
	  }
	
  
	  
	public static String tonewcash(String uid,String oauth_token,String money,String bankaccount,String paypassword) {
		String method ="/openapi/invest/tonewcash.html";
		String params = "?";
		String str = "";
		Map<String, String> map = new TreeMap<String, String>();
		map.put("uid", uid);
		map.put("appkey", appkey);
		map.put("oauth_token", oauth_token);
		
		map.put("money", money);
		map.put("bankaccount", bankaccount);
		map.put("paypassword", paypassword);
		params = getparams(params, map);
		
		try {
			str = send(method,params);
		} catch (ProtocolException e) {
			e.printStackTrace();
		} 
		return str;
	}
    
	public static String userCreditLog(String uid, String oauth_token) {
		String method ="/zdbaoapi/account/userCreditLog.html";
		String params = "?";
		String str = "";
		Map<String, String> map = new TreeMap<String, String>();
		map.put("uid", uid);
		map.put("appkey", appkey);
		map.put("oauth_token", oauth_token);
		map.put("credit_type", "expense_change");
		map.put("page", "1");
		params = getparams(params, map);
		try {
			str = send(method,params);
		} catch (ProtocolException e) {
			e.printStackTrace();
		} 
		return str;
	}
	
	public static String recharge(String uid, String oauth_token) {
		String method ="/openapi/account/rechargeInit.html";
		String params = "?";
		String str = "";
		Map<String, String> map = new TreeMap<String, String>();
		map.put("uid", uid);
		map.put("appkey", appkey);
		map.put("oauth_token", oauth_token);
		params = getparams(params, map);
		try {
			str = send(method,params);
		} catch (ProtocolException e) {
			e.printStackTrace();
		} 
		return str;
	}
	
	public static String rechargedown(String uid, String oauth_token) {
		String method ="/zdbaoapi/account/offrechargeInit.html";
		String params = "?"; 
		String str = "";
		Map<String, String> map = new TreeMap<String, String>();
		map.put("uid", uid);
		map.put("appkey", appkey);
		map.put("oauth_token", oauth_token);
		params = getparams(params, map);
		try {
			str = send(method,params);
		} catch (ProtocolException e) {
			e.printStackTrace();
		} 
		return str;
	}
	
	public static String rechargedownSub(String uid, String oauth_token,String money,String payment) {
		String method ="/zdbaoapi/account/tooffrecharge.html";
		String params = "?"; 
		String str = "";
		Map<String, String> map = new TreeMap<String, String>();
		map.put("uid", uid);
		map.put("appkey", appkey);
		map.put("oauth_token", oauth_token);
		map.put("money", money);
		map.put("payment", payment);

		params = getparams(params, map);
		try {
			str = send(method,params);
		} catch (ProtocolException e) {
			e.printStackTrace();
		} 
		return str;
	}
	
	public static String charge(String uid, String oauth_token,String money,String payment) {
		String method ="/openapi/user/torecharge.html";
		String params = "?";
		String str = "";
		Map<String, String> map = new TreeMap<String, String>();
		map.put("uid", uid);
		map.put("appkey", appkey);
		map.put("oauth_token", oauth_token);
		map.put("money", money);
		map.put("payment",payment);
		params = getparams(params, map);
		try {
			str = send(method,params);
		} catch (ProtocolException e) {
			e.printStackTrace();
		} 
		return str;
	}
	public static String initnewcash(String uid,String oauth_token) {
		String method ="/openapi/invest/initnewcash.html";
		String params = "?";
		String str = "";
		Map<String, String> map = new TreeMap<String, String>();
		map.put("uid", uid);
		map.put("appkey", appkey);
		map.put("oauth_token", oauth_token);
		params = getparams(params, map);
	
		try {
			str = send(method,params);
		} catch (ProtocolException e) {
			e.printStackTrace();
		}
		return str;
	}

	public static  String tenderlist(String bid) {
		String method ="/openapi/invest/tenderlist.html";
		String params = "?";
		Map<String, String> map = new TreeMap<String, String>();
		map.put("bid", bid);
		map.put("appkey", appkey);
	    String str = "";
		params = getparams(params, map);
		
		try {
			str = send(method,params);
		} catch (ProtocolException e) {
			e.printStackTrace();
		}
		return str ;
	}

	public  static String investcontent(String id) {
		String method ="/openapi/invest/getcontent.html";
		String params = "?";
		Map<String, String> map = new TreeMap<String, String>();
		map.put("id", id);
		map.put("appkey", appkey);
	    String str = "";
		params = getparams(params, map);
		
		try {
			str = send(method,params);
		} catch (ProtocolException e) {
			e.printStackTrace();
		}
		return str ;
	}

	public  static String investlist(String statues,String page) {
		String method ="/openapi/invest/list.html";
		String params = "?";
		Map<String, String> map = new TreeMap<String, String>();
		map.put("page", page);
		map.put("status", statues);
		map.put("appkey", appkey);
	    String str = "";
		params = getparams(params, map);
		
		try {
			 str = send(method,params);
		} catch (ProtocolException e) {
			e.printStackTrace();
		}
		return str;
	}

	public  static String noticegetcontent(String id) {
		String method ="/openapi/notice/getcontent.html";
		String params = "?";
		Map<String, String> map = new TreeMap<String, String>();
        String str = "";
		map.put("appkey", appkey);
	    map.put("id", id);

		params = getparams(params, map);
		
		try {
			str = send(method,params);
		} catch (ProtocolException e) {
			e.printStackTrace();
		}
		return str ;
	}

	public static String noticelist(String id,String page) {
		String method ="/openapi/notice/list.html";
		String params = "?";
		Map<String, String> map = new TreeMap<String, String>();
		map.put("appkey", appkey);
		map.put("nid", id);
		map.put("page", page);
	    String str = "";
		params = getparams(params, map);
		try {
			str = send(method,params);
		} catch (ProtocolException e) {
			e.printStackTrace();
		}
		return str ;
	}
  
	public  static String collectionlist(String uid,String oauth_token,String page) {
		String method ="/openapi/sitelog/collectionlist.html";
		String params = "?";
		Map<String, String> map = new TreeMap<String, String>();
      String str = "";
	 	map.put("uid", uid);
		map.put("oauth_token", oauth_token);
		map.put("appkey", appkey);
		map.put("page", page);

		params = getparams(params, map);
		
		try {
			str = send(method,params);
		} catch (ProtocolException e) {
			e.printStackTrace();
		}
		
		return str ;
	}
    
	
	public  static String collection(String uid,String oauth_token,String page) {
		String method ="/zdbaoapi/invest/collection.html";
		String params = "?";
		Map<String, String> map = new TreeMap<String, String>();
        String str = "";
	 	map.put("uid", uid);
		map.put("oauth_token", oauth_token);
		map.put("appkey", appkey);
		map.put("page", page);
		map.put("status", "1");

		params = getparams(params, map);
		
		try {
			str = send(method,params);
		} catch (ProtocolException e) {
			e.printStackTrace();
		}
		
		return str ;
	}
  
	public  static String borrowlist(String uid ,String oauth_token,String page ) {
		String method ="/openapi/sitelog/borrowlist.html";
		String params = "?";
		Map<String, String> map = new TreeMap<String, String>();
        String str = "" ;
		map.put("uid", uid);
		map.put("oauth_token", oauth_token);
		map.put("appkey", appkey);
		map.put("status", "1");
		map.put("page", page);

		params = getparams(params, map);
		
		try {
			str = send(method,params);
		} catch (ProtocolException e) {
			e.printStackTrace();
		}
		return str ;
	}
   
	
	public  static String borrow(String uid ,String oauth_token,String page ) {
		String method ="/zdbaoapi/invest/collection.html";
		String params = "?";
		Map<String, String> map = new TreeMap<String, String>();
        String str = "" ;
		map.put("uid", uid);
		map.put("oauth_token", oauth_token);
		map.put("appkey", appkey);
		map.put("status", "1");
		map.put("page", page);

		params = getparams(params, map);
		
		try {
			str = send(method,params);
		} catch (ProtocolException e) {
			e.printStackTrace();
		}
		return str ;
	}
	
	public  static String log(String uid,String oauth_token,String page) {
		String method ="/openapi/sitelog/log.html";
		String params = "?";
		Map<String, String> map = new TreeMap<String, String>();

		map.put("uid", uid);
		map.put("oauth_token", oauth_token);
		map.put("appkey", appkey);
		map.put("page", page);
        String str = "";
		params = getparams(params, map);
		
		try {
			str = send(method,params);
		} catch (ProtocolException e) {
			e.printStackTrace();
		}
		return str ;
	}

	public  static String CashList(String uid,String oauth_token,String page) {
		String method ="/openapi/sitelog/cashlist.html";
		String params = "?";
		Map<String, String> map = new TreeMap<String, String>();

		map.put("uid", uid);
		map.put("oauth_token", oauth_token);
		map.put("appkey", appkey);
		map.put("page", page);
      String str = "";
		params = getparams(params, map);
		
		try {
			str = send(method,params);
		} catch (ProtocolException e) {
			e.printStackTrace();
		}
		return str;
	}

	public static   String rechargelist(String uid,String oauth_token,String page) {
		String method ="/openapi/sitelog/rechargelist.html";
		String params = "?";
		Map<String, String> map = new TreeMap<String, String>();
       String str = "";
		map.put("uid", uid);
		map.put("oauth_token", oauth_token);
		map.put("appkey", appkey);
		map.put("page", page);

		params = getparams(params, map);
		
		try {
			str = send(method,params);
		} catch (ProtocolException e) {
			e.printStackTrace();
		}
		return str ;
	}

	/**
	 * {"resCode":"1"}
	 */
	public  static String resetpassword(String uid ,String oauth_token, String password,String Npassword,String pas) {
		
		String method ="/openapi/account/resetpassword.html";
		String params = "?";
		Map<String, String> map = new TreeMap<String, String>();
        String str = "";
		map.put("uid", uid);
		map.put("oauth_token", oauth_token);
		map.put("appkey", appkey);
		map.put("pswd", password);
		map.put("newpswd", Npassword);
		map.put("cardNo", pas);
		params = getparams(params, map);
		
		try {
			str = send(method,params);
		} catch (ProtocolException e) {
			e.printStackTrace();
		}
		return str ;
	}

	public  static String basicUser(String oauth_token,String uid) {
		String method ="/openapi/account/basic.html";
		String params = "?";
		Map<String, String> map = new TreeMap<String, String>();

		
		map.put("appkey", appkey);
		map.put("oauth_token", oauth_token);
		map.put("uid", uid);
		params = getparams(params, map);
		String str = "";
		try {
			str = send(method,params);
		} catch (ProtocolException e) {
			e.printStackTrace();
		}
		return str;
	}
	public  static String  gaomai(String oauth_token ,String uid,String id,String money,String count,String paypassword,String pwd){
		String method ="/openapi/invest/toinvest.html";
		//http://www.xinlongct.com/openapi/invest/toinvest.html
		String params = "?";
		String str = "";
		Map<String, String> map = new TreeMap<String, String>();
		map.put("appkey", appkey);
		map.put("oauth_token", oauth_token);
		map.put("uid", uid);
		map.put("id", id);
		map.put("money", money);
		map.put("count", count);
		map.put("paypassword", paypassword);
		map.put("pwd", pwd);
		//map.put("minFlowMoney", appkey);
		
		System.out.println("appkey"+appkey+"oauth_token"+oauth_token+"uid"+uid+"id"+id+"money"+money+"count"+count+"paypassword"+paypassword+"pwd"+pwd);
	 
		params = getparams(params, map);
		
		try {
			str = send(method,params);
		} catch (ProtocolException e) {
			e.printStackTrace();
	}
		return str ;
	}
	
	
	public static String oauth_token(String username,String password) {
		String method ="/openapi/oauth/oauth_token.html";
		String params = "?";
		Map<String, String> map = new TreeMap<String, String>();
		map.put("username", username);
		map.put("password", password);
		map.put("appkey", appkey);
		params = getparams(params, map);
		String str = "";
		try {
			str = send(method,params);
		} catch (ProtocolException e) {
			e.printStackTrace();
		}
		return str;
	}
	
	/*public  static String register(String username,String password,String email) {
		String method ="/openapi/oauth/register.html";
		String params = "?";
		String str = "";
		Map<String, String> map = new TreeMap<String, String>();

		map.put("email", email);
		map.put("password", password);
		map.put("username", username);
		map.put("appkey", appkey);
		params = getparams(params, map);
		
		try {
			str =  send(method,params);
		} catch (ProtocolException e) {
			e.printStackTrace();
			System.out.println(e);
		}
		return str;
	}*/
	
	public  static String register(String username,String password) {
		String method ="/sps/portal/showLoginPage.action"; 
		String params = "?";
		String str = "";
		Map<String, String> map = new TreeMap<String, String>();

	
		map.put("password", password);
		map.put("userName", username);

		params = getparams(params, map);
		
		try {
			str =  send(method,params); 
		} catch (ProtocolException e) {
			e.printStackTrace();
			System.out.println(e);
		}
		return str;
	}
	
	public  static String choujia(String uid,String oauth_token) {
		String method ="/openapi/invest/choujiazige.html";
		String params = "?"; 
		String str = "";
		Map<String, String> map = new TreeMap<String, String>();
		map.put("oauth_token", oauth_token);
		map.put("uid", uid);
		map.put("appkey", appkey);
		params = getparams(params, map);
		  
		try {
			str =  send(method,params);
		} catch (ProtocolException e) {
			e.printStackTrace();
		}
		return str;
	}
	
	public  static String lotteryadd(String uid,String oauth_token,String award) {
		String method ="/openapi/invest/award.html";
		String params = "?"; 
		String str = ""; 
		Map<String, String> map = new TreeMap<String, String>();
		map.put("oauth_token", oauth_token);
		map.put("uid", uid);
		map.put("appkey", appkey);
		map.put("award", award);  
		params = getparams(params, map);
		 
		try {
			str =  send(method,params);
		} catch (ProtocolException e) {
			e.printStackTrace();
		}
		return str;
	}
	
	
	
	//choujia
}
