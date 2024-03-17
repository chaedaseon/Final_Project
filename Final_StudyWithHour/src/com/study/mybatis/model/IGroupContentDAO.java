package com.study.mybatis.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public interface IGroupContentDAO
{

	public int joinGroupCK(HashMap<String, String> ckMap);
	public int ticketCount(String grCode);
	public ArrayList<GuestDTO> ticketList(HashMap<String, Object> listMap);
	
	// 휴공티켓 게시판 - 페이징용
	public int ticketBoardTotalCnt(String grCode);
	public ArrayList<GuestDTO> ticketBoardListPaging(PaginationDTO pg);	
	
	//최근 게시물
	public ArrayList<GroupBoardDTO> lastestGroupBoard(String grCode);
	//최근 그룹 이력
	public ArrayList<Map<String, Object>> lastestGroupRecord(String grCode);
	//그룹장 닉네임 가져오기
	public String getLeaderNick(String grCode);
	//그룹원 닉네임 가져오기
	public ArrayList<String> getMemberNick(String grCode);
}
