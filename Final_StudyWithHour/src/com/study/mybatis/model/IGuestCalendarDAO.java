package com.study.mybatis.model;

import java.util.ArrayList;
import java.util.List;

public interface IGuestCalendarDAO
{
	// 게스트 캘린더
	public ArrayList<GuestCalendarDTO> scheduleList(String guCode);
	public ArrayList<GuestCalendarDTO> searchSchedule(String gu_code, String sch_date);
	public int scheduleAdd(GuestCalendarDTO guest);
	public int scheduleModify(GuestCalendarDTO guest);
	public int scheduleRemove(String guCode);
}
