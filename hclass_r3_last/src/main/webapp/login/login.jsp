<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<link rel="stylesheet" href="css/login.css?after" >
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.20/dist/sweetalert2.all.min.js"></script>
<script type="text/javascript">

	function checklogin() {
		var form = document.loginform;

		//아이디의 값이 입력되지 않았다면

		if (form.id.value == "") {
			Swal.fire({
				title : '오류',
				text : '아이디를 입력해주세요.',
				icon : 'warning',
				position : 'top' // 원하는 위치로 설정하세요
			});
			//form.id.select();
			//form.id.focus();
			return false;
		}

		//아이디가 영문 소문자로만 입력되도록 검사하는 구문
		for (var i = 0; i < form.id.value.length; i++) {
			var ch = form.id.value.charAt(i);
			var reg = /^[0-9a-z]*$/;
			if (!reg.test(ch)) {
				Swal.fire({
					title : '오류',
					text : '아이디는 영문 소문자로만 입력 가능합니다.',
					icon : 'warning',
					position : 'top' // 원하는 위치로 설정하세요
				});
				//form.id.select();
				//form.id.focus;
				return false;
			}
		}

		//비밀번호 값이 없다면
		if (form.pw.value == "") {
			Swal.fire({
				title : '오류',
				text : '비밀번호를 입력해주세요.',
				icon : 'warning',
				position : 'top' // 원하는 위치로 설정하세요
			});
			//form.id.select();
			//form.id.focus;
			return false;
		}

		/* 유효성 검사를 다 통과하면 
			자바스크립트 함수내에서 submit() 호출함.*/
		form.submit();
	}

	// 엔터키가 눌렸을 때
	function enterkey() {
		if (window.event.keyCode == 13) {
			checklogin();
		}
	}

	function redirectToIndex() {
		location.href = 'http://localhost:8080/hclass/index.jsp'; // 서버 측에서 처리되도록 변경
	}
	
	// 아이디 저장하기 체크 여부 확인
	function checkRemember() {
	    var rememberCheck = document.getElementById('remember-check');
	    var idInput = document.getElementsByName('id')[0];

	    if (rememberCheck.checked) {
	        localStorage.setItem('rememberId', idInput.value);
	    } else {
	        localStorage.removeItem('rememberId');
	    }
	}

	// 페이지 로드 시 아이디 저장 여부 확인 및 적용
	function loadRememberedId() {
	    var idInput = document.getElementsByName('id')[0];
	    var rememberedId = localStorage.getItem('rememberId');

	    if (rememberedId) {
	        idInput.value = rememberedId;
	        document.getElementById('remember-check').checked = true;
	    }
	}

	// 페이지 로드 시 아이디 저장 여부 확인 및 적용
	window.onload = function() {
	    loadRememberedId();
	};

</script>
</head>
<body>
	<!-- top -->
	
	<div class="wrapper">
		<button type="button"><img src="img/back1.png" alt="back1.png" onclick="redirectToIndex()"></button>
		<h2>로그인</h2>
		<form method="post" action="login_save.jsp" class="form" name="loginform">
			<input type="text" name="id" placeholder="아이디" maxlength="20" onkeyup="enterkey()">
			<input type="password" name="pw" placeholder="비밀번호" onkeyup="enterkey()">
			<input type="checkbox" id="remember-check" class="remember-check">
			<label class="remember-label" for="remember-check"> 아이디 저장하기</label>

			<input type="button" onclick="checklogin()" value="로그인" id="loginsubmit" >
			<input type="button" onclick="location.href='join.jsp'" value="회원가입" id="joinbutton">
		</form>
	</div>
	
	<!-- footer -->
</body>
</html>