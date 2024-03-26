package com.study.mybatis.model;

import java.util.ArrayList;
import java.util.HashMap;

public interface IAdminReportGroupBBSDAO
{
	public ArrayList<ReportBBSDTO> groupBBSlist(int vNum);
	public ReportBBSDTO reportContent(HashMap<String, Object> map); 
	
	public String userId(String gjCode);
	public String userGucode(String gjCode);
	
	public String replyBoardCode(String greCode);
	
	public String boardTitle(String gbCode);
	
	public void groupBBSReportProcess(HashMap<String, Object> map);
	
	//-- 패널티 3개일 경우 진행하는 코드
	public int penaltyCount(String guCode);
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
