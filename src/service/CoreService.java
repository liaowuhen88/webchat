package service;

import indexMessage.IndexMessage;

import java.util.ArrayList;
import java.util.Date;  
import java.util.List;
import java.util.Map;  
import javax.servlet.http.HttpServletRequest;  

import message.resp.Article;
import message.resp.NewsMessage;
import message.resp.TextMessage;  
import course.MessageUtil;  
	  
	/** 
	 * 核心服务类 
	 *  
	 * @author liufeng 
	 * @date 2013-05-20 
	 */  
	public class CoreService {  
	    /** 
	     * 处理微信发来的请求 
	     *  
	     * @param request 
	     * @return 
	     */  
		public static  int count ;
		public static  boolean flag = true;
	    public static String processRequest(HttpServletRequest request) {  
	        String respMessage = null;
	        boolean flag = true;
	        
	        try {  
	            // 默认返回的文本消息内容   
	            String respContent = "请求处理异常，请稍候尝试！";  
	  
	            // xml请求解析   
                Map<String, String> requestMap = MessageUtil.parseXml(request);  
	  
	            // 发送方帐号（open_id）   
	            String fromUserName = requestMap.get("FromUserName");  
	            // 公众帐号   
	            String toUserName = requestMap.get("ToUserName");  
	            // 消息类型   
	            String msgType = requestMap.get("MsgType");  
	  
	            // 回复文本消息   
	            TextMessage textMessage = new TextMessage();  
	            textMessage.setToUserName(fromUserName);  
	            textMessage.setFromUserName(toUserName);  
                textMessage.setCreateTime(new Date().getTime());  
	            textMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_TEXT);  
	            textMessage.setFuncFlag(0);  
	    
	            // 文本消息   
	            if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_TEXT)) {  
	              //  respContent = "您发送的是文本消息！";
	            	String contest = requestMap.get("Content"); 
	            	if(contest.equals("1989.11.11")){
	            		count+=2;
	            		respContent = "茄子先生最爱的人是谁？";
	            	}else if(contest.equals("洋葱小姐")){
	            		count+=2;
	            		respContent = "请问洋葱小姐是谁？";
	            		
	            	}
	            	else if(contest.equals("高小玉")){
	            		count+=2;
	            		respContent = "您真厉害,您已经"+count+"积分了，再接再厉\n请问茄子先生最喜欢洋葱小姐的那些地方？";
	            		
	            	}
	            	else if(contest.equals("无厘头")){
	            		count+=2;
	            		if(count >= 10){
	            			respContent += "恭喜你获得了礼物，请电话茄子先生领取。请牢记密码\n茄子爱洋葱";	
	            		}
	            		respContent = "回答正确，继续";
	            		
	            	}
	            	else if(contest.equals("漂亮")){
	            		count+=2;
	            		if(count >= 10){
	            			respContent += "恭喜你获得了礼物，请电话茄子先生领取。请牢记密码\n茄子爱洋葱";	
	            		}
	            		respContent = "茄子先生最爱的人是谁？";
	            		
	            	}
	            	else if(contest.equals("博客")){
	            		respContent = " <a href= \"http://blog.csdn.net/lyq8479\">博客</a>";
	            	}
	            	else if(contest.equals("商场") || contest.equals("商城")){
	            		respContent = " <a href= \"http://liaowuhen.duapp.com/xinlongct/list_pic.jsp\">商场</a>";
	            	}else{
	            		if(flag){
	            			/*respContent = "谢谢您的关注！\n"; 
		                    respContent += "欢迎"+toUserName+"登陆，恭喜您获得了一次免费答题机会\n";
		                    respContent += "每道题两分，累计达到10分，有精美礼品相送\n"; 
		                    respContent += "请听题\n茄子先生的生日是哪天，注意格式为2000.01.1"; */ 
	            			respContent += "您好，欢迎关注鑫隆创投官方微信。"+
	            			" 回复以下数字了解详情 ："+
	            			"“1”、公司简介。"+
	            			"“2”、最新活动。"+
	            			"“3”、项目进展情况。"+
	            			"“4”、新手上路。"+
	            			"“5”、网站资费。"+
	            			"“6”、公司地址与联系方式。";
	            		    flag = false;
	            		}else{
	            			respContent = "回答错误！\n"; 
	            		}
	            		
	            	}
	            	
	                
	            }  
	            // 图片消息   
	            else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_IMAGE)) {  
	               
	            	respContent = "您发送的是图片消息！";  
	            	// 创建图文消息   
                     NewsMessage newsMessage = new NewsMessage();  
	            	 newsMessage.setToUserName(fromUserName);  
	            	 newsMessage.setFromUserName(toUserName);  
	            	 newsMessage.setCreateTime(new Date().getTime());  
	            	 newsMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);  
	            	 newsMessage.setFuncFlag(0);   
	                 List<Article> articleList = new ArrayList<Article>(); 
	                 Article article = new Article();  
	                 article.setTitle("微信公众帐号开发教程Java版");  
	                 article.setDescription("茄子先生，80后，微信公众帐号开发。初学者入门，希望借此机会认识更多同行！");  
	                  article.setPicUrl("http://bcs.duapp.com/liaowuhen/Penguins.jpg?sign=MBO:WrV32iUmu3D25qjBsVHB6oIM:ANQWxiIxLKtc8OjagAMqgIKyfig%3D&response-cache-control=private");  
	                  article.setUrl("www.baidu.com");  
	                 articleList.add(article);  
	                 // 设置图文消息个数   
	                 newsMessage.setArticleCount(articleList.size());  
	                 // 设置图文消息包含的图文集合   
	                  newsMessage.setArticles(articleList);  
	                 // 将图文消息对象转换成xml字符串   
	                  return respMessage = MessageUtil.newsMessageToXml(newsMessage);  

	            
	            
	            }    
	            // 地理位置消息   
	            else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_LOCATION)) {  
	                respContent = "您发送的是地理位置消息！";  
	            }  
	            // 链接消息   
	            else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_LINK)) {  
               // respContent = "您发送的是链接消息！"; 
	            	respContent = " <a href= \"http://blog.csdn.net/lyq8479\">柳峰的博客</a>"; 
	            	
	            }  
	            // 音频消息   
	            else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_VOICE)) {  
	                respContent = "您发送的是音频消息！";  
	            }  
	            // 事件推送   
	            else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_EVENT)) {  
	                // 事件类型   
	                String eventType = requestMap.get("Event");  
                // 订阅   
	                if (eventType.equals(MessageUtil.EVENT_TYPE_SUBSCRIBE)) { 
	                	count = 0;
	                    respContent = "谢谢您的关注！\n"; 
	                    respContent += "欢迎"+toUserName+"登陆，恭喜您获得了一次免费答题机会\n";
	                    respContent += "每道题两分，累计达到10分，有精美礼品相送\n"; 
	                    respContent += "请听题\n茄子先生的生日是哪天，注意格式为2000.01.1"; 
	                   
	                
	                }  
	                // 取消订阅   
	                else if (eventType.equals(MessageUtil.EVENT_TYPE_UNSUBSCRIBE)) {  
	                    // TODO 取消订阅后用户再收不到公众号发送的消息，因此不需要回复消息   
	                }  
	                // 自定义菜单点击事件   
	                else if (eventType.equals(MessageUtil.EVENT_TYPE_CLICK)) {  
	                    // TODO 自定义菜单权没有开放，暂不处理该类消息   
	                	 // 事件KEY值，与创建自定义菜单时指定的KEY值对应   
	                		                    String eventKey = requestMap.get("EventKey");  
	                		  
	                		                    if (eventKey.equals("11")) {  
	                		                        respContent = "天气预报菜单项被点击！";  
	                		                    } else if (eventKey.equals("12")) {  
	                		                        respContent = "公交查询菜单项被点击！";  
	                		                    } else if (eventKey.equals("13")) {  
	                		                        respContent = "周边搜索菜单项被点击！";  
	                		                    } else if (eventKey.equals("14")) {  
	                		                        respContent = "历史上的今天菜单项被点击！";  
	                		                    } else if (eventKey.equals("21")) {  
	                		                        respContent = "歌曲点播菜单项被点击！";  
	                		                    } else if (eventKey.equals("22")) {  
	                		                        respContent = "经典游戏菜单项被点击！";  
	                		                    } else if (eventKey.equals("23")) {  
	                		                        respContent = "美女电台菜单项被点击！";  
	                		                    } else if (eventKey.equals("24")) {  
	                		                        respContent = "人脸识别菜单项被点击！";  
	                		                    } else if (eventKey.equals("25")) {  
	                		                        respContent = "聊天唠嗑菜单项被点击！";  
	                		                    } else if (eventKey.equals("31")) {  
	                		                        respContent = "Q友圈菜单项被点击！";  
	                		                    } else if (eventKey.equals("32")) {  
	                		                        respContent = "电影排行榜菜单项被点击！";  
	                		                    } else if (eventKey.equals("33")) {  
	                		                        respContent = "幽默笑话菜单项被点击！";  
	                		                    }  
	                		                }  
	                		            }  
	            textMessage.setContent(respContent);  
	            respMessage = MessageUtil.textMessageToXml(textMessage);  
	        } catch (Exception e) {  
	            e.printStackTrace();  
	        }  
	  
	        return respMessage;  
	    }  
	}  
