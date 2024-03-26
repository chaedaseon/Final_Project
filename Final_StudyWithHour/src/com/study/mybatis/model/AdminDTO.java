package com.study.mybatis.model;

public class AdminDTO
{
	//관리자 정보
	private String adCode, adPw, adNick, adDate, adUndate;
	
	// getter/setter 구성
	public String getAdCode()
	{
		return adCode;
	}

	public void setAdCode(String adCode)
	{
		this.adCode = adCode;
	}

	public String getAdPw()
	{
		return adPw;
	}

	public void setAdPw(String adPw)
	{
		this.adPw = adPw;
	}

	public String getAdNick()
	{
		return adNick;
	}

	public void setAdNick(String adNick)
	{
		this.adNick = adNick;
	}

	public String getAdDate()
	{
		return adDate;
	}

	public void setAdDate(String adDate)
	{
		this.adDate = adDate;
	}
	
	
	public String getAdUndate()
	{
		return adUndate;
	}
	
	public void setAdUndate(String adUndate)
	{
		this.adUndate = adUndate;
	}
	
	
}
