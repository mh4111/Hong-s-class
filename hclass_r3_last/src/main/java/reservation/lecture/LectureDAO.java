package reservation.lecture;

import java.util.ArrayList;
import java.util.List;

import reservation.common.DB;

public class LectureDAO extends LectureGlobal implements LectureInterface {
  public LectureDAO() {
	 try {
		CN=DB.getConnection();
		ST=CN.createStatement();
	 }catch(Exception ex) {
		 System.out.println(ex);
	 }
   }//LectureDAO constructor
	
  public int lectureInsert(LectureVO vo) {
	  try {
	   msg = "insert into h_class values(?, ?, ?, ?, ?, ?, ?, ?, TO_DATE(?,'YYYY-MM-DD'), TO_DATE(?,'YYYY-MM-DD'), ?, ?,sysdate)";
	   PST = CN.prepareStatement(msg);
	   
	   PST.setString(1, vo.getLid());
		  System.out.println(vo.getLid());
		  
	   PST.setString(2, vo.getLname());
		  System.out.println(vo.getLname());
		  
	   PST.setString(3, vo.getLnum());
		  System.out.println(vo.getLnum());
		  
	   PST.setString(4, vo.getLurl());
		  System.out.println(vo.getLurl());
		  
	   PST.setString(5, vo.getLimg());
		  System.out.println(vo.getLimg());
		  
	   PST.setString(6, vo.getLlocation());
		  System.out.println(vo.getLlocation());
	   
	   PST.setString(7, vo.getLtitle());
		  System.out.println(vo.getLtitle());
	   
	   PST.setString(8, vo.getLcontents());
		  System.out.println(vo.getLcontents());
	   
	   PST.setString(9,vo.getLsdate());

	
	   PST.setString(10,vo.getLedate());
	   
	   PST.setInt(11, vo.getLprice());
		  System.out.println(vo.getLprice());
		  
	   PST.setInt(12, vo.getLpeople());
		  System.out.println(vo.getLpeople());
		  
	   PST.executeUpdate();//ok
	     
	     System.out.println("lecture테이블 저장성공");    
	  }catch(Exception ex) {
		  System.out.println(ex);
		  
	  }
	  return OK;
  }//end

  
  public List<LectureVO> lectureSelectAll(int start, int end, String skey, String sval){ //시작행,끝행,검색필드,검색어 
		List<LectureVO> alist = new ArrayList<LectureVO>();
		try {
		  String a ="select * from ( ";
		  String b =" select rownum rn, code,name,num,url,img,location,c_title,c_contents,sdate,edate,price,people from ";
		  String y = " ( select * from h_class where "+ skey + " like '%" + sval + "%'  order by code ) ";
		  String c =" ) where rn between  " + start + " and "  + end;	
		  msg = a+b+y+c ; 
		  
		 RS = ST.executeQuery(msg);
		   while(RS.next()==true){
			  LectureVO vo = new LectureVO();
			  vo.setLid(RS.getString("code")); 
			  vo.setLname(RS.getString("name"));
			  vo.setLnum(RS.getString("num"));
			  vo.setLurl(RS.getString("url"));
			  vo.setLimg(RS.getString("img"));
			  vo.setLlocation(RS.getString("location"));
			  vo.setLtitle(RS.getString("c_title"));
			  vo.setLcontents(RS.getString("c_contents"));
			  vo.setLsdate(RS.getString("sdate"));
			  vo.setLedate(RS.getString("edate"));
			  vo.setLprice(RS.getInt("price"));
			  vo.setLpeople(RS.getInt("people"));
			  		  
			  alist.add(vo); //Don't forget;
			  
		   }//while end
		}catch(Exception ex) { System.out.println(ex);}
		return alist;
	  }//end

  public int lectureCountAll() {
	try {
	 msg="select count(*) as cnt from h_class ";  
	 RS=ST.executeQuery(msg);
	 if(RS.next()==true){ Gtotal=RS.getInt("cnt"); }  
	}catch(Exception ex) { }	
	return Gtotal;
  }//end     
  
  public int lectureCountAll( String search) {
	 try {
	  //msg="select count(*) as cnt from h_class where title like '%p%' "; 
	  msg="select count(*) as cnt from h_class where c_title like '%"+ search +"%' "; 
	  RS=ST.executeQuery(msg);
	  if(RS.next()==true){ Gtotal=RS.getInt("cnt"); }   
	 }catch(Exception ex) { }	
	return Gtotal;
  }//end
  
  public LectureVO lectureDetail(String data){
	LectureVO dto = new LectureVO();
	 try {
	   msg = "select *  from h_class where code = ? ";
	   PST = CN.prepareStatement(msg);
	         PST.setString(1, data);
	   RS = PST.executeQuery();
		 if(RS.next()==true){ 
			 dto.setLid(RS.getString("code")); 
			 dto.setLname(RS.getString("name"));
			 dto.setLnum(RS.getString("num"));
			 dto.setLurl(RS.getString("url"));
			 dto.setLimg(RS.getString("img"));
			 dto.setLlocation(RS.getString("location"));
			 dto.setLtitle(RS.getString("c_title"));
			 dto.setLcontents(RS.getString("c_contents"));
			 dto.setLsdate(RS.getString("sdate"));
			 System.out.println("DAO : " + RS.getString("sdate"));
			 dto.setLedate(RS.getString("edate"));
			 dto.setLprice(RS.getInt("price"));
			 dto.setLpeople(RS.getInt("people"));
			 
		  }//if end
	 }catch(Exception ex) { }
	return dto;
  }//end 
  
  
  public void lectureDelete(String data) {
	try {
	 msg="delete from h_class where code = " + data;
	 OK = ST.executeUpdate(msg);
	 if(OK>0) { System.out.println(data + " delete OK sucess");}
	 else { System.out.println(data + " delete failed"); }
	}catch(Exception ex) { System.out.println(ex); }	
  }//end  
  
}//LectureDAO class END








