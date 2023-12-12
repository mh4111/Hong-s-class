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
 	request.setCharacterEncoding("UTF-8");
    String id=request.getParameter("id");
    String code=request.getParameter("code");
	String contents=request.getParameter("contents");
	String score=request.getParameter("reviewStar");
 
 	guestVO vo = new guestVO();
 	vo.setId(id);
 	vo.setCode(code);
 	vo.setContents(contents);
 	vo.setScore( Integer.parseInt(score));
 	
 	guestDAO dao=new guestDAO();
 	dao.reviewInsert(vo);
 	
 	response.sendRedirect("http://localhost:8080/hclass/awsDetail.do?idx="+code);
 	
 %>


	
</body>
</html>