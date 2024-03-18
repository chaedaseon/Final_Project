// GuestDAO.java

package com.study.mvc.model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.study.util.DBConn;

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
	
	
	// 게스트 회원 가입 (멤버 입력)
	public int add(GuestDTO guestDTO) throws SQLException, ClassNotFoundException
	{
		
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
		
		return result;
	}
	
	// 아이디 중복 확인 쿼리문
	public int idCheck(String guId) throws ClassNotFoundException, SQLException
	{
		
		int result = 0;
		
		String sql = "SELECT COUNT(*) AS COUNT FROM GUEST WHERE GU_ID = ? ";
	
		PreparedStatement pstmt = conn.prepareStatement(sql);	
		pstmt.setString(1, guId);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next())
		{
			result = rs.getInt("COUNT");
		}
		rs.close();
		pstmt.close();
		
		return result;
	
	}
	
	// 닉네임 중복 확인 쿼리문
	public int nickCheck(String guNick) throws ClassNotFoundException, SQLException
	{
		int result = 0;
		
		String sql = "SELECT COUNT(*) AS COUNT FROM GUEST WHERE GU_NICK = ? ";
	
		PreparedStatement pstmt = conn.prepareStatement(sql);	
		pstmt.setString(1, guNick);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next())
		{
			result = rs.getInt("COUNT");
		}
		rs.close();
		pstmt.close();
		
		return result;
	
	}
	
	// 개인정보 중복 확인 쿼리문
	public int infoCheck(String guName, String guSsn, String guTel) throws SQLException
	{
		int result = 0;
		
		String sql = "SELECT COUNT(*) AS COUNT FROM GUEST_INFO WHERE GU_NAME=? AND GU_TEL=? AND GU_SSN=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, guName);
		pstmt.setString(2, guTel);
		pstmt.setString(3, guSsn);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next())
		{
			result = rs.getInt("COUNT");
		}
			
		rs.close();
		pstmt.close();
		
		return result;
		
	}
	
	// 비밀번호 일치 여부 확인 쿼리문
	public int pwCheck(String guCode, String guPwCheck) throws SQLException
	{
		int result = 0;
		
		String sql = "SELECT COUNT(*) AS COUNT"
				   + " FROM GUEST WHERE GU_CODE = ?"
				   + " AND ? = (SELECT CRYPTPACK.DECRYPT(GU_PW, ?)"
				   + " FROM GUEST WHERE GU_CODE=?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, guCode);
		pstmt.setString(2, guPwCheck);
		pstmt.setString(3, guPwCheck);
		pstmt.setString(4, guCode);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next())
		{
			result = rs.getInt("COUNT");
		}
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	
	// 로그인 쿼리문
	public String login(String guId, String guPw) throws ClassNotFoundException, SQLException
	{
		
		String result = "";
		
		String sql = "SELECT GU_CODE FROM GUEST WHERE GU_ID = ?"
				   + " AND ? = (SELECT CRYPTPACK.DECRYPT(GU_PW, ?) FROM GUEST WHERE GU_ID=?)"
				   + " AND GU_CODE NOT IN (SELECT GU_CODE FROM GUEST_UNREG)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, guId);
		pstmt.setString(2, guPw);
		pstmt.setString(3, guPw);
		pstmt.setString(4, guId);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next())
		{
			result = rs.getString("GU_CODE");
		}
		rs.close();
		pstmt.close();
		
		return result;
		
	}
	
	// 아이디 찾기 쿼리문
	public String searchId(String userName, String userTel) throws ClassNotFoundException, SQLException
	{
		
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
		
		return guId;
	}
	
	
	// 비밀번호 찾기 쿼리문 (아이디, 이름, 전화번호 일치 여부 확인 후 비밀번호 재설정 페이지로 연결)
	public int searchPw(String userId, String userName, String userTel) throws ClassNotFoundException, SQLException
	{
		
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
		
		return result;
	}
	
	
	// 세션에 올릴 객체 생성 (게스트 회원 정보, 게스트 개인 정보)
	public GuestDTO sessionGuest(String guCode) throws ClassNotFoundException, SQLException
	{
		GuestDTO guest = new GuestDTO();

		String sql = "SELECT G.GU_CODE AS GU_CODE, G.GU_ID AS GU_ID, G.GU_NICK AS GU_NICK, G.GU_DATE AS GU_DATE"
				   + ", G.CATEGORY_CODE AS CATEGORY_CODE, GI.GU_NAME AS GU_NAME, GI.GU_TEL AS GU_TEL, GI.GU_SSN AS GU_SSN"
				   + ", GI.GU_EMAIL AS GU_EMAIL FROM GUEST G, GUEST_INFO GI WHERE G.GU_CODE = GI.GU_CODE AND G.GU_CODE = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, guCode);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			guest.setGuCode(rs.getString("GU_CODE"));
			guest.setGuId(rs.getString("GU_ID"));
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
		
		return guest;
	}
	
	
	// 마이페이지 정보 수정
	public int modify(GuestDTO guestDTO) throws ClassNotFoundException, SQLException
	{

		int result = 0;
		
		String sql = "{call PRC_MYPAGE_UPDATE(?, ?, ?, ?)}";
		
		CallableStatement cstmt = conn.prepareCall(sql);
		
		cstmt.setString(1, guestDTO.getGuTel());
		cstmt.setString(2, guestDTO.getGuEmail());
		cstmt.setString(3, guestDTO.getGuNick());
		cstmt.setString(4, guestDTO.getGuCode());
		
		result = cstmt.executeUpdate();
		
		cstmt.close();
		
		return result;
	}
	
	// 마이페이지 비밀번호 변경
	public int modifyPw(String guPw, String guCode) throws ClassNotFoundException, SQLException
	{
		
		int result = 0;
		
		String sql = "UPDATE GUEST SET GU_PW = ? WHERE GU_CODE= ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, guPw);
		pstmt.setString(2, guCode);
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		
		return result;
	}
	
	// 마이페이지 회원 탈퇴 (개인정보 삭제, 회원탈퇴 테이블 삽입)
	public int remove(String guCode, String reasonCode) throws ClassNotFoundException, SQLException
	{
		
		int result = 0;
		
		String sql = "{call PRC_GUEST_UNREG(?, ?)}";
		
		CallableStatement cstmt = conn.prepareCall(sql);
		cstmt.setString(1, guCode);
		cstmt.setString(2, reasonCode);
		
		result = cstmt.executeUpdate();
		
		cstmt.close();
		
		return result;
	}
	
	// 사이드메뉴 이웃관리 (리스트 조회)
	public ArrayList<GuestDTO> frinedList(String guCode) throws SQLException
	{
		ArrayList<GuestDTO> result = new ArrayList<GuestDTO>();
		
		String sql = "SELECT VR.FM_CODE AS FM_CODE, VR.FM_DATE AS FM_DATE, VR.GU_CODE AS GU_CODE, G.GU_NICK AS GU_FMNICK"
				 + ", VR.FT_CODE AS FT_CODE FROM (SELECT F.FM_CODE AS FM_CODE, F.FM_DATE AS FM_DATE, G.GU_CODE AS GU_CODE"
				 + ", F.GU_FMCODE AS GU_FMCODE, F.FT_CODE AS FT_CODE FROM FRIEND_MANAGE F, GUEST G"
				 + " WHERE F.GU_CODE = G.GU_CODE AND G.GU_CODE = ? ) VR, GUEST G"
				 + " WHERE VR.GU_FMCODE = G.GU_CODE";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, guCode);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			GuestDTO dto = new GuestDTO();
			
			dto.setFmCode(rs.getString("FM_CODE"));
			dto.setFmDate(rs.getString("FM_DATE"));
			dto.setGuCode(rs.getString("GU_CODE"));
			dto.setGuFmNick(rs.getString("GU_FMNICK"));
			dto.setFtCode(rs.getString("FT_CODE"));
			
			result.add(dto);
		}
		
		rs.close();
		pstmt.close();
				
		return result;
	}
	
	// 이웃 관리 추가 수행
	public int friendAdd(String guCode, String boWriter, String type) throws SQLException
	{
		int result = 0;
		
		// 찜 이웃 추가
		String sql = "INSERT INTO FRIEND_MANAGE(FM_CODE, FM_DATE, GU_CODE, GU_FMCODE, FT_CODE)"
	               + " VALUES(TO_CHAR(FRIEND_MANAGE_SEQ.NEXTVAL), SYSDATE, ?, ?, ?	)";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, guCode);
		pstmt.setString(2, boWriter);
		pstmt.setString(3, type);
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		return result;
	}

	
	// 이웃 관리 삭제 수행
	public int friendRemove(String guCode, String fmCode) throws SQLException
	{
		int result = 0;
		
		String sql = "DELETE FROM FRIEND_MANAGE WHERE FM_CODE = ? AND GU_CODE = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, fmCode);
		pstmt.setString(2, guCode);
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		
		return result; 
	}
	
	// 멤버 정보 내역 
	public GuestDTO guestInfoList(String guCode) throws SQLException
	{
		GuestDTO result = new GuestDTO();
		
		String sql = "SELECT GU_CODE, GU_ID, GU_NICK, GU_DATE, CATEGORY_CODE, GU_NAME, CATEGORY_LIST, GU_SSN, GENDER, AGE"
				+ " FROM VIEW_GUESTINFO WHERE GU_CODE = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, guCode);
		
		ResultSet rs = pstmt.executeQuery();
		while(rs.next())
		{
			result.setGuCode(rs.getString("GU_CODE"));
			result.setGuId(rs.getString("GU_ID"));
			result.setGuNick(rs.getString("GU_NICK"));
			result.setGuDate(rs.getString("GU_DATE"));
			result.setGuCategoryCode(rs.getString("CATEGORY_CODE"));
			result.setGuName(rs.getString("GU_NAME"));
			result.setGuCategoryList(rs.getString("CATEGORY_LIST"));
			result.setGuSsn(rs.getString("GU_SSN"));
			result.setGender(rs.getString("GENDER"));
			result.setAge(rs.getInt("AGE"));
		}
		
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	// 그룹코드에서 멤버코드 내역 확인
	public String searchMember(String gjCode) throws SQLException
	{
		String result = "";
		
		String sql = "SELECT G.GU_CODE AS GU_CODE FROM GROUP_JOIN GJ, GUEST G"
				+ " WHERE GJ.GU_CODE = G.GU_CODE AND GJ.GJ_CODE = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, gjCode);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next())
		{
			result = rs.getString("GU_CODE");
		}
		
		rs.close();
		pstmt.close();
		
		return result;
	}
	
}
