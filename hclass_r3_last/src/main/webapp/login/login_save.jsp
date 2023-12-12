<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="DB.MemberVO"%>
<%@ page import="DB.MemberDAO"%>
<%@ include file="ssi.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login_save</title>
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.20/dist/sweetalert2.all.min.js"></script>
</head>
<body>
	<%
	try {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		MemberVO vo = new MemberVO();
		MemberDAO dao = new MemberDAO();

		vo = dao.login(id, pw);

		session.setAttribute("user_id", vo.getId());
		session.setAttribute("user_email", vo.getEmail());
		session.setAttribute("user_name", vo.getName());
		session.setAttribute("user_phone", vo.getPhone());
		session.setAttribute("user_zipcode", vo.getZipcode());
		session.setAttribute("user_address", vo.getAddress());
		session.setAttribute("user_address2", vo.getAddress2());
		session.setAttribute("user_grade", vo.getGrade());

		response.sendRedirect("../index.jsp"); // 페이지이동
	} catch (Exception e) {
	%>
	<script>
            Swal.fire({
                title: '실패',
                text: '아이디 또는 비밀번호가 일치하지 않습니다.',
                icon: 'error',
                position: 'top'
            }).then(() => {
                location.href = 'login.jsp';
            });
</script>
	<%
	}
	%>

</body>
</html>