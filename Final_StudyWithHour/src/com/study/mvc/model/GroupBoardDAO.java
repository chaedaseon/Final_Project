package com.study.mvc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.study.util.DBConn;

public class GroupBoardDAO
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
	
	
	// 가입한 그룹 게시글 작성 내역
	public ArrayList<GroupBoardDTO> groupBoardList(String guCode) throws SQLException
	{
		ArrayList<GroupBoardDTO> result = new ArrayList<GroupBoardDTO>();
		
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
			GroupBoardDTO dto = new GroupBoardDTO();
			
			dto.setGbCode(rs.getString("GB_CODE"));
			dto.setGbDate(rs.getString("GB_DATE"));
			dto.setGbTitle(rs.getString("GB_TITLE"));
			dto.setGbContent(rs.getString("GB_CONTENT"));
			dto.setGbView(rs.getInt("GB_VIEW"));
			dto.setGbModate(rs.getString("GB_MODATE"));
			dto.setGbFile(rs.getString("GB_FILE"));
			dto.setGrName(rs.getString("GR_NAME"));
			
			result.add(dto);
		}
		
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	
	// 그룹 게시글 별 댓글 수 조회
	public ArrayList<GroupBoardDTO> groupReplyCount() throws SQLException
	{
		ArrayList<GroupBoardDTO> result = new ArrayList<GroupBoardDTO>();
		
		String sql = "SELECT GB.GB_CODE AS GB_CODE, COUNT(GR.GRE_CONTENT) AS COUNT FROM GROUP_BOARD GB JOIN GROUP_REPLY GR ON GB.GB_CODE = GR.GB_CODE GROUP BY GB.GB_CODE"; 
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			GroupBoardDTO dto = new GroupBoardDTO();
			
			dto.setGbCode(rs.getString("GB_CODE"));
			dto.setReplyCount(rs.getInt("COUNT"));
			
			result.add(dto);
		}
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	// 그룹 게시판 댓글 작성 내역 조회
	public ArrayList<GroupBoardDTO> groupReplyList(String guCode) throws SQLException
	{
		ArrayList<GroupBoardDTO> result = new ArrayList<GroupBoardDTO>();
		
		String sql = "SELECT GRE_CODE, GRE_DATE, GRE_CONTENT, GB_CODE, GB_TITLE, GR_NAME"
				   + " FROM VIEW_GROUP_REPLY_LIST"
				   + " WHERE GU_CODE = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, guCode);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			GroupBoardDTO dto = new GroupBoardDTO();
			
			dto.setGreCode(rs.getString("GRE_CODE"));
			dto.setGreDate(rs.getString("GRE_DATE"));
			dto.setGreContent(rs.getString("GRE_CONTENT"));
			dto.setGbCode(rs.getString("GB_CODE"));
			dto.setGbTitle(rs.getString("GB_TITLE"));
			dto.setGrName(rs.getString("GR_NAME"));
			
			result.add(dto);
					
		}
		rs.close();
		pstmt.close();
				
		return result;
	}
	
	// 그룹 스크랩 게시글 조회
	public ArrayList<GroupBoardDTO> groupScrapList(String guCode) throws SQLException
	{
		ArrayList<GroupBoardDTO> result = new ArrayList<GroupBoardDTO>();
		
		String sql = "SELECT GBS_CODE, GBS_DATE, GJ_CODE, GR_NAME, GB_CODE, GB_TITLE, GU_NICK, GU_ID"
				   + " FROM VIEW_GROUP_SCRAP WHERE GJ_CODE IN"
				   + " (SELECT GJ.GJ_CODE FROM GUEST G JOIN GROUP_JOIN GJ ON G.GU_CODE = GJ.GU_CODE"
				   + " WHERE G.GU_CODE = ?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, guCode);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			GroupBoardDTO dto = new GroupBoardDTO();
			
			dto.setGbsCode(rs.getString("GBS_CODE"));
			dto.setGbsDate(rs.getString("GBS_DATE"));
			dto.setGjCode(rs.getString("GJ_CODE"));
			dto.setGrName(rs.getString("GR_NAME"));
			dto.setGbCode(rs.getString("GB_CODE"));
			dto.setGbTitle(rs.getString("GB_TITLE"));
			dto.setGuNick(rs.getString("GU_NICK"));
			dto.setGuId(rs.getString("GU_ID"));
			
			result.add(dto);
		}
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	// 그룹 게시물 신고 내역 조회
	public ArrayList<GroupBoardDTO> redGroupBoardList(String guCode) throws SQLException
	{
		ArrayList<GroupBoardDTO> result = new ArrayList<GroupBoardDTO>();
		
		String sql = "SELECT GBR_CODE, GBR_DATE, REASON, GB_CODE, GJ_CODE, GB_CONTENT, GBRD_DATE, GR_NAME, REDSTATE"
				   + " FROM VIEW_GROUPBOARD_RED_LIST WHERE GJ_CODE"
				   + " IN (SELECT GJ.GJ_CODE FROM GUEST G JOIN GROUP_JOIN GJ ON G.GU_CODE = GJ.GU_CODE"
				   + " WHERE G.GU_CODE = ?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, guCode);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			GroupBoardDTO dto = new GroupBoardDTO();
			
			dto.setGbrCode(rs.getString("GBR_CODE"));
			dto.setGbrDate(rs.getString("GBR_DATE"));
			dto.setReason(rs.getString("REASON"));
			dto.setGbCode(rs.getString("GB_CODE"));
			dto.setGbContent(rs.getString("GB_CONTENT"));
			dto.setGbrdDate(rs.getString("GBRD_DATE"));
			dto.setGrName(rs.getString("GR_NAME"));
			dto.setRedstate(rs.getString("REDSTATE"));
			
			result.add(dto);
		}
		
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	// 그룹 댓글 신고 내역 조회
	public ArrayList<GroupBoardDTO> redGroupReplyList(String guCode) throws SQLException
	{
		ArrayList<GroupBoardDTO> result = new ArrayList<GroupBoardDTO>();
		
		String sql = "SELECT GRR_CODE, GRR_DATE, REASON, GB_CODE, GRE_CONTENT, GJ_CODE, GRRD_DATE, GR_NAME, REDSTATE"
				  + " FROM VIEW_GROUPREPLY_RED_LIST WHERE GJ_CODE"
				  + " IN (SELECT GJ.GJ_CODE FROM GUEST G JOIN GROUP_JOIN GJ ON G.GU_CODE = GJ.GU_CODE"
				  + " WHERE G.GU_CODE = ?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, guCode);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			GroupBoardDTO dto = new GroupBoardDTO();
			
			dto.setGrrCode(rs.getString("GRR_CODE"));
			dto.setGrrDate(rs.getString("GRR_DATE"));
			dto.setReason(rs.getString("REASON"));
			dto.setGbCode(rs.getString("GB_CODE"));
			dto.setGreContent(rs.getString("GRE_CONTENT"));
			dto.setGjCode(rs.getString("GJ_CODE"));
			dto.setGrrdDate(rs.getString("GRRD_DATE"));
			dto.setGrName(rs.getString("GR_NAME"));
			dto.setRedstate(rs.getString("REDSTATE"));
			
			result.add(dto);
		}
		
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	
	
	// 그룹 게시판&댓글 패널티 부여 내역 조회
	public ArrayList<GroupBoardDTO> groupBoardPenaltyList(String guCode) throws SQLException
	{
		ArrayList<GroupBoardDTO> result = new ArrayList<GroupBoardDTO>();
		
		String sql = "SELECT PGB_DATE AS START_DATE, PGB_DATE+90 AS END_DATE, REASON, GR_NAME, GB_TITLE, GU_CODE FROM VIEW_GROUP_BOARD_PENALTY WHERE GU_CODE=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, guCode);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			GroupBoardDTO dto = new GroupBoardDTO();
			
			dto.setStartDate(rs.getString("START_DATE"));
			dto.setEndDate(rs.getString("END_DATE"));
			dto.setReason(rs.getString("REASON"));
			dto.setGrName(rs.getString("GR_NAME"));
			dto.setGbTitle(rs.getString("GB_TITLE"));
			dto.setGuCode(rs.getString("GU_CODE"));
			
			result.add(dto);
		}
		rs.close();
		pstmt.close();
		
		return result;
		
	}
	
	// 그룹 활동(그룹 해체) 패널티 부여 내역 조회
	public ArrayList<GroupBoardDTO> groupBreakPenaltyList(String guCode) throws SQLException
	{
		ArrayList<GroupBoardDTO> result = new ArrayList<GroupBoardDTO>();
		
		String sql = "SELECT GR_NAME, GR_DATE AS START_DATE, GR_DATE+90 AS END_DATE, REASON, REASON_CODE, GR_CODE"
				   + " FROM VIEW_GROUP_ACTIVE_PENALTY WHERE GR_CODE IN (SELECT GR_CODE FROM GROUP_JOIN WHERE GU_CODE=?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, guCode);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			GroupBoardDTO dto = new GroupBoardDTO();
			
			dto.setGrName(rs.getString("GR_NAME"));
			dto.setStartDate(rs.getString("START_DATE"));
			dto.setEndDate(rs.getString("END_DATE"));
			dto.setReason(rs.getString("REASON"));
			dto.setReasonCode(rs.getString("REASON_CODE"));
			
			result.add(dto);
		}
		rs.close();
		pstmt.close();
		
		return result;
		
	}
	
	
}
