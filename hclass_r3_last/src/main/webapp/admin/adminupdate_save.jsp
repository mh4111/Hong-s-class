<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="DB.MemberVO"%>
<%@ page import="DB.MemberDAO"%>
<%@ include file="ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update_save</title>
</head>
<body>
<%	request.setCharacterEncoding("UTF-8");	%>

	<%
	try {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String zipcode = request.getParameter("zipcode");
		String address = request.getParameter("address");
		String address2 = request.getParameter("address2");
		String grade = request.getParameter("grade");
		
		MemberVO vo = new MemberVO();
		
		vo.setPw(pw);
		vo.setEmail(email);
		vo.setName(name);
		vo.setPhone(phone);
		vo.setZipcode(zipcode);
		vo.setAddress(address);
		vo.setAddress2(address2);
		vo.setGrade(grade);
		vo.setId(id);

		MemberDAO dao = new MemberDAO();
		
		dao.adminupdate(vo);
		
		response.sendRedirect("adminpage.jsp");
	} catch (Exception e) {
		response.sendRedirect("adminpage.jsp");
	}
	%>
</body>
</html>