/*==================
	CafeDAO.java
==================*/

package com.study.mvc.model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.study.util.DBConn;

public class CafeDAO
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
	
	
	// 전체 스터디카페내역 출력 메소드
	public ArrayList<CafeDTO> lists() throws SQLException, ClassNotFoundException
	{
		ArrayList<CafeDTO> result = new ArrayList<CafeDTO>();
		
		String sql = "SELECT ROWNUM RNUM, SC_CODE, SC_NAME, SC_ADDR1, SC_ADDR2, SC_TEL, SC_OPENHOUR, SC_CLOSEHOUR, SC_CONVENIENT, SC_SURROUND, SC_CAUTION, SC_DETAIL, SC_RESNUMBER, SC_DATE, SC_FILE, HO_CODE, AD_PERDATE, AD_CODE, AD_CHCODE";
		sql += " FROM STUDYCAFE WHERE SC_CODE NOT IN (SELECT SC_CODE FROM CAFEUNREG)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next())
		{
			CafeDTO dto = new CafeDTO();
			
			dto.setrNum(rs.getString("RNUM"));
			dto.setScCode(rs.getString("SC_CODE"));
			dto.setScName(rs.getString("SC_NAME"));
			dto.setScAddr1(rs.getString("SC_ADDR1"));
			dto.setScAddr2(rs.getString("SC_ADDR2"));
			dto.setScTel(rs.getString("SC_TEL"));
			dto.setScOpenHour(rs.getString("SC_OPENHOUR"));
			dto.setScCloseHour(rs.getString("SC_CLOSEHOUR"));
			dto.setScConvenient(rs.getString("SC_CONVENIENT"));
			dto.setScSurround(rs.getString("SC_SURROUND"));
			dto.setScCaution(rs.getString("SC_CAUTION"));
			dto.setScDetail(rs.getString("SC_DETAIL"));
			dto.setScResnumber(rs.getString("SC_RESNUMBER"));
			dto.setScDate(rs.getString("SC_DATE"));
			dto.setScFile(rs.getString("SC_FILE"));
			dto.setHoCode(rs.getString("HO_CODE"));
			dto.setAdPerDate(rs.getString("AD_PERDATE"));
			dto.setAdCode(rs.getString("AD_CODE"));
			dto.setAdChCode(rs.getString("AD_CHCODE"));
			
			result.add(dto);
		}
		
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	// 전체 스터디카페내역(검색기능 포함) 출력 메소드
	public ArrayList<CafeDTO> searchLists(String reserveDate, String reserveAddr1, String reserveAddr2, String reserveHour1, String reserveHour2, String reserveCount) throws SQLException, ClassNotFoundException
	{
		ArrayList<CafeDTO> result = new ArrayList<CafeDTO>();
		
		// 페이지가 처음 요청될 때
		if(reserveDate==null || reserveAddr1==null || reserveAddr2==null || reserveHour1==null || reserveHour2==null || reserveCount==null)
		{		
			reserveDate = "%%";
			reserveHour1 = "%%";
			reserveHour2 = "%%";
			
			String sql = "SELECT SC_NAME, SC_CODE, SC_ADDR1, SC_ADDR2, SC_OPENHOUR, SC_CLOSEHOUR, SR_CODE, SR_NAME, SR_COUNT, SR_PRICE"
					+ " FROM VIEW_CAFEROOM"
					+ " WHERE SC_CODE NOT IN (SELECT SC_CODE FROM VIEW_RESERVE WHERE RE_STARTDATE = TO_DATE(?,'YYYY-MM-DD')"
					+ " AND (? BETWEEN RE_STARTHOUR AND RE_ENDHOUR) AND (? BETWEEN RE_STARTHOUR AND RE_ENDHOUR))"
					+ " AND SR_CODE NOT IN (SELECT SR_CODE FROM ROOMUNREG)";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, reserveDate);
			pstmt.setString(2, reserveHour1);
			pstmt.setString(3, reserveHour2);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next())
			{
				CafeDTO dto = new CafeDTO();
				
				dto.setScCode(rs.getString("SC_CODE"));
				dto.setScName(rs.getString("SC_NAME"));
				dto.setScAddr1(rs.getString("SC_ADDR1"));
				dto.setScAddr2(rs.getString("SC_ADDR2"));
				dto.setScOpenHour(rs.getString("SC_OPENHOUR"));
				dto.setScCloseHour(rs.getString("SC_CLOSEHOUR"));
				dto.setSrCode(rs.getString("SR_CODE"));
				dto.setSrName(rs.getString("SR_NAME"));
				dto.setSrPrice(rs.getInt("SR_PRICE"));
				dto.setSrCount(rs.getInt("SR_COUNT"));
				
				result.add(dto);
			}
			
			rs.close();
			pstmt.close();

		}
		else
		{
			reserveHour1 = "%" + reserveHour1 + "%";
			reserveHour2 = "%" + reserveHour2 + "%";
			reserveAddr1 = "%" + reserveAddr1 + "%";
			reserveAddr2 = "%" + reserveAddr2 + "%";
			
			String sql = "SELECT SC_NAME, SC_CODE, SC_ADDR1, SC_ADDR2, SC_OPENHOUR, SC_CLOSEHOUR, SR_CODE, SR_NAME, SR_COUNT, SR_PRICE"
					  + " FROM VIEW_CAFEROOM"
					  + " WHERE SR_COUNT = ? AND SC_ADDR1 LIKE ? AND SC_ADDR1 LIKE ?"
					  + " AND SC_CODE NOT IN (SELECT SC_CODE FROM VIEW_RESERVE WHERE RE_STARTDATE = TO_DATE(?,'YYYY-MM-DD')"
					  + " AND (? BETWEEN RE_STARTHOUR AND RE_ENDHOUR) AND (? BETWEEN RE_STARTHOUR AND RE_ENDHOUR))"
					  + " AND SR_CODE NOT IN (SELECT SR_CODE FROM ROOMUNREG)";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(reserveCount));
			pstmt.setString(2, reserveAddr1);
			pstmt.setString(3, reserveAddr2);
			pstmt.setString(4, reserveDate);
			pstmt.setString(5, reserveHour1);
			pstmt.setString(6, reserveHour2);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next())
			{
				CafeDTO dto = new CafeDTO();
				
				dto.setScCode(rs.getString("SC_CODE"));
				dto.setScName(rs.getString("SC_NAME"));
				dto.setScAddr1(rs.getString("SC_ADDR1"));
				dto.setScAddr2(rs.getString("SC_ADDR2"));
				dto.setScOpenHour(rs.getString("SC_OPENHOUR"));
				dto.setScCloseHour(rs.getString("SC_CLOSEHOUR"));
				dto.setSrCode(rs.getString("SR_CODE"));
				dto.setSrName(rs.getString("SR_NAME"));
				dto.setSrPrice(rs.getInt("SR_PRICE"));
				dto.setSrCount(rs.getInt("SR_COUNT"));
				
				result.add(dto);
			}
			
			rs.close();
			pstmt.close();
		}
		
		return result;
	}
	
	
	
		
	
	// 전체 스터디카페(검색기능) 개수 조회
	public int cafeCount(String reserveDate, String reserveAddr1, String reserveAddr2, String reserveHour1, String reserveHour2, String reserveCount) throws SQLException
	{
		int result = 0;
		
		if(reserveDate==null || reserveAddr1==null || reserveAddr2==null || reserveHour1==null || reserveHour2==null || reserveCount==null)
		{
			reserveDate = "%%";
			reserveHour1 = "%%";
			reserveHour2 = "%%";
			
			String sql = "SELECT COUNT(*) AS COUNT"
					+ " FROM VIEW_CAFEROOM"
					+ " WHERE SC_CODE NOT IN (SELECT SC_CODE FROM VIEW_RESERVE WHERE RE_STARTDATE = TO_DATE(?,'YYYY-MM-DD')"
					+ " AND (? BETWEEN RE_STARTHOUR AND RE_ENDHOUR) AND (? BETWEEN RE_STARTHOUR AND RE_ENDHOUR))"
					+ " AND SR_CODE NOT IN (SELECT SR_CODE FROM ROOMUNREG)";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, reserveDate);
			pstmt.setString(2, reserveHour1);
			pstmt.setString(3, reserveHour2);
			
			ResultSet rs = pstmt.executeQuery();
			if (rs.next())
			{
				result = rs.getInt("COUNT");
			}
			
			rs.close();
			pstmt.close();
		}
		else
		{
			reserveHour1 = "%" + reserveHour1 + "%";
			reserveHour2 = "%" + reserveHour2 + "%";
			reserveAddr1 = "%" + reserveAddr1 + "%";
			reserveAddr2 = "%" + reserveAddr2 + "%";
			
			String sql = "SELECT COUNT(*) AS COUNT"
					  + " FROM VIEW_CAFEROOM WHERE SR_COUNT = ? AND SC_ADDR1 LIKE ? AND SC_ADDR1 LIKE ?"
					  + " AND SC_CODE NOT IN (SELECT SC_CODE FROM VIEW_RESERVE WHERE RE_STARTDATE = TO_DATE(?,'YYYY-MM-DD')"
					  + " AND (? BETWEEN RE_STARTHOUR AND RE_ENDHOUR) AND (? BETWEEN RE_STARTHOUR AND RE_ENDHOUR))"
					  + " AND SR_CODE NOT IN (SELECT SR_CODE FROM ROOMUNREG)";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(reserveCount));
			pstmt.setString(2, reserveAddr1);
			pstmt.setString(3, reserveAddr2);
			pstmt.setString(4, reserveDate);
			pstmt.setString(5, reserveHour1);
			pstmt.setString(6, reserveHour2);
			ResultSet rs = pstmt.executeQuery();
			
			if (rs.next())
			{
				result = rs.getInt("COUNT");
			}
			
			rs.close();
			pstmt.close();
		}
		
		return result;
	}
	
	// [호스트기준] 전체 스터디카페내역 출력 메소드
	public ArrayList<CafeDTO> lists(String hoCode, int start, int end) throws SQLException, ClassNotFoundException
	{
		ArrayList<CafeDTO> result = new ArrayList<CafeDTO>();
		
		String sql = "SELECT RNUM, SC_CODE, SC_NAME, SC_ADDR1, SC_ADDR2, SC_TEL, SC_OPENHOUR, SC_CLOSEHOUR, SC_CONVENIENT, SC_SURROUND, SC_CAUTION, SC_DETAIL, SC_RESNUMBER, SC_DATE, SC_FILE, HO_CODE, AD_PERDATE, AD_CODE, AD_CHCODE";
		sql += " FROM";
		sql += "(";
		sql += "	SELECT ROWNUM RNUM, DATA.*";
		sql += "	 FROM";
		sql += "    (";
		sql += "    	SELECT SC_CODE, SC_NAME, SC_ADDR1, SC_ADDR2, SC_TEL, SC_OPENHOUR, SC_CLOSEHOUR, SC_CONVENIENT, SC_SURROUND, SC_CAUTION, SC_DETAIL, SC_RESNUMBER, SC_DATE, SC_FILE, HO_CODE, AD_PERDATE, AD_CODE, AD_CHCODE";
		sql += "    	 FROM STUDYCAFE WHERE HO_CODE = ? AND SC_CODE NOT IN (SELECT SC_CODE FROM CAFEUNREG)";
		sql += "    ) DATA";
		sql += ")";
		sql += " WHERE RNUM>=? AND RNUM<=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, hoCode);
		pstmt.setInt(2, start);
		pstmt.setInt(3, end);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next())
		{
			CafeDTO dto = new CafeDTO();
			
			dto.setrNum(rs.getString("RNUM"));
			dto.setScCode(rs.getString("SC_CODE"));
			dto.setScName(rs.getString("SC_NAME"));
			dto.setScAddr1(rs.getString("SC_ADDR1"));
			dto.setScAddr2(rs.getString("SC_ADDR2"));
			dto.setScTel(rs.getString("SC_TEL"));
			dto.setScOpenHour(rs.getString("SC_OPENHOUR"));
			dto.setScCloseHour(rs.getString("SC_CLOSEHOUR"));
			dto.setScConvenient(rs.getString("SC_CONVENIENT"));
			dto.setScSurround(rs.getString("SC_SURROUND"));
			dto.setScCaution(rs.getString("SC_CAUTION"));
			dto.setScDetail(rs.getString("SC_DETAIL"));
			dto.setScResnumber(rs.getString("SC_RESNUMBER"));
			dto.setScDate(rs.getString("SC_DATE"));
			dto.setScFile(rs.getString("SC_FILE"));
			dto.setHoCode(rs.getString("HO_CODE"));
			dto.setAdPerDate(rs.getString("AD_PERDATE"));
			dto.setAdCode(rs.getString("AD_CODE"));
			dto.setAdChCode(rs.getString("AD_CHCODE"));
			
			result.add(dto);
		}
		
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	
	// ----------------------- START 스터디카페 등록·수정·삭제 ------------------------
	// [호스트] 스터디카페 등록 메소드
	public int add(CafeDTO dto) throws SQLException
	{
		int result = 0;
		
		String sql = "{call PRC_INSERTCAFE(?,?,?,?,?,?,?,?,?,?,?,?,?)}";
		CallableStatement cstmt = conn.prepareCall(sql);
		cstmt.setString(1, dto.getScName());
		cstmt.setString(2, dto.getScAddr1());
		cstmt.setString(3, dto.getScAddr2());
		cstmt.setString(4, dto.getScTel());
		cstmt.setString(5, dto.getScOpenHour());
		cstmt.setString(6, dto.getScCloseHour());
		cstmt.setString(7, dto.getScConvenient());
		cstmt.setString(8, dto.getScSurround());
		cstmt.setString(9, dto.getScCaution());
		cstmt.setString(10, dto.getScDetail());
		cstmt.setString(11, dto.getScResnumber());
		cstmt.setString(12, dto.getScFile());
		cstmt.setString(13, dto.getHoCode());
		
		result = cstmt.executeUpdate();
		
		cstmt.close();
		
		return result;
	}
	
	// [호스트] 스터디카페 정보 수정 메소드
	public int modify(CafeDTO dto) throws SQLException
	{
		int result = 0;
		
		String sql = "{call PRC_CAFEUPDATE(?,?,?,?,?,?,?,?)}";
		
		CallableStatement cstmt = conn.prepareCall(sql);
		cstmt.setString(1, dto.getScCode());
		cstmt.setString(2, dto.getScTel());
		cstmt.setString(3, dto.getScOpenHour());
		cstmt.setString(4, dto.getScCloseHour());
		cstmt.setString(5, dto.getScConvenient());
		cstmt.setString(6, dto.getScSurround());
		cstmt.setString(7, dto.getScCaution());
		cstmt.setString(8, dto.getScDetail());
		
		result = cstmt.executeUpdate();
		
		cstmt.close();
		
		return result;		
	}
	
	// [호스트] 스터디카페 비활성화 메소드
	public int remove(String scCode, String hoCode) throws SQLException
	{
		int result = 0;
		
		String sql = "{call PRC_CAFEDELETE(?, ?)}";
		
		CallableStatement cstmt = conn.prepareCall(sql);
		cstmt.setString(1, scCode);
		cstmt.setString(2, hoCode);
		
		result = cstmt.executeUpdate();
		
		cstmt.close();
		return result;
	}
	// ----------------------- END 스터디카페 등록·수정·삭제 ------------------------
	
	// [호스트기준] 보유 스터디카페 개수 조회
	public int cafeCount(String hoCode) throws SQLException
	{
		int result = 0;
		
		String sql = "SELECT COUNT(*) AS COUNT FROM STUDYCAFE WHERE HO_CODE = ? AND SC_CODE NOT IN (SELECT SC_CODE FROM CAFEUNREG)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, hoCode);
		
		ResultSet rs = pstmt.executeQuery();
		if (rs.next())
		{
			result = rs.getInt("COUNT");
		}
		
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	// 전체 스터디카페 개수 조회
	public int cafeCount() throws SQLException
	{
		int result = 0;
		
		String sql = "SELECT COUNT(*) AS COUNT FROM STUDYCAFE WHERE SC_CODE NOT IN (SELECT SC_CODE FROM CAFEUNREG)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		if (rs.next())
		{
			result = rs.getInt("COUNT");
		}
		
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	
	// [스터디카페기준] 스터디카페 정보 조회
	public CafeDTO searchCode(String scCode) throws SQLException
	{
		CafeDTO result = new CafeDTO();
		
		String sql = "SELECT SC_CODE, SC_NAME, SC_ADDR1, SC_ADDR2"
				+ ", SC_TEL, SC_OPENHOUR, SC_CLOSEHOUR, SC_CONVENIENT"
				+ ", SC_SURROUND, SC_CAUTION, SC_DETAIL, SC_RESNUMBER"
				+ ", SC_DATE, SC_FILE, HO_CODE, AD_PERDATE, AD_CODE, AD_CHCODE"
				+ " FROM STUDYCAFE WHERE SC_CODE = ? AND SC_CODE NOT IN (SELECT SC_CODE FROM CAFEUNREG)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, scCode);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next())
		{			
			result.setScCode(rs.getString("SC_CODE"));
			result.setScName(rs.getString("SC_NAME"));
			result.setScAddr1(rs.getString("SC_ADDR1"));
			result.setScAddr2(rs.getString("SC_ADDR2"));
			result.setScTel(rs.getString("SC_TEL"));
			result.setScOpenHour(rs.getString("SC_OPENHOUR"));
			result.setScCloseHour(rs.getString("SC_CLOSEHOUR"));
			result.setScConvenient(rs.getString("SC_CONVENIENT"));
			result.setScSurround(rs.getString("SC_SURROUND"));
			result.setScCaution(rs.getString("SC_CAUTION"));
			result.setScDetail(rs.getString("SC_DETAIL"));
			result.setScResnumber(rs.getString("SC_RESNUMBER"));
			result.setScDate(rs.getString("SC_DATE"));
			result.setScFile(rs.getString("SC_FILE"));
			result.setHoCode(rs.getString("HO_CODE"));
			result.setAdPerDate(rs.getString("AD_PERDATE"));
			result.setAdCode(rs.getString("AD_CODE"));
			result.setAdChCode(rs.getString("AD_CHCODE"));
			
		}
		
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	// [스터디카페기준] 전체 예약 내역 조회
	public ArrayList<CafeDTO> ReserveLists(String scCode) throws SQLException
	{
		ArrayList<CafeDTO> result = new ArrayList<CafeDTO>();
		
		String sql = "SELECT RE_CODE, SC_CODE, SC_NAME, SR_NAME, RE_STARTDATE, RE_STARTHOUR, RE_ENDHOUR"
				+ ", RE_COUNT, FB_CODE, FB_STATE, GJ_CODE, GU_ID, GU_NICK, FB_STATECODE, GR_NAME, HR_CODE, RE_STATE"
				+ " FROM VIEW_RESERVE WHERE SC_CODE = ? AND SC_CODE NOT IN (SELECT SC_CODE FROM CAFEUNREG)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, scCode);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next())
		{
			CafeDTO dto = new CafeDTO();
			
			dto.setScName(rs.getString("SC_NAME"));
			dto.setScCode(rs.getString("SC_CODE"));
			dto.setSrName(rs.getString("SR_NAME"));
			dto.setReCode(rs.getString("RE_CODE"));
			dto.setReStartDate(rs.getString("RE_STARTDATE"));
			dto.setReStartHour(rs.getString("RE_STARTHOUR"));
			dto.setReEndHour(rs.getString("RE_ENDHOUR"));
			dto.setReCount(rs.getInt("RE_COUNT"));
			dto.setGuNick(rs.getString("GU_NICK"));
			dto.setGjCode(rs.getString("GJ_CODE"));
			dto.setGuId(rs.getString("GU_ID"));
			dto.setGrName(rs.getString("GR_NAME"));
			dto.setHrCode(rs.getString("HR_CODE"));
			dto.setFbCode(rs.getString("FB_CODE"));
			dto.setFbState(rs.getString("FB_STATE"));
			dto.setFbStateCode(rs.getString("FB_STATECODE"));
			dto.setReState(rs.getString("RE_STATE"));
			
			result.add(dto);
		}
		
		pstmt.close();
		rs.close();
		
		return result;		
	}
	
	// [예약코드기준] 예약 상세정보 조회
	public CafeDTO ReserveInfoLists(String reCode) throws SQLException
	{
		CafeDTO result = new CafeDTO();
		
		String sql = "SELECT RE_CODE, SC_CODE, SC_NAME, SR_NAME, RE_STARTDATE, RE_STARTHOUR, RE_ENDHOUR"
				+ ", RE_COUNT, FB_CODE, FB_STATE, GJ_CODE, GU_ID, GU_NICK, FB_STATECODE, GR_NAME, HR_CODE, RE_STATE"
				+ " FROM VIEW_RESERVE WHERE RE_CODE = ? AND SC_CODE NOT IN (SELECT SC_CODE FROM CAFEUNREG)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, reCode);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next())
		{			
			result.setScName(rs.getString("SC_NAME"));
			result.setScCode(rs.getString("SC_CODE"));
			result.setSrName(rs.getString("SR_NAME"));
			result.setReCode(rs.getString("RE_CODE"));
			result.setReStartDate(rs.getString("RE_STARTDATE"));
			result.setReStartHour(rs.getString("RE_STARTHOUR"));
			result.setReEndHour(rs.getString("RE_ENDHOUR"));
			result.setReCount(rs.getInt("RE_COUNT"));
			result.setGuNick(rs.getString("GU_NICK"));
			result.setGjCode(rs.getString("GJ_CODE"));
			result.setGuId(rs.getString("GU_ID"));
			result.setGrName(rs.getString("GR_NAME"));
			result.setHrCode(rs.getString("HR_CODE"));
			result.setFbCode(rs.getString("FB_CODE"));
			result.setFbState(rs.getString("FB_STATE"));
			result.setFbStateCode(rs.getString("FB_STATECODE"));
			result.setReState(rs.getString("RE_STATE"));
			
		}
		
		pstmt.close();
		rs.close();
		
		return result;		
	}
	
	
	// [호스트기준] 전체스터디카페 예약 후 취소 여부 확인
	public int countCancel(String hoCode) throws SQLException
	{
		int result = 0;
		
		String sql = "SELECT COUNT(RC_CODE) AS COUNT FROM VIEW_CANCEL WHERE HO_CODE = ? AND SC_CODE NOT IN (SELECT SC_CODE FROM CAFEUNREG)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, hoCode);
		ResultSet rs = pstmt.executeQuery();
		if (rs.next())
		{
			result = rs.getInt("COUNT");
		}
		
		rs.close();
		
		return result;
	}
	
	// [스터디카페기준] 스터디카페 이용상태 조회
	public String feedbackList(String scCode) throws SQLException
	{
		String result = "";
		
		String sql = "SELECT STATE, USECOM FROM VIEW_RESERVE WHERE SC_CODE = ? AND SC_CODE NOT IN (SELECT SC_CODE FROM CAFEUNREG)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, scCode);
		ResultSet rs = pstmt.executeQuery();
		if (rs.next())
		{
			result = rs.getString("STATE");
			result = rs.getString("USECOM");
		}
		
		pstmt.close();
		rs.close();
		
		return result;	
	}
	
	// [호스트] 스터디카페 이용 피드백 입력
	public int feedbackAdd(String feed, String reCode) throws SQLException
	{
		int result = 0;
		
		String sql = "INSERT INTO FEEDBACK(FB_CODE, FB_STATECODE, RE_CODE) VALUES(TO_CHAR(FEEDBACK_SEQ.NEXTVAL), ?, ?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, feed);
		pstmt.setString(2, reCode);
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		
		return result;
	}
	
	// 신고 사유 내역 조회
	public ArrayList<ReasonDTO> reasonLists() throws SQLException
	{
		ArrayList<ReasonDTO> result = new ArrayList<ReasonDTO>();
		
		String sql = "SELECT REASON_CODE, REASON FROM REASON WHERE REASON_CODE LIKE '3%'";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next())
		{
			ReasonDTO dto = new ReasonDTO();
			
			dto.setReasonCode(rs.getString("REASON_CODE"));
			dto.setReason(rs.getString("REASON"));
			
			result.add(dto);
		}
		
		pstmt.close();
		rs.close();
		
		return result;
	}
	
	// 호스트 신고요청 
	public int addHostRed(String fbCode, String reasonCode, String file) throws SQLException
	{
		int result = 0;
		
		String sql = "INSERT INTO HOST_RED(HR_CODE, HR_DATE, FB_CODE, REASON_CODE, HR_FILE)"
				+ " VALUES(TO_CHAR(HOST_RED_SEQ.NEXTVAL), SYSDATE, ?, ?, ?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, fbCode);
		pstmt.setString(2, reasonCode);
		pstmt.setString(3, file);
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		return result;
	}
	
	// [호스트기준] 전체 신고내역 조회
	public ArrayList<CafeDTO> hostRedLists(String hoCode, int start, int end, String searchKey, String searchValue, String hrState, String adState) throws SQLException
	{
		ArrayList<CafeDTO> result = new ArrayList<CafeDTO>();
		
		if (searchKey.equals("group"))
			searchKey = "GR_NAME";
		else
			searchKey = "REASON";
		
		//
		if (hrState.equals("hrAll"))
			hrState = "";
		else if (hrState.equals("yet"))
			hrState = "처리중";
		else if (hrState.equals("done"))
			hrState = "처리완료";
		
		//
		if (adState.equals("adAll"))
			adState = "";
		else if (adState.equals("access"))
			adState = "승인";
		else if (adState.equals("reject"))
			adState = "반려";
		else if (adState.equals("stay"))
			adState = "대기";
		
		searchValue = "%" + searchValue + "%";
		hrState = "%" + hrState + "%";
		adState = "%" + adState + "%";
		
		String sql = "SELECT RNUM, HR_CODE, HR_DATE, REASON_CODE, FB_CODE, RED_CODE, HRD_DATE, REASON, RED_STATE, GJ_CODE, GR_CODE, GR_NAME, HR_STATE";
		sql += " FROM";
		sql += "(";
		sql += "	SELECT ROWNUM RNUM, DATA.*";
		sql += "	 FROM";
		sql += "    (";
		sql += "    	SELECT HR_CODE, HR_DATE, REASON_CODE, FB_CODE, RED_CODE, HRD_DATE, REASON, RED_STATE, GJ_CODE, GR_CODE, GR_NAME, HR_STATE";
		sql += "    	 FROM VIEW_HOSTRED WHERE HO_CODE = ? AND " + searchKey + " LIKE ? AND HR_STATE LIKE ? AND RED_STATE LIKE ? AND SC_CODE NOT IN (SELECT SC_CODE FROM CAFEUNREG)";
		sql += "    ) DATA";
		sql += ")";
		sql += " WHERE RNUM>=? AND RNUM<=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, hoCode);
		pstmt.setString(2, searchValue);
		pstmt.setString(3, hrState);
		pstmt.setString(4, adState);
		pstmt.setInt(5, start);
		pstmt.setInt(6, end);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next())
		{
			CafeDTO dto = new CafeDTO();
			dto.setrNum(rs.getString("RNUM"));
			dto.setFbCode(rs.getString("FB_CODE"));
			dto.setHrCode(rs.getString("HR_CODE"));
			dto.setHrDate(rs.getString("HR_DATE"));
			dto.setGjCode(rs.getString("GJ_CODE"));
			dto.setGrCode(rs.getString("GR_CODE"));
			dto.setGrName(rs.getString("GR_NAME"));
			dto.setHrdDate(rs.getString("HRD_DATE"));
			dto.setReason(rs.getString("REASON"));
			dto.setReasonCode(rs.getString("REASON_CODE"));
			dto.setRedCode(rs.getString("RED_CODE"));
			dto.setRedState(rs.getString("RED_STATE"));
			dto.setHrState(rs.getString("HR_STATE"));
			
			result.add(dto);
		}
		
		pstmt.close();
		rs.close();
		return result;
	}
	
	// [호스트기준] 신고내역 총 개수 구하는 메소드
	public int reserveCount(String hoCode, String searchKey, String searchValue, String hrState, String adState) throws SQLException
	{
		int result = 0;
		
		if (searchKey.equals("group"))
			searchKey = "GR_NAME";
		else
			searchKey = "REASON";
		
		//
		if (hrState.equals("hrAll"))
			hrState = "";
		else if (hrState.equals("yet"))
			hrState = "처리중";
		else if (hrState.equals("done"))
			hrState = "처리완료";
		
		//
		if (adState.equals("adAll"))
			adState = "";
		else if (adState.equals("access"))
			adState = "승인";
		else if (adState.equals("reject"))
			adState = "반려";
		else if (adState.equals("stay"))
			adState = "대기";
		
		searchValue = "%" + searchValue + "%";
		hrState = "%" + hrState + "%";
		adState = "%" + adState + "%";
		
		String sql = "SELECT COUNT(*) AS COUNT"
				+ " FROM VIEW_HOSTRED"
				+ " WHERE HO_CODE = ? AND " + searchKey + " LIKE ? AND HR_STATE LIKE ? AND RED_STATE LIKE ?"
				+ " AND SC_CODE NOT IN (SELECT SC_CODE FROM CAFEUNREG)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, hoCode);
		pstmt.setString(2, searchValue);
		pstmt.setString(3, hrState);
		pstmt.setString(4, adState);
		ResultSet rs = pstmt.executeQuery();
		if (rs.next())
			result = rs.getInt("COUNT");
		rs.close();
		pstmt.close();			
			
		return result;
	}	
	
	// [호스트기준] 예약내역 총 개수 구하는 메소드
	public int getDataCount(String hoCode, String searchKey, String searchValue, String fbState, String reState) throws SQLException
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
		
		String sql = "SELECT COUNT(*) AS COUNT FROM VIEW_RESERVE"
				+ " WHERE HO_CODE = ? AND " + searchKey + " LIKE ? AND FB_STATE LIKE ? AND RE_STATE LIKE ?"
				+ " AND SC_CODE NOT IN (SELECT SC_CODE FROM CAFEUNREG)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, hoCode);
		pstmt.setString(2, searchValue);
		pstmt.setString(3, fbState);
		pstmt.setString(4, reState);
		ResultSet rs = pstmt.executeQuery();
		if (rs.next())
			result = rs.getInt("COUNT");
		rs.close();
		pstmt.close();			
		
		return result;
	}
	
	// [호스트기준] 예약 내역 조회(검색기능 추가)
	public ArrayList<CafeDTO> ReserveSearchLists(String hoCode, int start, int end, String searchKey, String searchValue, String fbState, String reState) throws SQLException
	{
		ArrayList<CafeDTO> result = new ArrayList<CafeDTO>();
		
		if (searchKey.equals("resDate"))
			searchKey = "RE_STARTDATE";		// 달력에서 값 받기
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

		String sql = "SELECT RNUM, RE_CODE, SC_CODE, SC_NAME, SR_NAME, RE_STARTDATE, RE_STARTHOUR, RE_ENDHOUR, RE_COUNT, FB_CODE, FB_STATE, GJ_CODE, GU_ID, GU_NICK, FB_STATECODE, GR_NAME, HR_CODE, RE_STATE";
		sql += " FROM";
		sql += "(";
		sql += "	SELECT ROWNUM RNUM, DATA.*";
		sql += "	 FROM";
		sql += "    (";
		sql += "    	SELECT RE_CODE, SC_CODE, SC_NAME, SR_NAME, RE_STARTDATE, RE_STARTHOUR, RE_ENDHOUR, RE_COUNT, FB_CODE, FB_STATE, GJ_CODE, GU_ID, GU_NICK, FB_STATECODE, GR_NAME, HR_CODE, RE_STATE";
		sql += "    	 FROM VIEW_RESERVE WHERE HO_CODE = ? AND " + searchKey + " LIKE ? AND FB_STATE LIKE ? AND RE_STATE LIKE ? AND SC_CODE NOT IN (SELECT SC_CODE FROM CAFEUNREG)";
		sql += "    ) DATA";
		sql += ")";
		sql += " WHERE RNUM>=? AND RNUM<=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, hoCode);
		pstmt.setString(2, searchValue);
		pstmt.setString(3, fbState);
		pstmt.setString(4, reState);
		pstmt.setInt(5, start);
		pstmt.setInt(6, end);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next())
		{
			CafeDTO dto = new CafeDTO();
			
			dto.setrNum(rs.getString("RNUM"));
			dto.setScName(rs.getString("SC_NAME"));
			dto.setScCode(rs.getString("SC_CODE"));
			dto.setSrName(rs.getString("SR_NAME"));
			dto.setReCode(rs.getString("RE_CODE"));
			dto.setReStartDate(rs.getString("RE_STARTDATE"));
			dto.setReStartHour(rs.getString("RE_STARTHOUR"));
			dto.setReEndHour(rs.getString("RE_ENDHOUR"));
			dto.setReCount(rs.getInt("RE_COUNT"));
			dto.setGuNick(rs.getString("GU_NICK"));
			dto.setGjCode(rs.getString("GJ_CODE"));
			dto.setGuId(rs.getString("GU_ID"));
			dto.setGrName(rs.getString("GR_NAME"));
			dto.setHrCode(rs.getString("HR_CODE"));
			dto.setFbCode(rs.getString("FB_CODE"));
			dto.setFbState(rs.getString("FB_STATE"));
			dto.setFbStateCode(rs.getString("FB_STATECODE"));
			dto.setReState(rs.getString("RE_STATE"));
			
			result.add(dto);
		}
		
		pstmt.close();
		rs.close();
		
		return result;		
	}
	
	// [스터디카페기준] 전체 리뷰 조회
	public ArrayList<CafeDTO> reviewLists(String scCode, int start, int end, String searchKey, String searchValue) throws SQLException
	{
		ArrayList<CafeDTO> result = new ArrayList<CafeDTO>();
		
		if (searchKey.equals("scafe"))
			searchKey = "SC_NAME";
		else if (searchKey.equals("writer"))
			searchKey = "GU_NICK";
		else if (searchKey.equals("content"))
			searchKey = "RV_CONTENT";

		searchValue = "%" + searchValue + "%";	
		//scState = "%" + scState + "%";	
		
		String sql = "SELECT RNUM, SC_CODE, SC_NAME, RV_CODE, RV_CONTENT, RV_DATE, RE_CODE, RE_STARTDATE, GJ_CODE, GU_NICK, GR_NAME, FB_CODE, HR_CODE";
		sql += " FROM";
		sql += "(";
		sql += "	SELECT ROWNUM RNUM, DATA.*";
		sql += "	 FROM";
		sql += "    (";
		sql += "    	SELECT SC_CODE, SC_NAME, RV_CODE, RV_CONTENT, RV_DATE, RE_CODE, RE_STARTDATE, GJ_CODE, GU_NICK, GR_NAME, FB_CODE, HR_CODE";
		sql += "    	 FROM VIEW_REVIEW WHERE SC_CODE = ? AND " + searchKey + " LIKE ? AND SC_CODE NOT IN (SELECT SC_CODE FROM CAFEUNREG)";
		sql += "    ) DATA";
		sql += ")";
		sql += " WHERE RNUM>=? AND RNUM<=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, scCode);
		pstmt.setString(2, searchValue);
		pstmt.setInt(3, start);
		pstmt.setInt(4, end);
		
		ResultSet rs = pstmt.executeQuery();
		while(rs.next())
		{
			CafeDTO dto = new CafeDTO();
			
			dto.setrNum(rs.getString("RNUM"));
			dto.setScCode(rs.getString("SC_CODE"));
			dto.setScName(rs.getString("SC_NAME"));
			dto.setRvCode(rs.getString("RV_CODE"));
			dto.setRvContent(rs.getString("RV_CONTENT"));
			dto.setRvDate(rs.getString("RV_DATE"));
			dto.setReCode(rs.getString("RE_CODE"));
			dto.setReStartDate(rs.getString("RE_STARTDATE"));
			dto.setGjCode(rs.getString("GJ_CODE"));
			dto.setGuNick(rs.getString("GU_NICK"));
			dto.setGrName(rs.getString("GR_NAME"));
			dto.setFbCode(rs.getString("FB_CODE"));
			dto.setHrCode(rs.getString("HR_CODE"));
						
			result.add(dto);
		}
		
		rs.close();
		pstmt.close();
		
		return result; 
	}
	
	
	
	// [스터디카페기준] 리뷰 수 조회
	public int cafeReviewCount(String scCode, String searchKey, String searchValue) throws SQLException
	{
		int result = 0;
		
		if (searchKey.equals("scafe"))
			searchKey = "SC_NAME";
		else if (searchKey.equals("writer"))
			searchKey = "GU_NICK";
		else if (searchKey.equals("content"))
			searchKey = "RV_CONTENT";
		
		searchValue = "%" + searchValue + "%";	
		
		String sql = "SELECT COUNT(*) AS COUNT FROM VIEW_REVIEW WHERE SC_CODE = ? AND " + searchKey + " LIKE ? AND SC_CODE NOT IN (SELECT SC_CODE FROM CAFEUNREG)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, scCode);
		pstmt.setString(2, searchValue);
		ResultSet rs = pstmt.executeQuery();
		if (rs.next())
		{
			result = rs.getInt("COUNT");
		}
		
		rs.close();
		
		return result;
	}
	
	// [호스트기준] 전체 스터디카페 리뷰 조회
	public ArrayList<CafeDTO> reviewHostLists(String hoCode, int start, int end,String searchKey, String searchValue) throws SQLException
	{
		ArrayList<CafeDTO> result = new ArrayList<CafeDTO>();
		
		if (searchKey.equals("scafe"))
			searchKey = "SC_NAME";
		else if (searchKey.equals("writer"))
			searchKey = "GU_NICK";
		else if (searchKey.equals("content"))
			searchKey = "RV_CONTENT";
		
		searchValue = "%" + searchValue + "%";	
		
		String sql = "SELECT RNUM, SC_CODE, SC_NAME, RV_CODE, RV_CONTENT, RV_DATE, RE_CODE, RE_STARTDATE, GJ_CODE, GU_NICK, GR_NAME, FB_CODE, HR_CODE";
		sql += " FROM";
		sql += "(";
		sql += "	SELECT ROWNUM RNUM, DATA.*";
		sql += "	 FROM";
		sql += "    (";
		sql += "    	SELECT SC_CODE, SC_NAME, RV_CODE, RV_CONTENT, RV_DATE, RE_CODE, RE_STARTDATE, GJ_CODE, GU_NICK, GR_NAME, FB_CODE, HR_CODE";
		sql += "    	 FROM VIEW_REVIEW WHERE HO_CODE = ? AND " + searchKey + " LIKE ? AND SC_CODE NOT IN (SELECT SC_CODE FROM CAFEUNREG)";
		sql += "    ) DATA";
		sql += ")";
		sql += " WHERE RNUM>=? AND RNUM<=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, hoCode);
		pstmt.setString(2, searchValue);
		pstmt.setInt(3, start);
		pstmt.setInt(4, end);
		
		ResultSet rs = pstmt.executeQuery();
		while(rs.next())
		{
			CafeDTO dto = new CafeDTO();
			
			dto.setrNum(rs.getString("RNUM"));
			dto.setScCode(rs.getString("SC_CODE"));
			dto.setScName(rs.getString("SC_NAME"));
			dto.setRvCode(rs.getString("RV_CODE"));
			dto.setRvContent(rs.getString("RV_CONTENT"));
			dto.setRvDate(rs.getString("RV_DATE"));
			dto.setReCode(rs.getString("RE_CODE"));
			dto.setReStartDate(rs.getString("RE_STARTDATE"));
			dto.setGjCode(rs.getString("GJ_CODE"));
			dto.setGuNick(rs.getString("GU_NICK"));
			dto.setGrName(rs.getString("GR_NAME"));
			dto.setFbCode(rs.getString("FB_CODE"));
			dto.setHrCode(rs.getString("HR_CODE"));
						
			result.add(dto);
		}
		
		rs.close();
		pstmt.close();
		
		return result; 
	}
	
	// [호스트기준] 전체 스터디카페 리뷰 수 조회
	public int hostReviewCount(String hoCode, String searchKey, String searchValue) throws SQLException
	{
		int result = 0;
		
		if (searchKey.equals("scafe"))
			searchKey = "SC_NAME";
		else if (searchKey.equals("writer"))
			searchKey = "GU_NICK";
		else if (searchKey.equals("content"))
			searchKey = "RV_CONTENT";
		
		searchValue = "%" + searchValue + "%";	
		
		String sql = "SELECT COUNT(RV_CODE) AS COUNT FROM VIEW_REVIEW WHERE HO_CODE = ? AND " + searchKey + " LIKE ?"
				+ " AND SC_CODE NOT IN (SELECT SC_CODE FROM CAFEUNREG)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, hoCode);
		pstmt.setString(2, searchValue);
		ResultSet rs = pstmt.executeQuery();
		if (rs.next())
		{
			result = rs.getInt("COUNT");
		}
		
		rs.close();
		
		return result;
	}
	
	// [스터디카페기준] 전체 중 최신 리뷰 조회
	public ArrayList<CafeDTO> reviewNewLists(String scCode, int start, int end) throws SQLException
	{
		ArrayList<CafeDTO> result = new ArrayList<CafeDTO>();
		
		String sql = "SELECT RNUM, SC_CODE, SC_NAME, RV_CODE, RV_CONTENT, RV_DATE, RE_CODE, RE_STARTDATE, GJ_CODE, GU_NICK, GR_NAME, FB_CODE, HR_CODE";
		sql += " FROM";
		sql += "(";
		sql += "	SELECT ROWNUM RNUM, DATA.*";
		sql += "	 FROM";
		sql += "    (";
		sql += "    	SELECT SC_CODE, SC_NAME, RV_CODE, RV_CONTENT, RV_DATE, RE_CODE, RE_STARTDATE, GJ_CODE, GU_NICK, GR_NAME, FB_CODE, HR_CODE";
		sql += "    	 FROM VIEW_REVIEW WHERE SC_CODE = ? AND SC_CODE NOT IN (SELECT SC_CODE FROM CAFEUNREG) ORDER BY RV_DATE";
		sql += "    ) DATA";
		sql += ")";
		sql += " WHERE RNUM>=? AND RNUM<=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, scCode);
		pstmt.setInt(2, start);
		pstmt.setInt(3, end);
		
		ResultSet rs = pstmt.executeQuery();
		while(rs.next())
		{
			CafeDTO dto = new CafeDTO();
			
			dto.setrNum(rs.getString("RNUM"));
			dto.setScCode(rs.getString("SC_CODE"));
			dto.setScName(rs.getString("SC_NAME"));
			dto.setRvCode(rs.getString("RV_CODE"));
			dto.setRvContent(rs.getString("RV_CONTENT"));
			dto.setRvDate(rs.getString("RV_DATE"));
			dto.setReCode(rs.getString("RE_CODE"));
			dto.setReStartDate(rs.getString("RE_STARTDATE"));
			dto.setGjCode(rs.getString("GJ_CODE"));
			dto.setGuNick(rs.getString("GU_NICK"));
			dto.setGrName(rs.getString("GR_NAME"));
			dto.setFbCode(rs.getString("FB_CODE"));
			dto.setHrCode(rs.getString("HR_CODE"));
						
			result.add(dto);
		}
		
		rs.close();
		pstmt.close();
		
		return result; 
	}
		
	// 스터디룸 추가
	public int addRoom(CafeDTO dto) throws SQLException
	{
		int result = 0;
		
		String sql = "INSERT INTO STUDYROOM(SR_CODE, SR_NAME, SR_COUNT, SR_PRICE, SC_CODE)"
				+ " VALUES(TO_CHAR(STUDYROOM_SEQ.NEXTVAL), ?, ?, ?, ?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dto.getSrName());
		pstmt.setInt(2, dto.getSrCount());
		pstmt.setInt(3, dto.getSrPrice());
		pstmt.setString(4, dto.getScCode());
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		return result;
	}
	
	// 스터디카페의 스터디룸 조회
	public ArrayList<CafeDTO> roomList(String scCode) throws SQLException
	{
		ArrayList<CafeDTO> result = new ArrayList<CafeDTO>();
		
		String sql = "SELECT SC_CODE, SC_NAME, SR_CODE, SR_NAME, SR_COUNT, SR_PRICE, ROWNUM RNUM, SC_ADDR1"
				+ ", SC_ADDR2, SC_TEL, SC_OPENHOUR, SC_CLOSEHOUR, SC_CONVENIENT, SC_SURROUND, SC_CAUTION, SC_DETAIL, SC_DATE"
				+ " FROM VIEW_ROOMINFO WHERE SC_CODE = ? AND SR_CODE NOT IN (SELECT SR_CODE FROM ROOMUNREG) ORDER BY SR_CODE";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, scCode);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next())
		{
			CafeDTO dto = new CafeDTO();
			
			dto.setrNum(rs.getString("RNUM"));
			dto.setScCode(rs.getString("SC_CODE"));
			dto.setScName(rs.getString("SC_NAME"));
			dto.setSrCode(rs.getString("SR_CODE"));
			dto.setSrName(rs.getString("SR_NAME"));
			dto.setSrCount(rs.getInt("SR_COUNT"));
			dto.setSrPrice(rs.getInt("SR_PRICE"));
			dto.setScAddr1(rs.getString("SC_ADDR1"));
			dto.setScAddr2(rs.getString("SC_ADDR2"));
			dto.setScTel(rs.getString("SC_TEL"));
			dto.setScOpenHour(rs.getString("SC_OPENHOUR"));
			dto.setScCloseHour(rs.getString("SC_CLOSEHOUR"));
			dto.setScConvenient(rs.getString("SC_CONVENIENT"));
			dto.setScSurround(rs.getString("SC_SURROUND"));
			dto.setScCaution(rs.getString("SC_CAUTION"));
			dto.setScDetail(rs.getString("SC_DETAIL"));
			dto.setScDate(rs.getString("SC_DATE"));
			
			result.add(dto);
		}
		
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	// 스터디룸 조회
	public ArrayList<CafeDTO> roomInfoList(String srCode) throws SQLException
	{
		ArrayList<CafeDTO> result = new ArrayList<CafeDTO>();
		
		String sql = "SELECT SC_CODE, SC_NAME, SR_CODE, SR_NAME, SR_COUNT, SR_PRICE, ROWNUM RNUM, SC_ADDR1"
				+ ", SC_ADDR2, SC_TEL, SC_OPENHOUR, SC_CLOSEHOUR, SC_CONVENIENT, SC_SURROUND, SC_CAUTION, SC_DETAIL, SC_DATE"
				+ " FROM VIEW_ROOMINFO WHERE SR_CODE = ? AND SR_CODE NOT IN (SELECT SR_CODE FROM ROOMUNREG) ORDER BY SR_CODE";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, srCode);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next())
		{
			CafeDTO dto = new CafeDTO();
			
			dto.setrNum(rs.getString("RNUM"));
			dto.setScCode(rs.getString("SC_CODE"));
			dto.setScName(rs.getString("SC_NAME"));
			dto.setSrCode(rs.getString("SR_CODE"));
			dto.setSrName(rs.getString("SR_NAME"));
			dto.setSrCount(rs.getInt("SR_COUNT"));
			dto.setSrPrice(rs.getInt("SR_PRICE"));
			dto.setScAddr1(rs.getString("SC_ADDR1"));
			dto.setScAddr2(rs.getString("SC_ADDR2"));
			dto.setScTel(rs.getString("SC_TEL"));
			dto.setScOpenHour(rs.getString("SC_OPENHOUR"));
			dto.setScCloseHour(rs.getString("SC_CLOSEHOUR"));
			dto.setScConvenient(rs.getString("SC_CONVENIENT"));
			dto.setScSurround(rs.getString("SC_SURROUND"));
			dto.setScCaution(rs.getString("SC_CAUTION"));
			dto.setScDetail(rs.getString("SC_DETAIL"));
			dto.setScDate(rs.getString("SC_DATE"));
			
			result.add(dto);
		}
		
		rs.close();
		pstmt.close();
		
		return result;
	}


	// 스터디룸 수정
	public int modifyRoom(CafeDTO dto) throws SQLException
	{
		int result = 0;
		
		String sql = "UPDATE STUDYROOM SET SR_NAME = ?, SR_COUNT = ?, SR_PRICE = ? WHERE SR_CODE = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dto.getSrName());
		pstmt.setInt(2, dto.getSrCount());
		pstmt.setInt(3, dto.getSrPrice());
		pstmt.setString(4, dto.getSrCode());
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		return result;
	}
	
	// 스터디룸 비활성화 
	public int roomRemove(String srCode) throws SQLException
	{
		int result = 0;
		
		String sql = "{call PRC_ROOMDELETE(?)}";
		
		CallableStatement cstmt = conn.prepareCall(sql);
		cstmt.setString(1, srCode);
		
		result = cstmt.executeUpdate();
		
		cstmt.close();
		return result;
	}
	
	
	// [스터디카페기준] 전체 예약내역 수 조회
	public int cafeAllCount(String code, String cfState) throws SQLException
	{
		int result = 0;
		String search = "";
		
		if (cfState.equals("cfAll"))
			search = "HO_CODE";
		else
			search = "SC_CODE";
		
		String sql = "SELECT COUNT(*) AS COUNT FROM VIEW_RESERVE WHERE " +search+ " = ? AND SC_CODE NOT IN (SELECT SC_CODE FROM CAFEUNREG)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, code);
		ResultSet rs = pstmt.executeQuery();
		if (rs.next())
			result = rs.getInt("COUNT");
		
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	// [스터디카페기준] 이용상태 수 조회
	public int cafeStateCount(String code, String cfState, String state) throws SQLException
	{
		int result = 0;
		String search = "";
		
		if (cfState.equals("cfAll"))
			search = "HO_CODE";
		else
			search = "SC_CODE";
			
			
		String sql = "SELECT FB_STATE, COUNT(*) AS COUNT FROM VIEW_RESERVE"
				+ " WHERE " + search + " = ? AND FB_STATE = ? AND SC_CODE NOT IN (SELECT SC_CODE FROM CAFEUNREG)"
				+ " GROUP BY FB_STATE";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, code);
		pstmt.setString(2, state);
		ResultSet rs = pstmt.executeQuery();
		if (rs.next())
			result = rs.getInt("COUNT");
		
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	// 스터디룸 기준 예약내역 개수 조회
	public int roomReserveCount(String srCode) throws SQLException
	{
		int result = 0;
		
		String sql = "SELECT COUNT(*) AS COUNT"
				+ " FROM VIEW_ROOM WHERE RE_CODE IN (SELECT RE_CODE FROM RESERVATION WHERE RE_STARTDATE >= SYSDATE AND SR_CODE = ?)"
				+ " AND SR_CODE NOT IN (SELECT SR_CODE FROM ROOMUNREG)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, srCode);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next())
		{
			result = rs.getInt("COUNT");
		}
		
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	// 지역 내역 조회
	public ArrayList<GroupDTO> lfList() throws SQLException
	{
		ArrayList<GroupDTO> result = new ArrayList<GroupDTO>();
		
		String sql = "SELECT LF_CODE, LF_LIST FROM LOCATION_FIRST";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next())
		{
			GroupDTO dto = new GroupDTO();
			
			dto.setLfCode(rs.getString("LF_CODE"));
			dto.setLfList(rs.getString("LF_LIST"));
			
			result.add(dto);
		}
		
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	// 지역 분류 검색 
	public String searchLf(String lfList) throws SQLException
	{
		String result = "";
		
		if (lfList == null)
			lfList = "서울";
		
		String sql = "SELECT LF_CODE FROM LOCATION_FIRST WHERE LF_LIST = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, lfList);
		ResultSet rs = pstmt.executeQuery();
		if (rs.next())
		{
			result = rs.getString("LF_CODE");
		}
		
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	// 지역 소분류 내역 조회
	public ArrayList<GroupDTO> lsList(String lfCode) throws SQLException
	{
		ArrayList<GroupDTO> result = new ArrayList<GroupDTO>();
		
		if(lfCode==null)
			lfCode = "1";
		
		String sql = "SELECT LS_CODE, LS_LIST FROM LOCATION_SECOND WHERE LF_CODE = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, lfCode);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next())
		{
			GroupDTO dto = new GroupDTO();
			dto.setLsCode(rs.getString("LS_CODE"));
			dto.setLsList(rs.getString("LS_LIST"));
			
			result.add(dto);
		}
		
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	// 지역 분류 검색 
	public String searchLs(String lsList) throws SQLException
	{
		String result = "";
		
		String sql = "SELECT LS_CODE FROM LOCATION_SECOND WHERE LS_LIST = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, lsList);
		ResultSet rs = pstmt.executeQuery();
		if (rs.next())
		{
			result = rs.getString("LS_CODE");
		}
		
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	// 스터디룸별 후기 내역
	public ArrayList<CafeDTO> roomReview(String srCode) throws SQLException
	{
		ArrayList<CafeDTO> result = new ArrayList<CafeDTO>();
		
		String sql = "SELECT RV_CONTENT, RE_STARTDATE, RV_DATE, GU_NICK FROM VIEW_REVIEW WHERE ? IN (SELECT SR_CODE FROM STUDYROOM)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, srCode);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next())
		{
			CafeDTO dto = new CafeDTO();
			dto.setRvContent(rs.getString("RV_CONTENT"));
			dto.setRvDate(rs.getString("RV_DATE"));
			dto.setReStartDate(rs.getString("RE_STARTDATE"));
			dto.setGuNick(rs.getString("GU_NICK"));
			
			result.add(dto);
		}
		
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	// [스터디카페기준] 전체 예약내역 가격 조회
	public int cafeAllPrice(String code, String cfState) throws SQLException
	{
		int result = 0;
		String search = "";
		
		if (cfState.equals("cfAll"))
			search = "HO_CODE";
		else
			search = "SC_CODE";
		
		String sql = "SELECT NVL(SUM(SR_PRICE),0) AS PRICE FROM VIEW_RESERVE WHERE " +search+ " = ? AND SC_CODE NOT IN (SELECT SC_CODE FROM CAFEUNREG)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, code);
		ResultSet rs = pstmt.executeQuery();
		if (rs.next())
			result = rs.getInt("PRICE");
		
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	// [스터디카페기준] 이용상태에 따른 총액 조회
	public int cafeStatePrice(String code, String cfState, String state) throws SQLException
	{
		int result = 0;
		String search = "";
		
		if (cfState.equals("cfAll"))
			search = "HO_CODE";
		else
			search = "SC_CODE";
		
		
		String sql = "SELECT FB_STATE, NVL(SUM(SR_PRICE),0) AS PRICE FROM VIEW_RESERVE"
				+ " WHERE " + search + " = ? AND FB_STATE = ? AND SC_CODE NOT IN (SELECT SC_CODE FROM CAFEUNREG)"
				+ " GROUP BY FB_STATE";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, code);
		pstmt.setString(2, state);
		ResultSet rs = pstmt.executeQuery();
		if (rs.next())
			result = rs.getInt("PRICE");
		
		rs.close();
		pstmt.close();
		
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

		
}
