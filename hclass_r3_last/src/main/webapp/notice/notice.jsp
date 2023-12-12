<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>


<!DOCTYPE html>
<html>
<head>
<title>notice</title>
	<meta charset="UTF-8">
	<!-- notice -->
	<link href="../css/notice.css?after" rel="stylesheet" type="text/css">
    <!-- SweetAlert2 -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.min.css">

    <!-- main -->
	<link rel="stylesheet" href="../main/css/nicepage.css" media="screen">
	<link rel="stylesheet" href="../main/css/Home.css" media="screen">
	<script class="u-script" type="text/javascript" src="../main/js/jquery.js" defer=""></script>
	<script class="u-script" type="text/javascript" src="../main/js/nicepage.js" defer=""></script>
</head>
<body>
<!-- top -->	
  <div>
	<jsp:include page="../main/header.jsp" flush="false" />	
  </div>
	<div class="notice_container">
		<div class="PageWrapper">
			<h1 class="main">공지사항</h1>
			<div class="TabLabels_Wrapper">
			<span class="TabLabels_tab1"><a href="notice.jsp">공지</a></span>
			<span class="TabLabels_tab2"><a href="notice_event.jsp">이벤트</a></span>
			<span class="TabLabels_tab3"><a href="qna_List.jsp">Q&A</a></span>
			</div>
			<div class="Fade_wrapper">
				<ul class="NoticePage_List">
					<li>
						<div class="NoticeEntity_title">
							<div class="Badge">공지</div>
							<div class="Badge_title" id="notice_title">8월 공휴일 (8/15) 고객센터 운영시간 안내</div>
							<div class="Badge_date">2023.07.25</div>
						</div>
						<div style="display: none;" id="notice_contents" class="NoticeEntity_contents">
							<p>안녕하세요. 고객님 :)</p>
							<p>Hong's class입니다.</p>
							<br>
							<p>
							8월 15일 (월) 광복절, 고객센터 운영시간이 단축되어 안내드립니다.
							</p>
							<br>
							<p>
							<strong>
								<span style="font-szie: 16px; background-color: rgb(247, 218, 100);">[고객센터 운영시간 안내]</span>
							</strong>
							</p>
							<p>-일자 :  8월 15일 (화) 광복절</p>
							<p>
							<span style="color: rgb(226, 80, 65);">- 카카오톡 채널 운영 시간 : 오전 10:100 ~ 오후 1:00</span> 
							</p>
							<br>
							<p>
							주말, 공휴일에는 카카오톡 채널만 운영되며
							<br>
							취소, 일정 변경 등 일부 문의에 대한 처리가 제한될 수 있으니 참고 부탁드립니다.
							</p>
							<p>감사합니다.</p>
							<P>Hong's Class 고객센터 드림</P>
						</div>
					</li>
					<li>
						<div class="NoticeEntity_title">
							<div class="Badge">공지</div>
							<div class="Badge_title" id="notice_title">코로나19 확진자 관련 환불 규정 변경 안내(7/1~)</div>
							<div class="Badge_date">2023.06.28</div>
						</div>
						<div style="display: none;"id="notice_contents" class="NoticeEntity_contents">
							<p>안녕하세요. 고객님 :)</p>
							<p>Hong's class입니다.</p>
							<br>
							<p>
							6월 6일 현충일의 
							<span style="color: rgb(226, 80 ,65);">고객센터 운영 시간이 일분 단축</span>
							되어 안내해드립니다.
							</p>
							<br>
							<p>
							다가오는 7월 `일, 코로나19 방역 전환 조치(확진 시 5일간 "격리 권고")가 시행됨에 따라 
							확진자에 대한 Hong's Class 환불 규정이 변경됨을 안내드립니다.
							</p>
							<br>
							<p style="margin-left: 20px;">
							<strong>
							<span style="colorL rgb(226, 80, 65);">*변경 전 : 코로나19 확진 증빙 서류 제출 시 전액 환불</span></strong></p>
							<p style="margin-left: 20px;">
							<strong>
							<span style="colorL rgb(226, 80, 65);">*변경 후 : 상품<환불 정책>에 의거하여 처리</span></strong></p>
							<p>
							<br>
							코로나19 확진 판정을 받은 고객이여도 상품 하단 <환불 정책>에 의거하여 처리돠며,
							코로나19 확진 이전에 확정된 예약 건에 대해서는 호스트님과 개별적으로 일정 진행 및 변경 가능 여부에 대해 소통해 주시면 됩니다.
							<br>
							</p>
							<p>감사합니다.</p>
						</div>
					</li>				
					<li>
						<div class="NoticeEntity_title">
							<div class="Badge">공지</div>
							<div class="Badge_title" id="notice_title">현충일(6/6) 고객센터 운영시간 안내</div>
							<div class="Badge_date">2023.06.02</div>
						</div>
						<div font-size="12px" style="display: none;" id="notice_contents" class="NoticeEntity_contents">
							<p>안녕하세요. 고객님 :)</p>
							<p>Hong's class입니다.</p>
							<br>
							<p>
							6월 6일 현충일의 
							<span style="color: rgb(226, 80 ,65);">고객센터 운영 시간이 일분 단축</span>
							되어 안내해드립니다.
							</p>
							<br>
							<p>
							<strong>
								<span style="background-color: rgb(247, 218, 100);">[고객센터 운영시간 안내]</span>
							</strong>
							</p>
							<p>-일자 :  6월 6일 (화) 현충일</p>
							<p>
							-카카오톡 채널 운영 시간 : 
								<strong style="color: rgb(226, 80, 65);">오전 10:100 ~ 오후 1:00</strong>
							</p>
							<br>
							<p>
							주말, 공휴일에는 취소 및 결제 관련 일부 문의에 대한 처리가 제한될 수 있는 점 양해 부탁드리며,
							<br>
							문의 사항은 카카오톡 채널 @Hong's class로 남겨주시면 순차적으로 처리해드릴 예정입니다.
							</p>
							<p>감사합니다.</p>
						</div>
					</li>
					<li>
						<div class="NoticeEntity_title">
							<div class="Badge">공지</div>
							<div class="Badge_title" id="notice_title">이용 약관 개정 안내</div>
							<div class="Badge_date">2023.05.20</div>
						</div>
						<div font-size="12px" style="display: none;" id="notice_contents" class="NoticeEntity_contents">
							<p>안녕하세요. 고객님 :)</p>
							<p>Hong's class입니다.</p>
							<br>
							<p>
							항상 Hong's class를 이용해 주셔서 감사드리며, Hong's class 이용약관 개정에 관하여 알려드리고자 합니다. 
							</p>
							<p>
							고객님들께서는 변경된 이용약관을 확인하시고 서비스 이용에 불편을 겪지 않도록 참고하여 주시기 바랍니다.
							</p>
							<br>
							<p>- 누락 및 오기재된 내용 수정</p>
							<br>
							<p>변경된 이용약관은 2023년 5월 31일자로 적용됩니다.</p>
							<br>
							<p>
							본 이용약관 변경에 동의하시지 않는 경우,
							<br>
							이용약관 적용일자 전일까지 Hong's Class 고객센터를 통하여 회사에 거부의사를 표시하고 서비스 이용계약을 해지할 수 있으며,
							</p>
							<p>시행일까지 별도의 거부 의사를 표시하지 않으시는 경우 변경된 위치기반 서비스 이용 약관에 동희한 것으로 간주됩니다.</p>
							<p>- 카카오톡 채널 @Hong's Class</p>
							<p>- 이메일 cs@hongsclass.com</p>
							
							<p>감사합니다.</p>
						</div>
					</li>
					<li>
						<div class="NoticeEntity_title">
							<div class="Badge">공지</div>
							<div class="Badge_title" id="notice_title">시스템 점검으로 인한 서비스 일시 중단 안내(5월 15일, 오전 00:30 ~ 오전 01:30)</div>
							<div class="Badge_date">2023.05.10</div>
						</div>
						<div font-size="12px" style="display: none;" id="notice_contents" class="NoticeEntity_contents">
							<p>안녕하세요. 고객님 :)</p>
							<p>Hong's class입니다.</p>
							<br>
							<p>보다 안정적으로 서비스를 제공하기 위해 아래와 같이 시스템 점검을 진행할 예정입니다.</p>
							<p>점검 시간 동안 앱/웹 이용이 불가하므로 결제, 결제 내역 확인, 결제 취소 등&nbsp;</p>
							<p>서비스 사용이 필요한 경우 미리 이용해 주시기 바랍니다.</p>
							<br>
							<p><strong>- 점검 대상 서비스 : 앱/웹 페이지, 호스트 관리 페이지
							</strong></p>
							<p><strong>- 점검 기간 : 2023년 5월 15일, 오전 0시 30분 ~ 오전 1시 30분
							</strong></p>
							<p>위 기간은 예상 기간으로 상황에 따라 연장될 수 있으며, 연장될 경우 재공지를 통해 안내드리도록 하겠습니다.</p>
							<p>감사합니다.</p>
						</div>
					</li>
										<li>
						<div class="NoticeEntity_title">
							<div class="Badge">공지</div>
							<div class="Badge_title" id="notice_title">호스트를 저장(북마크)하는 기능 관련하여 안내드립니다.</div>
							<div class="Badge_date">2023.04.07</div>
						</div>
						<div font-size="12px" style="display: none;" id="notice_contents" class="NoticeEntity_contents">
							<p>안녕하세요. 고객님 :)</p>
							<p>Hong's class입니다.</p>
							<br>
							<p>좋아하는 호스트를 저장하여 해당 호스트의 새로운 클래스가 열렸을 때 푸시 알림을 받는 기능 관련하여 안내드립니다.</p>
							<br>
							<p>대부분의 푸시 알림이 정상적으로 발송되고 있으나, 4,000명이 넘은 고객님들께서 저장한 프립은 일부 고객님들께 알림이 발송되지 않았던 내역을 확인하였습니다.</p>
							<p>이용에 불편을 드려 대단히 죄송합니다.</p>
							<br>
							<p>해당 오류는 3월 20일에 해결하였으며, 추후 동일한 상황이 발생하지 않도록 더욱 노력하겠습니다.</p>
							<br>
							<p>*단, 휴대폰 자체 설정에서 앱 알립을 off로 설정하셨거나, 앱 > 설정 > 앱 알림을 off로 설정하신 경우 푸시 알림이 발송되지 않는 점 유의해주시기 바랍니다.</p>
							<p>감사합니다.</p>
						</div>
					</li>
					<li>
						<div class="NoticeEntity_title">
							<div class="Badge">공지</div>
							<div class="Badge_title" id="notice_title">[Hong's class 이용 꿀팁] 내가 좋아하는 호스트의 클래스를 놓치지 마세요!</div>
							<div class="Badge_date">2023.04.01</div>
						</div>
						<div font-size="12px" style="display: none;" id="notice_contents" class="NoticeEntity_contents">
							<p>안녕하세요. 고객님 :)</p>
							<p>Hong's class입니다.</p>
							<br>
							<p>꼭 가고 싶었던 클래스인데 매번 인원이 너무 빨리 차 속상하셨다구요?</p>
							<p>Hong's Class의
							<strong><u>'호스트 팔로우 기능</u></strong>을 이용해 보세요!</p>
							<p><img class="host_follow" src="images/host_follow_ggtlsu.jpg"></p>
							<p><strong>Q : 호스트 팔로우? 어떠게 하는 건가요?</strong></p>
							<p>A : 마음에 드는 호스트의 프로필 보기를 눌러 오른쪽 상단의 하트 모양을 눌러주시기만 하면, 팔로우 끝!</p>
							<p>호스트가 새로운 클래스를 개설할 떄마다 바로 바로 푸시를 보내주니까 원하던 클래스 일정을 놓치지 않고 신청 할 수 있습니다.</p>
							<p>감사합니다.</p>
						</div>
					</li>
					<li>
						<div class="NoticeEntity_title">
							<div class="Badge">공지</div>
							<div class="Badge_title" id="notice_title">AWS 장애로 인해 서비스 접속 문제 해걸</div>
							<div class="Badge_date">2023.03.021</div>
						</div>
						<div font-size="12px" style="display: none;" id="notice_contents" class="NoticeEntity_contents">
							<p>안녕하세요. 고객님 :)</p>
							<p>Hong's class입니다.</p>
							<br>
							<p>결재 서비스는 Amazon Web Service (AWS) 운영되는 서비스를 이용하고 있어,
							<u>2023년 4월 11일 오전 8시에서 10시 사이</u>에 발생한 AWS 장애로 인해 서비스 이용이 불가능하였습니다.</p>
							<p>현재 AWS 장애 해결되어 서비스가 정상화 되었으니 참고 부탁드립낟.</p>
							<br>
							<p>혹시나, 장애가 발생했던 시기에 결제하였지만 신청 내역이 보이지 않는 경우 고객센터로 연락해주시면 결제 취소 처리 및 재결제를 할 수 있도록 안내해드리겠습니다.</p>
							<p><br>이용에 불편을 드려 죄송하며, 안정적인 서비스 제공을 위해 더욱 노력하겠습니다.</p>
							<p>감사합니다.</p>
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

