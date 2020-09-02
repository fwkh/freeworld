package kh.semi.jsp.chageDate.model.service;

import java.sql.Connection;

import kh.semi.jsp.chageDate.model.dao.ChangeDateDao;
import kh.semi.jsp.member.model.vo.Member;
import static kh.semi.jsp.common.JDBCTemplate.*;
public class ChangeDateService {
	private ChangeDateDao cDao = new ChangeDateDao();
	
	public int FutureUpdate(Member m) {
		Connection con = getConnection();
		int result = cDao.FutureUpdate(m, con);
		
		if(result>0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

}
