package com.study.mvc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.study.util.DBConn;

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
	
	// 현재 활동중인 그룹 리스트 출력 실행
	public ArrayList<GuestGroupDTO> groupActiveList(String guCode) throws SQLException
	{
		ArrayList<GuestGroupDTO> result = new ArrayList<GuestGroupDTO>();
		
		String sql  = "SELECT GJ.GJ_CODE AS GJ_CODE, GJ.GJ_DATE AS GJ_DATE, GJ.GU_CODE AS GU_CODE"
				    + ", GJ.GR_CODE AS GR_CODE, GR.GR_NAME AS GR_NAME, GR.GR_COUNT AS GR_COUNT"
				    + ", GR.GR_SUBJECT AS GR_SUBJECT, A.AGE_RANGE AS AGE_RANGE, G.GENDER_RANGE AS GENDER_RANGE"
				    + ", C.CATEGORY_LIST AS CATEGORY_LIST, L.LS_LIST AS LS_LIST"
				    + " FROM GROUP_JOIN GJ"
				    + " JOIN GROUP_REGISTRATION GR ON GJ.GR_CODE = GR.GR_CODE"
				    + " JOIN GROUP_CONFIRM GC ON GC.GR_CODE = GR.GR_CODE"
				    + " JOIN REGISTRATION_STATE RS ON RS.RS_CODE = GC.RS_CODE"
				    + " JOIN GENDER G ON G.GENDER_CODE = GR.GENDER_CODE"
				    + " JOIN LOCATION_SECOND L ON L.LS_CODE = GR.LS_CODE"
				    + " JOIN AGE A ON A.AGE_CODE = GR.AGE_CODE"
				    + " JOIN CATEGORY C ON C.CATEGORY_CODE = GR.CATEGORY_CODE" 
				    + " WHERE GJ.GU_CODE= ?"
				    + " AND RS.RS_CODE = '1'"
				    + " AND GJ.GJ_CODE NOT IN (SELECT GJ_CODE FROM GROUP_UNREG)"
				    + " AND GC.GC_CODE NOT IN (SELECT GC_CODE FROM BREAK)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, guCode);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			GuestGroupDTO dto = new GuestGroupDTO();
			
			dto.setGjCode(rs.getString("GJ_CODE"));
			dto.setGjDate(rs.getString("GJ_DATE"));
			dto.setGuCode(rs.getString("GU_CODE"));
			dto.setGrCode(rs.getString("GR_CODE"));
			dto.setGrName(rs.getString("GR_NAME"));
			dto.setGrCount(rs.getInt("GR_COUNT"));
			dto.setAgeRange(rs.getString("AGE_RANGE"));
			dto.setGenderRange(rs.getString("GENDER_RANGE"));
			dto.setCategoryList(rs.getString("CATEGORY_LIST"));
			dto.setLsList(rs.getString("LS_LIST"));
			
			result.add(dto);
		}
		
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	// 그룹 개설 요청 리스트 출력
	/*
	public ArrayList<GuestGroupDTO> groupOpenList(String guCode)
	{
		ArrayList<GuestGroupDTO> result = new ArrayList<GuestGroupDTO>();
		
		String sql = "";
		
	}
	*/
	
	
	
	// 그룹 가입 신청 이력 리스트 출력 실행
	public ArrayList<GuestGroupDTO> groupJoinList(String guCode) throws SQLException
	{
		ArrayList<GuestGroupDTO> result = new ArrayList<GuestGroupDTO>();
		
		String sql = "SELECT GJ_CODE, GJ_DATE, GR_DATE, GU_CODE, GR_CODE, GR_NAME, GR_COUNT, GR_SUBJECT, RS_STATE"
				   + ", CATEGORY_LIST, BR_DATE, BR_REASON_CODE, GUN_CODE, GUN_DATE, GUN_REASON_CODE, GUR_DATE"
				   + " FROM GROUP_JOIN_LIST_VIEW"
				   + " WHERE GU_CODE=?";		
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, guCode);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			GuestGroupDTO dto = new GuestGroupDTO();
			
			dto.setGjCode(rs.getString("GJ_CODE"));
			dto.setGjDate(rs.getString("GJ_DATE"));
			dto.setGrDate(rs.getString("GR_DATE"));
			dto.setGuCode(rs.getString("GU_CODE"));
			dto.setGrCode(rs.getString("GR_CODE"));
			dto.setGrName(rs.getString("GR_NAME"));
			dto.setGrCount(rs.getInt("GR_COUNT"));
			dto.setGrSubject(rs.getString("GR_SUBJECT"));
			dto.setRsState(rs.getString("RS_STATE"));
			dto.setCategoryList(rs.getString("CATEGORY_LIST"));
			dto.setBrDate(rs.getString("BR_DATE"));
			dto.setBrReasonCode(rs.getString("BR_REASON_CODE"));
			dto.setGunCode(rs.getString("GUN_CODE"));
			dto.setGunDate(rs.getString("GUN_DATE"));
			dto.setGunReasonCode(rs.getString("GUN_REASON_CODE"));
			dto.setGurDate(rs.getString("GUR_DATE"));
			
			result.add(dto);
			
		}
		
		rs.close();
		pstmt.close();
		
		return result;
		
	}
	
	
}
