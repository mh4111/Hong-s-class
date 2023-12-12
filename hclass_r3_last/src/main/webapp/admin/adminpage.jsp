<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="DB.MemberVO"%>
<%@ page import="DB.MemberDAO"%>
<%@ include file="ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/adminpage.css?after">
<title>admin_page</title>
<script type="text/javascript">
	function redirectToIndex() {
		location.href = 'http://localhost:8080/hclass/index.jsp'; // 서버 측에서 처리되도록 변경
	}
</script>
</head>
<body>
	<div class="wrapper">
	<button type="button"><img src="../login/img/back1.png" alt="back1.png" onclick="redirectToIndex()"></button>
	<h2>* 관리자 페이지 *</h2>
		<table>
			<tr>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>이메일</th>
				<th>이름</th>
				<th>전화번호</th>
				<th>생년월일</th>
				<th>성별</th>
				<th>우편번호</th>
				<th>주소</th>
				<th>상세주소</th>
				<th>등급</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
			<%
			MemberDAO dao = new MemberDAO();
			
			List<MemberVO> List = dao.adminupdate();
			for (MemberVO vo : List) {
			%>
			<tr>
				<td><%=vo.getId()%></td>
				<td><%=vo.getPw()%></td>
				<td><%=vo.getEmail()%></td>
				<td><%=vo.getName()%></td>
				<td><%=vo.getPhone()%></td>
				<td><%=vo.getBirth()%></td>
				<td><%=vo.getGender()%></td>
				<td><%=vo.getZipcode()%></td>
				<td><%=vo.getAddress()%></td>
				<td><%=vo.getAddress2()%></td>
				<td><%=vo.getGrade()%></td>
				<td><a href="admingetInfo.jsp?idx=<%=vo.getId()%>">수정</a></td>
				<td><a href="admindelete_save.jsp?idx=<%=vo.getId()%>">삭제</a></td>
			</tr>
			<%
			}
			%>
		</table>
	</div>
</body>
</html>