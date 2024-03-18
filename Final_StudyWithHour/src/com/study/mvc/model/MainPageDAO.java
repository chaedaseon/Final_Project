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
		
		// 최신 등록된 스터디카페 조회
		public CafeDTO searchNewCafe() throws SQLException
		{
			CafeDTO result = new CafeDTO();
			
			String sql = "SELECT SC_CODE, SC_NAME, SC_ADDR1, SC_ADDR2, SC_TEL, SC_OPENHOUR, SC_CLOSEHOUR, SC_CONVENIENT"
					+ " FROM STUDYCAFE WHERE SC_DATE IN (SELECT MAX(SC_DATE) FROM STUDYCAFE)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next())
			{
				result.setScCode(rs.getString("SC_CODE"));
				result.setScName(rs.getString("SC_NAME"));
				result.setScAddr1(rs.getString("SC_ADDR1"));
				result.setScAddr2(rs.getString("SC_ADDR2"));
				result.setScTel(rs.getString("SC_TEL"));
				result.setScOpenHour(rs.getString("SC_OPENHOUR"));
				result.setScCloseHour(rs.getString("SC_CLOSEHOUR"));
				result.setScConvenient(rs.getString("SC_CONVENIENT"));
			}
			
			rs.close();
			pstmt.close();
			
			return result;
		}
		
		// 예약 많은 스터디카페 1~3위 조회
		public ArrayList<CafeDTO> reserveTopCafe() throws SQLException
		{
			ArrayList<CafeDTO> result = new ArrayList<CafeDTO>();
			
			String sql = "SELECT SC_CODE, SC_ADDR1, SC_ADDR2 FROM"
					+ " (SELECT SC_CODE, COUNT(RE_CODE) AS COUNT FROM VIEW_RESERVE GROUP BY SC_CODE ORDER BY COUNT DESC)"
					+ " WHERE ROWNUM <= 3";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next())
			{
				CafeDTO dto = new CafeDTO();
				dto.setScCode(rs.getString("SC_CODE"));
				dto.setScAddr1(rs.getString("SC_ADDR1"));
				dto.setScAddr2(rs.getString("SC_ADDR2"));
				
				result.add(dto);
			}
			
			rs.close();
			pstmt.close();
			
			return result;
		}
		
	
		
}
