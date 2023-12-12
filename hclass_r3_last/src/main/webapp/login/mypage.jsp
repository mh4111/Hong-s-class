<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="css/mypage.css?after">
</head>
<script>
	function redirectToIndex() {
		location.href = 'http://localhost:8080/hclass/index.jsp'; // 서버 측에서 처리되도록 변경
	}
</script>
<body>
	<%
    String id = (String) session.getAttribute("user_id");
    String email = (String) session.getAttribute("user_email");
    String name = (String) session.getAttribute("user_name");
    String phone = (String) session.getAttribute("user_phone");
    String zipcode = (String) session.getAttribute("user_zipcode");
    String address = (String) session.getAttribute("user_address");
    String address2 = (String) session.getAttribute("user_address2");
    String grade = (String) session.getAttribute("user_grade");
    %>
	<div class="wrapper">
	<button type="button"><img src="img/back1.png" alt="back1.png" onclick="redirectToIndex()"></button>
		<h2>* 마이페이지 *</h2>
		<div class="userinfo">
			<div>
				<span class="head">아이디 :</span> <span class="body"><%=id%></span>
			</div>
			<div>
				<span class="head">이메일 :</span> <span class="body"><%=email%></span>
			</div>
			<div>
				<span class="head">이름 :</span> <span class="body"><%=name%></span>
			</div>
			<div>
				<span class="head">전화번호 :</span> <span class="body"><%=phone%></span>
			</div>
			<div>
				<span class="head">우편번호 :</span> <span class="body"><%=zipcode%></span>
			</div>
			<div>
				<span class="head">주소 :</span> <span class="body"><%=address%></span>
			</div>
			<div>
				<span class="head">상세주소 :</span> <span class="body"><%=address2%></span>
			</div>
			<div>
				<span class="head">등급 :</span> <span class="body"><%=grade%></span>
			</div>
		</div>
		<div class="buttons">
			<button onclick="location.href='getInfo.jsp'">정보 수정</button>
			<button onclick="location.href='http://localhost:8080/hclass/historyList.do?hid=<%=id%>'">등록 내역</button>
			<button onclick="location.href='delete_save.jsp'">회원탈퇴</button>
		</div>
	</div>
</body>
</html>
