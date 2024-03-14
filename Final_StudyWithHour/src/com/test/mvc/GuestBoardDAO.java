package com.test.mvc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
				   + " WHERE B.GU_CODE=?";	
		
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

	
	// 스크랩 게시글 조회
	public ArrayList<GuestBoardDTO> guestScrapList(String guCode) throws SQLException
	{
		ArrayList<GuestBoardDTO> result = new ArrayList<GuestBoardDTO>();
		
		String sql = "SELECT C.SCRAP_CODE AS SCRAP_CODE, C.SCRAP_DATE AS SCRAP_DATE, B.BO_CODE AS BO_CODE, B.BO_DATE AS BO_DATE, G.GU_NICK AS GU_NICK"
				   + ", G.GU_ID AS GU_ID, B.BO_TITLE AS BO_TITLE, B.BO_CONTENT AS BO_CONTENT, B.BO_VIEW AS BO_VIEW, BS.BS_LIST AS BS_LIST, BF.BF_LIST AS BF_LIST"
				   + " FROM SCRAP C JOIN BOARD B ON C.BO_CODE = B.BO_CODE JOIN BOARD_SECOND BS ON BS.BS_CODE = B.BS_CODE"
				   + " JOIN BOARD_FIRST BF ON BF.BF_CODE = BS.BF_CODE JOIN GUEST G ON G.GU_CODE = B.GU_CODE"
				   + " WHERE C.GU_CODE = ?";
		
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
				   + ", BR.BRD_CODE AS BRD_CODE, BR.BRD_DATE AS BRD_DATE\r\n, BR.RED_CODE AS RED_CODE, RS.REDSTATE AS REDSTATE"
				   + " FROM BOARD_RED_LIST_VIEW BW, BOARD_REDDONE BR, REDSTATE RS, BOARD_SECOND BS, BOARD_FIRST BF"
				   + " WHERE BW.BOR_CODE = BR.BOR_CODE AND BR.RED_CODE = RS.RED_CODE AND BW.BS_CODE = BS.BS_CODE"
				   + " AND BS.BF_CODE = BF.BF_CODE AND BW.GU_CODE = ?";
		
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
		
		String sql = "";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, guCode);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			GuestBoardDTO dto = new GuestBoardDTO();
			
			
			result.add(dto);
		}
		
		rs.close();
		pstmt.close();
		
		return result;
	}

	
}
