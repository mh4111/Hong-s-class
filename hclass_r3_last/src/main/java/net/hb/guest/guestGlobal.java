package net.hb.guest;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

public class guestGlobal {
	   Connection CN = null;
	   Statement ST = null;
	   PreparedStatement PST = null;
	   ResultSet RS = null ;
	   String msg = "";
	   int OK = 0;
	   
	   int Gcode=0, Gpay=0, Ghit=0,  Grn=0, Grow=0;
	   String Gname="",  Gtitle="", Gemail="";
	   java.util.Date Gwdate=null;
	   String Gdata="";  
	   int Gtotal = 0 ;
	   
	   //페이징및 검색
	   String pnum ;             //pnum = request.getParameter("pageNum=idx역할");
	   int pageNUM, pagecount;   //pageNUM=Integer.parseInt(pnum);
	   					         //총데이터 316개이니까 총페이지 pagecount=32
		
	   int start, end;          //슬비님선택[17]  start시작=161, end행=170
	   int startpage, endpage;  //startpage=[11] ~~[17] endpage=[20]
	   int temp; //[이전] [숫자]~~[숫자] [다음] 
	  
	   String sqry="", skey="", sval="" ;  //검색 이름/제목/메일
	   String returnpage="";               //Web0712.jsp?pageNum=7
	   
	   //시작행번호 Gtotal이용 역순
	   int Gnumber, Rnumber ; 
	   
	   //댓글관련 Rdata
	   String Rdata="";
	   int  Rrn,  Rnum, Rcode ;
	   String  Rwriter,  Rcontent ;
	   
	   
	   int Rcnt;
	   
	   String Rid="", Rcontents="";
	   Date Rdate=null;
}
