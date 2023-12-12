package common;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

public class Global {
	 Connection CN = null;
	 Statement ST = null;
	 PreparedStatement PST = null;
	 ResultSet RS = null ;
	 String msg = "";
	 int OK = 0;
	   
	 int Gcode=0, Gpay=0, Ghit=0,  rn=0, Grow=0;
	 String Gname="",  Gtitle="", Gemail="";
	 Date Gwdate=null;
	 String Gdata="";  
	 int Gtotal = 0 ;
	   
	 String pnum ;             
	 int pageNUM, pagecount;   
	   					       
	 int start, end;          
	 int startpage, endpage;  
	 int temp;  
	  
	 String sqry="", skey="", sval="" ;  
	 String returnpage="";               
	   
	 int Gnumer, Rnumer ; 
	
}//class END
