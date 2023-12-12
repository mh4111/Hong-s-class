package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class MemberDAO {
	////////////////////////////////////////////////////////////////////////////
	// 멤버변수
	private String url = "jdbc:oracle:thin:@localhost:1521/XE";
	private String uid = "system";
	private String upw = "1234";

	private Connection CN = null;
	private PreparedStatement PST = null;
	private ResultSet rs = null;

	/*
	 * DAO 클래스는 단순히 DB연동만 담당하기 때문에 불필요하게 객체를 여러개 생성 할 필요가 없습니다. 그래서 싱글톤 패턴을 적용해서 객체를
	 * 1개만 생성되도록 만듭니다.
	 */

	// 1. 스스로 객체를 1개 생성합니다.
	public static MemberDAO instance = new MemberDAO();

	// 2. 외부에서 생성자를 호출할 수 없도록 생성자에 private제한을 붙임
	public MemberDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			CN = DriverManager.getConnection(url, uid, upw);
		} catch (Exception e) {
			System.out.println("드라이버 호출 에러");
		}
	}

	// 3. 외부에서 객체생성을 요구하면 getter메서드를 이용해서 1번의 객체를 반환
	public static MemberDAO getInstance() {
		return instance;
	}

	// join메서드
	public int join(MemberVO vo) {
		int result = 0;

		String sql = "insert into h_user values(?, ?, ?, ?, ?, TO_DATE(?,'YYYY-MM-DD'), ?, ?, ?, ?, ?)";

		try {
			// CN 생성
			// PST생성
			PST = CN.prepareStatement(sql);
			PST.setString(1, vo.getId());
			PST.setString(2, vo.getPw());
			PST.setString(3, vo.getEmail());
			PST.setString(4, vo.getName());
			PST.setString(5, vo.getPhone());
			PST.setString(6, vo.getBirth());
			PST.setString(7, vo.getGender());
			PST.setString(8, vo.getZipcode());
			PST.setString(9, vo.getAddress());
			PST.setString(10, vo.getAddress2());
			PST.setString(11, vo.getGrade());

			// sql 실행
			result = PST.executeUpdate(); // 1 or 0

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (CN != null)
					CN.close();
				if (PST != null)
					PST.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return result;
	}

	// id 중복체크
	public int duplecateID(String id) {
		int cnt = 0;

		String sql = "SELECT count(id) as cnt FROM h_user WHERE id = ? ";
		try {
			// 아이디 중복 확인
			PST = CN.prepareStatement(sql);
			PST.setString(1, id);

			rs = PST.executeQuery();
			if (rs.next()) {
				cnt = rs.getInt("cnt");
			}
		} catch (Exception e) {
			System.out.println("아이디 중복 확인 실패 : " + e);
		}
		return cnt;
	}// duplecateID end

	// login메서드
	public MemberVO login(String id, String pw) {
		MemberVO vo = null;

		String sql = "select * from h_user where id = ? and pw = ?";

		try {
			// PST생성
			PST = CN.prepareStatement(sql);
			PST.setString(1, id);
			PST.setString(2, pw);
			// sql실행
			rs = PST.executeQuery();

			if (rs.next()) { // 로그인 성공
				vo = new MemberVO();

				vo.setId(rs.getString("id"));
				vo.setEmail(rs.getString("email"));
				vo.setName(rs.getString("name"));
				vo.setPhone(rs.getString("phone"));
				vo.setZipcode(rs.getString("zipcode"));
				vo.setAddress(rs.getString("address"));
				vo.setAddress2(rs.getString("address2"));
				vo.setGrade(rs.getString("grade"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (CN != null)
					CN.close();
				if (PST != null)
					PST.close();
				if (rs != null)
					rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return vo;
	}

	// 회원정보를 조회하는 메서드
	public MemberVO getInfo(String id) {
		MemberVO vo = null;

		String sql = "select * from h_user where id = ?";

		try {
			PST = CN.prepareStatement(sql);
			PST.setString(1, id);

			rs = PST.executeQuery();

			if (rs.next()) {
				vo = new MemberVO();

				vo.setId(id);
				vo.setEmail(rs.getString("email"));
				vo.setName(rs.getString("name"));
				vo.setPhone(rs.getString("phone"));
				vo.setBirth(rs.getString("birth"));
				vo.setGender(rs.getString("gender"));
				vo.setZipcode(rs.getString("zipcode"));
				vo.setAddress(rs.getString("address"));
				vo.setAddress2(rs.getString("address2"));
			}
		} catch (Exception e) {

		} finally {
			try {
				if (CN != null)
					CN.close();
				if (PST != null)
					PST.close();
				if (rs != null)
					rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return vo;
	}

	// update메서드
	public int update(MemberVO vo) {
		int result = 0;

		String sql = "update h_user set pw = ?, email = ?, name = ?, phone = ?, zipcode = ?, address = ?, address2 = ? "
				+ "where id = ?";

		try {
			PST = CN.prepareStatement(sql);
			PST.setString(1, vo.getPw());
			PST.setString(2, vo.getEmail());
			PST.setString(3, vo.getName());
			PST.setString(4, vo.getPhone());
			PST.setString(5, vo.getZipcode());
			PST.setString(6, vo.getAddress());
			PST.setString(7, vo.getAddress2());
			PST.setString(8, vo.getId());

			result = PST.executeUpdate(); // 성공시 1반환, 실패시 0반환
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (CN != null)
					CN.close();
				if (PST != null)
					PST.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return result;
	}

	// delete메서드
	public int delete(String id) {
		int result = 0;

		String sql = "delete from h_user where id = ?";

		try {
			PST = CN.prepareStatement(sql);
			PST.setString(1, id);

			result = PST.executeUpdate();
		} catch (Exception e) {
			System.out.println("탈퇴 안되는 이유 : " + e);
			e.printStackTrace();
		} finally {
			try {
				if (CN != null)
					CN.close();
				if (PST != null)
					PST.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return result;
	}

	// 회원정보를 조회하는 메서드
	public List<MemberVO> adminupdate() {
		List<MemberVO> adminlist = new ArrayList<MemberVO>();

		String sql = "select * from h_user";

		try {
			PST = CN.prepareStatement(sql);
			rs = PST.executeQuery();

			while (rs.next()) {
				MemberVO vo = new MemberVO();

				vo.setId(rs.getString("id"));
				vo.setPw(rs.getString("pw"));
				vo.setEmail(rs.getString("email"));
				vo.setName(rs.getString("name"));
				vo.setPhone(rs.getString("phone"));
				vo.setBirth(rs.getString("birth"));
				vo.setGender(rs.getString("gender"));
				vo.setZipcode(rs.getString("zipcode"));
				vo.setAddress(rs.getString("address"));
				vo.setAddress2(rs.getString("address2"));
				vo.setGrade(rs.getString("grade"));
				
				adminlist.add(vo);
			}
		} catch (Exception e) {

		} finally {
			try {
				if (CN != null)
					CN.close();
				if (PST != null)
					PST.close();
				if (rs != null)
					rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return adminlist;
	}
	
	// 관리자 페이지 조회
		public MemberVO admingetInfo(String id) {
			MemberVO vo = null;

			String sql = "select * from h_user where id = ?";

			try {
				PST = CN.prepareStatement(sql);
				PST.setString(1, id);

				rs = PST.executeQuery();

				if (rs.next()) {
					vo = new MemberVO();

					vo.setId(id);
					vo.setPw(rs.getString("pw"));
					vo.setEmail(rs.getString("email"));
					vo.setName(rs.getString("name"));
					vo.setPhone(rs.getString("phone"));
					vo.setBirth(rs.getString("birth"));
					vo.setGender(rs.getString("gender"));
					vo.setZipcode(rs.getString("zipcode"));
					vo.setAddress(rs.getString("address"));
					vo.setAddress2(rs.getString("address2"));
					vo.setGrade(rs.getString("grade"));
				}
			} catch (Exception e) {

			} finally {
				try {
					if (CN != null)
						CN.close();
					if (PST != null)
						PST.close();
					if (rs != null)
						rs.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}

			return vo;
		}
		
		// update메서드
		public int adminupdate(MemberVO vo) {
			int result = 0;

			String sql = "update h_user set pw = ?, email = ?, name = ?, phone = ?, zipcode = ?, address = ?, address2 = ?, grade = ? "
					+ "where id = ?";

			try {
				PST = CN.prepareStatement(sql);
				PST.setString(1, vo.getPw());
				PST.setString(2, vo.getEmail());
				PST.setString(3, vo.getName());
				PST.setString(4, vo.getPhone());
				PST.setString(5, vo.getZipcode());
				PST.setString(6, vo.getAddress());
				PST.setString(7, vo.getAddress2());
				PST.setString(8, vo.getGrade());
				PST.setString(9, vo.getId());

				result = PST.executeUpdate(); // 성공시 1반환, 실패시 0반환
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (CN != null)
						CN.close();
					if (PST != null)
						PST.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}

			return result;
		}
		
		// delete메서드
		public int admindelete(String id) {
			int result = 0;

			String sql = "delete from h_user where id = ?";

			try {
				PST = CN.prepareStatement(sql);
				PST.setString(1, id);

				result = PST.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (CN != null)
						CN.close();
					if (PST != null)
						PST.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}

			return result;
		}

}