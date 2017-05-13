package service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import org.apache.log4j.Logger;


public class MysqlBasic {  
   public static Logger logger = Logger.getLogger("java");  
	public static void database() throws IOException {
		Connection connection = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
		/*****1. 填写数据库相关信息(请查找数据库详情页)*****/
		String databaseName = "zbpZRckgUbcdjJnMOwPT"; 
		String host = "sqld.duapp.com";
		String port = "4050";
		String username = "WrV32iUmu3D25qjBsVHB6oIM";//用户名(api key);
		String password = "vb54aj9eD2xMVFeQqcGaG9uIHfIcAn6R";//密码(secret key)
		String driverName = "com.mysql.jdbc.Driver";
		String dbUrl = "jdbc:mysql://";
		String serverName = host + ":" + port + "/";
		String connName = dbUrl + serverName + databaseName;
		 
		/******2. 接着连接并选择数据库名为databaseName的服务器******/
		Class.forName(driverName);
		connection = DriverManager.getConnection(connName, username, password);
		stmt = connection.createStatement();
		/*至此连接已完全建立，就可对当前数据库进行相应的操作了*/
		/* 3. 接下来就可以使用其它标准mysql函数操作进行数据库操作*/
		//创建一个数据库表  
		sql = "create table if not exists test_mysql(" + 
				        "id int primary key auto_increment," + 
				        "no int, "+
				        "name varchar(1024)," + 
				        "key idx_no(no))";
		logger.info(sql);
		stmt.execute(sql);
		} catch (Exception e) {
				    e.printStackTrace();
		}
		}
	public static void main(String args[]){
		logger.info("message");
	}
		}