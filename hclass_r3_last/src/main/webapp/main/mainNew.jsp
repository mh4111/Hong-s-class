<%@page import="reservation.lecture.LectureDAO"%>
<%@page import="reservation.lecture.LectureVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="common.jsp" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>mainNew</title>
</head>
<body class="u-body u-xl-mode" data-lang="en">

<!-- 테이블에서 가지고 오는 클래스 목록 시작 -->
    <section class="u-clearfix u-section-2" id="sec-e1c9">
      <div class="u-clearfix u-sheet u-sheet-1">
        <h2 class="u-custom-font u-text u-text-black u-text-default u-text-1">새로 등록된 클래스✨</h2>
        <div class="u-list u-list-1">
          <div class="u-repeater u-repeater-1">

<%
	LectureDAO dao = new LectureDAO();
	
	skey=request.getParameter("keyfield");
	sval=request.getParameter("keyword");
	
	if(skey==null || skey=="" || sval==null || sval=="" || sval.equals("")){
		skey="c_title"; sval="" ;
	}
	
	sqry = " where " + skey + " like '%"+ sval + "%'  " ;
	returnpage="&keyfield="+ skey+"&keyword="+sval;
	
	pnum=request.getParameter("pageNum"); // <a href=awsList.do?pageNum=17>[17]</a>
	if(pnum==null || pnum=="" || pnum.equals("")){ pnum="1"; }
	pageNUM=Integer.parseInt(pnum);
	
	start = (pageNUM-1)*10+1 ; 
	end = (pageNUM*10) ; 
	
	dao = new LectureDAO();
	Gtotal = dao.lectureCountAll();
	 
	if(Gtotal%10==0){ pagecount = Gtotal/10; }
	else{ pagecount = (Gtotal/10)+1;  }
	temp = (pageNUM-1)%10;  
	startpage = pageNUM-temp;  
	endpage = startpage+9;     
	if(endpage>pagecount){ endpage=pagecount; } 


	List<LectureVO> list = (List<LectureVO>)dao.lectureSelectAll(start, end, skey, sval);

  String a = "select * from (";
  String b = "select rownum rn, code, c_title, price, img, people, avgrv, cntrv from h_class full outer join ( ";
  String c = "select r_code, round(avg(score),2) as avgrv, count(score) as cntrv from h_review group by r_code ";
  String d = ") on code=r_code) where rn between 1 and 8" ;

  msg = a + b + c + d ;	  
  
  RS = ST.executeQuery(msg);
  int z = 0;
  while(RS.next()==true){
	  LectureVO vo = list.get(z);
	Hcode = RS.getString("code");
	Htitle = RS.getString("c_title");
	Hprice = RS.getInt("price");  
	Havg = RS.getDouble("avgrv");
	Hcnt = RS.getInt("cntrv");
	Himg = RS.getString("img");
	Hpeo = RS.getInt("people");
%>

<!-- 이미지 테이블 저장경로 확인하고 코드 수정하기 -->
<!-- 아이템 -->
<%
if(Hpeo==0){%>
            <div class="u-container-style u-list-item u-repeater-item">
              <div class="u-container-layout u-similar-container u-container-layout-1">
                <div class="u-align-center u-image u-image-default u-image-2">
                <img src="./detailPagePicture/<%=vo.getLimg()%>" width="250" height="250">
                <div class="u-overlay-1" style="color: white;">Sold-Out</div>
                </div>
                <p class="u-custom-font u-hover-feature u-text u-text-black u-text-default u-text-2"><%=Htitle %></p>
                <p class="u-custom-font u-text u-text-default u-text-3"> <%=df.format(Hprice) %>원 </p><span class="u-file-icon u-icon u-icon-1"><img src="main/images/7656139.png" alt=""></span>
                <p class="u-custom-font u-text u-text-default u-text-4"> <%=av.format(Havg) %> (<%=Hcnt %>)</p>
              </div>
            </div>
<%
}else{
%>
			<a href="http://localhost:8080/hclass/lecture/2header.jsp?idx=<%=vo.getLid()%>">
	            <div class="u-container-style u-list-item u-repeater-item">
	              <div class="u-container-layout u-similar-container u-container-layout-1">
	                <img class="u-align-center u-image u-image-default u-image-1" src="./detailPagePicture/<%=vo.getLimg()%>">
	                <p class="u-custom-font u-hover-feature u-text u-text-black u-text-default u-text-2"><%=vo.getLtitle() %></p>
	                <p class="u-custom-font u-text u-text-default u-text-3"><%=df.format(vo.getLprice()) %>원 </p><span class="u-file-icon u-icon u-icon-1"><img src="main/images/7656139.png" alt=""></span>
	                <p class="u-custom-font u-text u-text-default u-text-4"><%=av.format(Havg) %> (<%=Hcnt %>)</p>
	              </div>
	            </div>  
            </a>   
  <%
	}//if end 

z++;
}//while end
  %>
 		 </div>  
        </div>
      </div>
    </section>
</body>
</html>