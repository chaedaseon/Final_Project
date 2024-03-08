// CalendarDTO.java
// - 데이터 저장 및 전송 전용 객체

package com.test.mybatis;

public class CalendarDTO
{
	private String sch_code, sch_date, sch_name, sch_content, sch_regdate, gu_code;

	public String getSch_code()
	{
		return sch_code;
	}

	public void setSch_code(String sch_code)
	{
		this.sch_code = sch_code;
	}

	public String getSch_date()
	{
		return sch_date;
	}

	public void setSch_date(String sch_date)
	{
		this.sch_date = sch_date;
	}

	public String getSch_name()
	{
		return sch_name;
	}

	public void setSch_name(String sch_name)
	{
		this.sch_name = sch_name;
	}

	public String getSch_content()
	{
		return sch_content;
	}

	public void setSch_content(String sch_content)
	{
		this.sch_content = sch_content;
	}

	public String getSch_regdate()
	{
		return sch_regdate;
	}

	public void setSch_regdate(String sch_regdate)
	{
		this.sch_regdate = sch_regdate;
	}

	public String getGu_code()
	{
		return gu_code;
	}

	public void setGu_code(String gu_code)
	{
		this.gu_code = gu_code;
	}
	
	
}
