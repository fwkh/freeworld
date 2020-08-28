package kh.semi.jsp.member.model.service;

import static kh.semi.jsp.common.JDBCTemplate.*;

import java.sql.Connection;

import kh.semi.jsp.member.exception.MemberException;
import kh.semi.jsp.member.model.dao.MemberDao;
import kh.semi.jsp.member.model.vo.Member;

public class MemberService {

	private Connection con;
	private MemberDao mDao = new MemberDao();
	
	public Member selectMember(Member m) throws MemberException {
		con = getConnection();
		
		Member result = mDao.selectMembver(con,m);
		
		close(con);
		
		if(result == null) {
			throw new MemberException("아이디나 비번을 확인해주세요.");
		}
		return result;
	}

}
