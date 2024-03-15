package com.study.mybatis.model;

import java.util.ArrayList;

public interface IAdminGuestDAO
{

	public GuestDTO guestInfo(String guCode);
	public ArrayList<StudyGroupDTO> runGroup(String guCode);
	public int penaltyCount(String guCode);
	public GuestDTO guestUnreg(String guCode);
	public int guestUnregCk(String guCode);
	
	
	// 테스트용
	public int boardTotalCnt(PaginationDTO pg);
	public ArrayList<GuestDTO> boardListPaging(PaginationDTO pg);
}
