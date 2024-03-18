// GuestDTO.java

package com.study.mvc.model;

public class GuestDTO
{
	// 주요 속성 구성(Guest)
	
	// 회원&개인 정보 속성 구성
	private String guCode, guId, guPw, guNick, guDate, guCategoryCode, guName, guTel, guSsn, guEmail, gender, guCategoryList;
	private int age;
	
	// 이웃관리 속성 구성
	private String fmCode, fmDate, guFmNick, ftCode;
	
	// 회원&개인정보 getter/setter 구성
	public String getGuCode()
	{
		return guCode;
	}
	
	public void setGuCode(String guCode)
	{
		this.guCode = guCode;
	}
	
	public String getGuCategoryList()
	{
		return guCategoryList;
	}

	public void setGuCategoryList(String guCategoryList)
	{
		this.guCategoryList = guCategoryList;
	}

	public String getGender()
	{
		return gender;
	}

	public void setGender(String gender)
	{
		this.gender = gender;
	}

	public int getAge()
	{
		return age;
	}

	public void setAge(int age)
	{
		this.age = age;
	}

	public String getGuId()
	{
		return guId;
	}

	public void setGuId(String guId)
	{
		this.guId = guId;
	}

	public String getGuPw()
	{
		return guPw;
	}

	public void setGuPw(String guPw)
	{
		this.guPw = guPw;
	}

	public String getGuNick()
	{
		return guNick;
	}

	public void setGuNick(String guNick)
	{
		this.guNick = guNick;
	}

	public String getGuDate()
	{
		return guDate;
	}

	public void setGuDate(String guDate)
	{
		this.guDate = guDate;
	}

	public String getGuCategoryCode()
	{
		return guCategoryCode;
	}

	public void setGuCategoryCode(String guCategoryCode)
	{
		this.guCategoryCode = guCategoryCode;
	}

	public String getGuName()
	{
		return guName;
	}

	public void setGuName(String guName)
	{
		this.guName = guName;
	}

	public String getGuTel()
	{
		return guTel;
	}

	public void setGuTel(String guTel)
	{
		this.guTel = guTel;
	}

	public String getGuSsn()
	{
		return guSsn;
	}

	public void setGuSsn(String guSsn)
	{
		this.guSsn = guSsn;
	}

	public String getGuEmail()
	{
		return guEmail;
	}

	public void setGuEmail(String guEmail)
	{
		this.guEmail = guEmail;
	}
	
	// 이웃관리 getter/setter 구성
	public String getFmCode()
	{
		return fmCode;
	}

	public void setFmCode(String fmCode)
	{
		this.fmCode = fmCode;
	}

	public String getFmDate()
	{
		return fmDate;
	}

	public void setFmDate(String fmDate)
	{
		this.fmDate = fmDate;
	}

	public String getGuFmNick()
	{
		return guFmNick;
	}

	public void setGuFmNick(String guFmNick)
	{
		this.guFmNick = guFmNick;
	}

	public String getFtCode()
	{
		return ftCode;
	}

	public void setFtCode(String ftCode)
	{
		this.ftCode = ftCode;
	}
	
}
