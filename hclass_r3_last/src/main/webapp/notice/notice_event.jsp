<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>


<!DOCTYPE html>
<html>
<head>
<title>notice_event</title>
<link href="../css/notice.css?after" rel="stylesheet" type="text/css">
    <!-- SweetAlert2 -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.min.css">
<meta charset="UTF-8">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
      	.swal2-modal{
	      	width:400px;
      	}
      	..swal2-popup{
	      	font-size: 12px;
      	}
    </style>
  <link rel="stylesheet" href="../main/css/nicepage.css" media="screen">
  <link rel="stylesheet" href="../main/css/Home.css" media="screen">
  <script class="u-script" type="text/javascript" src="../main/js/jquery.js" defer=""></script>
  <script class="u-script" type="text/javascript" src="../main/js/nicepage.js" defer=""></script>
</head>
<body>
  <div>
	<jsp:include page="../main/header.jsp" flush="false" />	
  </div>
	<div class="notice_container">
		<div class="PageWrapper">
			<h1 class="main">공지사항</h1>
			<div class="TabLabels_Wrapper">
			<span class="TabLabels_tab1"><a href="notice.jsp">공지</a></span>
			<span class="TabLabels_tab1"><a href="notice_event.jsp">이벤트</a></span>
			<span class="TabLabels_tab1"><a href="qna_List.jsp">Q&A</a></span>
			</div>
			<div class="Fade_wrapper">
				<ul class="NoticePage_List">
					<li>
						<div class="NoticeEntity_title">
							<div class="Badge_event">이벤트</div>
							<div class="Badge_title" id="notice_title">7월엔 러닝하고, 에너지 충전하세요!</div>
							<div class="Badge_date" id="notice_title">2023-06-30</div>
						</div>
						<div font-size="12px" style="display: none;" id="notice_contents" class="NoticeEntity_contents">
							<p>7월에 진행되는 두 가지 러닝 대회,</p>
							<p>2023 평화나비: 런(7/2)과 2021 여름버킷레이스(7/22)에 &nbsp;</p>
							<p>모두 참여하시는 분들께 5000포인트를 추가로 적립해 드립니다.</p><br>
							<p>우리 7월엔 조금 더 건강해지기로 해요</p><br>
							<p><strong><이벤트 안내></strong></p>
							<p><Strong>º</Strong>
							  응모기간 : ~2023년 7월 22일까지</p>
							<p><Strong>º</Strong>
							  추가 포인트 적립일 : 2023년 7월 25일까지</p>
							<p>* 두 가지 러닝대회 상품을 모두 구매하시면, 자동 응모됩니다.</p>
							<p>* 추가 적립된 포인트는 별도의 개별 연락없이 앱 하단 더보기 > 포인트 관리에서 확인하실 수 있습니다.</p>
						</div>
					</li>
					<li>
						<div class="NoticeEntity_title">
							<div class="Badge_event">이벤트</div>
							<div class="Badge_title" id="notice_title">첫 후기 작성하고 에너지 받으세요!</div>
							<div class="Badge_date" id="notice_title">2023-06-15</div>
						</div>
						<div font-size="12px" style="display: none;" id="notice_contents" class="NoticeEntity_contents">
							<p>안녕하세요. 고객님 :)</p>
							<p>Hong's class입니다.</p>
							<br>
							<p><img src="images/acstql.jpg" class="acstql">
							<p>* 해당 이벤트는 내부 사정에 의해 변경 및 중단될 수 있습니다.</p>
							<br>
							<p>감사합니다.</p>
							<P>Hong's Class 고객센터 드림</P>
						</div>
					</li>
					<li>
						<div class="NoticeEntity_title">
							<div class="Badge_event">이벤트</div>
							<div class="Badge_title" id="notice_title">[종료]5월 후기 이벤트! -영화 예매권 100명 증정</div>
							<div class="Badge_date" id="notice_title">2023-05-20</div>
						</div>
						<div font-size="12px" style="display: none;" id="notice_contents" class="NoticeEntity_contents">
							<p><img src="images/0104_nbqdrf.png" class="acstql"></p>
							<p>5월 참여 후기르르 남겨주신 고객님들 중 총 100분께 영화 '레지던트 이블' 에매권 2매를 드립니다.</p>
							<p>즐겁고 신나는 후기 많이 남겨주세요.<br></p>
							<p>- 응모 기간: &nbsp;5월 22일 ~ 5월 30일</p>
							<p>- 당첨자 발표 : 6월 1일(당첨자분들에 한해 개별 연락 드릴 예정입니다. &nbsp;</p>
							<p>- 참여 방법 : 참가 후, 솔직한 후기를 남겨 주시면 참여 완료! &nbsp;</p>
							<p>- 경품 : 영화 '레지던트 이블' 예매권 1인 2매 100명</p><br>
							<p>* 영화 '레지던트 이블' 정보</p>
							<p>감독 : 폴 앤더슨
							<br>출연 : 밀라 요보비치, 알리 라터, 이아인 글렌
							<br>특별출연 : 이준기</p>
							<p><Strong>* 예고편</Strong></p>
							<p><iframe width="560" height="315" src="https://www.youtube.com/embed/F6qyNkwa9c4" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe></iframe></p>
						</div>
					</li>
					<li>
						<div class="NoticeEntity_title">
							<div class="Badge_event">이벤트</div>
							<div class="Badge_title" id="notice_title">[종료]친구 초대하고 5000 포인트 받자!</div>
							<div class="Badge_date" id="notice_title">2023-05-03</div>
						</div>
						<div font-size="12px" style="display: none;" id="notice_contents" class="NoticeEntity_contents">
							<p>안녕하세요. 고객님 :)</p>
							<p>Hong's class입니다.</p>
							<br>
							<p><img src="images/jo0bfd.jpg" class="acstql"></p>
							<br>
							<p>친구와 같이 클래스를 듣고 싶은 사람을 위한 이벤트</p>
							<p>지금 바로 친구에게 소개하고, 5000 포인트 받자!</p>
							<br><hr>
							<p><strong>[참여방법]</strong></p>
							<p>앱을 켜고<u>더보기 > 친구 초대하기</u>를 눌러</p>
							<p>아직 Hong's class를 모르는 친구를 초대하세요.</p>
							<br>
							<p><strong>[혜택]</strong></p>
							<p>초대 받은 친구가 신규 회원일 경우, 친구에게 5000포인트가 적립됩니다.</p>
							<p>내가 초대한 친구가 클래스에 참여하면 나에게 5000포인트가 적립됩니다.</p>
							<p>* 초대 받은 친구의 첫 클래스 실제 결제 금액이 포인트 제외 후 결제 금액 100원 이상일 경우에 적립됩니다.</p>
							<p>* 포인트 유효기간 : 지급일로부터 30일</p>
							<p>감사합니다.</p>
							<P>Hong's Class 고객센터 드림</P>
							<p><strong>(5월15일 이후, 해당 이벤트는 종료되었습니다.)</strong></p>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<div>
	<jsp:include page="../main/footer.jsp" flush="false" />	
 	</div>
	<script>

    const titleDivs = document.querySelectorAll(".Badge_title");
    const contentsDivs = document.querySelectorAll(".NoticeEntity_contents");

    titleDivs.forEach((titleDiv, index) => {
        titleDiv.addEventListener("click", () => {
            contentsDivs[index].style.display = contentsDivs[index].style.display === "none" ? "block" : "none";
        });
    });
	</script>
</body>
</html>

