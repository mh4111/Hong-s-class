<%@ page language="java" contentType="text/html; charset=UTF-8"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> [openSb.jsp]</title>
  <style type="text/css">
    *{font-size:12pt; font-weight:bold;}      
           
  </style>
 <script type="text/javascript">
 	function send(){
 		subform.chkid.value=window.opener.iform.lid.value;
 	}
 </script>
</head>
<body bgcolor="pink" onload="send()">
 <p>
 <div align="center">
  <form name="subform" action="openSbSave.jsp">
    <font>아이디:</font><input type="text" name="chkid">
        <input type="submit" value="중복확인"> 
  </form>
 </div>	
</body>
</html>





