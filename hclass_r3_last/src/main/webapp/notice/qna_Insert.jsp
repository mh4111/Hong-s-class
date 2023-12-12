<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="notice.qna.notice_DAO"%>
<%@ page import="notice.qna.notice_VO"%>
<%@ include file="ssi.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.all.min.js"></script>
<!-- qna_Insert.jsp -->
<%
	// 사용자가 작성한 데이터 받아오기
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String pass = request.getParameter("pass");
	String email = request.getParameter("email");
	String title = request.getParameter("title");
	String contents = request.getParameter("contents");

	// 간단한 입력값 검증
	if (name == null || name.trim().isEmpty() ||
	    pass == null || pass.trim().isEmpty() ||
	    title == null || title.trim().isEmpty() ||
	    contents == null || contents.trim().isEmpty()) {
	    out.println("<script>Swal.fire('입력값 오류', '입력값이 유효하지 않습니다.', 'error').then(function() { history.go(-1); });</script>");
	    return;
	}

	try {
		 // 데이터베이스에 데이터 삽입을 위해 DAO 객체 생성 및 메서드 호출
        notice_DAO dao = new notice_DAO();
		
		 
        // date 변수를 현재 날짜로 설정
        String date = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
        boolean success = dao.noticeInsert(name, pass, title, contents);


		if (success) {
			out.println("<script>Swal.fire('Q&A 등록 완료', 'Q&A 등록이 완료되었습니다.', 'success').then(function() { location.href='qna_List.jsp'; });</script>");
		} else {
			out.println("<script>Swal.fire('Q&A 등록 실패', 'Q&A 등록에 실패하였습니다.', 'error').then(function() { history.go(-1); });</script>");
		}
	} catch (Exception e) {
		e.printStackTrace();
		out.println("<script>Swal.fire('오류', 'JDBC 드라이버를 찾을 수 없습니다.', 'error');</script>");
	}
%>
