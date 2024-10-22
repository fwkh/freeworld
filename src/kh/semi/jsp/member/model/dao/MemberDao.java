package kh.semi.jsp.member.model.dao;

import static kh.semi.jsp.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import kh.semi.jsp.member.exception.MemberException;
import kh.semi.jsp.member.model.vo.Member;

public class MemberDao{

   private Properties prop;

	public MemberDao(){
		prop = new Properties();
		
		String filePath = MemberDao.class.getResource("/config/member-query.properties").getPath();
		try
		{
			prop.load(new FileReader(filePath));
		}
		catch(FileNotFoundException e) 
		{
			e.printStackTrace();
		}
		catch(IOException e) 
		{
			e.printStackTrace();
		}
	}
	
	

	public Member f_searchOne(Connection con, Member m){
		Member result = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("freelancerSearchOne");
		
		try{
			pstmt.getConnection().prepareStatement(sql);
			rset = pstmt.executeQuery();
		
			if(rset.next()){
				result.setUserName(rset.getString("F_NAME"));
				result.setBirth(rset.getDate("F_BIRTH"));
				result.setPhone(rset.getString("F_PHONE"));
				result.setEmail(rset.getString("F_EAMIL"));
				result.setArea(rset.getString("F_AREA"));
				result.setHope(rset.getString("F_HOPE"));
				result.setFuture(rset.getDate("F_FUTURE"));
				result.setWithdraw(rset.getBoolean("F_WITHDRAW_YN"));
				result.setEnrolldate(rset.getDate("F_ENROLLDATE"));
				result.setCareer(rset.getInt("F_CAREER"));
				result.setTotal(rset.getInt("F_TOTAL"));
				result.setJoin(rset.getString("F_JOIN"));
				result.setSkill1(rset.getString("F_SKILL1"));
				result.setSkill2(rset.getString("F_SKILL2"));
				result.setSkill3(rset.getString("F_SKILL3"));
			}
		}
		catch(SQLException e){
			e.printStackTrace();
		}
		finally{
			close(rset);
			close(pstmt);
		}
		
		return result;
	}
  
   
 
   

   
   public Member selectMember(Connection con, Member m) throws MemberException
   {
      Member result = null;
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      
      String sql = prop.getProperty("selectMember");
      
      try
      {
         pstmt = con.prepareStatement(sql);
         pstmt.setString(1, m.getEmail());
         pstmt.setString(2, m.getUserPwd());
         
         rset = pstmt.executeQuery();
         
         if(rset.next())
         {
            result = new Member();
            
            result.setUserPwd(m.getUserPwd());
            result.setEmail(m.getEmail());
            result.setUserName(rset.getString("F_NAME"));
            
//            result.setUserNo(rset.getInt("F_NO"));
//            result.setBirth(rset.getDate("F_BIRTH"));
//            result.setPhone(rset.getString("F_PHONE"));
//            result.setArea(rset.getString("F_AREA"));
//            result.setHope(rset.getString("F_HOPE"));
//            result.setFuture(rset.getDate("F_FUTURE"));
//            result.setEnrolldate(rset.getDate("F_ENROLLDATE"));
//            result.setCareer(rset.getInt("F_CAREER"));
//            result.setTotal(rset.getInt("F_TOTAL"));
//            result.setJoin(rset.getString("F_JOIN"));
//            result.setBirthday_year(rset.getInt("F_BIRTH_YEAR"));
//            result.setPhone_new(rset.getInt("F_PHONE_NEW"));
//            result.setFiles(rset.getString("F_FILE"));
//            result.setGender(rset.getString("F_GENDER"));
            System.out.println(result);
         }
      }
      catch(Exception e) 
      {
         throw new MemberException(e.getMessage());
      }
      finally 
      {
         close(rset);
         close(pstmt);
      }
      
      return result;
   }
  


	public int insertMember(Connection con, Member m) throws MemberException {
		int result = 0;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("insertMember");

		try{
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1,m.getUserPwd());
			pstmt.setString(2,m.getUserName());
			pstmt.setDate(3,m.getBirth());
			pstmt.setString(4,m.getPhone());
			pstmt.setString(5,m.getEmail());
			pstmt.setString(6,m.getArea());
			pstmt.setString(7,m.getHope());
			pstmt.setDate(8,m.getFuture());
			pstmt.setInt(9,m.getTotal());

			result = pstmt.executeUpdate();
		}catch (SQLException e){
			throw new MemberException(e.getMessage());
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int memberUpdate(Connection con, Member m) throws MemberException {
		int result = 0;
		System.out.println("MemberDao 접속!");
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("memberUpdate");

		try{
			System.out.println("MemberDao try문 입성!");
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1,m.getBirthYear());
			pstmt.setString(2,m.getGender());
			pstmt.setString(3,m.getPhone());
			pstmt.setString(4,m.getSkill1());
			pstmt.setString(5,m.getSkill2());
			pstmt.setString(6,m.getSkill3());
			pstmt.setString(7,m.getArea());
			pstmt.setDate(8,m.getFuture());
			pstmt.setInt(9,1);

			result = pstmt.executeUpdate();
			
		}catch (SQLException e){
			throw new MemberException(e.getMessage());
		}finally {
			close(pstmt);
		}
		return result;
	}

}