// HostDAO.java

package com.study.mvc.model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.study.util.DBConn;
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
	
	// 호스트 회원 가입 멤버 데이터 입력
	public int add(HostDTO hostDTO) throws SQLException, ClassNotFoundException
	{

		int result = 0;
		
		String sql = "{call PRC_JOIN_HOST(?, ?, ?, ?, ?, ?)}";
		
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
		
		return result;
	
	}
	
	// 로그인 쿼리문
	public String login(String hoId, String hoPw) throws ClassNotFoundException, SQLException
	{
		
		String result = "";
		
		String sql = "SELECT HO_CODE FROM HOST WHERE HO_ID = ?"
				   + " AND ? = (SELECT CRYPTPACK.DECRYPT(HO_PW, ?) FROM HOST WHERE HO_ID=?)"
				   + " AND HO_CODE NOT IN (SELECT HO_CODE FROM HOST_UNREG)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, hoId);
		pstmt.setString(2, hoPw);
		pstmt.setString(3, hoPw);
		pstmt.setString(4, hoId);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next())
		{
			result = rs.getString("HO_CODE");
		}
		rs.close();
		pstmt.close();
		
		return result;
		
	}
	
	// 비밀번호 일치 여부 확인 쿼리문
	public int pwCheck(String hoCode, String hoPwCheck) throws SQLException
	{
		int result = 0;
		
		String sql = "SELECT COUNT(*) AS COUNT"
				   + " FROM HOST WHERE HO_CODE = ?"
				   + " AND ? = (SELECT CRYPTPACK.DECRYPT(HO_PW, ?)"
				   + " FROM HOST WHERE HO_CODE=?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, hoCode);
		pstmt.setString(2, hoPwCheck);
		pstmt.setString(3, hoPwCheck);
		pstmt.setString(4, hoCode);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next())
		{
			result = rs.getInt("COUNT");
		}
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	// 마이페이지 비밀번호 변경
	public int modifyPw(String hoPw, String hoCode) throws ClassNotFoundException, SQLException
	{
		int result = 0;
		
		String sql = "UPDATE HOST SET HO_PW = CRYPTPACK.DECRYPT(?, ?) WHERE HO_CODE=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, hoPw);
		pstmt.setString(2, hoPw);
		pstmt.setString(3, hoCode);
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		
		return result;
	}
	
	// 마이페이지 정보 수정
	public int modify(HostDTO hostDTO) throws ClassNotFoundException, SQLException
	{
		int result = 0;
		
		String sql = "UPDATE HOST_INFO SET HO_TEL = ?, HO_EMAIL = ? WHERE HO_CODE = ?";
		
		PreparedStatement pstmt = conn.prepareCall(sql);
		
		pstmt.setString(1, hostDTO.getHoTel());
		pstmt.setString(2, hostDTO.getHoEmail());
		pstmt.setString(3, hostDTO.getHoCode());
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		
		return result;
	}
	
	// 마이페이지 회원 탈퇴 (개인정보 삭제, 회원탈퇴 테이블 삽입)
	public int remove(String hoCode, String reasonCode) throws ClassNotFoundException, SQLException
	{
		int result = 0;
		
		String sql = "{call PRC_GUEST_UNREG(?, ?)}";
		
		CallableStatement cstmt = conn.prepareCall(sql);
		cstmt.setString(1, hoCode);
		cstmt.setString(2, reasonCode);
		
		result = cstmt.executeUpdate();
		
		cstmt.close();
		
		return result;
	}
	
	
	// 아이디 찾기 쿼리문
	public String searchId(String userName, String userTel) throws ClassNotFoundException, SQLException
	{
		
		String hoId = "";
		
		String sql = "SELECT H.HO_ID AS HO_ID FROM HOST H, HOST_INFO HI WHERE HI.HO_NAME = ? AND HI.HO_TEL = ? AND H.HO_CODE = HI.HO_CODE";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userName);
		pstmt.setString(2, userTel);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			hoId = rs.getString("HO_ID");
		}
		
		rs.close();
		pstmt.close();
		
		return hoId;
	}
	
	// 개인정보 중복 확인 쿼리문
	public int infoCheck(String hoName, String hoSsn, String hoTel) throws SQLException
	{
		int result = 0;
		
		String sql = "SELECT COUNT(*) AS COUNT FROM HOST_INFO WHERE HO_NAME=? AND HO_TEL=? AND HO_SSN=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, hoName);
		pstmt.setString(2, hoTel);
		pstmt.setString(3, hoSsn);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next())
		{
			result = rs.getInt("COUNT");
		}
			
		rs.close();
		pstmt.close();
		
		return result;
		
	}
	
	// 비밀번호 찾기 쿼리문 (아이디, 이름, 전화번호 일치 여부 확인 후 비밀번호 재설정 페이지로 연결)
	public int searchPw(String userId, String userName, String userTel) throws ClassNotFoundException, SQLException
	{
		
		int result = 0;
		
		String sql = "SELECT COUNT(*) AS COUNT FROM HOST H, HOST_INFO HI WHERE H.HO_ID = ? AND HI.HO_NAME = ? AND HI.HO_TEL = ? AND H.HO_CODE = HI.HO_CODE";
		
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
		
		return result;
	}
	
	
	
	// 세션에 올릴 객체 생성 (호스트 회원 정보, 호스트 개인 정보)
	public HostDTO sessionHost(String hoCode) throws ClassNotFoundException, SQLException
	{
		HostDTO host = new HostDTO();
		
		String sql = "SELECT H.HO_CODE AS HO_CODE, H.HO_ID AS HO_ID, H.HO_DATE AS HO_DATE"
				   + ", HI.HO_NAME AS HO_NAME, HI.HO_TEL AS HO_TEL, HI.HO_SSN AS HO_SSN, HI.HO_EMAIL AS HO_EMAIL FROM HOST H"
				   + ", HOST_INFO HI WHERE H.HO_CODE = HI.HO_CODE AND H.HO_CODE = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, hoCode);
		
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next())
		{	
			host.setHoCode(rs.getString("HO_CODE"));
			host.setHoId(rs.getString("HO_ID"));
			host.setHoDate(rs.getString("HO_DATE"));
			host.setHoName(rs.getString("HO_NAME"));
			host.setHoTel(rs.getString("HO_TEL"));
			host.setHoSsn(rs.getString("HO_SSN"));
			host.setHoEmail(rs.getString("HO_EMAIL"));
		}
		
		rs.close();
		pstmt.close();
		
		return host;
	}

	
}
