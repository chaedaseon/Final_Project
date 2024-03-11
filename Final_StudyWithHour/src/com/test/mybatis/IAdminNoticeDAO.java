package com.test.mybatis;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

public interface IAdminNoticeDAO
{
	//public ArrayList<NoticeDTO> list(int vNum);
	//public ArrayList<NoticeDTO> searchList(HashMap<String, Object> map);
	//public int count();
	public int searchCount(HashMap<String, Object> map);
	public int add(NoticeDTO dto);
	public int modify(NoticeDTO dto);
	public int remove(String ntCode);

	
	// 테스트용
	public int boardTotalCnt(PaginationDTO pg);
	public ArrayList<NoticeDTO> boardListPaging(PaginationDTO pg);
}
