<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="notice.qna.notice_DAO"%>
<%@ page import="notice.qna.notice_VO"%>

<%
    String noParam = request.getParameter("no");
    String password = request.getParameter("pass");

    if (noParam != null && !noParam.isEmpty()) {
        try {
            int no = Integer.parseInt(noParam);

            notice_DAO dao = new notice_DAO();
            boolean isDeleted = dao.noticeDelete(no, password);

            // JSON 형태의 응답을 만들어서 클라이언트로 전송
            out.println("{ \"isDeleted\" : " + isDeleted + " }");
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("{ \"isDeleted\" : false }");
        } catch (NumberFormatException e) {
            // 'no' 파라미터가 정수로 변환할 수 없는 경우 처리
            out.println("{ \"isDeleted\" : false }");
        }
    } else {
        // 'no' 파라미터가 null이거나 빈 문자열인 경우 처리
        out.println("{ \"isDeleted\" : false }");
    }
%>
