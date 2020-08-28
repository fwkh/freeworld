package kh.semi.jsp.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Member implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -5860829447627887370L;
	
	private String userId;		// 아이디
	private String userName;	// 이름
	private String userPwd;		// 비밀번호
	private String birth;		// 생년월일
	private String phone;		// 연락처
	private String hope;		// 희망지역
	private String address;		// 거주지역
	private String skill;		// 보유기술
	private Date Date;			// 투입가능 날짜
	
	public Member() {
		
	}

	public Member(String userId, String userPwd) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
	}

	public Member(String userId, String userName, String userPwd, String birth, String phone, String hope,
			String address, String skill) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userPwd = userPwd;
		this.birth = birth;
		this.phone = phone;
		this.hope = hope;
		this.address = address;
		this.skill = skill;
	}

	public Member(String userId, String userName, String userPwd, String birth, String phone, String hope,
			String address, String skill, java.sql.Date date) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userPwd = userPwd;
		this.birth = birth;
		this.phone = phone;
		this.hope = hope;
		this.address = address;
		this.skill = skill;
		Date = date;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getHope() {
		return hope;
	}

	public void setHope(String hope) {
		this.hope = hope;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getSkill() {
		return skill;
	}

	public void setSkill(String skill) {
		this.skill = skill;
	}

	public Date getDate() {
		return Date;
	}

	public void setDate(Date date) {
		Date = date;
	}

	@Override
	public String toString() {
		return "userId=" + userId + ", userName=" + userName + ", userPwd=" + userPwd + ", birth=" + birth
				+ ", phone=" + phone + ", hope=" + hope + ", address=" + address + ", skill=" + skill + ", Date=" + Date;
	}
	
	
}






