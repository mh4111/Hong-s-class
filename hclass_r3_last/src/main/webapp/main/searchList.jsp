<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="common.jsp" %>

<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta charset="utf-8">
  <title>🎨Hong's Class</title>
  <link rel="stylesheet" href="css/nicepage.css" media="screen">
  <link rel="stylesheet" href="css/Home.css" media="screen">
  <script class="u-script" type="text/javascript" src="js/jquery.js" defer=""></script>
  <script class="u-script" type="text/javascript" src="js/nicepage.js" defer=""></script>
</head>

<body class="u-body u-xl-mode" data-lang="en">

<!-- top -->	
  <div>
	<jsp:include page="header.jsp" flush="false" />	
  </div>


<%
	sval=request.getParameter("keyword");

	if(sval==null || sval=="" || sval.equals("")){
		sval="";
	}//if end
	sqry = "where c_title like '%"+sval+"%'";
	
	//http://localhost:8080/project/index.jsp?keyword=1#
	returnpage= "&keyword="+sval;

	msg= "select count(*) as cnt from h_class "+ sqry;
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
	String s = " select rownum rn, c.* from h_class c "+sqry+") a left join ( ";
	String c = " select r_code, round(avg(score),2) as avgrv, count(score) as cntrv from h_review group by r_code ) on code=r_code order by code) ";
  	String d = " where rn between "+start+" and "+end;
	
  	msg = a + b + s + c + d ;
%>
<!-- 테이블에서 가지고 오는 클래스 목록 시작 -->
    <section class="u-clearfix u-section-2" id="sec-e1c9">
      <div class="u-clearfix u-sheet u-sheet-1">
        <h2 class="u-custom-font u-text u-text-black u-text-default u-text-1">"<%=sval %>"로 검색된 클래스 <%=Gtotal %>개📑</h2>
        <div class="u-list u-list-1">
          <div class="u-repeater u-repeater-1">
<%
  RS = ST.executeQuery(msg);
  while(RS.next()==true){
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
                <img src="http://localhost:8080/hclass/detailPagePicture/<%=Himg %>" width="250" height="250">
                <div class="u-overlay-1" style="color: white;">Sold-Out</div>
                </div>
                <p class="u-custom-font u-hover-feature u-text u-text-black u-text-default u-text-2"><%=Htitle %></p>
                <p class="u-custom-font u-text u-text-default u-text-3"> <%=df.format(Hprice) %>원 </p>
                <span class="u-file-icon u-icon u-icon-1"><img src="http://localhost:8080/hclass/main/images/7656139.png" alt=""></span>
                <p class="u-custom-font u-text u-text-default u-text-4"> <%=av.format(Havg) %> (<%=Hcnt %>)</p>
              </div>
            </div>
<%
}else{
%>
            <div class="u-container-style u-list-item u-repeater-item">
              <div class="u-container-layout u-similar-container u-container-layout-1">
                <img class="u-align-center u-image u-image-default u-image-1" src="http://localhost:8080/hclass/detailPagePicture/<%=Himg %>">
                <p class="u-custom-font u-hover-feature u-text u-text-black u-text-default u-text-2"><%=Htitle %></p>
                <p class="u-custom-font u-text u-text-default u-text-3"><%=df.format(Hprice) %>원 </p>
                <span class="u-file-icon u-icon u-icon-1"><img src="http://localhost:8080/hclass/main/images/7656139.png" alt=""></span>
                <p class="u-custom-font u-text u-text-default u-text-4"><%=av.format(Havg) %> (<%=Hcnt %>)</p>
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
			  			out.println("<a href=http://localhost:8080/hclass/main/searchList.jsp?pageNum="+(startpage-10)+ returnpage +">[이전]</a>");
			  		}
			  	%>
			  	<%
			  	for(int i=startpage; i<=endpage; i++){
			 		  if(i==pageNUM){
			 			out.println("<font style='color:tomato; font-weight: 400; font-size: 1.2rem;'>["+i+"]</font>");  
			 		  }else{
			 		  	out.println("<a href=http://localhost:8080/hclass/main/searchList.jsp?pageNum="+(i+returnpage)+">["+i+"]</a>");
			 		  }
			 	  }
			  	%>
				<%
				//[다음]
					if(endpage<pagecount){
			  			out.println("<a href=http://localhost:8080/hclass/main/searchList.jsp?pageNum="+(startpage+10)+returnpage+">[다음]</a>");
					}
				%>
		  </div> <!-- 목록 넘버링 end --> 
        </div>
      </div>
    </section>
    
    <!-- footer -->  	
  <div>
	<jsp:include page="footer.jsp" flush="false" />
  </div>
</body>
</html>