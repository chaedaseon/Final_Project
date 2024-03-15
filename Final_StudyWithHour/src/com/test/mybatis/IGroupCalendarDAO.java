package com.test.mybatis;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public interface IGroupCalendarDAO
{
	// 그룹 캘린더
	public ArrayList<GroupCalendarDTO> groupScheduleList(String grCode);
	public ArrayList<GroupCalendarDTO> groupSearchSchedule(String grCode, String gschDate);
	public ArrayList<GuestDTO>	groupMemberSelect(String grCode);
	public String leadMember(String grCode, String guCode);
	public int groupScheduleAdd(GroupCalendarDTO group);
	public String getGschCode(String leadMemeber);
	public void attListInsert(HashMap<String, Object> memberMap);
	public ArrayList<String> attlMemberNick(String gschCode);
	public String getAddMember(HashMap<String, Object> mapCk);
	
	// 일정 삭제
	public void attMemDel(String gschCode);
	public void gschDel(String gschCode);
///	public int scheduleModify(GuestCalendarDTO guest);
//	public int scheduleRemove(String gu_Code);
}
