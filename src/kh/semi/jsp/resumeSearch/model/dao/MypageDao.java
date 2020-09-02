package kh.semi.jsp.resumeSearch.model.dao;

import static kh.semi.jsp.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import kh.semi.jsp.member.model.vo.Member;
public class MypageDao {
	private Properties prop;
	
	public MypageDao() {
		prop = new Properties();
		String filePath = MypageDao.class.getResource("/config/resumeSearch.properties").getPath();

		try {
			prop.load(new FileReader(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int fileUpdate(Member m, Connection con) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("fileUpdate");
		
		try {
			pstmt =con.prepareStatement(sql);
			pstmt.setString(1, m.getFiles());
			pstmt.setInt(2, m.getUserNo());
			
			
			result =pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

}
