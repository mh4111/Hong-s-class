<%@page import="reservation.lecture.LectureVO"%>
<%@page import="reservation.lecture.LectureDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.Date" %>

<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>


<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
 <title>   </title>
 <style type="text/css">
   *{font-size: 14pt; font-weight:bold;}
   a{font-size: 14pt; text-decoration:none; color:blue; }
   a:hover{font-size: 16pt; color:blue;}
 </style>
</head>
<body>
 <%!
   Connection CN = null;
   Statement ST = null;
   PreparedStatement PST = null;
   ResultSet RS = null ;
   String msg = "";
   int OK = 0;
   
   int Gcode=0, Gpay=0, Ghit=0,  Grn=0, Grow=0;
   String Gname="",  Gtitle="", Gemail="";
   java.util.Date Gwdate=null;
   String Gdata="";  
   int Gtotal = 0 ;
   int Grepl = 0;
   //페이징및 검색
   String pnum ;             //pnum = request.getParameter("pageNum=idx역할");
   int pageNUM, pagecount;   //pageNUM=Integer.parseInt(pnum);
   					         //총데이터 316개이니까 총페이지 pagecount=32
	
   int start, end;          //슬비님선택[17]  start시작=161, end행=170
   int startpage, endpage;  //startpage=[11] ~~[17] endpage=[20]
   int temp; //[이전] [숫자]~~[숫자] [다음] 
  
   String sqry="", skey="", sval="" ;  //검색 이름/제목/메일
   String returnpage="";               //Web0712.jsp?pageNum=7
   
   //시작행번호 Gtotal이용 역순
   int Gnumber, Rnumber ; 
   
   //댓글관련 Rdata
   String Rdata="";
   int  Rrn,  Rnum, Rcode ;
   String  Rwriter,  Rcontent ;
   int Rcnt;
 %>

 <%
  try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url="jdbc:oracle:thin:@127.0.0.1:1521:XE";
	CN=DriverManager.getConnection(url,"system", "1234");
	//System.out.println("------ db연결 성공했습니다 23-07-13 ------ ");
	//out.println("<h2> ------ db연결 성공했습니다 23-07-13 ------ </h2> ");
	ST = CN.createStatement();
  }catch(Exception ex){System.out.println("db에러:"+ex);}
 %>

<%!
  //MVC1모델1=순수자바 GuestDAO.java, GuestVO.java + Web문서 ~~.jsp
  LectureDAO dao = new LectureDAO();
  LectureVO vo = new LectureVO();
%>
</body>
</html>









