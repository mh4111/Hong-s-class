<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.text.DecimalFormat"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> common </title>
</head>
<body>
<%






	Connection CN = null;
	Statement ST = null;
	PreparedStatement PST = null;
	ResultSet RS = null ;
	String msg = "";
	int OK = 0;

	int Hprice=0, Hscore=0,  Hcnt=0, Hpeo=0;
	Double Havg=0.0;
	String Hcode="", Htitle="", Himg="";   
	
	int Gtotal = 0 ;
	String pnum;
	int pageNUM, pagecount;
    int start, end;						
    int startpage=0, endpage=0;
    int temp;
    
    
    String sqry="", sval="",skey="";
    String returnpage="";
	
  try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url="jdbc:oracle:thin:@127.0.0.1:1521:XE";
	CN=DriverManager.getConnection(url,"system", "1234");
	//System.out.println("------ db연결 성공했습니다 23-07-13 ------ ");
	//out.println("<h2> ------ db연결 성공했습니다 23-07-13 ------ </h2> ");
	ST = CN.createStatement();
  }catch(Exception ex){System.out.println("db에러:"+ex);}
  
  DecimalFormat df = new DecimalFormat("#,###");
  DecimalFormat av = new DecimalFormat("0.0");
%>
</body>
</html>