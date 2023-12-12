package net.hb.common;

import java.sql.Connection;
import java.sql.DriverManager;


public class DB {
	public static Connection getConnection() {
		   Connection CN=null;
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url="jdbc:oracle:thin:@127.0.0.1:1521:XE";
			CN=DriverManager.getConnection(url,"system", "1234");
			//System.out.println("------ db연결 성공했습니다 23-07-18 ------ ");
		}catch(Exception ex){System.out.println("db error:"+ex);}
		return CN;
	}
}
