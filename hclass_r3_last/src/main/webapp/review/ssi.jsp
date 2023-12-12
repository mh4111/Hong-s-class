<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.Date"%>

<%@ page import="net.hb.guest.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<style>
</style>
<body>



	<%
		Connection CN = null;
	   Statement ST = null;
	   PreparedStatement PST = null;
	   ResultSet RS = null ;
	   String msg = "";
	   int OK = 0;

	   //댓글관련 Rdata
	   String Rdata="";
	   int  Rrn,  Rnum, Rcode ;
	   String  Rwriter,  Rcontent ;
	   String Gdata="";
	   
	   String pnum ;             //pnum = request.getParameter("pageNum=idx역할");
	   int pageNUM, pagecount;   //pageNUM=Integer.parseInt(pnum);
	   					         //총데이터 316개이니까 총페이지 pagecount=32
		
	   int start, end;          //슬비님선택[17]  start시작=161, end행=170
	   int startpage, endpage;  //startpage=[11] ~~[17] endpage=[20]
	   int temp; //[이전] [숫자]~~[숫자] [다음] 
	   int Gtotal=0;
	   String returnpage="";  
	   
	   String Rid="", Rcontents="";
	   Date Rdate=null;
	%>

	<%
  try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url="jdbc:oracle:thin:@127.0.0.1:1521:XE";
	CN=DriverManager.getConnection(url,"system", "1234");
	System.out.println("------ db연결 성공했습니다 23-07-13 ------ ");
	//out.println("<h2> ------ db연결 성공했습니다 23-07-13 ------ </h2> ");
	ST = CN.createStatement();
  }catch(Exception ex){System.out.println("db에러:"+ex);}

	
	%>



</body>
</html>