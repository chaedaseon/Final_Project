package com.study.mvc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.study.mybatis.model.BoardStudyGroupDTO;
import com.study.mybatis.model.CommunityBoardDTO;
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
			
			String sql = "SELECT SC_CODE, SC_ADDR1, SC_ADDR2, SC_NAME FROM STUDYCAFE WHERE SC_CODE IN (SELECT SC_CODE FROM VIEW_TOP3CAFE)";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next())
			{
				CafeDTO dto = new CafeDTO();
				dto.setScCode(rs.getString("SC_CODE"));
				dto.setScName(rs.getString("SC_NAME"));
				dto.setScAddr1(rs.getString("SC_ADDR1"));
				dto.setScAddr2(rs.getString("SC_ADDR2"));
				
				result.add(dto);
			}
			
			rs.close();
			pstmt.close();
			
			return result;
		}
		
		// 개설중인 그룹 최신순 조회
		public ArrayList<BoardStudyGroupDTO> latestStudyGroupList() throws SQLException
		{
			ArrayList<BoardStudyGroupDTO> result = new ArrayList<BoardStudyGroupDTO>();
			
			String sql = "SELECT X.NO,X.GRCODE, X.GUCODE, X.GRDATE,X.GACODE, X.PERIODCODE";
			sql += ", X.GRLEADER, X.GRNAME, X.GRCOUNT, X.GRSUBJECT, X.GRCOMMENT, X.AGE, X.GENDER, X.LSCODE, X.CATEGORY, X.GROPEN";
			sql += ", (TRUNC(X.GRDATE + 7) - TRUNC(SYSDATE)) AS DDAY, X.GPPW, TO_CHAR(X.GRDATE+7,'YYYY-MM-DD') AS ENDDATE";
			sql += ", NVL((SELECT COUNT(*) FROM GROUP_JOIN WHERE GR_CODE = X.GRCODE),0) AS GJCOUNT";
			sql += " FROM(SELECT ROWNUM, ROW_NUMBER() OVER(ORDER BY ROWNUM) AS NO,T.GACODE, T.PERIODCODE";
			sql += ", T.GRCODE, T.GUCODE, T.GRLEADER, T.GRDATE, T.GRNAME, T.GRCOUNT, T.GRSUBJECT, T.GRCOMMENT, T.AGE, T.GENDER, T.LSCODE, T.CATEGORY, T.GROPEN, T.GPPW";
			sql += " FROM(SELECT GACODE, PERIODCODE, GRCODE, GUCODE, GRLEADER, GRDATE, GRNAME, GRCOUNT, GRSUBJECT, GRCOMMENT, AGE, GENDER, LSCODE, CATEGORY, GROPEN, GPPW";
			sql += " FROM GR_ALL_VIEW ORDER BY TO_NUMBER(GRCODE))T";
			sql += " WHERE (SELECT COUNT(*) FROM GR_ALL_VIEW) >= ROWNUM ORDER BY ROWNUM DESC)X";
			sql += " WHERE X.NO >= (SELECT COUNT(*)- 7 FROM GR_ALL_VIEW)";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			ResultSet rs = pstmt.executeQuery();
					
			
			while(rs.next())
			{
				BoardStudyGroupDTO dto = new BoardStudyGroupDTO();
				
				dto.setNo(rs.getInt("NO"));
				dto.setGrCode(rs.getString("GRCODE"));
				dto.setGrDate(rs.getString("GRDATE"));
				dto.setGaCode(rs.getString("GACODE"));
				dto.setPeriodCode(rs.getString("PERIODCODE"));
				dto.setGrLeader(rs.getString("GRLEADER"));
				dto.setGrName(rs.getString("GRNAME"));
				dto.setGrCount(rs.getInt("GRCOUNT"));
				dto.setGrSubject(rs.getString("GRSUBJECT"));
				dto.setGrComment(rs.getString("GRCOMMENT"));
				dto.setAge(rs.getString("AGE"));
				dto.setGender(rs.getString("GENDER"));
				dto.setLsCode(rs.getString("LSCODE"));
				dto.setCategory(rs.getString("CATEGORY"));
				dto.setGrOpen(rs.getString("GROPEN"));
				dto.setdDay(rs.getInt("DDAY"));
				dto.setGpPw(rs.getInt("GPPW"));
				dto.setEndDate(rs.getString("ENDDATE"));
				dto.setGjCount(rs.getInt("GJCOUNT"));
				result.add(dto);
			}
			
			pstmt.close();
			rs.close();
			
			return result;
		}
		
		// 게시글 인기순 조회
		public ArrayList<CommunityBoardDTO> popBoardList() throws SQLException
		{
			ArrayList<CommunityBoardDTO> result = new ArrayList<CommunityBoardDTO>();
			
			String sql = "SELECT X.NO, X.BOCODE, X.BODATE, X.BOTITLE, X.BOCONTENT, X.BOVIEW, X.BOMODATE, X.BOFILE, X.BSCODE, X.BOWRITER, X.REPLYCOUNT, X.SCRAPCOUNT";
			sql += " FROM(SELECT ROWNUM, ROW_NUMBER() OVER(ORDER BY ROWNUM) AS NO,T.BOCODE,T.BODATE,T.BOTITLE";
			sql += ",T.BOCONTENT,T.BOVIEW,T.BOMODATE,T.BOFILE,T.BSCODE,T.BOWRITER,T.REPLYCOUNT, T.SCRAPCOUNT";
			sql += " FROM(SELECT B.BO_CODE AS BOCODE, TO_CHAR(B.BO_DATE) AS BODATE, B.BO_TITLE AS BOTITLE";
			sql += " , B.BO_CONTENT AS BOCONTENT, B.BO_VIEW AS BOVIEW";
			sql += " , TO_CHAR(B.BO_MODATE, 'YYYY-MM-DD') AS BOMODATE, B.BO_FILE AS BOFILE, B.BS_CODE AS BSCODE";
			sql += " , (SELECT GU_NICK FROM GUEST WHERE GU_CODE = B.GU_CODE)";
			sql += "  AS BOWRITER";
			sql += ", NVL((SELECT COUNT(*) FROM(SELECT RP_CODE, BO_CODE";
			sql += " FROM REPLY UNION ALL SELECT RR.RP_CODE, RP.BO_CODE FROM REPLY RP";
			sql += " RIGHT JOIN re_reply RR ON RP.RP_CODE = RR.RP_CODE)";
			sql += " WHERE BO_CODE = B.BO_CODE),0) AS REPLYCOUNT";
			sql += " , NVL((SELECT COUNT(*) FROM SCRAP WHERE BO_CODE = B.BO_CODE),0) AS SCRAPCOUNT";
			sql += " FROM BOARD B LEFT JOIN SCRAP S ON B.BO_CODE = S.BO_CODE";
			sql += " ORDER BY SCRAPCOUNT)T";
			sql += " WHERE (SELECT COUNT(*) FROM BOARD) >= ROWNUM ORDER BY ROWNUM DESC)X";
			sql += " WHERE X.NO >= (SELECT COUNT(*) - 3 FROM BOARD)";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			ResultSet rs = pstmt.executeQuery();
			
			
			while(rs.next())
			{
				CommunityBoardDTO dto = new CommunityBoardDTO();
				
				dto.setNo(rs.getInt("NO"));
				dto.setBoCode(rs.getString("BOCODE"));
				dto.setBoDate(rs.getString("BODATE"));
				dto.setBoTitle(rs.getString("BOTITLE"));
				dto.setBoMoDate(rs.getString("BOMODATE"));
				dto.setBsCode(rs.getString("BSCODE"));
				dto.setBoWriter(rs.getString("BOWRITER"));
				dto.setReplyCount(rs.getInt("REPLYCOUNT"));
				dto.setScrapCount(rs.getInt("SCRAPCOUNT"));
				dto.setBoContent(rs.getString("BOCONTENT"));
				result.add(dto);
			}
			
			pstmt.close();
			rs.close();
			
			return result;
		}
		
		// 게시글 최신순 조회
		public ArrayList<CommunityBoardDTO> latestBoardList() throws SQLException
		{
			ArrayList<CommunityBoardDTO> result = new ArrayList<CommunityBoardDTO>();
			
			String sql = "SELECT X.NO, X.BOCODE, X.BODATE, X.BOTITLE, X.BOCONTENT, X.BOVIEW, X.BOMODATE, X.BOFILE, X.BSCODE, X.BOWRITER, X.REPLYCOUNT, X.SCRAPCOUNT";
			sql += " FROM(SELECT ROWNUM, ROW_NUMBER() OVER(ORDER BY ROWNUM) AS NO,T.BOCODE,T.BODATE,T.BOTITLE";
			sql += ",T.BOCONTENT,T.BOVIEW,T.BOMODATE,T.BOFILE,T.BSCODE,T.BOWRITER,T.REPLYCOUNT, T.SCRAPCOUNT";
			sql += " FROM(SELECT B.BO_CODE AS BOCODE, TO_CHAR(B.BO_DATE) AS BODATE, B.BO_TITLE AS BOTITLE";
			sql += " , B.BO_CONTENT AS BOCONTENT, B.BO_VIEW AS BOVIEW";
			sql += " , TO_CHAR(B.BO_MODATE, 'YYYY-MM-DD') AS BOMODATE, B.BO_FILE AS BOFILE, B.BS_CODE AS BSCODE";
			sql += " , (SELECT GU_NICK FROM GUEST WHERE GU_CODE = B.GU_CODE)";
			sql += "  AS BOWRITER";
			sql += ", NVL((SELECT COUNT(*) FROM(SELECT RP_CODE, BO_CODE";
			sql += " FROM REPLY UNION ALL SELECT RR.RP_CODE, RP.BO_CODE FROM REPLY RP";
			sql += " RIGHT JOIN re_reply RR ON RP.RP_CODE = RR.RP_CODE)";
			sql += " WHERE BO_CODE = B.BO_CODE),0) AS REPLYCOUNT";
			sql += " , NVL((SELECT COUNT(*) FROM SCRAP WHERE BO_CODE = B.BO_CODE),0) AS SCRAPCOUNT";
			sql += " FROM BOARD B LEFT JOIN SCRAP S ON B.BO_CODE = S.BO_CODE";
			sql += " ORDER BY BOMODATE)T";
			sql += " WHERE (SELECT COUNT(*) FROM BOARD) >= ROWNUM ORDER BY ROWNUM DESC)X";
			sql += " WHERE X.NO >= (SELECT COUNT(*) - 3 FROM BOARD)";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			ResultSet rs = pstmt.executeQuery();
			
			
			while(rs.next())
			{
				CommunityBoardDTO dto = new CommunityBoardDTO();
				
				dto.setNo(rs.getInt("NO"));
				dto.setBoCode(rs.getString("BOCODE"));
				dto.setBoDate(rs.getString("BODATE"));
				dto.setBoTitle(rs.getString("BOTITLE"));
				dto.setBoMoDate(rs.getString("BOMODATE"));
				dto.setBsCode(rs.getString("BSCODE"));
				dto.setBoWriter(rs.getString("BOWRITER"));
				dto.setReplyCount(rs.getInt("REPLYCOUNT"));
				dto.setScrapCount(rs.getInt("SCRAPCOUNT"));
				dto.setBoContent(rs.getString("BOCONTENT"));
				result.add(dto);
			}
			
			pstmt.close();
			rs.close();
			
			return result;
		}
		
}
