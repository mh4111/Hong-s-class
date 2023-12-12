package notice.qna;

import common.DB;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class notice_DAO extends notice_Global {
	public notice_DAO() {
		try {
			this.CN = DB.getConnection();
			this.ST = this.CN.createStatement();
		} catch (Exception var2) {
			var2.printStackTrace();
		}

	}

	public boolean noticeInsert(String name, String pass, String title, String contents) {
		try {
			String sql = "INSERT INTO h_notice (no, n_name, n_pass, n_date, n_title, n_contents, n_count) VALUES ((SELECT NVL(MAX(no), 0) + 1 FROM h_notice), ?, ?, sysdate, ?, ?, 0)";
			this.PST = this.CN.prepareStatement(sql);
			this.PST.setString(1, name);
			this.PST.setString(2, pass);
			this.PST.setString(3, title);
			this.PST.setString(4, contents);
			int rowsInserted = this.PST.executeUpdate();
			this.PST.close();
			boolean var8 = rowsInserted > 0;
			return var8;
		} catch (SQLException var16) {
			var16.printStackTrace();
		} finally {
			try {
				if (this.PST != null) {
					this.PST.close();
				}
			} catch (SQLException var15) {
				var15.printStackTrace();
			}

		}

		return false;
	}

	public List<notice_VO> noticePaging(int start, int end, String skey, String sval) {
		ArrayList noticeList = new ArrayList();

		try {
			String sql = "SELECT * FROM (SELECT rownum AS rn, n.* FROM (SELECT * FROM h_notice WHERE " + skey
					+ " LIKE ? ORDER BY n_date DESC, no DESC) n) WHERE rn BETWEEN ? AND ?";
			this.PST = this.CN.prepareStatement(sql);
			this.PST = this.CN.prepareStatement(sql);
			this.PST.setString(1, "%" + sval + "%");
			this.PST.setInt(2, start);
			this.PST.setInt(3, end);
			this.RS = this.PST.executeQuery();

			while (this.RS.next()) {
				notice_VO notice = new notice_VO();
				notice.setNo(this.RS.getInt("no"));
				notice.setN_name(this.RS.getString("n_name"));
				notice.setN_title(this.RS.getString("n_title"));
				notice.setN_count(this.RS.getInt("n_count"));
				notice.setN_date(this.RS.getDate("n_date"));
				noticeList.add(notice);
			}
		} catch (SQLException var16) {
			var16.printStackTrace();
		} finally {
			try {
				if (this.RS != null) {
					this.RS.close();
				}

				if (this.PST != null) {
					this.PST.close();
				}
			} catch (SQLException var15) {
				var15.printStackTrace();
			}

		}

		return noticeList;
	}

	public boolean noticeEdit(notice_VO vo) {
		try {
			String sql = "Update h_notice SET n_title =?, n_contents=? where no = ?";
			this.PST = this.CN.prepareStatement(sql);
			this.PST.setString(1, vo.getN_title());
			this.PST.setString(2, vo.getN_contents());
			this.PST.setInt(3, vo.getNo());
			this.PST.executeUpdate();
			this.PST.close();
		} catch (Exception var3) {
			var3.printStackTrace();
		}

		return true;
	}

	public int NoticeCount(String skey, String sval) {
		int totalCount = 0;

		try {
			String sql = "SELECT count(*) total FROM h_notice WHERE " + skey + " LIKE ?";
			this.PST = this.CN.prepareStatement(sql);
			this.PST.setString(1, "%" + sval + "%");
			this.RS = this.PST.executeQuery();
			if (this.RS.next()) {
				totalCount = this.RS.getInt("total");
			}
		} catch (SQLException var13) {
			var13.printStackTrace();
		} finally {
			try {
				if (this.RS != null) {
					this.RS.close();
				}

				if (this.PST != null) {
					this.PST.close();
				}
			} catch (SQLException var12) {
				var12.printStackTrace();
			}

		}

		return totalCount;
	}

	public void updateNoticeCount(int no) {
		String sql = "UPDATE h_notice set n_count=n_count+1 where no = ?";

		try {
			this.PST = this.CN.prepareStatement(sql);
			this.PST.setInt(1, no);
			this.PST.executeUpdate();
		} catch (Exception var4) {
			var4.printStackTrace();
		}

	}

	public notice_VO getNoticeByNo(int no) {
		notice_VO notice = null;

		try {
			String sql = "SELECT * FROM h_notice WHERE no = ?";
			this.PST = this.CN.prepareStatement(sql);
			this.PST.setInt(1, no);
			this.RS = this.PST.executeQuery();
			if (this.RS.next()) {
				notice = new notice_VO();
				notice.setNo(this.RS.getInt("no"));
				notice.setN_name(this.RS.getString("n_name"));
				notice.setN_pass(this.RS.getString("n_pass"));
				notice.setN_date(this.RS.getDate("n_date"));
				notice.setN_title(this.RS.getString("n_title"));
				notice.setN_contents(this.RS.getString("n_contents"));
				notice.setN_count(this.RS.getInt("n_count"));
			}
		} catch (SQLException var12) {
			var12.printStackTrace();
		} finally {
			try {
				if (this.RS != null) {
					this.RS.close();
				}

				if (this.PST != null) {
					this.PST.close();
				}
			} catch (SQLException var11) {
				var11.printStackTrace();
			}

		}

		return notice;
	}

	public boolean checkPassword(int no, String password) {
		boolean isPasswordCorrect = false;

		try {
			String sql = "SELECT COUNT(*) AS count FROM h_notice WHERE no = ? AND n_pass = ?";
			this.PST = this.CN.prepareStatement(sql);
			this.PST.setInt(1, no);
			this.PST.setString(2, password);
			this.RS = this.PST.executeQuery();
			if (this.RS.next()) {
				int count = this.RS.getInt("count");
				isPasswordCorrect = count > 0;
			}
		} catch (SQLException var14) {
			var14.printStackTrace();
		} finally {
			try {
				if (this.RS != null) {
					this.RS.close();
				}

				if (this.PST != null) {
					this.PST.close();
				}
			} catch (SQLException var13) {
				var13.printStackTrace();
			}

		}

		return isPasswordCorrect;
	}

	public boolean noticeDelete(int no, String pass) throws SQLException {
		try {
			String deleteSql = "DELETE FROM h_notice WHERE no = ? and n_pass=?";
			this.PST = this.CN.prepareStatement(deleteSql);
			this.PST.setInt(1, no);
			this.PST.setString(2, pass);
			int rowsDeleted = this.PST.executeUpdate();
			if (rowsDeleted <= 0) {
				return false;
			}

			String updateSql = "UPDATE h_notice SET no = no - 1 WHERE no > ?";
			this.PST = this.CN.prepareStatement(updateSql);
			this.PST.setInt(1, no);
			this.PST.executeUpdate();
			return true;
		} catch (SQLException var9) {
			var9.printStackTrace();
		} finally {
			if (this.PST != null) {
				this.PST.close();
			}

		}

		return false;
	}
}