package com.study.mybatis.model;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

public interface IGroupBoardDAO
{
	// 페이징용
	public int boardTotalCnt(PaginationDTO pg);
	public ArrayList<GroupBoardDTO> boardListPaging(PaginationDTO pg);
	// 상세 페이지
	public ArrayList<GroupBoardDTO> groupBoardViewList(String gbCode);
	public int boardView(String gbCode);
	public int increaseBoardView(String gbCode, int gbView);
	public int replyCount(String gbCode);
	public ArrayList<GroupBoardDTO> replyList(String gbCode);
	public String selectGjCode(String gu_code, String gr_code);
	public int addReply(GroupBoardDTO dto);
}
