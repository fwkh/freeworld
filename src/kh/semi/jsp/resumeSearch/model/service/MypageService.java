package kh.semi.jsp.resumeSearch.model.service;

import static kh.semi.jsp.common.JDBCTemplate.close;
import static kh.semi.jsp.common.JDBCTemplate.commit;
import static kh.semi.jsp.common.JDBCTemplate.getConnection;
import static kh.semi.jsp.common.JDBCTemplate.rollback;

import java.sql.Connection;

import kh.semi.jsp.member.model.vo.Member;
import kh.semi.jsp.resumeSearch.model.dao.MypageDao;

public class MypageService {
	private MypageDao mDao = new MypageDao();
	
	
	public int fileUpdate(Member m) {
		Connection con = getConnection();
		int result = mDao.fileUpdate(m, con);
		
		if(result>0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

}
