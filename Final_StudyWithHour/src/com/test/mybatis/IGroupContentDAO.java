package com.test.mybatis;

import java.util.ArrayList;
import java.util.HashMap;

public interface IGroupContentDAO
{

	public int joinGroupCK(HashMap<String, String> ckMap);
	public int ticketCount(String grCode);
	public ArrayList<GuestDTO> ticketList(HashMap<String, Object> listMap);
	
	// 휴공티켓 게시판 - 페이징용
	public int ticketBoardTotalCnt(String grCode);
	public ArrayList<GuestDTO> ticketBoardListPaging(PaginationDTO pg);	
}
