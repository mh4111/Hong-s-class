<%@ page language="java" contentType="text/html; charset=UTF-8"  %>
<%@ include file="ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="../js/1.js"></script>
<title> [openSbSave.jsp]</title></head>
<body>
 <%
   String data = request.getParameter("chkid");
   msg="select count(*) as cnt from h_class where code = '" + data + "'";
   
   ST=CN.createStatement();
   RS = ST.executeQuery(msg);
   if(RS.next()==true){  Gtotal=RS.getInt("cnt"); }
   
   if(Gtotal>0){
 %>
	 <script type="text/javascript">
	 	alert("<%=data%> 아이디는 이미 사용중입니다.");
		opener.iform.lid.value="";
	 	self.close();
	 	
	 </script>
 <%
   }else{
 %>
	 <script type="text/javascript">
	 	flagS_t();
	 	
	 	self.close();

	 </script>
 <%}%>
 
 
</body>
</html>


















