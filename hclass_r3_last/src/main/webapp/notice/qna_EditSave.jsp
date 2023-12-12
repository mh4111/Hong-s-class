<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="notice.qna.notice_DAO" %>
<%@ page import="notice.qna.notice_VO" %>
<%@ page import="java.util.*" %>
<%@ include file="ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <!-- SweetAlert2 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.min.css">
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
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    String noParam = request.getParameter("no");
    String newTitle = request.getParameter("n_title");
    String newContents = request.getParameter("n_contents");

    if (noParam != null) {
        int no = Integer.parseInt(noParam);

        notice_DAO dao = new notice_DAO();
        notice_VO notice = dao.getNoticeByNo(no);

        if (notice != null) {
            if (newTitle != null) {
                notice.setN_title(newTitle);
            }
            if (newContents != null) {
                notice.setN_contents(newContents);
            }
        	 // 등록일 업데이트
            Date currentDate = new Date();
            notice.setN_date(currentDate);
            boolean updateSuccess = dao.noticeEdit(notice);

            if (updateSuccess) {
                // SweetAlert2 알림 메시지 출력 및 페이지 이동
                out.println("<script>");
                out.println("Swal.fire('<div style=color:black;font-size:18px;margin-top:20px;>수정완료</div>', '수정이 완료되었습니다.', 'success').then(function() {");
                out.println("  location.href = 'qna_View.jsp?no=" + no + "';");
                out.println("});");
                out.println("</script>");
            } else {
                // SweetAlert2 알림 메시지 출력
                out.println("<script>");
                out.println("Swal.fire('<div style=color:black;font-size:18px;margin-top:20px;>수정실패</div>', '공지사항 내용 업데이트에 실패하였습니다.', 'error');");
                out.println("</script>");
            }
        } else {
            // SweetAlert2 알림 메시지 출력
            out.println("<script>");
            out.println("Swal.fire('오류', '해당 공지사항을 찾을 수 없습니다.', 'error');");
            out.println("</script>");
        }
    }
%>
</body>
</html>
