package com.test.mybatis;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

public interface IAdminStudyCafeDAO
{

	
	public StudyCafeDTO studyCafeInfo(String scCode);
	public ArrayList<StudyRoomDTO> studyRoomList(String scCode);
	public int studyRoomCount(String scCode);
	
	public void okCafe(HashMap<String, Object> map);
	public void notOkCafe(String scCode);
	
	public int cafeUnregCK(String scCode);
	public String cafeUnregDate(String scCode);
	
	
	// 페이징용
	public int boardTotalCnt(PaginationDTO pg);
	public ArrayList<StudyCafeDTO> boardListPaging(PaginationDTO pg);	
}
