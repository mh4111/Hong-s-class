package notice.qna;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;

public class notice_Global {
	Connection CN = null;
	Statement ST = null;
	PreparedStatement PST = null;
	ResultSet RS = null;
	String msg = "";
	int OK = 0;
	int Gcode = 0;
	int Gpay = 0;
	int Ghit = 0;
	int rn = 0;
	int Grow = 0;
	String Gname = "";
	String Gtitle = "";
	String Gemail = "";
	Date Gwdate = null;
	String Gdata = "";
	int count;
	int totalCount = 0;
	String pnum;
	int pageNUM;
	int pagecount;
	int start;
	int end;
	int startpage;
	int endpage;
	int temp;
	String sqry = "";
	String skey = "";
	String sval = "";
	String returnpage = "";
}