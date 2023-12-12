<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="DB.MemberVO"%>
<%@ page import="DB.MemberDAO"%>
<%@ include file="ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin_delete</title>
</head>
<body>
	<%
	try {
		String id = request.getParameter("idx");

		MemberVO vo = new MemberVO();
		MemberDAO dao = new MemberDAO();

		dao.admindelete(id);
		
		response.sendRedirect("adminpage.jsp");
	} catch (Exception e) {
		response.sendRedirect("adminpage.jsp");
	}
	%>
</body>
</html>