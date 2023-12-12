<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join</title>
<link rel="stylesheet" href="css/join.css?after">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.20/dist/sweetalert2.all.min.js"></script>
<script	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	//주소 api
	function kakaopost() {
		new daum.Postcode({
			oncomplete : function(data) {
				document.querySelector("#zipcode").value = data.zonecode;
				document.querySelector("#address").value = data.address
			}
		}).open();
	} //주소 end

	//id 중복체크
	function idCheck() {
		//새창 만들기
		window.open("idCheckForm.jsp", "idwin", "width=500, height=350");
	}

	//id 입력칸 클릭시 알림창
	function idclick() {
		alert("중복확인을 해주세요.")
	}//end

	// 유효성 검사 메서드
	function checkjoin() {
		var form = document.joinform;
		// 정규식
		// 이름
		var regName = /^[가-힣a-zA-Z]{2,15}$/;
		// 이메일
		var regEmail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
		// 년도
		var regBirth = /^[0-9]{8}$/;
		// 번호
		var regPhone = /^[0-9]{9,11}$/;
		// 성별
		var regGender = /^[1-4]$/;

		//아이디 확인
		if (form.id.value == "") {
			Swal.fire({
				title : '오류',
				text : '아이디를 입력해주세요.',
				icon : 'warning',
				position : 'top' // 원하는 위치로 설정하세요
			});
			//form.id.focus();
			return false;
		}

		//비밀번호 확인
		if (form.pw.value == "") {
			Swal.fire({
				title : '오류',
				text : '비밀번호를 입력하세요.',
				icon : 'warning',
				position : 'top' // 원하는 위치로 설정하세요
			});
			//form.pw.focus();
			return false;
		}

		//비밀번호와 아이디 비교
		else if (form.pw.value == form.id.value) {
			Swal.fire({
				title : '오류',
				text : '아이디와 동일한 비밀번호를 사용할 수 없습니다.',
				icon : 'warning',
				position : 'top' // 원하는 위치로 설정하세요
			});
			//alert("아이디와 동일한 비밀번호를 사용할 수 없습니다.")
			form.pw.focus();
			return false;
		}

		//비밀번호 확인 확인
		if (form.cpw.value == "") {
			Swal.fire({
				title : '오류',
				text : '비밀번호 확인을 입력하세요.',
				icon : 'warning',
				position : 'top' // 원하는 위치로 설정하세요
			});
			//alert("비밀번호 확인을 입력하세요.")
			form.cpw.focus();
			return false;
		}

		//비밀번호 확인
		else if (form.cpw.value !== form.pw.value) {
			Swal.fire({
				title : '오류',
				text : '비밀번호가 일치하지 않습니다.',
				icon : 'warning',
				position : 'top' // 원하는 위치로 설정하세요
			});
			//alert("비밀번호가 일치하지 않습니다.")
			form.cpw.focus();
			return false;
		}

		//메일주소 확인
		if (form.email.value.length == 0) {
			Swal.fire({
				title : '오류',
				text : '메일주소를 입력하세요.',
				icon : 'warning',
				position : 'top' // 원하는 위치로 설정하세요
			});
			//alert("메일주소를 입력하세요.")
			form.email.focus();
			return false;
		}

		else if (!regEmail.test(form.email.value)) {
			Swal.fire({
				title : '오류',
				text : '잘못된 이메일 형식입니다.',
				icon : 'warning',
				position : 'top' // 원하는 위치로 설정하세요
			});
			//alert("잘못된 이메일 형식입니다.")
			form.email.focus();
			return false;
		}

		//이름 확인 = 한글과 영어만 가능하도록
		if (form.name.value == "") {
			Swal.fire({
				title : '오류',
				text : '이름을 입력하세요.',
				icon : 'warning',
				position : 'top' // 원하는 위치로 설정하세요
			});
			//alert("이름을 입력하세요.")
			form.name.focus();
			return false;
		}

		else if (!regName.test(form.name.value)) {
			Swal.fire({
				title : '오류',
				text : '최소 2글자 이상, 한글과 영어만 입력하세요.',
				icon : 'warning',
				position : 'top' // 원하는 위치로 설정하세요
			});
			//alert("최소 2글자 이상, 한글과 영어만 입력하세요.")
			form.name.focus();
			return false;
		}

		//번호확인
		if (form.phone.value == "") {
			Swal.fire({
				title : '오류',
				text : '번호를 입력하세요.',
				icon : 'warning',
				position : 'top' // 원하는 위치로 설정하세요
			});
			//alert("번호를 입력하세요.")
			form.phone.focus();
			return false;
		}

		else if (!regPhone.test(form.phone.value)) {
			Swal.fire({
				title : '오류',
				text : '올바른 번호를 입력하세요.',
				icon : 'warning',
				position : 'top' // 원하는 위치로 설정하세요
			});
			//alert("올바른 번호를 입력하세요.")
			form.phone.focus();
			return false;
		}

		//생일 확인
		if (form.birth.value == "") {
			Swal.fire({
				title : '오류',
				text : '생년월일을 입력하세요.',
				icon : 'warning',
				position : 'top' // 원하는 위치로 설정하세요
			});
			//alert("생년월일을 입력하세요.")
			form.birth.focus();
			return false;
		}

		else if (!regBirth.test(form.birth.value)) {
			Swal.fire({
				title : '오류',
				text : '년도를 정확하게 입력하세요.',
				icon : 'warning',
				position : 'top' // 원하는 위치로 설정하세요
			});
			//alert("년도를 정확하게 입력해주세요.")
			form.birth.focus();
			return false;
		}

		else if (!(form.birth.value >= 19000101 && form.birth.value <= 20241231)) {
			Swal.fire({
				title : '오류',
				text : '년도를 정확하게 입력하세요.',
				icon : 'warning',
				position : 'top' // 원하는 위치로 설정하세요
			});
			//alert("년도를 정확하게 입력해주세요.")
			//fomr.birth.focus();
			return false;
		}

		//성별 확인
		if (form.gender.value == "") {
			Swal.fire({
				title : '오류',
				text : '성별을 입력하세요.',
				icon : 'warning',
				position : 'top' // 원하는 위치로 설정하세요
			});
			//alert("성별을 입력하세요.")
			form.gender.focus();
			return false;
		}

		else if (!regGender.test(form.gender.value)) {
			Swal.fire({
				title : '오류',
				text : '올바른 성별을 입력하세요.',
				icon : 'warning',
				position : 'top' // 원하는 위치로 설정하세요
			});
			//alert("올바른 성별을 입력하세요.")
			form.gender.focus();
			return false;
		}

		//주소 확인
		if (form.zipcode.value == "") {
			Swal.fire({
				title : '오류',
				text : '주소를 입력하세요.',
				icon : 'warning',
				position : 'top' // 원하는 위치로 설정하세요
			});
			//alert("주소를 입력하세요.")
			form.zipcode.focus();
			return false;

		}

		// 유효성 문제 없을 시 폼에 submit

		form.submit();
	}
