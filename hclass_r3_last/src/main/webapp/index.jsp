<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html style="font-size: 16px;" lang="en">
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta charset="utf-8">
  <title>🎨Hong's Class</title>
  <link rel="stylesheet" href="main/css/nicepage.css" media="screen">
  <link rel="stylesheet" href="main/css/Home.css" media="screen">
  <script class="u-script" type="text/javascript" src="main/js/jquery.js" defer=""></script>
  <script class="u-script" type="text/javascript" src="main/js/nicepage.js" defer=""></script>
      
</head>


<body class="u-body u-xl-mode" data-lang="en">
<!-- top -->	
  <div>
	<jsp:include page="main/header.jsp" flush="false" />	
  </div>

<!-- 서치페이지 만들기 > 목록 -->
<!-- 로그인했을때 헤더 수정 -->

<!-- Banner -->	
  <div>
	<jsp:include page="main/banner.jsp" flush="false" />
  </div>
  
<!-- main  -->	
  <div>
	<jsp:include page="main/main.jsp" flush="false" />
  </div>
  
<!-- main  -->	
  <div>
	<jsp:include page="main/mainNew.jsp" flush="false" />
  </div>
  
<!-- footer -->  	
  <div>
	<jsp:include page="main/footer.jsp" flush="false" />
  </div>
	
</body>
</html>