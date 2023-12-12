package notice.qna;

import java.util.Date;

public class notice_VO {
	int no;
	int n_count;
	int rn;
	String n_name;
	String n_pass;
	String n_title;
	String n_contents;
	Date n_date = new Date();

	public int getRn() {
		return this.rn;
	}

	public void setRn(int rn) {
		this.rn = rn;
	}

	public int getNo() {
		return this.no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getN_count() {
		return this.n_count;
	}

	public void setN_count(int n_count) {
		this.n_count = n_count;
	}

	public String getN_name() {
		return this.n_name;
	}

	public void setN_name(String n_name) {
		this.n_name = n_name;
	}

	public String getN_pass() {
		return this.n_pass;
	}

	public void setN_pass(String n_pass) {
		this.n_pass = n_pass;
	}

	public String getN_title() {
		return this.n_title;
	}

	public void setN_title(String n_title) {
		this.n_title = n_title;
	}

	public String getN_contents() {
		return this.n_contents;
	}

	public void setN_contents(String n_contents) {
		this.n_contents = n_contents;
	}

	public Date getN_date() {
		return this.n_date;
	}

	public void setN_date(Date n_date) {
		this.n_date = n_date;
	}
}