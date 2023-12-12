<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="notice.qna.notice_DAO" %>
<%@ page import="notice.qna.notice_VO" %>
<%@ page import="java.util.*" %>
<%@ include file="ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
 <title>qna_Edit</title>
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
        <h1 class="main">Q&A 수정</h1>
        <% 
        String noParam = request.getParameter("no"); 
        if (noParam != null && !noParam.isEmpty()) { 
            int no = Integer.parseInt(noParam);
            
            notice_DAO dao = new notice_DAO();
            notice_VO notice = dao.getNoticeByNo(no);
            if(notice != null){
        %>
        <div class="container">
            <div class="view_container">
                <form method="post" action="qna_EditSave.jsp">
                <input type="hidden" name="no" value="<%= notice.getNo() %>"> 
                    <table class="view_table">
                        <tr class="bg_blue">
                            <td class="row_1" colspan="8">
                            	제목 :
                                <input type="text" class="edit_title" name="n_title" value="<%= notice.getN_title() %>" required>
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
				        <textarea class="edit_contents" name="n_contents" rows="10"><%= notice.getN_contents() %></textarea>
				    </div>
				    <div class="btns">
				        <button type="submit" class="btn_orange">수정 완료</button>
				    </div>
				</form>
            </div>
        </div>

        <script>
        /* Your delete confirmation script */
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
