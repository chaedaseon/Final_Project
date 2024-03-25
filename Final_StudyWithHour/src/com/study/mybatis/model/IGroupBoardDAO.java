package com.study.mybatis.model;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

public interface IGroupBoardDAO
{
	// 페이징용
	public int boardTotalCnt(PaginationDTO pg);
	public ArrayList<GroupBoardDTO> boardListPaging(PaginationDTO pg);		


}
