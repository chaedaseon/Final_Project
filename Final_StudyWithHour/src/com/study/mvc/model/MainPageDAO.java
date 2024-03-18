package com.study.mvc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.study.mybatis.model.NoticeBoardDTO;
import com.study.util.DBConn;

public class MainPageDAO
{
	private Connection conn;
		
		// 데이터베이스 연결
		public Connection connection() throws ClassNotFoundException, SQLException
		{
			conn = DBConn.getConnection();
			return conn;
		}
		
		// 데이터베이스 연결 종료
		public void close() throws SQLException
		{
			DBConn.close();
		}
		
		// 공지사항 최신순 조회
		public ArrayList<NoticeBoardDTO> latestNoticeList() throws SQLException
		{
			ArrayList<NoticeBoardDTO> result = new ArrayList<NoticeBoardDTO>();
			
			String sql = "SELECT NTCODE,  NTTITLE, NTDATE";
			sql += " FROM";
			sql += " (";
			sql += "    	SELECT NT_CODE AS NTCODE, NT_TITLE AS NTTITLE, TO_CHAR(NT_DATE, 'YYYY-MM-DD') AS NTDATE";
			sql += "    	 FROM NOTICE";
			sql += "    	 ORDER BY TO_NUMBER(NT_CODE) DESC";
			sql += " )";
			sql += " WHERE ROWNUM BETWEEN 1 AND 5";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			ResultSet rs = pstmt.executeQuery();
					
			
			while(rs.next())
			{
				NoticeBoardDTO dto = new NoticeBoardDTO();
				System.out.println(rs.getString("NTCODE"));
				
				dto.setNtCode(rs.getString("NTCODE"));
				dto.setNtTitle(rs.getString("NTTITLE"));
				dto.setNtDate(rs.getString("NTDATE"));
				result.add(dto);
			}
			
			pstmt.close();
			rs.close();
			
			return result;
		}
		
	
		
}
