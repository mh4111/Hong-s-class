<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ include file="ssi.jsp"%>

<!DOCTYPE html>
<html>
<head>
<title>qna_Write</title>
<link href="../css/notice.css?after" rel="stylesheet" type="text/css">
    <!-- SweetAlert2 -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.all.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.min.css">
	
<meta charset="UTF-8">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
      	.swal2-modal{
	      	width:400px;
      	}
      	.swal2-popup {
        margin: 0;
        font-size: 15px;
        box-shadow: 0 1px 1px rgba(0, 0, 0, 0.21);
        margin-bottom: 28px;
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
		<div class="ment-box">
		<form name="write_form" action="qna_Insert.jsp" method="post" accept-charset="utf-8" onsubmit="return validForm();">
			<h2>온라인 문의</h2>
			<h5>궁금하신 점을 남겨주세요.</h5>
			<ul>
				<li>
				<div>이름<b>*</b></div>
					<input type="text" name="name" id="name_qna">
				<li>
				<div>비밀번호<b>*</b></div>
					<input type="password" name="pass" id="pass_qna">
				</li>
				<li>
				<div>메일<b>*</b></div>
					<input type="text" name="email" id="email_qna"> @ 
					<select name="email_back" id="email_back">
							<option value="">선택</option>
							<option value="naver.com">naver.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="daum.com">daum.net</option>
							<option value="daum.com">nate.com</option>
							<option value="daum.com">icloud.com</option>
					</select>
				</li>
				<li>
				<div>제목<b>*</b></div>
					<input type="text" name="title" id="title_qna">
				</li>
				<li>
				<div class="question_container">내용<b>*</b></div>
					<textarea name="contents" class="question-textarea" rows="8" cols="60">
					</textarea>
				</li>
				<li class="scroll">
					<div>개인정보 수집 <br>
					및 이용<b>*</b></div>
					<div class="scroll_box">
					<pre>
					"수집하는 개인정보의 항목
					수집하는 목적/방법에 따라 수집하는 개인정보 항목은 다음과 같습니다.
					- 기본 개인정보 정보
					　신청자, 샌년월일, 연락처, 이메일, 회사명
					- 마케팅/서비스 이용을 위한 정보
					　신청자, 주민등록번호, 연락처, 이메일, 회사명
					- 서비스 이용 중 발생되는 정보
					　서비스 이용기록, 접속로그, 쿠키
					　결재수단에 대한 기록여부(계좌), 결재기록
					개인정보 수집 및 이용 목적
					
					Hong's Class는 수집한 개인정보를 다음의 목적을 위해 활용합니다.
					- 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산 목적
					학습진행, 컨텐츠 제공, 구매 및 요금 결제, 물품배송 또는 청구지 등 발송
					- 회원 관리
					회원제 서비스 이용에 따른 본인확인, 개인 식별, 불량회원의 부정 이용 방지와
					비인가사용 방지, 가입 의사 확인, 연령확인, 불만처리 등 민원처리, 고지사항 전달
					- 마케팅 및 광고에 활용
					신규 서비스(제품) 개발 및 특화, 이벤트 등 광고성 정보 전달, 인구통계학적 특성에 따른
					서비스 제공 및 광고 게재, 접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계
					- 고용보험 과정의 노동부 신고
					회원이 신청한 과정이 고용보험 대상 과정인 경우 고용보험 환급을 이유로 노동부에 신고하게 됩니다.
					개인 정보 보유 및 이용기간
					
					원칙적으로, 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다.
					단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다.
					보존 항목 : 신청자, 주민등록번호, 연락처, 이메일, 회사명
					보존 근거 : 고용보험 환급 적정성 심의
					보존 기간 : 3년
					그리고 관계법령의 규정에 의하여 보존할 필요가 있는 경우 회사는 아래와 같이 관계법령에서 정한 일정한 기간 동안 회원정보를 보관합니다.
					1) 기타 법령에 따른 보유기간/관계법 안내
					- 계약 또는 청약철회 등에 관한 기록 : 5년 (전자상거래 등에서의 소비자 보호에 관한 법률)
					- 대금결제 및 재화 등의 공급에 관한 기록 : 5년 (전자상거래 등에서의 소비자 보호에 관한 법률)
					- 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년 (전자상거래 등에서의 소비자 보호에 관한 법률)
					- 본인확인에 관한 기록 보존 이유 : 정보통신 이용촉진 및 정보보호 등에 관한 법률 보존 기간 : 6개월
					- 방문에 관한 기록 보존 이유 : 통신 비밀 보호법 보존 기간 : 3개월"
					</pre>
					<div class="checkbox">
						<input type="checkbox" name="check_span" id="check_span" class="checkbox-style">
						<label for="check_span"><span>본인은 위 개인정보취급방침에 동의하십니까?</span></label>			
					</div>
					</div>
				</li>
				<li class="center">
					<input type="submit" id="submit_style" value="등록하기"> 
					<input type="reset" id="reset_style" value="취소" onclick="location='qna_List.jsp'">
				</li>
			</ul>				
		</form>
		</div>
	</div>
	</div>
	<div>
	<jsp:include page="../main/footer.jsp" flush="false" />	
  </div>
	<!--8/8 수정  -->
	<script type="text/javascript">
		function validForm(){
			var checkBox = document.getElementById("check_span");
			if (!checkBox.checked) {
				Swal.fire({
					icon: 'info',
					title: '<div style=font-weight:bold;font-size:20px;>개인정보취급방침에 동의해주세요</div>',
					confirmButtonColor: '#3085d6',
					confirmButtonText: '확인'
				});
				return false;
			}
			return true;
		}	
	</script>
</body>
</html>