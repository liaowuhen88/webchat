package api.service;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import api.ApiMethod;

public class Service {
	
   public  String getList_pic(String method,String page){
	   String str = ApiMethod.investlist(method,page);
       JSONObject json = JSONObject.fromObject(str);
       JSONArray list = json.getJSONArray("investList");
       String list_pic = "";
       for(int i=0;i<list.size();i++){
      	 JSONObject pic = list.getJSONObject(i);
      	 System.out.println(pic);
      	 String id = pic.getString("id");
      	 String Ytitle = pic.getString("title");
      	 int length = Ytitle.length()>10?11:Ytitle.length();
      	 String title = Ytitle.substring( 0, length);  
      	 String account = pic.getString("account");
      	 String apr = pic.getString("apr");
      	 String biaoType = pic.getString("biaoType");
      	 String islib = pic.getString("is_mb");
      	 String awardHtml = "没有信息";
      	 String award = pic.getString("award");
      	 String time_limit = "";
      	 String name = pic.getString("scale");
      	 if(award.equals("0")){
      		 awardHtml = "无";
      	 }else if(award.equals("bl")){
      		 awardHtml = pic.getString("award_account");
      	 }else if(award.equals("gd")){
      		 awardHtml = pic.getString("funds");
      	 }
      	 
      	 String invest_type = pic.getString("invest_type");
      	 if(invest_type.equals("1")){
      		 time_limit = pic.getString("time_limit_day")+"天";
      	 }else if(invest_type.equals("2")){
      		 time_limit = "系统自动还款";
      	 }else {
      		 time_limit = pic.getString("time_limit")+"月";
      	 }
      	 String picc = pic.getString("pic");
      	 if(!picc.startsWith("http:")){
      		picc = "http://www.xinlongct.com/imgurl.html?userid=5447&size=middle" ;
      	 }
      	 
      	  list_pic += "<a href=\"touzi_m.jsp?name="+name+"&biaoType="+biaoType+"&islib="+islib+"&id="+id+"&apr="+apr+"&awardHtml="+awardHtml+"&time_limit="+time_limit.substring(0,time_limit.length()-1)+" \">"+
      			   "<div class=\"list_box\">"+
      	            "<div class=\"list_box_l\"><img src=\""+picc+"\">" +
      	            "</div>"+
 
      	            "<div class=\"list_box_r\"> "+
      	            "<div class=\"list_box_r_top\">";
      	  if("1".equals(islib )){
      		list_pic +=  title+"<img class=\"islib\" src=\"http://www.xinlongct.com/themes/soonmes_xinlongdai/images/lock.png\">" ;
      	  }else {
      		list_pic += title ;
      	  }
      	            
      	      list_pic +="</div>"+
                   "<div class=\"list_box_r_m\">"+
			        "<div class=\"list_r_box list_r_a\">"+
			              "<div class=\"list_box_r_je\">¥"+account +"</div>"+
			              "<div class=\"list_box_r_nam\">金额</div>"+
			        
			        "</div>"+
			        "<div class=\"list_r_box list_r_b\">" +
			            "<div class=\"list_box_r_je\">"+apr+"%</div>"+
			            "<div class=\"list_box_r_nam\">年利率</div>"+
			        
			        "</div>" +
			        "<div class=\"list_r_box list_r_c\">" +
			              "<div class=\"list_box_r_je\">"+awardHtml +"%</div>"+
			              "<div class=\"list_box_r_nam\">奖励</div>"+
			        

			        "</div>"+
			        "<div class=\"list_r_box list_r_d\">" +
			            "<div class=\"list_box_r_je\">"+time_limit+"</div>"+
			             " <div class=\"list_box_r_nam\">期限</div>" +
			        
			       " </div>" +
			       //" <div class=\"list_r_e\">  <a href=\"touzi_m.jsp?id="+id+"&scale='"+scale+"'\"><img src=\"image/e.jpg\"></a>  </div>"+
			    
			     "</div>" +
     
			     "<div class=\"list_box_r_bot\">" +
			         " <div class=\"list_box_r_box_a\">完成度</div>" +
			          "<div class=\"list_box_r_bor_b\">" +
			          "<span  class=\"bar_span\"  style=\"width:"+name+"%;\"> </span>" +
			          "</div>" +
			         " <div class=\"list_box_r_box_a\">"+name+"%</div>" +
			     "</div>"+
			     
			" </div>" +

       " </div>   ";
       
     }
    list_pic += "<div class=\"left\"  >"+
            "</div> ";  
    
   return list_pic;
   }
   
