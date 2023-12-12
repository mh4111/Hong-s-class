package net.hb.guest;


import java.util.ArrayList;
import java.util.List;

import net.hb.common.DB;

public class guestDAO extends guestGlobal {
	
	
	public guestDAO() {
		try {
			CN=DB.getConnection();
			ST=CN.createStatement();
		}catch(Exception ex) {}
	}
	
	public int reviewInsert(guestVO vo) {
		try {
			msg = " insert into h_review values(seq_r_num.nextval, ?, ?, ?, sysdate, ?) " ;
			//msg="INSERT INTO h_review (r_num, r_id, r_code, r_contents, r_wdate, score)SELECT seq_r_num.NEXTVAL, ?, ?, ?, SYSDATE, ? FROM h_history hh";
			PST = CN.prepareStatement(msg);
			PST.setString(1, vo.getId());
			PST.setString(2, vo.getCode());
			PST.setString(3, vo.getContents());
			PST.setInt(4, vo.getScore());
			
			OK=PST.executeUpdate();//저장성공처리구현
			System.out.println(vo.getScore());
			System.out.println(vo.getContents());
			System.out.println("저장성공");
		}catch(Exception ex) {
			System.out.println(ex);
		}
		return OK;
	}
	
	public int reviewEdit(guestVO vo) {
		try {
			msg="update h_review set r_contents=? where r_id=? and r_code=? and r_num=?";
			PST = CN.prepareStatement(msg);
			PST.setString(1, vo.getContents());
			//PST.setString(2, vo.getId());
			PST.setString(2, vo.getId());
			PST.setString(3, vo.getCode());
			PST.setInt(4, vo.getNum());
			
			OK=PST.executeUpdate();//저장성공처리구현
			System.out.println(vo.getNum());
			System.out.println("수정성공");
		}catch(Exception ex) {}
		return OK;
	}	
	
	public guestVO reviewDelete(String data, String id) {
		guestVO dto = new guestVO();
		try {
			msg="delete from h_review where r_num=? and r_id=?";
			PST = CN.prepareStatement(msg);
			PST.setInt(1, Integer.parseInt(data));
			PST.setString(2, id);
			OK=PST.executeUpdate();//저장성공처리구현
			System.out.println(data);
			System.out.println(id);
			System.out.println("삭제성공");
		}catch(Exception ex) {}
		return dto;
	}	
	

	
	public int reviewCount(String code) {
		try {
			msg="select count(*) as cnt from h_review where r_code=?";
			PST= CN.prepareStatement(msg);
			PST.setString(1, code);
			RS = PST.executeQuery();
			if(RS.next()==true) {Gtotal = RS.getInt("cnt");}
		}catch(Exception ex) {}
		return Gtotal;
	}
	
	public List<guestVO> reviewList(String code,int start, int end){
		List<guestVO> alist = new ArrayList<>();
		try {
			msg="select * from(select row_number() over (order by r_wdate desc) as rn, r_num, r_id, r_code, r_contents, r_wdate, score from h_review  where r_code=?) where rn between ? and ?";
			PST = CN.prepareStatement(msg);
			PST.setString(1, code);
			PST.setInt(2, start);
			PST.setInt(3, end);
			RS = PST.executeQuery();
			while(RS.next()) {
				
					guestVO vo=new guestVO();
					vo.setNum(RS.getInt("r_num"));
					vo.setId(RS.getString("r_id"));
					vo.setCode(RS.getString("r_code"));
					vo.setContents(RS.getString("r_contents"));
					vo.setWdate(RS.getDate("r_wdate"));
					vo.setScore(RS.getInt("score"));
					alist.add(vo);
			}
		}catch(Exception e) {}
		return alist;
	}
	
	public guestVO login(String id, int pw) {
		guestVO vo = null;

		try {
			
			msg = "select * from h_user where id = ? and pw = ?";
			PST = CN.prepareStatement(msg);
			PST.setString(1, id);
			PST.setInt(2, pw);
			RS = PST.executeQuery();
			
			if(RS.next()) { // 로그인 성공
				vo = new guestVO();
				
				vo.setId(RS.getString("id"));
				vo.setPw(RS.getInt("pw"));
			} 
		} catch(Exception e) {
			e.printStackTrace();
		} 
		return vo;
		}
		

}

