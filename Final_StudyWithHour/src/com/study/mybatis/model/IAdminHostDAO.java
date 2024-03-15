package com.study.mybatis.model;

import java.util.ArrayList;

public interface IAdminHostDAO
{
	public ArrayList<HostDTO> hostList(int vNum);
	public int count();
	public HostDTO hostInfo(String hoCode);
	public ArrayList<StudyCafeDTO> manageCafe(String hoCode);

	
	// 테스트용
	public int boardTotalCnt(PaginationDTO pg);
	public ArrayList<NoticeDTO> boardListPaging(PaginationDTO pg);	
}
