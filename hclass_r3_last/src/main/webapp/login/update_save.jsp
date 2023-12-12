<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="DB.MemberVO"%>
<%@ page import="DB.MemberDAO"%>
<%@ include file="ssi.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update_save</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.20/dist/sweetalert2.all.min.js"></script>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	%>

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

		MemberVO vo = new MemberVO();

		vo.setPw(pw);
		vo.setEmail(email);
		vo.setName(name);
		vo.setPhone(phone);
		vo.setZipcode(zipcode);
		vo.setAddress(address);
		vo.setAddress2(address2);
		vo.setId(id);

		MemberDAO dao = new MemberDAO();

		dao.update(vo);

		session.setAttribute("user_name", name);
	%>
	<script>
		Swal.fire({
			  title: '수정이 완료되었습니다.',
			  icon: 'success',
			  position: 'top',
			  showConfirmButton: false,
			  timer: 1500
            }).then(() => {
                location.href = 'mypage.jsp';
            });
        </script>
	<%
	} catch (Exception e) {
	response.sendRedirect("update_fail.jsp");
	}
	%>
</body>
</html>