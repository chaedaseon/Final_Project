package com.test.mybatis;

import java.util.ArrayList;
import java.util.List;

public interface IGuestCalendarDAO
{
	// 게스트 캘린더
	public List<GuestCalendarDTO> calendarList(String guCode);
	public ArrayList<GuestCalendarDTO> scheduleList(String guCode);
	public int calendarAdd(GuestCalendarDTO calendar);
	public int calendarRemove(String schCode);
	public int calendarModify(String schCode);
	
}
