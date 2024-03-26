package com.study.mvc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.study.util.DBConn;

public class BoardDAO
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
	public ArrayList<BoardDTO> boardList(String guCode) throws SQLException
	{
		ArrayList<BoardDTO> result = new ArrayList<BoardDTO>();
		
		String sql = "SELECT B.BO_CODE AS BO_CODE, B.BO_DATE AS BO_DATE, B.BO_TITLE AS BO_TITLE, B.BO_CONTENT AS BO_CONTENT"
				   + ", B.BO_VIEW AS BO_VIEW, B.BO_MODATE AS BO_MODATE, B.BO_FILE AS BO_FILE, BS.BS_LIST AS BS_LIST, BF.BF_LIST AS BF_LIST"
				   + " FROM BOARD B JOIN BOARD_SECOND BS ON B.BS_CODE = BS.BS_CODE"
				   + " JOIN BOARD_FIRST BF ON BS.BF_CODE = BF.BF_CODE"
				   + " WHERE GU_CODE=?";	
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, guCode);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			BoardDTO dto = new BoardDTO();
			
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
	
	// 가입한 그룹 게시글 작성 내역
	public ArrayList<BoardDTO> groupBoardList(String guCode) throws SQLException
	{
		ArrayList<BoardDTO> result = new ArrayList<BoardDTO>();
		
		String sql = "SELECT GB.GB_CODE AS GB_CODE, GB.GB_DATE AS GB_DATE, GB.GB_TITLE AS GB_TITLE, GB.GB_CONTENT AS GB_CONTENT"
				   + ", GB.GB_VIEW AS GB_VIEW, GB.GB_MODATE AS GB_MODATE, GB.GB_FILE AS GB_FILE, GR.GR_NAME AS GR_NAME"
				   + " FROM GROUP_BOARD GB JOIN GROUP_JOIN GJ ON GB.GJ_CODE = GJ.GJ_CODE"
				   + " JOIN GROUP_REGISTRATION GR ON GR.GR_CODE = GJ.GR_CODE JOIN GUEST G ON G.GU_CODE = GJ.GU_CODE"
				   + " WHERE G.GU_CODE=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, guCode);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			BoardDTO dto = new BoardDTO();
			
			
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
	
	
	// 게시글에 따른 댓글 수
	public int replyCount(String boCode) throws SQLException
	{
		int result = 0;
		
		String sql = "SELECT COUNT(*) AS COUNT FROM BOARD B, REPLY R WHERE B.BO_CODE = R.BO_CODE AND B.BO_CODE = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, boCode);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next())
		{
			result = rs.getInt("COUNT");
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
	public ArrayList<BoardDTO> redBoardList(String guCode) throws SQLException
	{
		ArrayList<BoardDTO> result = new ArrayList<BoardDTO>();
		
		String sql = "SELECT BW.BO_CODE AS BO_CODE, BW.BO_DATE AS BO_DATE, BW.BO_TITLE AS BO_TITLE, BW.BO_CONTENT AS BO_CONTENT"
				 + ", BW.BO_VIEW AS BO_VIEW, BW.BO_MODATE AS BO_MODATE, BW.BO_FILE AS BO_FILE, BS.BS_LIST AS BS_LIST, BW.GU_CODE AS GU_CODE"
				 + ", BW.BOR_CODE AS BOR_CODE, BW.BOR_DATE AS BOR_DATE, BW.REASON AS REASON, BR.BRD_CODE AS BRD_CODE, BR.BRD_DATE AS BRD_DATE"
				 + ", BR.RED_CODE AS RED_CODE, RS.REDSTATE AS REDSTATE FROM BOARD_RED_LIST_VIEW BW, BOARD_REDDONE BR, REDSTATE RS, BOARD_SECOND BS" 
				 + " WHERE BW.BOR_CODE = BR.BOR_CODE AND BR.RED_CODE = RS.RED_CODE AND BW.BS_CODE = BS.BS_CODE AND BW.GU_CODE = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, guCode);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			BoardDTO dto = new BoardDTO();
			
			dto.setBoCode(rs.getString("BO_CODE"));
			dto.setBoDate(rs.getString("BO_DATE"));
			dto.setBoTitle(rs.getString("BO_TITLE"));
			dto.setBoContent(rs.getString("BO_CONTENT"));
			dto.setBoView(rs.getInt("BO_VIEW"));
			dto.setBoModate(rs.getString("BO_MODATE"));
			dto.setBoFile(rs.getString("BO_FILE"));
			dto.setBsList(rs.getString("BS_LIST"));
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
	public ArrayList<BoardDTO> redReplyList(String guCode) throws SQLException
	{
		ArrayList<BoardDTO> result = new ArrayList<BoardDTO>();
		
		String sql = "";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, guCode);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			BoardDTO dto = new BoardDTO();
			
			
			result.add(dto);
		}
		
		rs.close();
		pstmt.close();
		
		return result;
	}

	
}
