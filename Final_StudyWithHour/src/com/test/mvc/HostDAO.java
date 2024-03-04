// HostDAO.java

package com.test.mvc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;

public class HostDAO
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
	public int add(HostDTO hostDTO) throws SQLException, ClassNotFoundException
	{
		connection();
		
		int result = 0;
		
		String sql = "{call PRC_HOST_INSERT(?, ?, ?, ?, ?, ?)}";
		
		CallableStatement cstmt = conn.prepareCall(sql);
		
		cstmt.setString(1, hostDTO.getHoId());
		cstmt.setString(2, hostDTO.getHoPw());
		cstmt.setString(3, hostDTO.getHoName());
		cstmt.setString(4, hostDTO.getHoTel());
		cstmt.setString(5, hostDTO.getHoSsn());
		cstmt.setString(6, hostDTO.getHoEmail());
		
		result = cstmt.executeUpdate();
		
		cstmt.close();
		
		return result;
	}
	
	// 아이디 중복 확인 쿼리문
	public int idCheck(String hoId) throws ClassNotFoundException, SQLException
	{
		connection();
		
		int result = 0;
		
		String sql = "SELECT COUNT(*) AS COUNT FROM HOST WHERE HO_ID = ? ";
	
		PreparedStatement pstmt = conn.prepareStatement(sql);	
		pstmt.setString(1, hoId);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			result = rs.getInt("COUNT");
		}
		rs.close();
		pstmt.close();
		close();
		
		return result;
	
	}
	
	// 로그인 쿼리문
	public String login(String hoId, String hoPw) throws ClassNotFoundException, SQLException
	{
		connection();
		
		String result = "";
		
		String sql = "SELECT HO_CODE FROM HOST WHERE HO_ID = ? AND HO_PW = ?";
		
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, hoId);
		psmt.setString(2, hoPw);
		ResultSet rs = psmt.executeQuery();
		
		if(rs.next())
		{
			result = rs.getString("HO_CODE");
		}
		rs.close();
		psmt.close();
		close();
		
		return result;
		
	}
	
	// 세션에 올릴 객체 생성 (호스트 회원 정보, 호스트 개인 정보)
	public HostDTO sessionHost(String hoCode) throws ClassNotFoundException, SQLException
	{
		HostDTO host = new HostDTO();
		
		connection();
		
		String sql = "SELECT H.HO_CODE AS HO_CODE, H.HO_ID AS HO_ID, H.HO_PW AS HO_PW, H.HO_DATE AS HO_DATE"
				   + ", HI.HO_NAME AS HO_NAME, HI.HO_TEL AS HO_TEL, HI.HO_SSN AS HO_SSN, HI.HO_EMAIL AS HO_EMAIL FROM HOST H"
				   + ", HOST_INFO HI WHERE H.HO_CODE = HI.HO_CODE AND H.HO_CODE = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, hoCode);
		
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next())
		{	
			host.setHoCode(rs.getString("HO_CODE"));
			host.setHoId(rs.getString("HO_ID"));
			host.setHoPw(rs.getString("HO_PW"));
			host.setHoDate(rs.getString("HO_DATE"));
			host.setHoName(rs.getString("HO_NAME"));
			host.setHoTel(rs.getString("HO_TEL"));
			host.setHoSsn(rs.getString("HO_SSN"));
			host.setHoEmail(rs.getString("HO_EMAIL"));
		}
		
		rs.close();
		pstmt.close();
		close();
		
		return host;
	}

	
}
