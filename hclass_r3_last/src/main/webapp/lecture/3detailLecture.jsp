<%@page import="reservation.lecture.LectureDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="reservation.lecture.LectureVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="font-size: 16px;" lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="utf-8">
<meta name="keywords"
	content="​Your success in the industry is our mission, 2018, 2019, 2020, 2021, 2022, 2023, Our perfect team, ​We Provide Flexible IT Choose, ​Here are some of our clients, ​Together for a business lifestyle">
<meta name="description" content="">
<title>detail</title>
<link rel="stylesheet" href="http://localhost:8080/hclass/lecture/nicepage.css" media="screen">
<link rel="stylesheet" href="http://localhost:8080/hclass/lecture/detail.css" media="screen">
<script class="u-script" type="text/javascript" src="http://localhost:8080/hclass/lecture/jquery.js" defer=""></script>
<script class="u-script" type="text/javascript" src="http://localhost:8080/hclass/lecture/nicepage.js"
	defer=""></script>
<meta name="generator" content="Nicepage 5.14.1, nicepage.com">
<meta name="referrer" content="origin">

<link id="u-theme-google-font" rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,500,500i,600,600i,700,700i,800,800i">
<link id="u-page-google-font" rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Ubuntu:300,300i,400,400i,500,500i,700,700i">
<link rel="stylesheet" href="../review/css/review.css" type="text/css">

<script type="application/ld+json">{
		"@context": "http://schema.org",
		"@type": "Organization",
		"name": ""
}</script>




<meta name="theme-color" content="#478ac9">
<meta property="og:title" content="detail">
<meta property="og:type" content="website">
<meta data-intl-tel-input-cdn-path="intlTelInput/">
</head>


<%

	
	String Ldata = request.getParameter("idx");
	System.out.println("아이디 : " + Ldata);
	
	LectureVO vo = new LectureVO();  
	LectureDAO dao = new LectureDAO();
	
	vo = dao.lectureDetail(Ldata);
	
	String id = (String) session.getAttribute("user_id");
	String name = (String) session.getAttribute("user_name");
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
	
	DecimalFormat dc = new DecimalFormat("#,###");
	
	System.out.println("날짜 : " + sdf.format(sdf.parse(vo.getLsdate())));
%>


