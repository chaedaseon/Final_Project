package com.study.mvc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.study.util.DBConn;

public class GuestBoardDAO
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
	
	// 게시글 작성 내역 조회
	public ArrayList<GuestBoardDTO> boardList(String guCode) throws SQLException
	{
		ArrayList<GuestBoardDTO> result = new ArrayList<GuestBoardDTO>();
		
		String sql = "SELECT B.BO_CODE AS BO_CODE, B.BO_DATE AS BO_DATE, B.BO_TITLE AS BO_TITLE, B.BO_CONTENT AS BO_CONTENT"
				   + ", B.BO_VIEW AS BO_VIEW, B.BO_MODATE AS BO_MODATE, B.BO_FILE AS BO_FILE, BS.BS_LIST AS BS_LIST, BF.BF_LIST AS BF_LIST"
				   + " FROM BOARD B JOIN BOARD_SECOND BS ON B.BS_CODE = BS.BS_CODE JOIN BOARD_FIRST BF ON BS.BF_CODE = BF.BF_CODE"
				   + " WHERE B.GU_CODE=?"
				   + " ORDER BY BO_DATE DESC";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, guCode);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			GuestBoardDTO dto = new GuestBoardDTO();
			
			dto.setBoCode(rs.getString("BO_CODE"));
			dto.setBoDate(rs.getString("BO_DATE"));
			dto.setBoTitle(rs.getString("BO_TITLE"));
			dto.setBoContent(rs.getString("BO_CONTENT"));
			dto.setBoView(rs.getInt("BO_VIEW"));
			dto.setBoModate(rs.getString("BO_MODATE"));
			dto.setBoFile(rs.getString("BO_FILE"));
			dto.setBsList(rs.getString("BS_LIST"));
			dto.setBfList(rs.getString("BF_LIST"));
			
			result.add(dto);
		}
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	
	// 게시글 별 댓글 수 조회
	public ArrayList<GuestBoardDTO> boardReplyCount() throws SQLException
	{
		ArrayList<GuestBoardDTO> result = new ArrayList<GuestBoardDTO>();
		
		String sql = "SELECT B.BO_CODE AS BO_CODE, COUNT(R.RP_CONTENT) AS COUNT FROM BOARD B  JOIN REPLY R ON B.BO_CODE = R.BO_CODE LEFT JOIN RE_REPLY RR ON R.RP_CODE = RR.RP_CODE GROUP BY B.BO_CODE";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			GuestBoardDTO dto = new GuestBoardDTO();
			
			dto.setBoCode(rs.getString("BO_CODE"));
			dto.setReplyCount(rs.getInt("COUNT"));
			
			result.add(dto);
		}
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	// 전체 게시판 댓글 작성 내역 조회
	public ArrayList<GuestBoardDTO> replyList(String guCode) throws SQLException
	{
		ArrayList<GuestBoardDTO> result = new ArrayList<GuestBoardDTO>();
		
		String sql = "SELECT RP_DATE, RP_CONTENT, BO_CODE, BO_TITLE, BS_LIST, BF_LIST FROM VIEW_REPLY_LIST WHERE GU_CODE = ?"
				    + " ORDER BY RP_DATE DESC";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, guCode);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			GuestBoardDTO dto = new GuestBoardDTO();
			
			dto.setRpDate(rs.getString("RP_DATE"));
			dto.setRpContent(rs.getString("RP_CONTENT"));
			dto.setBoCode(rs.getString("BO_CODE"));
			dto.setBoTitle(rs.getString("BO_TITLE"));
			dto.setBfList(rs.getString("BF_LIST"));
			dto.setBsList(rs.getString("BS_LIST"));
			
			result.add(dto);
		
		}
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	
	// 스크랩 게시글 조회
	public ArrayList<GuestBoardDTO> guestScrapList(String guCode) throws SQLException
	{
		ArrayList<GuestBoardDTO> result = new ArrayList<GuestBoardDTO>();
		
		String sql = "SELECT C.SCRAP_CODE AS SCRAP_CODE, C.SCRAP_DATE AS SCRAP_DATE, B.BO_CODE AS BO_CODE, B.BO_DATE AS BO_DATE, G.GU_NICK AS GU_NICK"
				   + ", G.GU_ID AS GU_ID, B.BO_TITLE AS BO_TITLE, B.BO_CONTENT AS BO_CONTENT, B.BO_VIEW AS BO_VIEW, BS.BS_LIST AS BS_LIST, BF.BF_LIST AS BF_LIST"
				   + " FROM SCRAP C JOIN BOARD B ON C.BO_CODE = B.BO_CODE JOIN BOARD_SECOND BS ON BS.BS_CODE = B.BS_CODE"
				   + " JOIN BOARD_FIRST BF ON BF.BF_CODE = BS.BF_CODE JOIN GUEST G ON G.GU_CODE = B.GU_CODE"
				   + " WHERE C.GU_CODE = ?"
				   + " ORDER BY SCRAP_DATE DESC";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, guCode);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			GuestBoardDTO dto = new GuestBoardDTO();
			
			dto.setScrapCode(rs.getString("SCRAP_CODE"));
			dto.setScrapDate(rs.getString("SCRAP_DATE"));
			dto.setBoCode(rs.getString("BO_CODE"));
			dto.setBoDate(rs.getString("BO_DATE"));
			dto.setBoTitle(rs.getString("BO_TITLE"));
			dto.setBoContent(rs.getString("BO_CONTENT"));
			dto.setBsList(rs.getString("BS_LIST"));
			dto.setBfList(rs.getString("BF_LIST"));
			dto.setGuNick(rs.getString("GU_NICK"));
			dto.setGuId(rs.getString("GU_ID"));
			
			result.add(dto);
		}
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	// 게시물 스크랩 인서트
	public int scrapAdd(String boCode, String guCode) throws SQLException
	{
		int result = 0;
		
		String sql = "INSERT INTO SCRAP(SCRAP_CODE, SCRAP_DATE, GU_CODE, BO_CODE)"
				   + " VALUES (TO_CHAR(SCRAP_SEQ.NEXTVAL), SYSDATE, ?, ?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, guCode);
		pstmt.setString(2, boCode);
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		
		
		return result;
	}
	
	// 게시물 스크랩 삭제
	public int scrapRemove(String boCode, String guCode) throws SQLException
	{
		int result = 0;
		
		String sql = "DELETE SCRAP WHERE BO_CODE=? AND GU_CODE=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, guCode);
		pstmt.setString(2, boCode);
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		
		
		return result;
	}
	
	
	// 게시물 신고 내역 개수 조회
	public int redBoardCount(String guCode) throws SQLException
	{
		int result = 0;
		
		String sql = "SELECT COUNT(*) AS COUNT"
				 + " FROM BOARD_RED_LIST_VIEW BW, BOARD_REDDONE BR, REDSTATE RS" 
				 + " WHERE BW.BOR_CODE = BR.BOR_CODE AND BR.RED_CODE = RS.RED_CODE AND BW.GU_CODE = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, guCode);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next())
		{
			result = rs.getInt("COUNT");
		}
		
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	
	// 게시물 신고 내역 조회
	public ArrayList<GuestBoardDTO> redBoardList(String guCode) throws SQLException
	{
		ArrayList<GuestBoardDTO> result = new ArrayList<GuestBoardDTO>();
		
		String sql = "SELECT BW.BO_CODE AS BO_CODE, BW.BO_DATE AS BO_DATE, BW.BO_TITLE AS BO_TITLE, BW.BO_CONTENT AS BO_CONTENT, BW.BO_VIEW AS BO_VIEW"
				   + ", BW.BO_MODATE AS BO_MODATE, BW.BO_FILE AS BO_FILE, BS.BS_LIST AS BS_LIST, BF.BF_LIST AS BF_LIST"
				   + ", BW.GU_CODE AS GU_CODE, BW.BOR_CODE AS BOR_CODE, BW.BOR_DATE AS BOR_DATE, BW.REASON AS REASON"
				   + ", BR.BRD_CODE AS BRD_CODE, BR.BRD_DATE AS BRD_DATE, BR.RED_CODE AS RED_CODE, RS.REDSTATE AS REDSTATE"
				   + " FROM BOARD_RED_LIST_VIEW BW, BOARD_REDDONE BR, REDSTATE RS, BOARD_SECOND BS, BOARD_FIRST BF"
				   + " WHERE BW.BOR_CODE = BR.BOR_CODE AND BR.RED_CODE = RS.RED_CODE AND BW.BS_CODE = BS.BS_CODE"
				   + " AND BS.BF_CODE = BF.BF_CODE AND BW.GU_CODE = ?"
				   + " ORDER BY BOR_DATE DESC";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, guCode);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			GuestBoardDTO dto = new GuestBoardDTO();
			
			dto.setBoCode(rs.getString("BO_CODE"));
			dto.setBoDate(rs.getString("BO_DATE"));
			dto.setBoTitle(rs.getString("BO_TITLE"));
			dto.setBoContent(rs.getString("BO_CONTENT"));
			dto.setBoView(rs.getInt("BO_VIEW"));
			dto.setBoModate(rs.getString("BO_MODATE"));
			dto.setBoFile(rs.getString("BO_FILE"));
			dto.setBsList(rs.getString("BS_LIST"));
			dto.setBfList(rs.getString("BF_LIST"));
			dto.setGuCode(rs.getString("GU_CODE"));
			dto.setBorCode(rs.getString("BOR_CODE"));
			dto.setBorDate(rs.getString("BOR_DATE"));
			dto.setReason(rs.getString("REASON"));
			dto.setBrdCode(rs.getString("BRD_CODE"));
			dto.setBrdDate(rs.getString("BRD_DATE"));
			dto.setRedCode(rs.getString("RED_CODE"));
			dto.setRedstate(rs.getString("REDSTATE"));
			
			result.add(dto);
		}
		
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	
	// 댓글 신고 내역 조회
	public ArrayList<GuestBoardDTO> redReplyList(String guCode) throws SQLException
	{
		ArrayList<GuestBoardDTO> result = new ArrayList<GuestBoardDTO>();
		
		String sql = "SELECT RP_CODE, RP_CONTENT, RR_CODE, RR_DATE, REASON, BS_LIST, BF_LIST, REDSTATE, RRD_DATE FROM REPLY_RED_LIST_VIEW WHERE GU_CODE = ?"
				   + " ORDER BY RR_DATE DESC";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, guCode);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			GuestBoardDTO dto = new GuestBoardDTO();
			
			dto.setRpCode(rs.getString("RP_CODE"));
			dto.setRpContent(rs.getString("RP_CONTENT"));
			dto.setRrCode(rs.getString("RR_CODE"));
			dto.setRrDate(rs.getString("RR_DATE"));
			dto.setReason(rs.getString("REASON"));
			dto.setBsList(rs.getString("BS_LIST"));
			dto.setBfList(rs.getString("BF_LIST"));
			dto.setRedstate(rs.getString("REDSTATE"));
			dto.setRrdDate(rs.getString("RRD_DATE"));
			
			result.add(dto);
		}
		
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	
	// 전체 게시판&댓글&대댓글 패널티 부여 내역 조회
	public ArrayList<GuestBoardDTO> penaltyList(String guCode) throws SQLException
	{
		ArrayList<GuestBoardDTO> result = new ArrayList<GuestBoardDTO>();
		
		String sql = "SELECT PBO_CODE, PBO_DATE AS START_DATE, PBO_DATE+90 AS END_DATE, BRD_CODE, REASON, GU_CODE, BO_CODE"
				   + ", BO_TITLE FROM VIEW_BOARD_PENALTY WHERE GU_CODE= ?"
				   + " ORDER BY START_DATE DESC";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, guCode);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			GuestBoardDTO dto = new GuestBoardDTO();
			
			dto.setPboCode(rs.getString("PBO_CODE"));
			dto.setStartDate(rs.getString("START_DATE"));
			dto.setEndDate(rs.getString("END_DATE"));
			dto.setReason(rs.getString("REASON"));
			dto.setBoTitle(rs.getString("BO_TITLE"));
			
			result.add(dto);
		}
		
		rs.close();
		pstmt.close();
		
		return result;
		
	}
	
	
}
