// ICalendarDAO.java
// - 인터페이스

package com.test.mybatis;

import java.util.ArrayList;

public interface ICalendarDAO
{
	public ArrayList<CalendarDTO> list(String gu_code);
	public int add(CalendarDTO calendar);
	public int remove(String schCode);
	public int modify(String schCode);
	
}
