<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="notice.qna.notice_DAO" %>
<%@ page import="notice.qna.notice_VO" %>
<%@ page import="java.util.*" %>
<%@ include file="ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<title>qna_View</title>
    <link href="../css/notice.css" rel="stylesheet" type="text/css">
  
    <!-- SweetAlert2 -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.min.js"></script>
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
        <% 
        String noParam = request.getParameter("no"); 
        if (noParam != null && !noParam.isEmpty()) { 
            int no = Integer.parseInt(request.getParameter("no"));
            
            // 조회수 증가
            notice_DAO dao = new notice_DAO();
            dao.updateNoticeCount(no);
            
            notice_VO notice = dao.getNoticeByNo(no);
            if(notice != null){
        %>
        <div class="container">
            <div class="view_container">
                    <table class="view_table">
                         <tr class="bg_blue">
                             <td class="row_1" colspan="8">
                                 <%= notice.getN_title() %>
                             </td>
                         </tr>
                         <tr>
                           <td class="row_2">작성자</td>
                           <td class="row_content"><%= notice.getN_name() %></td>
                           <td class="row_2">등록일</td>
                           <td class="row_content"><%= notice.getN_date() %></td>
                           <td class="row_empty"> </td>
                           <td class="row_empty"> </td>
                           <td class="row_empty"> </td>
						   <td class="row_3">조회수 <span class="row_content"><%= notice.getN_count() %><span></td>
                         </tr>
                    </table>
                    <div class="view_contents">
                        <span><%= notice.getN_contents() %></span>
                    </div>
					<div class="btns">
                     	<button class="btn_orange" onclick="location.href ='qna_List.jsp'">목록</button>
                        <button type="button" class="btn_orange" onclick="confirmDelete(<%= notice.getNo() %>);">삭제</button>
                        <button type="button" class="btn_orange" onclick="checkPassword(<%= notice.getNo() %>)">수정</button>
                    </div>
            </div>
        </div>
	
	<script>
	/* 삭제 */
	function confirmDelete(no) {
	    Swal.fire({
	        title:   '<div style=color:black;font-size:18px;margin-top:20px;>비밀번호를 입력해주세요</div>', 
	        input: 'password',
	        inputAttributes: {
	            autocapitalize: 'off',
	            maxlength: 20, // 최대 입력 글자수
	            placeholder: '비밀번호를 입력해주세요.'
	        },
	        customClass: {
	            title: 'your-custom-title-class' 
	        },
	        showCancelButton: true,
	        confirmButtonText: '삭제',
	        cancelButtonText: '취소',
	        showLoaderOnConfirm: true,
	        preConfirm: (password) => {
	            if (!password) {
	                Swal.showValidationMessage('비밀번호를 입력해주세요.');
	                return;
	            }
	            return fetch('qna_delete.jsp', {
	                method: 'POST',
	                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
	                body: new URLSearchParams({ no, pass: password }),
	            })
	            .then(response => {
	                if (!response.ok) throw new Error('서버 오류로 게시물 삭제에 실패했습니다.');
	                return response.json();
	            })
	            .catch(error => Swal.showValidationMessage(`에러: ${error}`));
	        },
	        allowOutsideClick: false, // 취소 버튼 눌러도 창이 닫히지 않도록 설정
	    }).then(result => {
	        if (result.isConfirmed && result.value.isDeleted) {
	            Swal.fire('성공', '게시물이 삭제되었습니다.', 'success').then(() => {
	                location.href = 'qna_List.jsp';
	            });
	        } else if (result.dismiss === Swal.DismissReason.cancel) {
	        } else {
	            Swal.fire('실패', '비밀번호가 일치하지 않습니다. 다시 입력해주세요.', 'error');
	        }
	    });
	}
	
	/* 수정 */
    function checkPassword(no) {
        Swal.fire({
            title: '<div style=color:black;font-size:18px;margin-top:20px;>비밀번호 확인</div>',
            input: 'password',
            inputAttributes: {
                autocapitalize: 'off',
                maxlength: 20,
                placeholder: '비밀번호를 입력해주세요.'
            },
            showCancelButton: true,
            confirmButtonText: '확인',
            cancelButtonText: '취소',
            preConfirm: (password) => {
                if (!password) {
                    Swal.showValidationMessage('비밀번호를 입력해주세요.');
                    return false;
                }
                // 비밀번호를 입력하고 확인 버튼을 눌렀을 때의 처리
                location.href = 'qna_password.jsp?no=' + no + '&password=' + encodeURIComponent(password);
            }
        });
    }
	</script>

        <% 
            } else { 
        %>
        <div class="container">
            <div class="view_container">
                <h3 class="no_line">Q & A</h3>
                <p>해당 게시물을 찾을 수 없습니다.</p>
                <div class="btns">
                    <a class="btn_orange" href="qna_List.jsp">목록</a>
                </div>
            </div>
        </div>

        <% 
            }
        } else {
            response.sendRedirect("qna_List.jsp"); 
        }
        %>

    </div>
  </div>
    <div>
	<jsp:include page="../main/footer.jsp" flush="false" />	
  </div>
</body>
</html>