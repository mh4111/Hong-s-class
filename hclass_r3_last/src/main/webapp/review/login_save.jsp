<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="net.hb.guest.guestVO"%>
<%@ page import="net.hb.guest.guestDAO"%>
<%@ include file="ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login_save</title>
</head>
<body>
	<%
	try {
		String id = request.getParameter("id");
		int pw = Integer.parseInt(request.getParameter("pw"));

		guestVO vo = new guestVO();
		guestDAO dao = new guestDAO();

		vo = dao.login(id, pw);

		session.setAttribute("user_id", vo.getId());
		

		response.sendRedirect("classReply.jsp");
	} catch (Exception e) {
		
	}
	%>
</body>
</html>