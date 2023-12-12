<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ page import="net.hb.guest.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%  
  guestDAO dao=new guestDAO();
  guestVO vo=new guestVO();
  Gdata = request.getParameter("idx"); 
  String Gid=request.getParameter("idx1");
  String Gcode=request.getParameter("idx2");
  vo=dao.reviewDelete(Gdata,Gid);
  
  //session.setAttribute(name, value)
  response.sendRedirect("http://localhost:8080/hclass/awsDetail.do?idx="+Gcode);
  %>
 
</body>
</html>