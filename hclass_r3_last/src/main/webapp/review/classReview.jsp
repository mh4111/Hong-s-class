<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ page import="net.hb.guest.guestDAO" %>
<%@ page import="net.hb.guest.guestVO" %>
<%@ page import="DB.MemberDAO" %>
<%@ page import="DB.MemberVO" %>
<%@ page import="java.util.*" %>




<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="http://localhost:8080/hclass/review/css/review.css" type="text/css">
 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    
    <script>
    function reviewcheck() {
        var chk_radio = document.getElementsByName('reviewStar');
        var sel_type = null;
        var contents = document.getElementById('reviewContents').value;

        for(var i = 0; i < chk_radio.length; i++){
            if(chk_radio[i].checked == true){ 
                sel_type = chk_radio[i].value;
            }
        }
        
        if(sel_type == null){
            Swal.fire({
                icon: 'warning',
                title: '별점 선택',
                text: '별점을 선택하세요.',
                confirmButtonText: '확인'
            });
            return false;
        }
        
        if(contents.trim() === '') {
            Swal.fire({
                icon: 'warning',
                title: '리뷰 내용 입력',
                text: '리뷰 내용을 입력하세요.',
                confirmButtonText: '확인'
            });
            return false;
        }
        
       
        
    }
    
    </script>


<title>review</title>
</head>
<body>

<%
 String Gid = (String) session.getAttribute("user_id");
 String Gcode=(String)request.getParameter("Lcode");


pnum = request.getParameter("pageNum");
	if(pnum==null || pnum=="" || pnum.equals("")){
		pnum="1";
	}
	pageNUM = Integer.parseInt(pnum);  //문자페이지번호 숫자번호
	
	start = (pageNUM-1)*3+1;
	end = pageNUM*3;
	
	guestDAO dao= new guestDAO();
	Gtotal=dao.reviewCount(Gcode);
	
	 if(Gtotal%3==0){
		pagecount = Gtotal/3;
	}else{
		pagecount = (Gtotal/3)+1;
	}
	temp = (pageNUM-1)%3; 
	startpage = pageNUM-temp;
	endpage = startpage+2;
	
	if(endpage>pagecount){
		endpage=pagecount;
	}  
%>

<div align="center" >
<form class="mb-3" name="myform" id="myform" method="post" action="http://localhost:8080/hclass/review/classReviewInsert.jsp">
	<fieldset>
        <input type="hidden" name="id" value="<%=Gid%>">
  	    <input type="hidden" name="code" value="<%=Gcode%>">
		<span class="text-bold">별점을 선택해주세요</span>
		<input type="radio" name="reviewStar" value="5" id="rate1" required><label
			for="rate1">★</label>
		<input type="radio" name="reviewStar" value="4" id="rate2" required><label
			for="rate2">★</label>
		<input type="radio" name="reviewStar" value="3" id="rate3" required><label
			for="rate3">★</label>
		<input type="radio" name="reviewStar" value="2" id="rate4" required><label
			for="rate4">★</label>
		<input type="radio" name="reviewStar" value="1" id="rate5" required><label
			for="rate5">★</label>
	</fieldset>
	<div>
		<textarea class="col-auto form-control"  id="reviewContents" name="contents"
				  placeholder="리뷰를 남겨주세요." required></textarea>
				  
	</div>
	<div class="btn1">
	<input class="button" type="submit"  value="리뷰등록" onclick="reviewcheck()">
	</div>
</form>	


     <%
    
    
	List<guestVO> list=dao.reviewList(Gcode, start, end);
	for(guestVO vo : list){ 
  %>
  <br>
  
  <div class="review-container"> 
    <div class="cards">
        <div class="card">
            <div class="card-top">
                <div class="name">
                    <div>
                    <span><img src="https://front-img.taling.me/Content/Images/tutee_no_img.png" style="border-radius : 90px" width="50" height="50" ></span>
                    </div>
                    <p><%=vo.getId()%></p>
                </div>
            </div>
            
            <div class="card-content">
                <p><%=vo.getContents()%></p>
            </div>

            <div class="card-action">
                <span><%=vo.getWdate()%></span>
                <p align="right" class="t1">
                <a href="http://localhost:8080/hclass/review/classReviewEdit.jsp?idx=<%=vo.getNum()%>&idx1=<%=Gid %>&idx2=<%=Gcode %>"  style="text-decoration:none;">수정 </a>
                <a href="http://localhost:8080/hclass/review/classReviewDelete.jsp?idx=<%=vo.getNum()%>&idx1=<%=Gid %>&&idx2=<%=Gcode %>" style="text-decoration:none;"> 삭제</a></p>
            </div>

        </div>
        
    </div>
</div>
  <%}//while end%>
  
  
  
  
  
  
  
    
    <ul class="page">
       <%
    
 		if(startpage>3){
     	out.println("<li class='page__btn'><a href=http://localhost:8080/hclass/awsDetail.do?idx="+Gcode+"&pageNum="+(startpage-3)+" > < </a></li>");   
      	 }
      %>
      
      <%
      	for (int i=startpage; i<=endpage; i++){
      		if(i==pageNUM){
      			out.print("<li class='page__numbers active'>"+ i +"</li>");
      		}else{
      			out.print("<li class='page__numbers'><a href=http://localhost:8080/hclass/awsDetail.do?idx="+Gcode+"&pageNum=" + i + ">"+ i +"</a></li>");
      		}
      	}
      %>
      
      <%
      
      	if(endpage<pagecount){
   		out.print("<li class='page__btn'><a href=http://localhost:8080/hclass/awsDetail.do?idx="+Gcode+"&pageNum="+(startpage+3)+"> > </a></li>"); 
      	}
      
      %> 
      </ul>
 
  
      
 </div>

</body>
</html>