   public String verify (String str){
	  // String result = "";
	   if(str.startsWith("{") || str.startsWith("[")){
		   return true+"" ;
	   }
	    String[] list = str.split("&");
	    String oauth_token = list[0].split("=")[1];
	    String user_id = list[1].split("=")[1];
	    if(!oauth_token.equals("0")){
		    return str;
	    }else{
	    	 if("0".equals(user_id)){
	    		 if(list.length == 2){
	    			return   "账号密码不匹配"; 
	    		 }else {
	    			 return   "授权已经过期，请重新登录";   //过期
	    		 }
	    	 }else if ("12".equals(user_id)){
	    		String me = list[2];
	    		String[] array = me.split("=");
	    		if(array[0] == "islock"){
	    			return "用户被锁定";
	    		}else {
	    			return "用户被关闭";
	    		}
	    	 }
	    }
	    return "";
	   
   }

   public  String getNoticelist(String messager,String page){
	   //{"addtime":"2014-05-04 16:06:44","id":305,"title":"第三届大赛第三周周赛获奖名单"}
	   String content = ApiMethod.noticelist(messager,page);
	   JSONObject json = JSONObject.fromObject(content);
       JSONArray list = json.getJSONArray("noticeList");
       String str = "";
      // str += "<div><ul>";
       for(int i=0;i<list.size();i++){
    	   JSONObject notice = list.getJSONObject(i);
    	   String addtime = notice.getString("addtime");
    	   String id = notice.getString("id");
    	   String title = notice.getString("title");
    	   str += "<li><a href=\"show_gonggao.jsp?id="+id+"\"><span class=\"list_m_tit\">" +title +
    			   "</span><span class=\"list_m_time\">"+addtime+"</span></a></li>";
    	               
       }
       //str += "</ul></div>";
       return str;
   }
   public String getCashList(String uid,String oauth_token,String page){
	   String content = ApiMethod.CashList(uid, oauth_token, "1");
	   System.out.println(content);
	   JSONObject contentJson = JSONObject.fromObject(content);
	   Iterator<String> keys= contentJson.keys();
	   String str = "";
	   	while(keys.hasNext()){
	   		String key = keys.next();
	   		if("oauth_token".equals(key)){
	   			String oauth = contentJson.getString("oauth_token");
	   			if("0".equals(oauth)){
	   				return "0";
	   			}
	   		}else if("cashList".equals(key)){
	   			JSONArray collectionList = contentJson.getJSONArray(key);
	   			for(int i=0;i<collectionList.size();i++){
	   			
	   				JSONObject collection = collectionList.getJSONObject(i);
	   				String bank_name = collection.getString("bank_name");
	   				String account = collection.getString("account");
	   				String credited = collection.getString("credited");
	   				String total = collection.getString("total");
	   			    String fee = collection.getString("fee");
	   			    String status = collection.getString("status");
	   			    String verify_remark = collection.getString("verify_remark");
	   			   
	   			    // 1为成功，2失败，0为审核中,3用户取消
	   			    if("1".equals(status)){
	   			    	status = "成功";
	   			    }else if("2".equals(status)){
	   			    	status = "失败";
	   			    }else if("3".equals(status)){
	   			    	status = "用户取消";
	   			    }else if("0".equals(status)){
	   			    	status = "审核中";
	   			    }
	   			    //String coll = collection.getString("collection");
	   			    String addtime = collection.getString("addtime");
	   			    String time = Service.timeUtil(addtime);
	   			    String statues  = "";
	   			    String col = "";
	   			    if(i%2==1){
	   			    	col = "background:#CCC;";
	   			    }else {
	   			    	col = "";
	   			    }
	 
				  str += "<table border=\"0\" width=\"96%\" cellpadding=\"0\" cellspacing=\"0\" style=\"margin:10px auto;"+col+">"+
				     "<tr class=\"daishou_title\">"+
				     
				      " <td width=\"50%\" class=\"tl orange\" style=\"margin:10px auto;\">¥"+total +"</td>"+
				      " <td width=\"50%\" class=\"tr\"><span class=\"green_box\">"+status+"</span></td>"+
			
				       
				    " </tr>"+
				    " <tr> "+
				     "  <td class=\"tl\">到账<span class=\"orange\">¥:"+credited+"</span></td>"+
				      " <td class=\"tr\">手续费<span class=\"orange\">¥:"+fee+"</span></td>"+
				    " </tr> "+
				     
			
			
				      " <tr>"+
				       "<td class=\"tl\">"+bank_name +"<span class=\"orange\">(9296)</span></td>"+
				      " <td class=\"tr\">"+time+"</td>"+
				    " </tr>  "+
				     
				  " </table>";

	   			  
	   			  
	   			} 
	   		}
	   	}
	  return str ;
	   
	   
	   
   }
   public String getCollection(String uid,String oauth_token,String page){
	   
	   String content = ApiMethod.collectionlist(uid,oauth_token,page);
	   System.out.println(content);
	   JSONObject contentJson = JSONObject.fromObject(content);
	   String str = "";
	   Iterator<String> keys= contentJson.keys();
	  	while(keys.hasNext()){
	  		String key = keys.next();
	  		if("oauth_token".equals(key)){
	  			String oauth = contentJson.getString("oauth_token");
	  			if("0".equals(oauth)){
	  			return "0";	
	  			}
	  		}else if("collectionList".equals(key)){
	  			JSONArray collectionList = contentJson.getJSONArray(key);
	  			for(int i=0;i<collectionList.size();i++){
	  				JSONObject collection = collectionList.getJSONObject(i);
	  				String borrow_name = collection.getString("borrow_name").substring(2,12);
	  				String repay_time = collection.getString("repay_time");
	  				Date date = new Date(Long.valueOf(repay_time)*1000);
	  				SimpleDateFormat df2 = new SimpleDateFormat("yyyy-MM-dd");
	  				String time = df2.format(date);
	  			    String repay_account = collection.getString("repay_account");
	  			    String status = collection.getString("status");
	  			    String statues  = "";
	  			    if("0".equals(status)){
	  			    	statues = "等待还款";
	  			    }else if("".equals(status)){
	  			    	statues = "已还款";
	  			    }
	  			    String col = "";
	  			    if(i%2==1){
	  			    	col = "background:#CCC;";
	  			    }else {
	  			    	col = "";
	  			    }
	
				  str += "<table border=\"0\" width=\"96%\" cellpadding=\"0\" cellspacing=\"0\" style=\"margin:10px auto;"+col+">"+
				      "<tbody><tr class=\"daishou_title\">"+
				      "<td  colspan=\"2\"  class=\"tl\" width=\"75%\">"+borrow_name+"<span></span></td>"+
				      "<td  colspan=\"2\" class=\"tr\" width=\"25%\">"+time+"</td>"+
				      "</tr>"+
				     
				     " <tr class=\"daishou_title\">"+
				    "  <td width=\"25%\" class=\"tc\">总金额</td>" +
				    "  <td width=\"25%\" class=\"tc bl\">¥"+repay_account +"</td>"+
				    "  <td width=\"25%\" class=\"tc bl\">状态</td>"+
				    "  <td width=\"25%\" class=\"tc bl\">"+statues +"</td>"+
			
				   " </tr>"+     	 
				     
				  " </table>" ;
	  			}
	  		}
	  	}
	  	return str ;
   }
public String getCollectionH(String uid,String oauth_token,String page){
	   
	   String content = ApiMethod.collection(uid,oauth_token,page);
	   DecimalFormat df = new DecimalFormat("#.00");
	   JSONObject contentJson = JSONObject.fromObject(content);
	   String str = "";
	   Iterator<String> keys= contentJson.keys();
	  	while(keys.hasNext()){
	  		String key = keys.next();
	  		if("oauth_token".equals(key)){
	  			String oauth = contentJson.getString("oauth_token");
	  			if("0".equals(oauth)){
	  			return "0";	
	  			}
	  		}else if("collectList".equals(key)){
	  			JSONArray collectionList = contentJson.getJSONArray(key);
	  			for(int i=0;i<collectionList.size();i++){
	  				JSONObject collection = collectionList.getJSONObject(i);
	  				String borrow_name = collection.getString("borrow_name").substring(2,12);
	  				String repay_time = collection.getString("repay_time");
	  				Date date = new Date(Long.valueOf(repay_time)*1000);
	  				SimpleDateFormat df2 = new SimpleDateFormat("yyyy-MM-dd");
	  				String time = df2.format(date);
	  			    String repay_account = df.format(Double.valueOf(collection.getString("repay_account")));
	  			   // String status = collection.getString("status");
	  			    String statues  = "已收款";
	  			   /* if("0".equals(status)){
	  			    	statues = "等待还款";
	  			    }else if("".equals(status)){
	  			    	statues = "已还款";
	  			    }*/
	  			    String col = "";
	  			    if(i%2==1){
	  			    	col = "background:#CCC;";
	  			    }else {
	  			    	col = "";
	  			    }
	
				  str += "<table border=\"0\" width=\"96%\" cellpadding=\"0\" cellspacing=\"0\" style=\"margin:10px auto;"+col+">"+
				      "<tbody><tr class=\"daishou_title\">"+
				      "<td  colspan=\"2\"  class=\"tl\" width=\"75%\">"+borrow_name+"<span></span></td>"+
				      "<td  colspan=\"2\" class=\"tr\" width=\"25%\">"+time+"</td>"+
				      "</tr>"+
				     
				     " <tr class=\"daishou_title\">"+
				    "  <td width=\"25%\" class=\"tc\">总金额</td>" +
				    "  <td width=\"25%\" class=\"tc bl\">¥"+repay_account +"</td>"+
				    "  <td width=\"25%\" class=\"tc bl\">状态</td>"+
				    "  <td width=\"25%\" class=\"tc bl\">"+statues +"</td>"+
			
				   " </tr>"+     	 
				     
				  " </table>" ;
	  			}
	  		}
	  	}
	  	return str ;
   }
   public String getLog(String uid,String oauth_token,String page){
	    
	   String content = ApiMethod.log(uid,oauth_token,page);   
	   JSONObject contentJson = JSONObject.fromObject(content);
	   Iterator<String> keys= contentJson.keys();
	   String str = "";
	   while(keys.hasNext()){
			String key = keys.next();
			if("oauth_token".equals(key)){
				String oauth = contentJson.getString("oauth_token");
				if("0".equals(oauth)){
					return "0";
					//String oauth_error_msg = json.getString("oauth_error_msg");
		
				}
			}else if("cashLogList".equals(key)){
				JSONArray collectionList = contentJson.getJSONArray(key);
				for(int i=0;i<collectionList.size();i++){
					JSONObject collection = collectionList.getJSONObject(i);
					String remark = collection.getString("remark");
					String type = collection.getString("type");
					String money = collection.getString("money");
					String total = collection.getString("total");
				    String use_money = collection.getString("use_money");
				    String no_use_money = collection.getString("no_use_money");
				    String coll = collection.getString("collection");
				    String addtime = collection.getString("addtime");
				    String statues  = "";
				    String col = "";
				    if(i%2==1){
				    	col = "background:#CCC;";
				    }else {
				    	col = "";
				    }
       
				  
        		 str += "<table border=\"0\" width=\"96%\" cellpadding=\"0\" cellspacing=\"0\" style=\"margin:10px auto;"+col+"\">" +
	    
	                      "<tr class=\"daishou_title\">"+
	                      "<td colspan=\"2\" class=\"tl\">"+type+"<span></span></td>"+
	                       "<td colspan=\"2\" class=\"tr\">"+addtime+"</td>"+
	                        "</tr>"+
	  
	                        "<tr class=\"daishou_title\"> "+
	                        " <td width=\"25%\" class=\"tc\">总金额<br>¥"+total +"</td>"+
	                        " <td width=\"25%\" class=\"tc bl\">可用金额<br>¥"+use_money+"</td>"+
						    "<td width=\"25%\" class=\"tc bl\">冻结金额<br>¥"+no_use_money+"</td>"+
						   " <td width=\"25%\" class=\"tc bl\">操作金额<br>¥"+money +"</td>"+
					
						 " </tr>"+
						"</table>";
			 	} 
			}
		}
	   return str ;
   }
   public static String timeUtil(String time){
	    Date date = new Date(Long.valueOf(time)*1000);
		SimpleDateFormat df2 = new SimpleDateFormat("yyyy-MM-dd");
		return  df2.format(date);
   }
}
