<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/review2.css" type="text/css">


<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	Gdata = request.getParameter("idx");
	String Gid=request.getParameter("idx1");
	String Gcode=request.getParameter("idx2");
	
%>

<div align="center">
		
<form class="mb-3" name="myform" id="myform" method="post" action="classReviewEditSave.jsp">
 
       <input type=hidden name=num value="<%= Gdata%>">
       <input type=hidden name=id value="<%= Gid%>">
       <input type=hidden name=code value="<%= Gcode%>">
       
 <div>
 <p>수정할내용</p>
 <textarea class="editReview" rows="3" cols="100"  name="contents"></textarea>
 </div>
 <div class="btn1" align="center">
	<input class="button" type="submit"  value="리뷰수정">
	</div>
</form>
 </div>
</body>
</html>