</script>
</head>
<body>
	<%	request.setCharacterEncoding("UTF-8");	%>
	
	<div class="wrapper">
		<button type="button"><img src="img/back1.png" alt="back1.png" onclick="history.back()"></button>
		<h2>회원가입</h2>
		<form action="join_save.jsp" id="disEnter" name="joinform" method="post" class="form">
			<div class="idcheck-box">
				<input type="text" name="id" placeholder="아이디" id="idcheck1" maxlength="20" onclick="idCheck()" readonly>
				<input type="button" id="idcheck2" value="중복확인" onclick="idCheck()">
			</div>
			<input type="password" name="pw" placeholder="비밀번호" >
			<input type="password" name="cpw" placeholder="비밀번호 확인" >
			<input type="email" name="email" placeholder="이메일 (abc@naver.com)" >
			<input type="text" name="name" placeholder="이름">
			<div class="phone-box">
				<input type="tel" name="phone" placeholder="휴대폰 번호 ('-' 없이 입력)" maxlength="11">
			</div>
			<!-- <div class="phone-box">
				<input type="tel" name="phone" placeholder="휴대폰 번호 ('-' 없이 입력)" >
				<button>인증번호 받기</button>
			</div>
			<div class="phone-box">
				<input type="text" name="" placeholder="인증번호 입력">
				<button>인증번호 확인</button>
			</div> -->
			<div class="birth-box">
				<input id="birth-box1" type="text" name="birth" placeholder="생년월일(ex) 19970315)" maxlength="8">
				<span> - </span>
				<div class="birth-box2">
					<input type="text" name="gender" maxlength="1"> ******
				</div>
			</div>
			<div class="address-box">
				<input type="text" name="zipcode" id="zipcode" placeholder="우편번호" onclick="kakaopost()" readonly>
				<input type="button" id="zip-btn" onclick="kakaopost()" value="우편번호 찾기">
			</div>
			<input type="text" name="address" id="address" placeholder="도로명주소" readonly>
			<input type="text" name="address2" id="address2" placeholder="상세주소">
			<input type="hidden" name="grade" id="grade" value="일반">
			
			<input type="button" onclick="checkjoin()" value="가입하기" id="joinsubmit">
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