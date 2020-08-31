package kh.semi.project.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Project implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int pNo;
	private int cNo;
	private String pName;
	private String pMain;
	private String pCustom;
	private Date pStart;
	private Date pEnd;
	private int pPay;
	private String pArea;
	private int pPeople;
	private Date pDate;
	private String pCon;
	private String pSkill1;
	private String pSkill2;
	private String pSkill3;
	private Date pCreateDate;
	private String boardAva;
	private String checkAva;
	private int pCount;
	private String pDeadline;
	private String pFiles;
	
	
	public Project() {	}


	public Project(int pNo, int cNo, String pName, String pMain, String pCustom, Date pStart, Date pEnd, int pPay,
			String pArea, int pPeople, Date pDate, String pCon, String pSkill1, String pSkill2, String pSkill3,
			Date pCreateDate, String boardAva, String checkAva, int pCount, String pDeadline, String pFiles) {
		super();
		this.pNo = pNo;
		this.cNo = cNo;
		this.pName = pName;
		this.pMain = pMain;
		this.pCustom = pCustom;
		this.pStart = pStart;
		this.pEnd = pEnd;
		this.pPay = pPay;
		this.pArea = pArea;
		this.pPeople = pPeople;
		this.pDate = pDate;
		this.pCon = pCon;
		this.pSkill1 = pSkill1;
		this.pSkill2 = pSkill2;
		this.pSkill3 = pSkill3;
		this.pCreateDate = pCreateDate;
		this.boardAva = boardAva;
		this.checkAva = checkAva;
		this.pCount = pCount;
		this.pDeadline = pDeadline;
		this.pFiles = pFiles;
	}


	@Override
	public String toString() {
		return "Project [pNo=" + pNo + ", cNo=" + cNo + ", pName=" + pName + ", pMain=" + pMain + ", pCustom=" + pCustom
				+ ", pStart=" + pStart + ", pEnd=" + pEnd + ", pPay=" + pPay + ", pArea=" + pArea + ", pPeople="
				+ pPeople + ", pDate=" + pDate + ", pCon=" + pCon + ", pSkill1=" + pSkill1 + ", pSkill2=" + pSkill2
				+ ", pSkill3=" + pSkill3 + ", pCreateDate=" + pCreateDate + ", boardAva=" + boardAva + ", checkAva="
				+ checkAva + ", pCount=" + pCount + ", pDeadline=" + pDeadline + ", pFiles=" + pFiles + "]";
	}


	public int getpNo() {
		return pNo;
	}


	public void setpNo(int pNo) {
		this.pNo = pNo;
	}


	public int getcNo() {
		return cNo;
	}


	public void setcNo(int cNo) {
		this.cNo = cNo;
	}


	public String getpName() {
		return pName;
	}


	public void setpName(String pName) {
		this.pName = pName;
	}


	public String getpMain() {
		return pMain;
	}


	public void setpMain(String pMain) {
		this.pMain = pMain;
	}


	public String getpCustom() {
		return pCustom;
	}


	public void setpCustom(String pCustom) {
		this.pCustom = pCustom;
	}


	public Date getpStart() {
		return pStart;
	}


	public void setpStart(Date pStart) {
		this.pStart = pStart;
	}


	public Date getpEnd() {
		return pEnd;
	}


	public void setpEnd(Date pEnd) {
		this.pEnd = pEnd;
	}


	public int getpPay() {
		return pPay;
	}


	public void setpPay(int pPay) {
		this.pPay = pPay;
	}


	public String getpArea() {
		return pArea;
	}


	public void setpArea(String pArea) {
		this.pArea = pArea;
	}


	public int getpPeople() {
		return pPeople;
	}


	public void setpPeople(int pPeople) {
		this.pPeople = pPeople;
	}


	public Date getpDate() {
		return pDate;
	}


	public void setpDate(Date pDate) {
		this.pDate = pDate;
	}


	public String getpCon() {
		return pCon;
	}


	public void setpCon(String pCon) {
		this.pCon = pCon;
	}


	public String getpSkill1() {
		return pSkill1;
	}


	public void setpSkill1(String pSkill1) {
		this.pSkill1 = pSkill1;
	}


	public String getpSkill2() {
		return pSkill2;
	}


	public void setpSkill2(String pSkill2) {
		this.pSkill2 = pSkill2;
	}


	public String getpSkill3() {
		return pSkill3;
	}


	public void setpSkill3(String pSkill3) {
		this.pSkill3 = pSkill3;
	}


	public Date getpCreateDate() {
		return pCreateDate;
	}


	public void setpCreateDate(Date pCreateDate) {
		this.pCreateDate = pCreateDate;
	}


	public String getBoardAva() {
		return boardAva;
	}


	public void setBoardAva(String boardAva) {
		this.boardAva = boardAva;
	}


	public String getCheckAva() {
		return checkAva;
	}


	public void setCheckAva(String checkAva) {
		this.checkAva = checkAva;
	}


	public int getpCount() {
		return pCount;
	}


	public void setpCount(int pCount) {
		this.pCount = pCount;
	}


	public String getpDeadline() {
		return pDeadline;
	}


	public void setpDeadline(String pDeadline) {
		this.pDeadline = pDeadline;
	}


	public String getpFiles() {
		return pFiles;
	}


	public void setpFiles(String pFiles) {
		this.pFiles = pFiles;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	
}
