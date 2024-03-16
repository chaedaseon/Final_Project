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
	
	
}
