package kh.semi.jsp.resumeSearch.model.service;

import java.sql.Connection;


import kh.semi.jsp.member.model.vo.Member;
import kh.semi.jsp.resumeSearch.model.dao.MemberDao;

import static kh.semi.jsp.common.JDBCTemplate.*;

public class MypageService {
	private MemberDao mDao = new MemberDao();
	
	
	public int fileUpdate(Member m) {
		Connection con = getConnection();
		int result = mDao.fileUpdate(m, con);
		
		if(result>0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

}
