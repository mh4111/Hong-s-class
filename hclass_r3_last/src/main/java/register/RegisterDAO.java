package register;


import java.util.ArrayList;
import java.util.List;

import reservation.common.DB;

public class RegisterDAO extends RegisterGlobal implements RegisterInterface{

	 int OK = 0;
	 public RegisterDAO() {
		 try {
				CN=DB.getConnection();
				ST=CN.createStatement();
			 }catch(Exception ex) {
				 System.out.println(ex);
			 }
	}
	 
	public int historyInsert(RegisterVO vo) {
		  try {
			  
		   msg = "insert into h_history values(?, ?, sysdate)";
		   PST = CN.prepareStatement(msg);
		   PST.setString(1, vo.getUserId());
		   PST.setString(2, vo.getClassCode());
			  PST.executeUpdate();//ok
		     
		  }catch(Exception ex) {
			  System.out.println(ex);
			  
		  }
		  return OK;
	  }//end


	  public List<HistoryVO> registerSelectAll(int start, int end, String skey, String sval, String hid){ //시작행,끝행,검색필드,검색어 
			List<HistoryVO> alist = new ArrayList<HistoryVO>();
			try {
								
			  String a =" select * from ( ";
			  String b =" select rownum rn, u.name, c.name as tea, c_title,c.sdate, c.edate, c.location, c.price, h.h_date ,h.h_code  from ";
			  String y =  "h_user u, h_history h, h_class c where u.id = h.h_id and h.h_code = c.code and h_id like '%" + hid + "%' and "+ skey +" like '%"+sval+"%' order by c_title ";
			  String c =" ) where rn between  " + start + " and "  + end;	
			  msg = a+b+y+c ; 
			  
			 RS = ST.executeQuery(msg);
			 
			   while(RS.next()==true){
				   HistoryVO vo = new HistoryVO();
				  vo.setRn(RS.getInt("rn"));
				  vo.setHcode(RS.getString("h_code"));
				  vo.setHname(RS.getString("name"));
				  vo.setHtitle(RS.getString("c_title"));
				  vo.setHsdate(RS.getString("sdate"));
				  vo.setHedate(RS.getString("edate"));
				  vo.setHisdate(RS.getString("h_date"));
				  vo.setHtname(RS.getString("tea"));
				  vo.setHlocation(RS.getString("location"));
				  vo.setHprice(RS.getInt("price"));
				  
				  alist.add(vo); //Don't forget;
				  
			   }//while end
			}catch(Exception ex) { 
				/* System.out.println(ex); */
				}
			return alist;
		  }//end

	@Override
	public int RegisterCountAll(String hid) {
		try {
			 msg="select count(*) as cnt from h_history where h_id like '%" + hid + "%'";  
			 RS=ST.executeQuery(msg);
			 if(RS.next()==true){ Gtotal=RS.getInt("cnt"); }  
			}catch(Exception ex) { }	
			return Gtotal;
	}

	@Override
	public void RegisterDelete(String data) {
		  try {
			  msg="delete from h_history where h_code like '" + data + "'";
				 OK = ST.executeUpdate(msg);
				 if(OK>0) { System.out.println(data + " delete OK sucess");}
				 else { System.out.println(data + " delete failed"); }
				}catch(Exception ex) { System.out.println(ex); }	
	}//end  

	public String findName(String hid) {
		String name = "";
		try {
			 msg=" select name from h_user where id like '%" + hid + "%'";  
			 RS=ST.executeQuery(msg);
			 if(RS.next()==true){ name=RS.getString("name");}  
			}catch(Exception ex) { }	
			return name;
	}

	public int countHistory(RegisterVO vo) {
		String hongC = vo.getUserId();
		try {
			System.out.println("history 중복 체크");
			 msg=" select count(*) as cnt from h_history where h_id like '" + hongC + "'";  
			 RS=ST.executeQuery(msg);
			 if(RS.next()==true){ Gtotal=RS.getInt("cnt");}  
			}catch(Exception ex) { }	
			return Gtotal;
	}
	public int countHistoryAll(RegisterVO vo) {
		String hongC = vo.getClassCode();
		try {
			System.out.println("history 중복 체크");
			 msg=" select count(*) as cnt from h_history where h_code like '" + hongC + "'";  
			 RS=ST.executeQuery(msg);
			 if(RS.next()==true){ Gtotal=RS.getInt("cnt");}  
			}catch(Exception ex) { }	
			return Gtotal;
	}
}
