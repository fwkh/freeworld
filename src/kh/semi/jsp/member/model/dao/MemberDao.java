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

public class MemberDao 
{
   private Properties prop;

   public MemberDao() 
   {
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
        	System.out.println("dao2 : " + m.getUserPwd());
            result = new Member();
            
            result.setEmail(m.getEmail());
            result.setUserPwd(m.getUserPwd());
            
//            result.setUserNo(rset.getInt("F_NO"));
//            result.setUserName(rset.getString("F_USERNAME"));
//            result.setBirth(rset.getDate("F_BIRTH"));
//            result.setPhone(rset.getString("F_PHONE"));
//            result.setArea(rset.getString("F_AREA"));
//            result.setHope(rset.getString("F_HOPE"));
//            result.setFuture(rset.getDate("F_FUTURE"));
//            result.setCareer(rset.getInt("F_CAREER"));
//            result.setTotal(rset.getInt("F_TOTAL"));
//            result.setJoin(rset.getString("F_JOIN"));
//            result.setBirthday_year(rset.getInt("F_BIRTH_YEAR"));
//            result.setPhone_new(rset.getInt("F_PHONE_NEW"));
//            result.setFiles(rset.getString("F_FILE"));
//            result.setGender(rset.getString("F_GENDER"));
         }S
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

   public int insertMember(Connection con, Member m) throws MemberException
   {
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
}