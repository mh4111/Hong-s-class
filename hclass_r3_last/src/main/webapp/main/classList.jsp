<%@page import="reservation.lecture.LectureVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="common.jsp" %>

<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta charset="utf-8">
  <title>🎨Hong's Class</title>
  <link rel="stylesheet" href="main/css/nicepage.css" media="screen">
  <link rel="stylesheet" href="main/css/Home.css" media="screen">
  <script class="u-script" type="text/javascript" src="main/js/jquery.js" defer=""></script>
  <script class="u-script" type="text/javascript" src="main/js/nicepage.js" defer=""></script>
</head>

<body class="u-body u-xl-mode" data-lang="en">

<!-- 테이블에서 가지고 오는 클래스 목록 시작 -->
    <section class="u-clearfix u-section-2" id="sec-e1c9">
      <div class="u-clearfix u-sheet u-sheet-1">
        <h2 class="u-custom-font u-text u-text-black u-text-default u-text-1">클래스 목록📑</h2>
        <div class="u-list u-list-1">
          <div class="u-repeater u-repeater-1">

<%

    List<LectureVO> list = (List<LectureVO>)request.getAttribute("LV");
	
    
	msg= "select count(*) as cnt from h_class ";
	RS = ST.executeQuery(msg);
	if(RS.next()){ Gtotal= RS.getInt("cnt");	}
  
	pnum=request.getParameter("pageNum");
	if(pnum==null || pnum=="" || pnum.equals("")){pnum="1";}
	pageNUM = Integer.parseInt(pnum);
  
	start = (pageNUM-1)*12+1;
	end = (pageNUM)*12;

  	if(Gtotal%12==0){ pagecount= Gtotal /12; }
	else{ pagecount = (Gtotal/12)+1; }
  
	temp = (pageNUM-1)%10 ;
	startpage = pageNUM - temp;
	endpage = startpage + 9;

	//msg = "select * from (select rownum rn, code, c_title, price, img, people, avgrv, cntrv from h_class full outer join (select r_code, round(avg(score),1) as avgrv, count(score) as cntrv from h_review group by r_code) on code=r_code) where rn between "+start+" and "+end ;
	
	String a = "select * from ( ";
	String b = " select a.*, avgrv, cntrv from ( ";
	String s = " select rownum rn, c.* from h_class c) a left join ( ";
	String c = " select r_code, round(avg(score),2) as avgrv, count(score) as cntrv from h_review group by r_code ) on code=r_code order by code) ";
  	String d = " where rn between "+start+" and "+end;
	
  	msg = a + b + s + c + d ;
      
  RS = ST.executeQuery(msg);
	int z=0;
  while(RS.next()==true){
	LectureVO vo = (LectureVO)list.get(z);
	System.out.println(z);
	System.out.println(vo.getLname());	
	z++;
	
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
if(Hpeo==0){
%>

            <div class="u-container-style u-list-item u-repeater-item">
              <div class="u-container-layout u-similar-container u-container-layout-1">
                <div class="u-align-center u-image u-image-default u-image-2">

                <img src="./detailPagePicture/<%=vo.getLimg()%>" width="250" height="250">
                <div class="u-overlay-1" style="color: white;">Sold-Out</div>
                </div>
                <p class="u-custom-font u-hover-feature u-text u-text-black u-text-default u-text-2"><%=vo.getLtitle() %></p>
                <p class="u-custom-font u-text u-text-default u-text-3"> <%=df.format(vo.getLprice()) %>원 </p>
                <span class="u-file-icon u-icon u-icon-1"><img src="http://localhost:8080/hclass/main/images/7656139.png" alt=""></span>
                <p class="u-custom-font u-text u-text-default u-text-4"> <%=av.format(Havg) %> (<%=Hcnt %>)</p>
            
              </div>
            </div>
<%
}else{
%>
            <div class="u-container-style u-list-item u-repeater-item">
              <div class="u-container-layout u-similar-container u-container-layout-1">
               <a href="http://localhost:8080/hclass/lecture/2header.jsp?idx=<%=vo.getLid()%>">
                <img class="u-align-center u-image u-image-default u-image-1" src="./detailPagePicture/<%=vo.getLimg()%>">
                <p class="u-custom-font u-hover-feature u-text u-text-black u-text-default u-text-2"><%=Htitle %></p>
                <p class="u-custom-font u-text u-text-default u-text-3"><%=df.format(vo.getLprice()) %>원 </p>
                <span class="u-file-icon u-icon u-icon-1"><img src="http://localhost:8080/hclass/main/images/7656139.png" alt=""></span>
                <p class="u-custom-font u-text u-text-default u-text-4"><%=av.format(Havg) %> (<%=Hcnt %>)</p>
              	</a>
              </div>
            </div>     
  <%
	}//if end 

  }//while end
  %>
 		 </div>  
		 	<div class="u-listnum-1">
		  	  	<%
		  		if(endpage>pagecount){ endpage=pagecount;} 
			  	//[이전]
			  			//http://localhost:8080/project/main/classMain.jsp
			  		
			  		if(startpage>10){ 
			  			out.println("<a href=http://localhost:8080/hclass/main/classMain.jsp?pageNum="+(startpage-10)+">[이전]</a>");
			  		}
			  	%>
			  	<%
			  	for(int i=startpage; i<=endpage; i++){
			 		  if(i==pageNUM){
			 			out.println("<font style='color:tomato; font-weight: 400; font-size: 1.2rem;'>["+i+"]</font>");  
			 		  }else{
			 		  	out.println("<a href=http://localhost:8080/hclass/main/classMain.jsp?pageNum="+(i)+">["+i+"]</a>");
			 		  }
			 	  }
			  	%>
				<%
				//[다음]
					if(endpage<pagecount){
			  			out.println("<a href=http://localhost:8080/hclass/main/classMain.jsp?pageNum="+(startpage+10)+">[다음]</a>");
					}
				%>
		  </div> <!-- 목록 넘버링 end --> 
        </div>
      </div>
    </section>
</body>
</html>