<body class="u-body u-xl-mode" data-lang="en">
	
	<input id="lc" value="<%=vo.getLlocation()%>" style="display: none;">
	
	
	
	<section class="u-clearfix u-section-1" id="sec-7663"
		>
		<div class="u-clearfix u-sheet u-sheet-1">
			<img class="u-image u-image-round u-radius-10 u-image-1"
				src="http://localhost:8080/hclass/detailPagePicture/<%=vo.getLimg() %>" alt="" data-image-width="1024"
				data-image-height="819" data-animation-name="customAnimationIn"
				data-animation-duration="1000" data-animation-delay="0">
			<div
				class="u-container-style u-group u-opacity u-opacity-30 u-shape-rectangle u-group-1">
				<div class="u-container-layout u-container-layout-1">
					<h5 class="u-align-left u-text u-text-default u-text-1">[<%=vo.getLname()%>] </h5>
					<h1 class="u-align-left u-text u-text-2">
						<%= vo.getLtitle() %> (예약가능)
					</h1>
					<p
						class="u-align-left u-custom-font u-heading-font u-text u-text-3">
					<%= vo.getLcontents() %>
					</p>
					<br>
					
					<h5 class="u-align-left u-text u-text-5">
						[<%=sdf.format(sdf.parse(vo.getLsdate())) %>~<%=sdf.format(sdf.parse(vo.getLedate()))%>]
					</h5>
					<br>
					<h3 class="u-align-left u-text u-text-5">
						<%=dc.format(vo.getLprice()) %><span style="font-size: 1.5rem;">원</span>
					</h3>
					<a href="http://localhost:8080/hclass/register.do?userId=<%=id %>&classCode=<%= vo.getLid() %>"
						class="u-border-none u-btn u-btn-round u-button-style u-custom-color-5 u-hover-custom-color-2 u-radius-50 u-btn-1">강의등록</a>
				</div>
			</div>
		</div>
	</section>
	
	<!-- 리뷰영역 -->
	<jsp:include page="../review/classReview.jsp">
		<jsp:param value="<%=vo.getLid() %>" name="Lcode"/>
	</jsp:include>
	
	
	<section class="u-clearfix u-white u-section-9" id="sec-051a">
		<div class="u-clearfix u-sheet u-sheet-1">
			<div
				class="u-clearfix u-expanded-width u-layout-wrap u-layout-wrap-1">
				<div class="u-layout">
					<div class="u-layout-row">
						<div 
							class="u-align-left u-container-style u-layout-cell u-left-cell u-size-30 u-layout-cell-1">
							<div class="u-container-layout u-container-layout-1">
								<a href="https://map.kakao.com/link/search/<%=vo.getLlocation()%>"> <h4 class="u-text u-text-3">-&nbsp;주소 : <%=vo.getLlocation() %></h4></a>
								<br>
								<h4 class="u-text u-text-3">-&nbsp;연락처 : <%=vo.getLnum() %></h4>
								<br>
								<h4 class="u-text u-text-3">-&nbsp;인스타 : 
									<a class="u-social-url" title="instagram" href="<%=vo.getLurl()%>">
										<span style="width: 30px;" class="u-icon u-social-icon u-social-instagram u-text-custom-color-2 u-icon-1">
											
											<svg class="u-svg-content" viewBox="0 0 112 112" x="0" y="0"
												id="svg-4efe">
												<path fill="currentColor"
													d="M55.9,32.9c-12.8,0-23.2,10.4-23.2,23.2s10.4,23.2,23.2,23.2s23.2-10.4,23.2-23.2S68.7,32.9,55.9,32.9z
										M55.9,69.4c-7.4,0-13.3-6-13.3-13.3c-0.1-7.4,6-13.3,13.3-13.3s13.3,6,13.3,13.3C69.3,63.5,63.3,69.4,55.9,69.4z"></path>
												<path fill="#FFFFFF"
													d="M79.7,26.8c-3,0-5.4,2.5-5.4,5.4s2.5,5.4,5.4,5.4c3,0,5.4-2.5,5.4-5.4S82.7,26.8,79.7,26.8z"></path>
												<path fill="currentColor"
													d="M78.2,11H33.5C21,11,10.8,21.3,10.8,33.7v44.7c0,12.6,10.2,22.8,22.7,22.8h44.7c12.6,0,22.7-10.2,22.7-22.7
										V33.7C100.8,21.1,90.6,11,78.2,11z M91,78.4c0,7.1-5.8,12.8-12.8,12.8H33.5c-7.1,0-12.8-5.8-12.8-12.8V33.7
										c0-7.1,5.8-12.8,12.8-12.8h44.7c7.1,0,12.8,5.8,12.8,12.8V78.4z"></path>
											</svg>
										</span>
									</a>
								</h4>
							</div>
						</div>
		
						
						
						
						<!-- 주소 시작 -->
						
						<div
							class="u-container-style u-layout-cell u-right-cell u-size-30 u-layout-cell-2">
							<div class="u-container-layout u-container-layout-2">
								<div class="u-expanded u-grey-10 u-map">
									<div id="map" style="width:100%;height:100%;"></div>
									
									<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fa51fb086bff6020cbf726e9b348ee7c&libraries=services"></script>
								</div>
							</div>
						</div>
						
						
						
						
						
						
					</div>
				</div>
			</div>
		</div>
	</section>

	<span
		style="height: 64px; width: 64px; margin-left: 0px; margin-right: auto; margin-top: 0px; right: 20px; bottom: 20px; padding: 19px; background-image: none;"
		class="u-back-to-top u-custom-color-5 u-icon u-icon-circle u-opacity u-opacity-85"
		data-href="#"> <svg class="u-svg-link"
			preserveAspectRatio="xMidYMin slice" viewBox="0 0 551.13 551.13">
			<use xmlns:xlink="http://www.w3.org/1999/xlink"
				xlink:href="#svg-1d98"></use></svg> <svg class="u-svg-content"
			enable-background="new 0 0 551.13 551.13" viewBox="0 0 551.13 551.13"
			xmlns="http://www.w3.org/2000/svg" id="svg-1d98">
			<path
				d="m275.565 189.451 223.897 223.897h51.668l-275.565-275.565-275.565 275.565h51.668z"></path></svg>
	</span>

	<section class="u-clearfix u-custom-color-6 u-section-7" id="sec-edef">
		<div class="u-clearfix u-sheet u-valign-middle u-sheet-1">
			<h2
				class="u-align-center u-custom-font u-font-ubuntu u-text u-text-default u-text-1">
				[신청 시 유의사항]</h2>
			<p class="u-align-left u-text u-text-2">
				·&nbsp;홍스클래스에서 구매 후 업체에 전화로 가능한 날짜 예약 바랍니다.<br>·&nbsp;방문 시 프립 앱
				내의 [내 활동] 화면을 보여주시면 호스트가 출석체크를 해 드립니다. 출석체크 후 자유롭게 이용하시면 됩니다.<br>·&nbsp;예약
				후 일정 변경은 강습 최소 1일 전에 해주셔야 합니다.<br>·&nbsp;예약 시간에 맞추어 늦지 않게 도착해
				주시기 바랍니다.<br>·&nbsp;도자기의 특성상 불에서 굽는 과정에서 요변현상이 발생할 수
				있습니다.(요변이란? 가마에서 도자기를 불에 구울 때 뒤틀리고 금이 가거나 색이 변하는 우연적인 현상)·&nbsp;직접
				만든 작품은 당일 가져가실 수 없습니다. (소성 기간&nbsp;한달 소요)·&nbsp;택배로 수령을 원하실 경우
				5,000원의 택배비가 별도로 부담되며 파손의 우려가 있어 가급적 재방문하여 수령하실 것을 권유 드립니다.<br>·&nbsp;택배
				수령 시 파손에 따른 책임은 호스트가 지지 않습니다.
			</p>
		</div>
	</section>

</body>

</html>