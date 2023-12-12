<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/style.css?after">
<title>아이디 중복확인</title>
</head>
<body>
  <div class="wrapper">
    <h2>아이디 중복확인</h2>
    <form method="post" action="check_id.jsp" class="form" name="checkidform">
      <input type="text" name="id" placeholder="아이디" maxlength="20">
      <button type="submit">중복 확인</button>
    </form>
  </div>
</body>
</html>
