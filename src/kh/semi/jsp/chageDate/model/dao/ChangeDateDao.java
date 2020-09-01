package kh.semi.jsp.chageDate.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;
import static kh.semi.jsp.common.JDBCTemplate.*;
import kh.semi.jsp.member.model.vo.Member;

public class ChangeDateDao {
	private Properties prop;

	public ChangeDateDao() {
		prop = new Properties();
		String filePath = ChangeDateDao.class.getResource("/config/changeDate.properties").getPath();

		try {
			prop.load(new FileReader(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	public int FutureUpdate(Member m, Connection con) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("FutureUpdate");
		
		try {
			pstmt =con.prepareStatement(sql);
			pstmt.setDate(1, m.getFuture()); 
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
