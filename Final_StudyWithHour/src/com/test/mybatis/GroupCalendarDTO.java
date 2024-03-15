package com.test.mybatis;

public class GroupCalendarDTO
{
	// 그룹 캘린더 속성 구성
	private String gschCode, gschName, gschDate, startHour , endHour , content, location, leadMember, attCk, gschType;
	private String memberListNickName;

	//getter setter 구성
	public String getGschCode()
	{
		return gschCode;
	}

	public String getMemberListNickName()
	{
		return memberListNickName;
	}

	public void setMemberListNickName(String memberListNickName)
	{
		this.memberListNickName = memberListNickName;
	}

	public void setGschCode(String gschCode)
	{
		this.gschCode = gschCode;
	}

	public String getGschName()
	{
		return gschName;
	}

	public void setGschName(String gschName)
	{
		this.gschName = gschName;
	}

	public String getGschDate()
	{
		return gschDate;
	}

	public void setGschDate(String gschDate)
	{
		this.gschDate = gschDate;
	}

	public String getStartHour()
	{
		return startHour;
	}

	public void setStartHour(String startHour)
	{
		this.startHour = startHour;
	}

	public String getEndHour()
	{
		return endHour;
	}

	public void setEndHour(String endHour)
	{
		this.endHour = endHour;
	}

	public String getContent()
	{
		return content;
	}

	public void setContent(String content)
	{
		this.content = content;
	}

	public String getLocation()
	{
		return location;
	}

	public void setLocation(String location)
	{
		this.location = location;
	}

	public String getLeadMember()
	{
		return leadMember;
	}

	public void setLeadMember(String leadMember)
	{
		this.leadMember = leadMember;
	}

	public String getAttCk()
	{
		return attCk;
	}

	public void setAttCk(String attCk)
	{
		this.attCk = attCk;
	}

	public String getGschType()
	{
		return gschType;
	}

	public void setGschType(String gschType)
	{
		this.gschType = gschType;
	}
	
	
	
}
