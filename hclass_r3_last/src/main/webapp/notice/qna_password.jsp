<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="notice.qna.notice_DAO" %>
<%@ page import="notice.qna.notice_VO" %>
<%@ include file="ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <!-- SweetAlert2 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.min.css">
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    String noParam = request.getParameter("no");
    String inputPassword = request.getParameter("password");

    if (noParam != null && inputPassword != null) {
        int no = Integer.parseInt(noParam);

        notice_DAO dao = new notice_DAO();
        boolean isPasswordCorrect = dao.checkPassword(no, inputPassword);

        if (isPasswordCorrect) {
            response.sendRedirect("qna_Edit.jsp?no=" + no);
        } else {
            out.println("<script>");
            out.println("Swal.fire('비밀번호 오류', '비밀번호가 일치하지 않습니다.', 'error').then(function() {");
            out.println("  location.href = 'qna_View.jsp?no=" + no + "';");
            out.println("});");
            out.println("</script>");
        }
    } else {
        out.println("<script>");
        out.println("Swal.fire('파라미터 오류', '파라미터가 올바르게 전달되지 않았습니다.', 'error').then(function() {");
        out.println("  history.back();");
        out.println("});");
        out.println("</script>");
    }
%>
</body>
</html>
