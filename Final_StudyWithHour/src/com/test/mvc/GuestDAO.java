// GuestDAO.java

package com.test.mvc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class GuestDAO
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
	
	// 멤버 데이터 입력
	public int add(GuestDTO guestDTO) throws SQLException, ClassNotFoundException
	{
		connection();
		
		int result = 0;
		
		String sql = "{call PRC_JOIN_GUEST(?, ?, ?, ?, ?, ?, ?, ?)}";
		
		CallableStatement cstmt = conn.prepareCall(sql);
		
		cstmt.setString(1, guestDTO.getGuId());
		cstmt.setString(2, guestDTO.getGuPw());
		cstmt.setString(3, guestDTO.getGuNick());
		cstmt.setString(4, guestDTO.getGuCategoryCode());
		cstmt.setString(5, guestDTO.getGuName());
		cstmt.setString(6, guestDTO.getGuTel());
		cstmt.setString(7, guestDTO.getGuSsn());
		cstmt.setString(8, guestDTO.getGuEmail());
		
		result = cstmt.executeUpdate();
		
		cstmt.close();
		close();
		
		return result;
	}
	
	// 아이디 중복 확인 쿼리문
	public int idCheck(String guId) throws ClassNotFoundException, SQLException
	{
		connection();
		
		int result = 0;
		
		String sql = "SELECT COUNT(*) AS COUNT FROM HOST WHERE GU_ID = ? ";
	
		PreparedStatement pstmt = conn.prepareStatement(sql);	
		pstmt.setString(1, guId);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next())
		{
			result = rs.getInt("COUNT");
		}
		rs.close();
		pstmt.close();
		close();
		
		return result;
	
	}
	
	// 로그인 쿼리문
	public String login(String guId, String guPw) throws ClassNotFoundException, SQLException
	{
		connection();
		
		String result = "";
		
		String sql = "SELECT GU_CODE AS COUNT FROM GUEST WHERE GU_ID = ? AND GU_PW = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, guId);
		pstmt.setString(2, guPw);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next())
		{
			result = rs.getString("COUNT");
		}
		rs.close();
		pstmt.close();
		close();
		
		return result;
		
	}
	
	// 아이디 찾기 쿼리문
	public String searchId(String userName, String userTel) throws ClassNotFoundException, SQLException
	{
		connection();
		
		String guId = "";
		
		String sql = "SELECT G.GU_ID AS GU_ID FROM GUEST G, GUEST_INFO GI WHERE GI.GU_NAME = ? AND GI.GU_TEL = ? AND G.GU_CODE = GI.GU_CODE";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userName);
		pstmt.setString(2, userTel);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			guId = rs.getString("GU_ID");
		}
		
		rs.close();
		pstmt.close();
		close();
		
		return guId;
	}
	
	
	// 비밀번호 찾기 쿼리문 (아이디, 이름, 전화번호 일치 여부 확인 후 비밀번호 재설정 페이지로 연결)
	public int searchPw(String userId, String userName, String userTel) throws ClassNotFoundException, SQLException
	{
		connection();
		
		int result = 0;
		
		String sql = "SELECT COUNT(*) AS COUNT FROM GUEST G, GUEST_INFO GI WHERE G.GU_ID = ? AND GI.GU_NAME = ? AND GI.GU_TEL = ? AND G.GU_CODE = GI.GU_CODE";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userId);
		pstmt.setString(2, userName);
		pstmt.setString(3, userTel);
		
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next())
		{
			result = rs.getInt("COUNT");
		}
		
		rs.close();
		pstmt.close();
		
		close();			
		
		return result;
	}
	
	
	// 세션에 올릴 객체 생성 (게스트 회원 정보, 게스트 개인 정보)
	public GuestDTO sessionGuest(String guCode) throws ClassNotFoundException, SQLException
	{
		GuestDTO guest = new GuestDTO();

		connection();
		
		String sql = "SELECT G.GU_CODE AS GU_CODE, G.GU_ID AS GU_ID, G.GU_PW AS GU_PW, G.GU_NICK AS GU_NICK"
				   + ", G.GU_DATE AS GU_DATE, G.CATEGORY_CODE AS CATEGORY_CODE, GI.GU_NAME AS GU_NAME, GI.GU_TEL AS GU_TEL"
				   + ", GI.GU_SSN AS GU_SSN, GI.GU_EMAIL AS GU_EMAIL FROM GUEST G, GUEST_INFO GI"
				   + " WHERE G.GU_CODE = GI.GU_CODE AND G.GU_CODE = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, guCode);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			guest.setGuCode(rs.getString("GU_CODE"));
			guest.setGuId(rs.getString("GU_ID"));
			guest.setGuPw(rs.getString("GU_PW"));
			guest.setGuNick(rs.getString("GU_NICK"));
			guest.setGuDate(rs.getString("GU_DATE"));
			guest.setGuCategoryCode(rs.getString("CATEGORY_CODE"));
			guest.setGuName(rs.getString("GU_NAME"));
			guest.setGuTel(rs.getString("GU_TEL"));
			guest.setGuSsn(rs.getString("GU_SSN"));
			guest.setGuEmail(rs.getString("GU_EMAIL"));
		}
		
		rs.close();
		pstmt.close();
		close();
		
		return guest;
	}
	
	
	
	// 로그인한 계정의 비밀번호와 일치하는지 확인하는 쿼리문
	public int checkPw(String guCode, String userPw) throws SQLException
	{
		int result = 0;
		
		String sql = "SELECT COUNT(*) AS COUNT FROM GUEST WHERE GU_CODE = ? AND GU_PW = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, guCode);
		pstmt.setString(2, userPw);
		
		pstmt.close();
		
		return result;
	}
}
