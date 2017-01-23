package member;

public class MemberDTO {
	private int member_no;
	private String id;
	private String passwd;
	private String name;
	private String birth;
	private String cellphone;
	private String email;
	private String address;
	private int discount;
	private String grade;
	
	public MemberDTO(){
		 
	}
	
	public MemberDTO(int member_no, String id, String passwd, String name, String birth, String cellphone, String email,
			String address, int discount, String grade) {
		super();
		this.member_no = member_no;
		this.id = id;
		this.passwd = passwd;
		this.name = name;
		this.birth = birth;
		this.cellphone = cellphone;
		this.email = email;
		this.address = address;
		this.discount = discount;
		this.grade = grade;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getCellphone() {
		return cellphone;
	}

	public void setCellphone(String cellphone) {
		this.cellphone = cellphone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}
		
}
