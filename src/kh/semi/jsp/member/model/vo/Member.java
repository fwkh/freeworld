package kh.semi.jsp.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Member implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -5860829447627887370L;

	private int userNo;         // 유저번호
	private String userPwd;      // 비밀번호
	private String userName;   // 이름
	private Date birth;         // 생년월일
	private String phone;      // 전화번호
	private String email;      // 이메일
	private String area;      // 거주지역
	private String hope;      // 희망지역
	private Date future;      // 투입가능날
	private Date enrolldate;
	private int career;
	private int total;
	private String join;
	private int birthday_year;
	private int phone_new;
	private String files;
	private String gender;

	// 가입시 필요한 생성자
	public Member(String userPwd, String userName, Date birth, String phone, String email, String area, String hope, Date future, int total) 
	{
		this.userPwd = userPwd;
		this.userName = userName;
		this.birth = birth;
		this.phone = phone;
		this.email = email;
		this.area = area;
		this.hope = hope;
		this.future = future;
		this.total = total;
	}


	// 스킬테이블
	private String skill1;      // 스킬 1
	private String skill2;      // 스킬 2
	private String skill3;      // 스킬 3

	// 학력 테이블
	private String uni_Name; // 학교명 
	private Date enterDate;         // 입학일
	private Date gra_Date;   // 졸업일
	private String gra_Status;   // 졸업상태
	private String major;         // 전공
	private String Total_grade;         // 학점
	private String grade_Standard;   // 학점 기준

	// 자격사항 테이블
	private String L_Name;      // 자격증명
	private String L_Agency;   // 발행처/ 발행기관
	private Date L_Date;      // 취득일

	// 학력 테이블
	public Member(int userNo, String uni_Name, Date enterDate, Date gra_Date, String gra_Status, String major,
			String total_grade, String grade_Standard) {
		super();
		this.userNo = userNo;
		this.uni_Name = uni_Name;
		this.enterDate = enterDate;
		this.gra_Date = gra_Date;
		this.gra_Status = gra_Status;
		this.major = major;
		Total_grade = total_grade;
		this.grade_Standard = grade_Standard;
	}

	// 스킬테이블
	public Member(int userNo, String skill1, String skill2, String skill3) {
		super();
		this.userNo = userNo;
		this.skill1 = skill1;
		this.skill2 = skill2;
		this.skill3 = skill3;
	}
	// 자격사항 테이블
	public Member(int userNo, String l_Name, String l_Agency, Date l_Date) {
		super();
		this.userNo = userNo;
		L_Name = l_Name;
		L_Agency = l_Agency;
		L_Date = l_Date;
	}

	public Member() {}


	public Member(String email , String userPwd)
	{
		this.email = email;
		this.userPwd = userPwd;
	}



	public Member(int userNo, String userPwd, String userName, Date birth, String phone, String email, String area,
			String hope, Date future, Date enrolldate, int career, int total, String join, int birthday_year,
			int phone_new, String files, String gender) {
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
		this.birthday_year = birthday_year;
		this.phone_new = phone_new;
		this.files = files;
		this.gender = gender;
	}

	public Member(int userNo, String userPwd, String userName, Date birth, String phone, String email, String area,
			String hope, Date future, int career, int total, String join, String files, String gender) {
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
		this.files = files;
		this.gender = gender;
	}

	public Member(int userNo, String userPwd, String userName, Date birth, String phone, String email, String area,
			String hope, Date future, Date enrolldate, int career, int total, String join, String files, String skill1,
			String skill2, String skill3, String uni_Name, Date enterDate, Date gra_Date, String gra_Status,
			String major, String total_grade, String grade_Standard, String l_Name, String l_Agency, Date l_Date) {
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
		this.skill1 = skill1;
		this.skill2 = skill2;
		this.skill3 = skill3;
		this.uni_Name = uni_Name;
		this.enterDate = enterDate;
		this.gra_Date = gra_Date;
		this.gra_Status = gra_Status;
		this.major = major;
		Total_grade = total_grade;
		this.grade_Standard = grade_Standard;
		L_Name = l_Name;
		L_Agency = l_Agency;
		L_Date = l_Date;
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

	public int getBirthday_year() {
		return birthday_year;
	}

	public void setBirthday_year(int birthday_year) {
		this.birthday_year = birthday_year;
	}

	public int getPhone_new() {
		return phone_new;
	}

	public void setPhone_new(int phone_new) {
		this.phone_new = phone_new;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getSkill1() {
		return skill1;
	}

	public void setSkill1(String skill1) {
		this.skill1 = skill1;
	}

	public String getSkill2() {
		return skill2;
	}

	public void setSkill2(String skill2) {
		this.skill2 = skill2;
	}

	public String getSkill3() {
		return skill3;
	}

	public void setSkill3(String skill3) {
		this.skill3 = skill3;
	}

	public String getUni_Name() {
		return uni_Name;
	}

	public void setUni_Name(String uni_Name) {
		this.uni_Name = uni_Name;
	}

	public Date getEnterDate() {
		return enterDate;
	}

	public void setEnterDate(Date enterDate) {
		this.enterDate = enterDate;
	}

	public Date getGra_Date() {
		return gra_Date;
	}

	public void setGra_Date(Date gra_Date) {
		this.gra_Date = gra_Date;
	}

	public String getGra_Status() {
		return gra_Status;
	}

	public void setGra_Status(String gra_Status) {
		this.gra_Status = gra_Status;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getTotal_grade() {
		return Total_grade;
	}

	public void setTotal_grade(String total_grade) {
		Total_grade = total_grade;
	}

	public String getGrade_Standard() {
		return grade_Standard;
	}

	public void setGrade_Standard(String grade_Standard) {
		this.grade_Standard = grade_Standard;
	}

	public String getL_Name() {
		return L_Name;
	}

	public void setL_Name(String l_Name) {
		L_Name = l_Name;
	}

	public String getL_Agency() {
		return L_Agency;
	}

	public void setL_Agency(String l_Agency) {
		L_Agency = l_Agency;
	}

	public Date getL_Date() {
		return L_Date;
	}

	public void setL_Date(Date l_Date) {
		L_Date = l_Date;
	}
	public String getFiles() {
		return files;
	}

	public void setFiles(String files) {
		this.files = files;
	}

	@Override
	public String toString() {
		//<<<<<<< HEAD
		//      return "Member{" +
		//            "userPwd='" + userPwd + '\'' +
		//            ", userName='" + userName + '\'' +
		//            ", birth=" + birth +
		//            ", phone='" + phone + '\'' +
		//            ", email='" + email + '\'' +
		//            ", area='" + area + '\'' +
		//            ", hope='" + hope + '\'' +
		//            ", future=" + future +
		//            ", enrolldate=" + enrolldate +
		//            ", total=" + total +
		//            '}';
		//=======
		return "Member [userNo=" + userNo + ", userPwd=" + userPwd + ", userName=" + userName + ", birth=" + birth
				+ ", phone=" + phone + ", email=" + email + ", area=" + area + ", hope=" + hope + ", future=" + future
				+ ", enrolldate=" + enrolldate + ", career=" + career + ", total=" + total + ", join=" + join
				+ ", files=" + files + ", skill1=" + skill1 + ", skill2=" + skill2 + ", skill3=" + skill3
				+ ", uni_Name=" + uni_Name + ", enterDate=" + enterDate + ", gra_Date=" + gra_Date + ", gra_Status="
				+ gra_Status + ", major=" + major + ", Total_grade=" + Total_grade + ", grade_Standard="
				+ grade_Standard + ", L_Name=" + L_Name + ", L_Agency=" + L_Agency + ", L_Date=" + L_Date + "]";
	}
}