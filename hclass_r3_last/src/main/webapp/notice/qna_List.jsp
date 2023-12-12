<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="notice.qna.notice_DAO" %>
<%@ page import="notice.qna.notice_VO" %>
<%@ page import="java.util.*"%>
<%@ include file="ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<title>qna_List</title>
    
    <meta charset="UTF-8">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<link href="../css/notice.css?after" rel="stylesheet" type="text/css">	
	<!-- main -->
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
            int pageNUM = 1;
            String skey = request.getParameter("keyfield");
            String sval = request.getParameter("keyword");

            if (skey == null || skey.isEmpty() || sval == null || sval.isEmpty()) {
                skey = "n_title";
                sval = "";
            }

            String returnpage = "&keyfield=" + skey + "&keyword=" + sval;
            String pnum = request.getParameter("pageNum");

            if (pnum != null && !pnum.isEmpty()) {
                pageNUM = Integer.parseInt(pnum);
            }
            // 전체 게시물 개수 가져오기
            notice_DAO dao = new notice_DAO();
            int totalCount = dao.NoticeCount(skey, sval);

            int pagecount = (totalCount + 10 - 1) / 10;

            if (pageNUM <= 0) pageNUM = 1;
            else if (pageNUM > pagecount) pageNUM = pagecount;

            int start = (pageNUM - 1) * 10 + 1;
            int end = pageNUM * 10;

            int startpage = ((pageNUM - 1) / 10) * 10 + 1;
            int endpage = startpage + 9;
            if (endpage > pagecount) endpage = pagecount;
        %>

        <div class="qna_List">
            <table class="qna_table">
                <colgroup>
                    <col style="width: 75px;">
                    <col style="width: auto;">
                    <col style="width: 125px;">
                    <col style="width: 125px;">
                    <col style="width: 125px;">
                </colgroup>
                <thead>
                <tr>
                    <th scope="col">NO</th>
                    <th scope="col">제목</th>
                    <th scope="col">작성자</th>
                    <th scope="col">조회수</th>
                    <th scope="col">날짜</th>
                </tr>
                </thead>
                <%
                    // 게시물 출력
                    List<notice_VO> noticeList = dao.noticePaging(start, end, skey, sval);
                    for (notice_VO notice : noticeList) {
                        int no = notice.getNo();
                        String title = notice.getN_title();
                        String name = notice.getN_name();
                        int count = notice.getN_count();
                        Date date = notice.getN_date();

                %>
                <tr align="center" onmouseover="style.backgroundColor='#dddddd'" onmouseout="style.backgroundColor=''">
                    <th class="no" scope="col"><%= no %></th>
                    <th class="align-left" scope="col"><a href="qna_View.jsp?no=<%= no %>" class="btn-title">
                            <span class="title-text"><%= title %></span></a></th>
                    <th class="name-nn" scope="col"><%= name %></th>
                    <th class="hit-tt" scope="col"><%= count %></th>
                    <th class="date-dd" scope="col"><%= date %></th>
                </tr>
                <%
                    }//for end
                %>

            </table>
        </div>
        <form>
            <table style="margin-left: 39%;">
                <tr class="page_wrap" align="center">
                    <th class="page_nation" colspan="5">
                        <a class="arrow pprev" href="#">◀</a>
                        <%
                            //[이전]
                            if (startpage > 10) {
                                out.print("<a class='arrow prev' href=qna_List.jsp?pageNum=" + (startpage - 10) + returnpage + "></a>");
                            }

                            for (int i = startpage; i <= endpage; i++) {
                                if (i == pageNUM) {
                                    out.print("<a class='active'>" + i + "</a>");
                                } else {
                                    out.print("<a class='#' href=qna_List.jsp?pageNum=" + i + returnpage + ">" + i + "</a>");
                                }
                            } //for end

                            //[다음]
                            if (endpage < pagecount) {
                                out.print("<a class='arrow next' href=qna_List.jsp?pageNum=" + (startpage + 10) + returnpage + "></a>");
                            }
                        %>
                        <a class="arrow nnext" href="">▶</a>
                    </th>
                </tr>
            </table>
            <div class="select_box">
                <form class="search_input" action="qna_List.jsp" method="get">
                    <select class="select" name="keyfield">
                        <option value="" selected="selected">전체검색</option>
                        <option value="n_title"<%if(skey.equals("n_title")){out.print("selected");}%> >제목검색</option>
                        <option value="n_name"<%if(skey.equals("n_name")){out.print("selected");}%>>이름검색</option>
                    </select>
                    <input type="text" class="search_input" name="keyword" value="<%= sval %>" size=10 placeholder="검색어입력">
                    <input type="submit" class="btn_search" value="검색">
                    <a class="hidden_write" href="qna_Write.jsp"><input type="button" class="btn_write" value="글쓰기"></a>
                </form>
            </div>
        </form>
    </div>
</div>
<div>
    <jsp:include page="../main/footer.jsp" flush="false" />
</div>
</body>
</html>
