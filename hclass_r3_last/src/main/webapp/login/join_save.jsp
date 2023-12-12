<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="DB.MemberVO"%>
<%@ page import="DB.MemberDAO"%>
<%@ include file="ssi.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join_save</title>
</head>
<body>
	<%
	try {
		request.setCharacterEncoding("UTF-8");

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String birth = request.getParameter("birth");
		String gender = request.getParameter("gender");
		String zipcode = request.getParameter("zipcode");
		String address = request.getParameter("address");
		String address2 = request.getParameter("address2");
		String grade = request.getParameter("grade");

		MemberVO vo = new MemberVO();
		vo.setId(id);
		vo.setPw(pw);
		vo.setEmail(email);
		vo.setName(name);
		vo.setPhone(phone);
		vo.setBirth(birth);
		vo.setGender(gender);
		vo.setZipcode(zipcode);
		vo.setAddress(address);
		vo.setAddress2(address2);
		vo.setGrade(grade);

		MemberDAO dao = new MemberDAO();
		dao.join(vo);
		response.sendRedirect("join_success.jsp");
	} catch (Exception e) {
		response.sendRedirect("join_fail.jsp");
	}
	%>
</body>
</html>