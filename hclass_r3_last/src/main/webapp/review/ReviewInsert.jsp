<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Save</title>
</head>
<body>
	
		
 <%
    String id=request.getParameter("id");
    String code=request.getParameter("code");
	String contents=request.getParameter("contents");
 
 
 	guestVO vo = new guestVO();
 	vo.setId(id);
 	vo.setCode(code);
 	vo.setContents(contents);
 	
 	guestDAO dao=new guestDAO();
 	dao.reviewInsert(vo);
 	
 	System.out.println(1);
 	response.sendRedirect("http://localhost:8080/hclass/awsDetail.do?idx="+code);
 	System.out.println(2);
 	
 %>


	
</body>
</html>