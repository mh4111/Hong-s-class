<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>

<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>

<%@ page import="java.text.SimpleDateFormat" %>

<%@ page import="common.*" %> 





<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
 <title>   </title>
</head>
<body>
 <%!
	Connection CN = null;
	Statement ST = null;
	PreparedStatement PST = null;
	ResultSet RS = null ;
	String msg = "";
	int OK = 0;
   
	int Gtotal;
	String sqry, skey, sval, returnpage;
	SimpleDateFormat sdf;
	Date dt;
	
	int no, count;
	String title, name;
	
	String pnum;
	int pageNUM, pagecount, listcount, temp;
	int start, startpage, end, endpage;    
	   
 	String keyword;
 %>

 <%
  try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url="jdbc:oracle:thin:@127.0.0.1:1521:XE";
	CN=DriverManager.getConnection(url,"system", "1234");
	System.out.println("------ db연결 성공했습니다 23-07-31 ------ ");
	ST = CN.createStatement();
  }catch(Exception ex){System.out.println("db에러:"+ex);}
 %>

<%!
  //MVC1모델1=순수자바 GuestDAO.java, GuestVO.java + Web문서 ~~.jsp

%>
</body>
</html>









