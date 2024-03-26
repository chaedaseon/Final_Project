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
	
	//회원 그룹가입요청코드 가져오기
	public String getGjCode(HashMap<String, String> map);
	//회원  그룹탈퇴 처리
	public void groupUnregInsert(HashMap<String, String> unregMap);
	
	// 디데이 불러올 일정 리스트
	//public ArrayList<GroupCalendarDTO> gschDdayList(String grCode);
	// 그룹 이름 가져오기
	public String getGroupName(String grCode);
}
