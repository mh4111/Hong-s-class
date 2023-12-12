<%@page import="java.text.DecimalFormat"%>
<%@page import="register.HistoryVO"%>
<%@page import="register.RegisterVO"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>4history</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

<style type="text/css">
* {	font-size: 14pt;	font-weight: bold;}
a {	font-size: 14pt;	text-decoration: none;	color: #6A24FE;}
a:hover {	font-size: 14pt;	color: rgb(128, 128, 255);}
#span_rcnt {	font-size: 12pt;	color: red;}
button {
	border: 0px;
	background-color: rgb(0,0,0,0);
	cursor: pointer;
}

img{
	width: 24px;
}

</style>

<script>
function redirectToIndex() {location .href = 'http://localhost:8080/hclass/index.jsp'; // 서버 측에서 처리되도록 변경
	
}
</script>


<body >
<button type="button"><img src="../hclass/login/img/back1.png" alt="back1.png" onclick="history.back()"></button>
	<div align="center">

	<%
	
	pageNUM = (int) request.getAttribute("pageNUM");
	startpage = (int) request.getAttribute("startpage");
	endpage = (int) request.getAttribute("endpage");
	pagecount = (int) request.getAttribute("pagecount");
	returnpage = (String) request.getAttribute("returnpage");
	skey = (String) request.getAttribute("skey");
	sval = (String) request.getAttribute("sval");
	sqry = (String) request.getAttribute("sqry");
	Gtotal = (int) request.getAttribute("Gtotal");
	String userName = (String) request.getAttribute("name");
	List<HistoryVO> list = (List<HistoryVO>) request.getAttribute("HV");
			DecimalFormat df = new DecimalFormat("#,###");
	%>

		<table class="table table-hover" >
			<tr align="right">
				<td colspan="8"><%=userName %>님이 등록한 수업 수: <%=Gtotal%> &nbsp; <a href="index.jsp">[hclass]</a>
				</td>
			</tr>

			<tr>
				<td>순차</td>
				<td>강사이름</td>
				<td>강의제목</td>
				<td>강의위치</td>
				<td>클래스 마감</td>
				<td>클래스 등록</td>
				<td>강의가격</td>
				<td>강의취소</td>
			</tr>

			<%
			 int num=Gtotal-(pageNUM-1)*10+1;
			for (int i = 0; i < list.size(); i++) {
				HistoryVO vo = (HistoryVO) list.get(i);
				String Ltitle = vo.getHtitle();
				num--;
			%>

			<tr>
				<td><%=num%></td>
				<td>
					<%=vo.getHtname() %>
				</td>				
				<td>
				<a href="http://localhost:8080/hclass/lecture/2header.jsp?idx=<%=vo.getHcode() %>"><%=vo.getHtitle()%></a>
				</td>
				<td><a href="https://map.kakao.com/link/search/<%=vo.getHlocation()%>"> <%=vo.getHlocation() %></a></td>
				<td><%=vo.getHedate() %></td>
				<td><%=vo.getHisdate() %></td>
				<td><%=df.format(vo.getHprice()) %>원</td>
				<td><a href="lecturedelete.do?hcode=<%=vo.getHcode()%>">등록철회</a></td>
			</tr>

			<%
			} //while end
			%>


			<tr align="center">
				<td colspan="8">
					<%
					if (startpage > 10) {
						out.print("<a href=awsList.do?pageNum=" + (startpage - 10) + ">[이전]</a>");
					}
					%> 
					<%
					 for (int i = startpage; i <= endpage; i++) {
					 	if (i == pageNUM) {
					 		out.print("<font style='font-size:16pt;color:pink;'>[" + i + "]</font>");
					 	} else {
					 		out.print("<a href=awsList.do?pageNum=" + (i + returnpage) + ">[" + i + "]</a>");
					 	}
					 } //for end
					 %> 
					<%
					 if (endpage < pagecount) {
					 	out.print("<a href=awsList.do?pageNum=" + (startpage + 10) + ">[다음]</a>");
					 }
					%>
				</td>
			</tr>

			<tr align="center">
				<td colspan="8">
					<form name="myform" action="historyList.do">
						<select name="keyfield" onchange="clearitem()">
							<option value="">--항목선택--</option>
							<option value="c.name"
								<%if (skey.equals("c.name")) {
									out.print("selected");
								}%>>
								이름검색</option>
							<option value="c.c_title"
								<%if (skey.equals("c.c_title")) {
									out.print("selected");
								}%>>
								클래스검색</option>
							<option value="c.location"
								<%if (skey.equals("c.location")) {
									out.print("selected");
								}%>>
								주소검색</option>
						</select> <input type="text" name="keyword" value="<%=sval%>" size="6">
						<input type="submit" value="검색"> <input type="reset"
							value="취소">
					</form>
				</td>
			</tr>
		</table>

	</div>
	<br>
	<p style="margin-bottom: 350px;">
</body>
</html>





