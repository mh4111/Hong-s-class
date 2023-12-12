<%@page import="DB.MemberDAO"%>
<%@page import="DB.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>header</title>
</head>
<%
String id = (String) session.getAttribute("user_id");
String name = (String) session.getAttribute("user_name");
String grade = (String) session.getAttribute("user_grade");
%>

<body class="u-body u-xl-mode" data-lang="en">
  <header class="u-clearfix u-header u-header" id="sec-a981">
    <div class="u-clearfix u-sheet u-sheet-1" >
<!-- 헤더 시작 -->
<!-- 로고 -->
        <a href="http://localhost:8080/hclass/index.jsp" class="u-hover-feature u-image u-image-default u-logo u-image-1" title="Home">
          <img src="http://localhost:8080/hclass/main/images/logo.png" class="u-logo-image u-logo-image-1" alt="">
        </a>
        
<!-- 메뉴버튼  -->
    <nav class="u-menu u-menu-hamburger u-offcanvas u-menu-1 " data-responsive-from="XL">
       <div class="menu-collapse" style="font-size: 1rem; letter-spacing: 0px; font-weight: 700;">
         <a class="u-button-style u-custom-active-border-color u-custom-active-color u-custom-border u-custom-border-color u-custom-borders u-custom-hover-border-color u-custom-hover-color u-custom-left-right-menu-spacing u-custom-padding-bottom u-custom-text-active-color u-custom-text-color u-custom-text-decoration u-custom-text-hover-color u-custom-top-bottom-menu-spacing u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="#">
           <svg class="u-svg-link" viewBox="0 0 24 24"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#menu-hamburger"></use></svg>
           <svg class="u-svg-content" version="1.1" id="menu-hamburger" viewBox="0 0 16 16" x="0px" y="0px" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns="http://www.w3.org/2000/svg">
            <g>
             <rect y="1" width="16" height="2"></rect>
             <rect y="7" width="16" height="2"></rect>
             <rect y="13" width="16" height="2"></rect>
            </g>
           </svg>
         </a>
       </div>
       <div class="u-custom-menu u-nav-container-collapse">
         <div class="u-black u-container-style u-inner-container-layout u-opacity u-opacity-95 u-sidenav u-sidenav-1" data-offcanvas-width="160">
           <div class="u-inner-container-layout u-sidenav-overflow">
             <div class="u-menu-close u-menu-close-1"></div>
             <ul class="u-align-center u-custom-font u-font-raleway u-nav u-popupmenu-items u-spacing-3 u-text-hover-custom-color-2 u-unstyled u-nav-2">
               <li class="u-nav-item"><a class="u-button-style u-nav-link" href="http://localhost:8080/hclass/index.jsp" style="padding-top: 22px; padding-bottom: 22px;">Home</a></li>
	  		   <li class="u-nav-item"><a class="u-button-style u-nav-link" href="http://localhost:8080/hclass/awsList.do" style="padding-top: 22px; padding-bottom: 22px;">Class</a></li>
	  		   <li class="u-nav-item"><a class="u-button-style u-nav-link" href="http://localhost:8080/hclass/notice/notice.jsp" style="padding-top: 22px; padding-bottom: 22px;">Notice</a></li>
			   <% if(grade==null||grade==""||grade.equals("")){
			   } else if(grade.equals("강사")){%>
			   <li class="u-nav-item"><a class="u-button-style u-nav-link" href="http://localhost:8080/hclass/lecture/1makeLecture.jsp" style="padding-top: 22px; padding-bottom: 22px;">등록</a></li>
			   <% } else if(grade.equals("관리자")) { %>
			   <li class="u-nav-item"><a class="u-button-style u-nav-link" href="http://localhost:8080/hclass/lecture/1makeLecture.jsp" style="padding-top: 22px; padding-bottom: 22px;">등록</a></li>
			   <li class="u-nav-item"><a class="u-button-style u-nav-link" href="http://localhost:8080/hclass/admin/adminpage.jsp" style="padding-top: 22px; padding-bottom: 22px;">관리자페이지</a></li>
			 	<% } %>
			 </ul>
           </div>
         </div>
         <div class="u-black u-menu-overlay u-opacity u-opacity-50"></div>
       </div>
    </nav>   
    
<!-- 검색창 -->  
<!-- http://localhost:8080/project/main/classMain.jsp?keyword=1# -->
        <form action="http://localhost:8080/hclass/main/searchList.jsp?" method="get" class="u-border-1 u-border-grey-30 u-radius-10 u-search u-search-left u-white u-search-1">
          <button class="u-search-button" type="submit">
            <span class="u-search-icon u-spacing-10 u-text-custom-color-1 u-search-icon-1">
              <svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 56.966 56.966" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-a8ce"></use></svg>
              <svg class="u-svg-content" viewBox="0 0 56.966 56.966" x="0px" y="0px" id="svg-a8ce" style="enable-background:new 0 0 56.966 56.966;">
              	<path d="M55.146,51.887L41.588,37.786c3.486-4.144,5.396-9.358,5.396-14.786c0-12.682-10.318-23-23-23s-23,10.318-23,23
						s10.318,23,23,23c4.761,0,9.298-1.436,13.177-4.162l13.661,14.208c0.571,0.593,1.339,0.92,2.162,0.92
						c0.779,0,1.518-0.297,2.079-0.837C56.255,54.982,56.293,53.08,55.146,51.887z M23.984,6c9.374,0,17,7.626,17,17s-7.626,17-17,17
						s-17-7.626-17-17S14.61,6,23.984,6z"></path>
			  </svg>
            </span>
          </button>
          <input class="u-custom-font u-font-raleway u-search-input" type="search" name="keyword" value="" placeholder="Search">
        </form>
        
 <!-- 로그인 -->
 <!-- ***로그인페이지 연결 -->
 	
 	<%
 	if(id==null||id==""||id.equals("")){
 	%>
 		
        <a href="http://localhost:8080/hclass/login/login.jsp" class="u-border-none u-btn u-button-style u-custom-font u-font-raleway u-none u-btn-1">
        <span class="u-icon u-text-custom-color-1 u-icon-1">
        <svg class="u-svg-content" viewBox="0 0 55 55" x="0px" y="0px" style="width: 1em; height: 1em;">
        </svg>
        </span>
        <img src="http://localhost:8080/hclass/main/images/login.png" width="17" style="vertical-align: middle;">&nbsp;&nbsp;login
        </a>
	<%
 	}
 	else{
	%>

			<div class="u-border-none u-btn u-button-style u-custom-font u-font-raleway u-none u-btn-1" >
	 			<span class="u-icon u-text-custom-color-1 u-icon-1">
	        		<svg class="u-svg-content" viewBox="0 0 55 55" x="0px" y="0px" style="width: 1em; height: 1em;"></svg>
        		</span>
	        	<a href="http://localhost:8080/hclass/login/mypage.jsp"><img src="http://localhost:8080/hclass/main/images/login.png" width="17" style="vertical-align: middle; display: inline;"></a>&nbsp;&nbsp;
				<a href="http://localhost:8080/hclass/login/logout.jsp" style="">logout</a> &nbsp;
			<!-- 	<a href="./login/getInfo.jsp">정보수정</a>&nbsp;
				<a href="./login/delete_save.jsp">회원탈퇴</a>&nbsp;
				<a href="historyList.do?hid=<%=id%>">등록내역</a> -->
			</div>
 	<%
 	}
	%>
	
 	</div>
  </header>
 <!-- 헤더 끝 -->

</body>
</html>