<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	 <%
	 request.setCharacterEncoding("UTF-8");
	int num=Integer.parseInt(request.getParameter("num"));
	String contents=request.getParameter("contents");
	String id=request.getParameter("id");
	String code=request.getParameter("code");
 	guestVO vo = new guestVO();
 	vo.setNum(num);
 	vo.setContents(contents);
 	vo.setId(id);
 	vo.setCode(code);
 	
 	
 	guestDAO dao=new guestDAO();
 	dao.reviewEdit(vo);
 	
 	response.sendRedirect("http://localhost:8080/hclass/awsDetail.do?idx="+code);
 %>
	
</body>
</html>