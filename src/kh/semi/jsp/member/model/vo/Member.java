package kh.semi.jsp.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Member implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -5860829447627887370L;
	
	private int userNo;			// 유저번호
	private String userPwd;		// 비밀번호
	private String userName;	// 이름
	private Date birth;			// 생년월일
	private String phone;		// 전화번호
	private String email;		// 이메일
	private String area;		// 거주지역
	private String hope;		// 희망지역
	private Date future;		// 투입가능날
	private Date enrolldate;
	private int career;
	private int total;
	private String join;
	private String files;
	
	public String getFiles() {
		return files;
	}

	public void setFiles(String files) {
		this.files = files;
	}

	public Member() {
	}

	public Member(String userPwd, String email) {
		super();
		this.userPwd = userPwd;
		this.email = email;
	}

	public Member(int userNo, String userPwd, String userName, Date birth, String phone, String email, String area,
			String hope, Date future, int career, int total, String join) {
		super();
		this.userNo = userNo;
		this.userPwd = userPwd;
		this.userName = userName;
		this.birth = birth;
		this.phone = phone;
		this.email = email;
		this.area = area;
		this.hope = hope;
		this.future = future;
		this.career = career;
		this.total = total;
		this.join = join;
	}

	public Member(int userNo, String userPwd, String userName, Date birth, String phone, String email, String area,
			String hope, Date future, Date enrolldate, int career, int total, String join, String files) {
		super();
		this.userNo = userNo;
		this.userPwd = userPwd;
		this.userName = userName;
		this.birth = birth;
		this.phone = phone;
		this.email = email;
		this.area = area;
		this.hope = hope;
		this.future = future;
		this.enrolldate = enrolldate;
		this.career = career;
		this.total = total;
		this.join = join;
		this.files = files;
	}

	public Member(int userNo, String userPwd, String userName, Date birth, String phone, String email, String area,
			String hope, Date future, Date enrolldate, int career, int total, String join) {
		super();
		this.userNo = userNo;
		this.userPwd = userPwd;
		this.userName = userName;
		this.birth = birth;
		this.phone = phone;
		this.email = email;
		this.area = area;
		this.hope = hope;
		this.future = future;
		this.enrolldate = enrolldate;
		this.career = career;
		this.total = total;
		this.join = join;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getHope() {
		return hope;
	}

	public void setHope(String hope) {
		this.hope = hope;
	}

	public Date getFuture() {
		return future;
	}

	public void setFuture(Date future) {
		this.future = future;
	}

	public Date getEnrolldate() {
		return enrolldate;
	}

	public void setEnrolldate(Date enrolldate) {
		this.enrolldate = enrolldate;
	}

	public int getCareer() {
		return career;
	}

	public void setCareer(int career) {
		this.career = career;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public String getJoin() {
		return join;
	}

	public void setJoin(String join) {
		this.join = join;
	}

	@Override
	public String toString() {
		return "Member [userNo=" + userNo + ", userPwd=" + userPwd + ", userName=" + userName + ", birth=" + birth
				+ ", phone=" + phone + ", email=" + email + ", area=" + area + ", hope=" + hope + ", future=" + future
				+ ", enrolldate=" + enrolldate + ", career=" + career + ", total=" + total + ", join=" + join + "]";
	}

	
	
}






