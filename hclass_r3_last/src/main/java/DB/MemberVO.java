package DB;

public class MemberVO {

	/*
	 * VO클래스는 DB컬럼들을 자바 변수로 선언합니다. DB컬럼과 form태그의 name과 매칭되는 변수를 모두 선언합니다.
	 */
	private String id;
	private String pw;
	private String email;
	private String name;
	private String phone;
	private String birth;
	private String gender;
	private String zipcode;
	private String address;
	private String address2;
	private String grade;

	// VO클래스는 기본생성자와 모든 멤버변수를 초기화하는 생성자를 선언.
	public MemberVO() {
	}

	public MemberVO(String id, String pw, String email, String name, String phone, String birth, String gender,
			String zipcode, String address, String address2, String grade) {
		super();
		this.id = id;
		this.pw = pw;
		this.email = email;
		this.name = name;
		this.phone = phone;
		this.birth = birth;
		this.gender = gender;
		this.zipcode = zipcode;
		this.address = address;
		this.address = address2;
		this.address = grade;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}
}