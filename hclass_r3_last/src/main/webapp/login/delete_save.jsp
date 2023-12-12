<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="DB.MemberVO"%>
<%@ page import="DB.MemberDAO"%>
<%@ include file="ssi.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delete</title>
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.20/dist/sweetalert2.all.min.js"></script>
</head>
<body>
    <%
    try {
        String id = (String) session.getAttribute("user_id");

        MemberVO vo = new MemberVO();
        MemberDAO dao = new MemberDAO();

        dao.delete(id);
        
        session.invalidate(); // 세션 무효화
        // Swal.fire()를 사용하여 회원탈퇴 알림 표시 후 메인 페이지로 리다이렉트
    %>
    <script>
        Swal.fire({
            title: '정말로 회원 탈퇴를 하시겠습니까?',
            text: "복구는 불가능 합니다.",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            cancelButtonText: '취소',
            confirmButtonText: '회원탈퇴'
        }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire(
                    '회원탈퇴 완료!',
                    '계정이 삭제되었습니다.',
                    'success'
                ).then(() => {
                    location.href = 'http://localhost:8080/hclass/index.jsp'; // 메인 페이지로 리다이렉트
                }); 
            } else {
                location.href = 'mypage.jsp'; // 취소 시 마이페이지로 리다이렉트
            }
        });
    </script>
    <%
    } catch (Exception e) {
        // 계정 삭제 실패 시 안내 메시지 출력 후 마이페이지로 리다이렉트
    %>
    <script>
        Swal.fire({
            title: '계정 삭제 실패',
            text: '계정 삭제 중에 오류가 발생하였습니다.',
            icon: 'error',
            showCancelButton: false,
            confirmButtonColor: '#3085d6',
            confirmButtonText: '확인'
        }).then(() => {
            location.href = 'mypage.jsp'; // 마이페이지로 리다이렉트
        });
    </script>
    <%
    }
    %>
</body>
</html>