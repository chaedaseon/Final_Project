package com.study.mybatis.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface IAdminStudyGroupDAO
{
	public ArrayList<StudyGroupDTO> studyGroupList(int vNum);
	public int count();
	public ArrayList<StudyGroupDTO> searchList(HashMap<String, Object> map);
	
	public StudyGroupDTO studyGroupInfo(String grCode);
	public int groupPenaltyCount(String grCode);
	public String leaderCode(String grCode);
	public String leaderId(String leaderCode);
	
	public String locationFirst(String lfCode);
	public String locationSecond(String lsCode);
	
	public ArrayList<GuestDTO> groupMember(String grCode);
	public int groupCount(String grCode);
	
	public StudyGroupDTO groupUnreg(String grCode);
	public ArrayList<Map<String, Object>> groupRecord(String grCode);
	
	
	// 페이징용
	public int boardTotalCnt(PaginationDTO pg);
	public ArrayList<StudyGroupDTO> boardListPaging(PaginationDTO pg);	
}
