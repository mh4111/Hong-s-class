<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="DB.MemberVO"%>
<%@ page import="DB.MemberDAO"%>
<%@ include file="ssi.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>idCheckProc.jsp</title>
<link rel="stylesheet" href="css/idcheck.css?after">
<script>
	function apply(id) {
		//2) 중복확인 id를 부모창에 적용
		//부모창 opener
		opener.document.joinform.id.value = id;
		window.close(); //창닫기
	}//apply () end
</script>
</head>
<body>
	<div class="wrapper">
		<h2>* 아이디 중복 확인 결과 *</h2>
		<%
		//1) 사용가능한 아이디일 경우, 아이디 입력 폼에 넣기 위함
		String id = request.getParameter("id");

		MemberDAO dao = new MemberDAO();
		int cnt = dao.duplecateID(id);
		%>
		<div>
			입력 ID : <span><strong><%=id%></strong></span>
		</div>

		<%
		if (cnt == 0) {
		%>
		<div>사용 가능한 ID 입니다.</div>
		<button type="button" onclick="apply('<%=id%>')">적용</button>
		<%
		} else {
		%>
		<div style="color: red">해당 아이디는 사용하실 수 없습니다.</div>
		<%
		} //if end
		%>
		<!-- 		<hr> -->
		<button onclick="history.back()">다시시도</button>
		<button onclick="window.close()">창닫기</button>
	</div>
</body>
</html>