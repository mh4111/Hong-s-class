<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>idCheckForm.jsp</title>
<link rel="stylesheet" href="css/idcheck.css?after">
<script>
	function checkId() {
		var id = document.getElementById("id").value;

		// 아이디의 값이 입력되지 않았다면
		if (id === "") {
			alert('아이디를 입력해주세요.');
			form.id.select();
			form.id.focus();
			return false;
		}

		// 아이디의 유효성을 검사하는 정규식
		var reg = /^(?=.*[a-z])[a-z0-9]{4,16}$/;
		if (!reg.test(id)) {
			alert('아이디는 영문 소문자와 숫자로 4~16자리 이내로 입력하세요.');
			form.id.select();
			form.id.focus();
			return false;
		}

		// 공백 또는 특수문자가 포함되었는지 검사
		if (id !== id.trim() || /[^a-z0-9]/.test(id)) {
			alert('아이디는 영문 소문자와 숫자만 사용 가능합니다.');
			form.id.select();
			form.id.focus();
			return false;
		}

		// 아이디 중복 체크를 진행하는 로직 (여기서는 생략)
		// 실제로는 서버와 통신하여 중복 여부를 확인해야 합니다.

		// 중복 체크에 성공했다면
		form.submit();
	}
</script>
</head>
<body>
	<!-- <div style="text-align: center"> -->
	<div class="wrapper">
		<h2>* 아이디 중복확인 *</h2>
		<form method="post" name="idcheckform" id="disEnter" action="idCheckProc.jsp" onsubmit="return blankCheck(this)">
			<input type="text" name="id" id="id" maxlength="16"	placeholder="영문 소문자와 숫자 4~16자리" autofocus>
			<input type="button" onclick="checkId()" value="중복확인">
		</form>
	</div>
	<script>
		const form = document.getElementById('disEnter');
		form.addEventListener('keypress', function(e) {
			if (e.keyCode === 13) {
				e.preventDefault();
			}
		});
	</script>

</body>
</html>