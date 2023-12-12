<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/update.css?after">
<title>update</title>
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

	//유효성 검사 메서드
	function checkupdate() {
		var form = document.updateform;
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

		//비밀번호 확인
		if (form.pw.value == "") {
			alert("비밀번호를 입력하세요.")
			form.pw.focus();
			return false;
		}

		//비밀번호와 아이디 비교
		else if (form.pw.value == form.id.value) {
			alert("아이디와 동일한 비밀번호를 사용할 수 없습니다.")
			form.pw.focus();
			return false;
		}

		//비밀번호 확인
		else if (form.cpw.value !== form.pw.value) {
			alert("비밀번호가 일치하지 않습니다.")
			form.cpw.focus();
			return false;
		}

		//메일주소 확인
		if (form.email.value.length == 0) {
			alert("메일주소를 입력하세요.")
			form.email.focus();
			return false;
		}

		else if (!regEmail.test(form.email.value)) {
			alert("잘못된 이메일 형식입니다.")
			form.email.focus();
			return false;
		}

		//이름 확인 = 한글과 영어만 가능하도록
		if (form.name.value == "") {
			alert("이름을 입력하세요.")
			form.name.focus();
			return false;
		}

		else if (!regName.test(form.name.value)) {
			alert("최소 2글자 이상, 한글과 영어만 입력하세요.")
			form.name.focus();
			return false;
		}

		//번호확인
		if (form.phone.value == "") {
			alert("번호를 입력하세요.")
			form.phone.focus();
			return false;
		}

		else if (!regPhone.test(form.phone.value)) {
			alert("올바른 번호를 입력하세요.")
			form.phone.focus();
			return false;
		}

		//주소 확인
		if (form.zipcode.value == "") {
			alert("주소를 입력하세요.")
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

	<%
	// 이전화면에서 전달받은 데이터를 받습니다.
	// 화면에 미리 보여지도록 처리를 하세요~

	String id = (String) request.getAttribute("id");
	String email = (String) request.getAttribute("email");
	String name = (String) request.getAttribute("name");
	String phone = (String) request.getAttribute("phone");
	String zipcode = (String) request.getAttribute("zipcode");
	String address = (String) request.getAttribute("address");
	String address2 = (String) request.getAttribute("address2");
	%>
	
	<div class="wrapper">
	<button type="button"><img src="img/back1.png" alt="back1.png" onclick="history.back()"></button>
		<h2>정보 수정페이지</h2>

		<form action="update_save.jsp" id="disEnter" name="updateform" method="post" class="form">
			<input type="text" name="id" value="<%=id%>" readonly>
			<input type="password" name="pw" placeholder="비밀번호">
			<input type="password" name="cpw" placeholder="비밀번호 확인" >
			<input type="email" name="email" value="<%=email%>" placeholder="이메일">
			<input type="text" name="name" value="<%=name%>" placeholder="이름">
			<input type="tel" name="phone" value="<%=phone%>" placeholder="전화번호">
			<div class="address-box">
				<input type="text" name="zipcode" id="zipcode" value="<%=zipcode%>" placeholder="우편번호" onclick="kakaopost()" readonly>
				<input type="button" id="zip-btn" onclick="kakaopost()" value="우편번호 찾기">
			</div>
			<input type="text" name="address" id="address" value="<%=address%>" placeholder="주소">
			<input type="text" name="address2" id="address2" value="<%=address2%>" placeholder="상세주소">
			<input type="button" onclick="checkupdate()" value="수정" id="updatesubmit">
		</form>
		<hr />
	</div>
</body>
</html>