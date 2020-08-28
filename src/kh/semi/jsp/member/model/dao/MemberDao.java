package kh.semi.jsp.member.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import static kh.semi.jsp.common.JDBCTemplate.*;

import kh.semi.jsp.member.exception.MemberException;
import kh.semi.jsp.member.model.vo.Member;

public class MemberDao {

	private Properties prop;

	public MemberDao() {
		prop = new Properties();
		
		String filePath = MemberDao.class
				.getResource("/config/member-query.properties").getPath();
		try {
			prop.load(new FileReader(filePath));
		}catch(FileNotFoundException e) {
			e.printStackTrace();
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	public Member selectMember(Connection con, Member m) throws MemberException{
		Member result = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMember");
		try {
			pstmt.getConnection().prepareStatement(sql);
			pstmt.setString(1, m.getEmail());
			pstmt.setString(2, m.getUserPwd());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = new Member();
				result.setEmail(m.getEmail());
				result.setUserPwd(m.getUserPwd());
				
				result.setUserNo(rset.getInt("userNo"));
				result.setUserName(rset.getString(3));
				result.setBirth(rset.getDate("birth"));
				result.setPhone(rset.getString("phone"));
				result.setArea(rset.getString("area"));
				result.setHope(rset.getString("hope"));
				result.setFuture(rset.getDate("future"));
				result.setCareer(rset.getInt("career"));
				result.setTotal(rset.getInt("total"));
				result.setJoin(rset.getString("join"));
			
				
			}
		} catch (Exception e) {
			throw new MemberException(e.getMessage());
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

}
