<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="reservation.lecture.LectureDAO"%>
<%@page import="reservation.lecture.LectureVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="../main/css/nicepage.css" media="screen">
  <link rel="stylesheet" href="../main/css/Home.css" media="screen">
  <script class="u-script" type="text/javascript" src="../main/js/jquery.js" defer=""></script>
  <script class="u-script" type="text/javascript" src="../main/js/nicepage.js" defer=""></script>
      
</head>
<%
	
	String Ldata = request.getParameter("idx");
	
	%>

<body>




		<jsp:include page="../main/header.jsp"></jsp:include>


        <iframe src="3detailLecture.jsp?idx=<%=Ldata %>" frameborder="0"  height='2500px' width='100%' scrolling="no" style="overflow-y:hidden">
        </iframe>


</body>
</html>