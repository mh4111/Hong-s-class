<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1makeLecture</title>
<link rel="stylesheet" href="./css/style.css?after">

</head>
<link rel="stylesheet" type="text/css" href="../css/1.css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	function redirectToIndex() {
		location.href = 'http://localhost:8080/hclass/index.jsp'; // 서버 측에서 처리되도록 변경
	}
</script>
<script src="../js/1.js" ></script>
<body>
	<div class="wrapper">
	<button type="button"><img src="../login/img/back1.png" alt="back1.png" onclick="redirectToIndex()"></button>
	<h2>클래스 등록</h2>
	
		<form name="iform" method="post" enctype="multipart/form-data" action="awsInsert.do" class="form">
		
						<input placeholder="강사이름" type="text" name="lname">
						<label id="lidlabel" name="a"></label>
						<input placeholder="강사ID" id="idcheck1" type="text" name="lid" onkeyup="checklen(this)" placeholder="숫자4자리"> 
						<input type="button" id="idcheck2" onclick="checkSb()" value="중복확인">
			<br>
				<label id="numlabel">번호를 입력하세요</label>
			<br>
						<input type="text" size="4" id="num" name="lnum1" placeholder="***" maxlength="4">&nbsp;
						<input type="text" size="4" id="num" name="lnum2" placeholder="****" maxlength="4">&nbsp;
						<input type="text" size="4" id="num" name="lnum3" placeholder="****" maxlength="4">
			<br>
					
						<input type="text" size="40" name="lurl" placeholder="SNS(url주소를 입력하세요)">
						
				 		<input type="file" id="limg" name="limg" onchange="handleFileSelect()">
			 		
				 		<div id="preview" ></div>
				 		
						<input type="text" id="lcode" name="lcode" placeholder="우편번호"> 
						<input type="button" id="letter" onclick="DaumPostcode()" value="주소 찾기">
						<input type="text" id="llocation" name="llocation">
						<input type="text" id="llocation2" name="llocation2"  placeholder="상세 주소">
						
						
						<input type="text" size="40" name="ltitle" placeholder="강의제목"  maxlength="30" >
						
						<textarea name="lcontents" id="lcontents" placeholder="강의 내용" rows="5" cols="40"></textarea>
						
					<font color=red>*</font> 시작날짜
						<input type="date" id="lsdate" placeholder="강의날짜" name="lsdate" onclick="startday()">
					<font color=red>*</font> 종료날짜
						<input type="date" id="ledate" placeholder="강의날짜" name="ledate" onclick="endday()">
					<font color=red>*</font> 가격
						<input type="text" placeholder="강의가격" name="lprice" value="15000"> <br>
					<font color=red>*</font> 총 인원
						<input type="text" placeholder="강의인원" name="lpeople" value="2"> <br>
				
			
			<p>
				<input type="button" id="subs" value="등록" onclick="check()">
				<input type="reset" id="subs" value="초기화">
			</p>
			
		</form>
		
	</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>

</html>
































