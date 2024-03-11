// GuestDAO.java

package com.test.mvc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;

public class AdminDAO
{
	private Connection conn;
	
	// 데이터베이스 연결
	public void connection() throws ClassNotFoundException, SQLException
	{
		conn = DBConn.getConnection();
	}
	
	// 데이터베이스 연결 해제
	public void close() throws SQLException
	{
		DBConn.close();
	}
	
	// 관리자 로그인
	public String login(String adCode, String adPw) throws SQLException, ClassNotFoundException
	{
		
		String result = "";
		
		String sql = "SELECT AD_CODE FROM ADMIN  WHERE AD_CODE = ? AND ? = CRYPTPACK.DECRYPT(AD_PW, ?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, adCode);
		pstmt.setString(2, adPw); 
		pstmt.setString(3, adPw); 
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next())
		{
			result = rs.getString("AD_CODE");
		}
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	// 세션에 올릴 객체 생성 (관리자 정보)
	public AdminDTO sessionAdmin(String adCode) throws ClassNotFoundException, SQLException
	{
		AdminDTO admin = new AdminDTO();
		
		String sql = "SELECT AD_CODE, AD_PW, AD_NICK, AD_DATE FROM ADMIN WHERE AD_CODE = ?";
				
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, adCode);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			admin.setAdCode(rs.getString("AD_CODE"));
			admin.setAdPw(rs.getString("AD_PW"));
			admin.setAdNick(rs.getString("AD_NICK"));
			admin.setAdDate(rs.getString("AD_DATE"));
		}
		rs.close();
		pstmt.close();
		
		return admin;
	}
}
