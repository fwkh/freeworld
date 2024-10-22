package kh.semi.jsp.member.model.service;

import static kh.semi.jsp.common.JDBCTemplate.*;

import java.sql.Connection;

import kh.semi.jsp.member.exception.MemberException;
import kh.semi.jsp.member.model.dao.MemberDao;
import kh.semi.jsp.member.model.vo.Member;


public class MemberService{
	
	private Connection con;
	private MemberDao mDao = new MemberDao();
	
	public Member selectMember(Member m) throws MemberException {
		con = getConnection();
		
		Member result = mDao.selectMember(con,m);
		
		close(con);
		
		if(result == null) {
			throw new MemberException("이메일이나 비밀번호를 확인해주세요.");
		}
		return result;
	}



	public Member f_searchOne(Member m) throws MemberException{
		con = getConnection();
		
		Member result = mDao.f_searchOne(con, m);
		
		if(result == null)
		{
			throw new MemberException("조회에 실패하였습니다.");
		}
		
		return result;
	}




   public int insertMember(Member m) throws MemberException
   {
      con = getConnection();

      int result = mDao.insertMember(con,m);
      

      if(result > 0) commit(con);
      else rollback(con);

      close(con);

      return result;
	}


	public int memberUpdate(Member m) throws MemberException {
		con = getConnection();

		System.out.println("MemberService 접속!");
		int result = mDao.memberUpdate(con,m);
		
		if(result > 0) commit(con);
		else rollback(con);

		close(con);

		return result;
		
	}

}