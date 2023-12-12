<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/login.css">
<title>login</title>
</head>
<body>
	<div class="wrapper">
		<h2>로그인</h2>
		<form method="post" action="login_save.jsp" class="form">
			<input type="text" name="id" placeholder="아이디	">
			<input type="password" name="pw" placeholder="비밀번호">
			<label for="remember-check">
				<input type="checkbox" id="remember-check"> 아이디 저장하기
			</label>
			<input type="submit" value="로그인">
			<input type="button" onclick="location.href='join.jsp'" value="회원가입">
		</form>
	</div>
</body>
</html>