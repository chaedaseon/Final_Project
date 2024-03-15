package com.study.mybatis.model;

import java.util.ArrayList;
import java.util.HashMap;

public interface IAdminReportHostDAO
{
	public ArrayList<ReportBBSDTO> reportHostlist(int vNum);
	
	public ReportBBSDTO reportContentReview(String code); 
	public ReportBBSDTO reportContentUse(String code); 
	
	
	public String reviewContent(String code);
	public String getScCode(String recode);
	public String getScName(String sccode);
	
	
	public String userId(String gucode);
	public String hostId(String hocode);
	public String groupName(String grcode);
	public String getFile(String code);
	
	public void reportHostProcess(HashMap<String, String> map); 
	public String getGrCode(String hrCode);
	public int penaltyCount(String grCode);
	public String getGcCode(String grCode);
	
	public void groupBreak(String gcCode);
	
	public ArrayList<String> breakMemberList(String grCode);
	public void breakMemberUnreg(String gjCode);
	public String getBrCode(String gcCode);
	public void breakPenaltyMember(HashMap<String, Object> breakMap);
	
	
	// 패널티 갯수 확인, 3개 이상일 경우 계정 차단 위함
	public String getGucode(String gjCode);

	public int penaltyCountGuest(String guCode);
	public int joinGroupCount(String guCode);
	public ArrayList<String> joinGroupList(String guCode);
	public String searchLeaderCode(String gjCode);
	public String searchJoinDate(String gjCode);
	public void changeLeader(String updateLeaderCode);
	
	public int reservationCk(String gjCode);
	public ArrayList<String> reservationList(String gjCode);
	public void updateReservation(HashMap<String, Object> rsMap);
	
	public void unregMember(String gjCode);
	public void unregGuest(String guCode);	
	
	// 페이징용
	public int boardTotalCnt(PaginationDTO pg);
	public ArrayList<ReportBBSDTO> boardListPaging(PaginationDTO pg);		
	
}
