package com.study.mvc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.study.util.DBConn;

public class GroupDAO
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
		
		// 스터디그룹의 스터디카페 예약 내역 조회
		public ArrayList<GroupDTO> groupReserveList(String grCode, String searchKey, String searchValue, String fbState, String reState, int start, int end) throws SQLException
		{
			ArrayList<GroupDTO> result = new ArrayList<GroupDTO>();
			
			if (searchKey.equals("resDate"))
				searchKey = "RE_STARTDATE";
			else if (searchKey.equals("cafe"))
				searchKey = "SC_NAME";
			else if (searchKey.equals("room"))
				searchKey = "SR_NAME";

			//
			if (fbState.equals("fbAll"))
				fbState = "";
			else if (fbState.equals("done"))
				fbState = "이용완료";
			else if (fbState.equals("yet"))
				fbState = "이용예정";
			else if (fbState.equals("noshow"))
				fbState = "노쇼";
			
			//
			if (reState.equals("reAll"))
				reState = "";
			else if (reState.equals("access"))
				reState = "확정";
			else if (reState.equals("cancel"))
				reState = "취소";
			
			searchValue = "%" + searchValue + "%";	
			fbState = "%" + fbState + "%";	
			reState = "%" + reState + "%";	
	
			String sql = "SELECT RNUM, RE_CODE, RE_STARTDATE, RE_STARTHOUR, RE_ENDHOUR, RE_STATE, FB_CODE, FB_STATE, FB_STATECODE, SC_CODE, SC_NAME, SR_NAME, SR_PRICE, GU_NICK, GJ_CODE, GU_ID, GR_CODE, GR_NAME, RE_COUNT, RV_CODE";
			sql += " FROM";
			sql += "(";
			sql += "	SELECT ROWNUM RNUM, DATA.*";
			sql += "	 FROM";
			sql += "    (";
			sql += "    	SELECT RE_CODE, RE_STARTDATE, RE_STARTHOUR, RE_ENDHOUR, RE_STATE, FB_CODE, FB_STATE, FB_STATECODE, SC_CODE, SC_NAME, SR_NAME, SR_PRICE, GU_NICK, GJ_CODE, GU_ID, GR_CODE, GR_NAME, RE_COUNT, RV_CODE";
			sql += "    	 FROM VIEW_GROUPRESERVE WHERE GR_CODE = ? AND " + searchKey + " LIKE ? AND FB_STATE LIKE ? AND RE_STATE LIKE ? ORDER BY RE_STARTDATE DESC";
			sql += "    ) DATA";
			sql += ")";
			sql += " WHERE RNUM>=? AND RNUM<=?";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, grCode);
			pstmt.setString(2, searchValue);
			pstmt.setString(3, fbState);
			pstmt.setString(4, reState);
			pstmt.setInt(5, start);
			pstmt.setInt(6, end);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next())
			{
				GroupDTO dto = new GroupDTO();
				
				dto.setrNum(rs.getString("RNUM"));
				dto.setReCode(rs.getString("RE_CODE"));
				dto.setReStartDate(rs.getString("RE_STARTDATE"));
				dto.setReStartHour(rs.getString("RE_STARTHOUR"));
				dto.setReEndHour(rs.getString("RE_ENDHOUR"));
				dto.setReState(rs.getString("RE_STATE"));
				dto.setFbCode(rs.getString("FB_CODE"));
				dto.setFbState(rs.getString("FB_STATE"));
				dto.setFbStateCode(rs.getString("FB_STATECODE"));
				dto.setScCode(rs.getString("SC_CODE"));
				dto.setScName(rs.getString("SC_NAME"));
				dto.setSrName(rs.getString("SR_NAME"));
				dto.setSrPrice(rs.getString("SR_PRICE"));
				dto.setGuNick(rs.getString("GU_NICK"));
				dto.setGjCode(rs.getString("GJ_CODE"));
				dto.setGuId(rs.getString("GU_ID"));
				dto.setGrCode(rs.getString("GR_CODE"));
				dto.setGrName(rs.getString("GR_NAME"));
				dto.setReCount(rs.getInt("RE_COUNT"));
				dto.setRvCode(rs.getString("RV_CODE"));
				
				result.add(dto);
			}
			
			pstmt.close();
			rs.close();
			
			return result;
		}
		
		// 스터디그룹의 스터디카페 예약 내역 수 조회
		public int groupReserveCount(String grCode, String searchKey, String searchValue, String fbState, String reState) throws SQLException
		{
			int result = 0;
			
			if (searchKey.equals("resDate"))
				searchKey = "RE_STARTDATE";
			else if (searchKey.equals("cafe"))
				searchKey = "SC_NAME";
			else if (searchKey.equals("room"))
				searchKey = "SR_NAME";

			//
			if (fbState.equals("fbAll"))
				fbState = "";
			else if (fbState.equals("done"))
				fbState = "이용완료";
			else if (fbState.equals("yet"))
				fbState = "이용예정";
			else if (fbState.equals("noshow"))
				fbState = "노쇼";
			
			//
			if (reState.equals("reAll"))
				reState = "";
			else if (reState.equals("access"))
				reState = "확정";
			else if (reState.equals("cancel"))
				reState = "취소";
			
			searchValue = "%" + searchValue + "%";	
			fbState = "%" + fbState + "%";	
			reState = "%" + reState + "%";
			
			String sql = "SELECT COUNT(*) AS COUNT FROM VIEW_GROUPRESERVE"
					+ " WHERE GR_CODE = ? AND " + searchKey + " LIKE ? AND FB_STATE LIKE ? AND RE_STATE LIKE ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, grCode);
			pstmt.setString(2, searchValue);
			pstmt.setString(3, fbState);
			pstmt.setString(4, reState);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next())
			{
				result = rs.getInt("COUNT");
			}
			
			rs.close();
			pstmt.close();
			
			return result;
		}
		
		// 스터디그룹 패널티 내역 조회
		public ArrayList<GroupDTO> groupPenalList(String grCode, String searchKey, String searchValue, String pgState, int start, int end) throws SQLException
		{
			ArrayList<GroupDTO> result = new ArrayList<GroupDTO>();
			
			if (searchKey.equals("pgDate"))
				searchKey = "PG_STARTDATE";
			else if (searchKey.equals("reason"))
				searchKey = "REASON";

			//
			if (pgState.equals("pgAll"))
				pgState = "";
			else if (pgState.equals("yet"))
				pgState = "유효";
			else if (pgState.equals("done"))
				pgState = "무효";
			
			searchValue = "%" + searchValue + "%";	
			pgState = "%" + pgState + "%";
			
			String sql = "SELECT RNUM, SC_NAME, GR_NAME, HRD_CODE, PG_CODE, HRD_DATE, PG_STARTDATE, PG_ENDDATE, PG_STATE, REASON, FB_CODE";
			sql += " FROM";
			sql += "(";
			sql += "	SELECT ROWNUM RNUM, DATA.*";
			sql += "	 FROM";
			sql += "    (";
			sql += "    	SELECT SC_NAME, GR_NAME, HRD_CODE, PG_CODE, HRD_DATE, PG_STARTDATE, PG_ENDDATE, PG_STATE, REASON, FB_CODE";
			sql += "    	 FROM VIEW_GROUPPENALTY WHERE GR_CODE = ? AND " + searchKey + " LIKE ? AND PG_STATE LIKE ? ORDER BY PG_STARTDATE DESC";
			sql += "    ) DATA";
			sql += ")";
			sql += " WHERE RNUM>=? AND RNUM<=?";
			
			PreparedStatement pstmt = conn.prepareStatement(sql); 
			pstmt.setString(1, grCode);
			pstmt.setString(2, searchValue);
			pstmt.setString(3, pgState);
			pstmt.setInt(4, start);
			pstmt.setInt(5, end);
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next())
			{
				GroupDTO dto = new GroupDTO();
				
				dto.setrNum(rs.getString("RNUM"));
				dto.setScName(rs.getString("SC_NAME"));
				dto.setGrName(rs.getString("GR_NAME"));
				dto.setHrdCode(rs.getString("HRD_CODE"));
				dto.setPgCode(rs.getString("PG_CODE"));
				dto.setHrdDate(rs.getString("HRD_DATE"));
				dto.setPgStartDate(rs.getString("PG_STARTDATE"));
				dto.setPgEndDate(rs.getString("PG_ENDDATE"));
				dto.setPgState(rs.getString("PG_STATE"));
				dto.setReason(rs.getString("REASON"));
				dto.setFbCode(rs.getString("FB_CODE"));
				
				result.add(dto);
			}
			
			rs.close();
			pstmt.close();
			
			return result;
		}
		
		// 스터디그룹의 스터디카페 예약 내역 수 조회
		public int groupPenalCount(String grCode, String searchKey, String searchValue, String pgState) throws SQLException
		{
			int result = 0;
			
			if (searchKey.equals("pgDate"))
				searchKey = "PG_STARTDATE";
			else if (searchKey.equals("reason"))
				searchKey = "REASON";

			//
			if (pgState.equals("pgAll"))
				pgState = "";
			else if (pgState.equals("yet"))
				pgState = "유효";
			else if (pgState.equals("done"))
				pgState = "무효";
			
			searchValue = "%" + searchValue + "%";	
			pgState = "%" + pgState + "%";
			
			String sql = "SELECT COUNT(*) AS COUNT FROM VIEW_GROUPPENALTY"
					+ " WHERE GR_CODE = ? AND " + searchKey + " LIKE ? AND PG_STATE LIKE ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, grCode);
			pstmt.setString(2, searchValue);
			pstmt.setString(3, pgState);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				result = rs.getInt("COUNT");
			}
			
			rs.close();
			pstmt.close();
			
			return result;
		}
		
		// 스터디그룹 모임내역 조회
		public ArrayList<GroupDTO> groupMeetList(String grCode, String searchKey, String searchValue, String searchDate, int start, int end) throws SQLException
		{
			ArrayList<GroupDTO> result = new ArrayList<GroupDTO>();
			
			if (searchKey.equals("attDate"))
				searchKey = "GSCH_DATE";
			else if (searchKey.equals("writer"))
				searchKey = "GU_NAME";
			else if (searchKey.equals("name"))
				searchKey = "GSCH_NAME";
			
			if (searchDate.equals("regDate"))
				searchDate = "GSCH_REGDATE";
			else if (searchDate.equals("nearDate"))
				searchDate = "GSCH_DATE";

			searchValue = "%" + searchValue + "%";	
			
			String sql = "SELECT RNUM, GSCH_CODE, GSCH_DATE, GSCH_NAME, GSCH_CONTENT, GSCH_LOCATION, GSCH_STARTHOUR, GSCH_ENDHOUR, GJ_CODE, GU_CODE, GU_ID, GU_NAME, ATT_STATE, GSCH_REGDATE";
			sql += " FROM";
			sql += "(";
			sql += "	SELECT ROWNUM RNUM, DATA.*";
			sql += "	 FROM";
			sql += "    (";
			sql += "    	SELECT GSCH_CODE, GSCH_DATE, GSCH_NAME, GSCH_CONTENT, GSCH_LOCATION, GSCH_STARTHOUR, GSCH_ENDHOUR, GJ_CODE, GU_CODE, GU_ID, GU_NAME, ATT_STATE, GSCH_REGDATE";
			sql += "    	 FROM VIEW_GROUPSCH WHERE GR_CODE = ? AND " + searchKey +" LIKE ? AND ATT_STATE = '무' ORDER BY " + searchDate + " DESC";
			sql += "    ) DATA";
			sql += ")";
			sql += " WHERE RNUM>=? AND RNUM<=?";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, grCode);
			pstmt.setString(2, searchValue);
			pstmt.setInt(3, start);
			pstmt.setInt(4, end);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next())
			{
				GroupDTO dto = new GroupDTO();
				dto.setrNum(rs.getString("RNUM"));
				dto.setGschCode(rs.getString("GSCH_CODE"));
				dto.setGschDate(rs.getString("GSCH_DATE"));
				dto.setGschName(rs.getString("GSCH_NAME"));
				dto.setGschContent(rs.getString("GSCH_CONTENT"));
				dto.setGschLocation(rs.getString("GSCH_LOCATION"));
				dto.setGschStartHour(rs.getString("GSCH_STARTHOUR"));
				dto.setGschEndHour(rs.getString("GSCH_ENDHOUR"));
				dto.setGjCode(rs.getString("GJ_CODE"));
				dto.setGuCode(rs.getString("GU_CODE"));
				dto.setGuId(rs.getString("GU_ID"));
				dto.setGuName(rs.getString("GU_NAME"));
				dto.setAttState(rs.getString("ATT_STATE"));
				
				result.add(dto);
			}
			
			rs.close();
			pstmt.close();
			
			return result;
		}
		
		// 스터디그룹 모임내역 개수 조회
		public int groupMeetCount(String grCode, String searchKey, String searchValue) throws SQLException
		{
			int result = 0;
			
			if (searchKey.equals("attDate"))
				searchKey = "GSCH_DATE";
			else if (searchKey.equals("writer"))
				searchKey = "GU_NAME";
			else if (searchKey.equals("name"))
				searchKey = "GSCH_NAME";
			
			searchValue = "%" + searchValue + "%";	
			
			String sql = "SELECT COUNT(*) AS COUNT FROM VIEW_GROUPSCH"
					+ " WHERE GR_CODE = ? AND " + searchKey + " LIKE ? AND ATT_STATE = '무'";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, grCode);
			pstmt.setString(2, searchValue);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next())
			{
				result = rs.getInt("COUNT");
			}
			
			rs.close();
			pstmt.close();
			
			return result;
		}
		
		// 스터디카페 리뷰 작성
		public int reviewAdd(String fbCode, String rvContent) throws SQLException
		{
			int result = 0;
			
			String sql = "INSERT INTO REVIEW(RV_CODE, RV_CONTENT, FB_CODE) VALUES(TO_CHAR(REVIEW_SEQ.NEXTVAL), ?, ?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rvContent);
			pstmt.setString(2, fbCode);
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
			return result;
		}
		
		// 스터디카페 예약 취소
		public int reserveRemove(String reCode) throws SQLException
		{
			int result = 0;
			
			String sql = "DELETE FROM RESERVATION WHERE RE_CODE = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, reCode);
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
			return result;
		}
		
		
		// 스터디카페 예약
	      public int roomReserveAdd(GroupDTO dto) throws SQLException
	      {
	         int result = 0;
	         
	         String sql= "INSERT INTO RESERVATION(RE_CODE, RE_STARTDATE, RE_STARTHOUR, RE_ENDHOUR, RE_COUNT, RE_DATE, SR_CODE, GJ_CODE)"
	               + " VALUES(TO_CHAR(RESERVATION_SEQ.NEXTVAL), ?, ?, ?, ?, SYSDATE, ?, ?)";
	         PreparedStatement pstmt = conn.prepareStatement(sql);
	         
	         pstmt.setString(1, dto.getReStartDate());
	         pstmt.setString(2, dto.getReStartHour());
	         pstmt.setString(3, dto.getReEndHour());
	         pstmt.setInt(4, dto.getReCount());
	         pstmt.setString(5, dto.getSrCode());
	         pstmt.setString(6, dto.getGjCode());
	         
	         result = pstmt.executeUpdate();
	         
	         pstmt.close();
	         
	         return result;
	      }
	      
	      // 모임내역 정보 불러오기
	      public GroupDTO meetInfo(String gschCode) throws SQLException
	      {
	         GroupDTO result = new GroupDTO();
	         
	         String sql = "SELECT GSCH_CODE, GSCH_DATE, GSCH_NAME, GSCH_CONTENT, GSCH_LOCATION, GSCH_STARTHOUR, GSCH_ENDHOUR, GJ_CODE , GU_ID, GU_NAME, MEET_STATE"
	               + " FROM VIEW_GROUPSCH WHERE GSCH_CODE = ?";
	         PreparedStatement pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, gschCode);
	         ResultSet rs = pstmt.executeQuery();
	         while (rs.next())
	         {
	            result.setGschCode(rs.getString("GSCH_CODE"));
	            result.setGschDate(rs.getString("GSCH_DATE"));
	            result.setGschName(rs.getString("GSCH_NAME"));
	            result.setGschContent(rs.getString("GSCH_CONTENT"));
	            result.setGschLocation(rs.getString("GSCH_LOCATION"));
	            result.setGschStartHour(rs.getString("GSCH_STARTHOUR"));
	            result.setGschEndHour(rs.getString("GSCH_ENDHOUR"));
	            result.setGjCode(rs.getString("GJ_CODE"));
	            result.setGuName(rs.getString("GU_NAME"));
	            result.setGuId(rs.getString("GU_ID"));
	            result.setMeetState(rs.getString("MEET_STATE"));
	            
	         }
	         
	         rs.close();
	         pstmt.close();
	         return result;
	      }
	      
	      // 모임에 대한 불참자 조회
	      public ArrayList<GroupDTO> meetMemberList(String gschCode) throws SQLException
	      {
	         ArrayList<GroupDTO> result = new ArrayList<GroupDTO>();
	         
	         String sql = "SELECT MEMBER, MEMBERCODE, ATTL_CODE FROM VIEW_ATT WHERE GSCH_CODE = ? AND UAT_STATE = '불참자'";
	         PreparedStatement pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, gschCode);
	         ResultSet rs = pstmt.executeQuery();
	         while(rs.next())
	         {
	            GroupDTO dto = new GroupDTO();
	            
	            dto.setMember(rs.getString("MEMBER"));
	            dto.setMembercode(rs.getString("MEMBERCODE"));
	            dto.setAttlCode(rs.getString("ATTL_CODE"));
	            
	            result.add(dto);
	         }
	         
	         rs.close();
	         pstmt.close();
	         return result;
	      }
	      
	      // 모임에 대한 참석자 조회
	      public ArrayList<GroupDTO> unattMemberList(String gschCode) throws SQLException
	      {
	         ArrayList<GroupDTO> result = new ArrayList<GroupDTO>();
	         
	         String sql = "SELECT MEMBER, MEMBERCODE, ATTL_CODE FROM VIEW_ATT WHERE GSCH_CODE = ? AND UAT_STATE = '참석자'";
	         PreparedStatement pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, gschCode);
	         ResultSet rs = pstmt.executeQuery();
	         while(rs.next())
	         {
	            GroupDTO dto = new GroupDTO();
	            
	            dto.setMember(rs.getString("MEMBER"));
	            dto.setMembercode(rs.getString("MEMBERCODE"));
	            dto.setAttlCode(rs.getString("ATTL_CODE"));
	            
	            result.add(dto);
	         }
	         
	         rs.close();
	         pstmt.close();
	         return result;
	      }
	      
	      // 불참자 등록
	      public int unattMemberAdd(String attlCode) throws SQLException
	      {
	         int result = 0;
	         
	         String sql = "INSERT INTO UNATTENDANCE(UNATT_CODE, ATTL_CODE) VALUES(TO_CHAR(UNATTENDANCE_SEQ.NEXTVAL), ?)";
	         PreparedStatement pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, attlCode);
	         
	         result = pstmt.executeUpdate();
	         
	         pstmt.close();
	         
	         return result;
	      }
	      
	      // 모임기록 등록
	      public int meetAdd(String gschCode, String meetDetail) throws SQLException
	      {
	         int result = 0;
	         
	         String sql = "INSERT INTO GROUP_MEETLIST(GM_CODE, GM_CONTENT, GSCH_CODE) VALUES(TO_CHAR(GROUP_MEETLIST_SEQ.NEXTVAL), ?, ?)";
	         PreparedStatement pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, meetDetail);
	         pstmt.setString(2, gschCode);
	         
	         result = pstmt.executeUpdate();
	         
	         pstmt.close();
	         
	         return result;
	      }
	      
	      // 모임 기록
	      public String meetRecord(String gschCode) throws SQLException
	      {
	         String result = "";
	         
	         String sql = "SELECT GM_CONTENT FROM GROUP_MEETLIST WHERE GSCH_CODE = ?";
	         PreparedStatement pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, gschCode);
	         ResultSet rs = pstmt.executeQuery();
	         while(rs.next())
	         {
	            result = rs.getString("GM_CONTENT");
	         }
	         
	         rs.close();
	         pstmt.close();
	         
	         return result;
	      }
		
}
