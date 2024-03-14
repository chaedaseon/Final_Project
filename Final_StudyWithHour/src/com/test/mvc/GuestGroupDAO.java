package com.test.mvc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class GuestGroupDAO
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
	
	// 스터디그룹 가입 내역 조회
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
			dto.setGuNick(rs.getString("GU_NICK"));
			dto.setGuId(rs.getString("GU_ID"));
			
			result.add(dto);
		}
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	
	

	
}
