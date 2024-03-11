package com.test.mybatis;

/*
공지사항 테이블
CREATE TABLE NOTICE
( NT_CODE       VARCHAR2(20)
, NT_TITLE      VARCHAR2(100)   NOT NULL
, NT_CONTENT    VARCHAR2(4000)  NOT NULL
, NT_DATE       DATE            DEFAULT SYSDATE
, NT_VIEW       NUMBER(5)       DEFAULT 0
, NT_MODATE     DATE            DEFAULT SYSDATE
, AD_CODE       VARCHAR2(20)
, CONSTRAINT NOTICE_PK_NT_CODE PRIMARY KEY(NT_CODE)
, CONSTRAINT NOTICE_FK_AD_CODE FOREIGN KEY(AD_CODE) REFERENCES ADMIN(AD_CODE)
);

*/

public class BoardStudyGroupDTO
{
	private String grCode, guCode, grDate, grName, grSubject, grComment, grLeader, age, gender, lsCode, category, grOpen;
	private int no, grCount, dDay;
	
	
	public String getGuCode()
	{
		return guCode;
	}
	public void setGuCode(String guCode)
	{
		this.guCode = guCode;
	}
	public String getGrCode()
	{
		return grCode;
	}
	public void setGrCode(String grCode)
	{
		this.grCode = grCode;
	}
	public String getGrDate()
	{
		return grDate;
	}
	public void setGrDate(String grDate)
	{
		this.grDate = grDate;
	}
	public String getGrName()
	{
		return grName;
	}
	public void setGrName(String grName)
	{
		this.grName = grName;
	}
	public String getGrSubject()
	{
		return grSubject;
	}
	public void setGrSubject(String grSubject)
	{
		this.grSubject = grSubject;
	}
	public String getGrComment()
	{
		return grComment;
	}
	public void setGrComment(String grComment)
	{
		this.grComment = grComment;
	}
	public String getGrLeader()
	{
		return grLeader;
	}
	public void setGrLeader(String grLeader)
	{
		this.grLeader = grLeader;
	}
	public String getAge()
	{
		return age;
	}
	public void setAge(String age)
	{
		this.age = age;
	}
	public String getGender()
	{
		return gender;
	}
	public void setGender(String gender)
	{
		this.gender = gender;
	}
	public String getLsCode()
	{
		return lsCode;
	}
	public void setLsCode(String lsCode)
	{
		this.lsCode = lsCode;
	}
	public String getCategory()
	{
		return category;
	}
	public void setCategory(String category)
	{
		this.category = category;
	}
	public String getGrOpen()
	{
		return grOpen;
	}
	public void setGrOpen(String grOpen)
	{
		this.grOpen = grOpen;
	}
	public int getNo()
	{
		return no;
	}
	public void setNo(int no)
	{
		this.no = no;
	}
	public int getGrCount()
	{
		return grCount;
	}
	public void setGrCount(int grCount)
	{
		this.grCount = grCount;
	}
	public int getdDay()
	{
		return dDay;
	}
	public void setdDay(int dDay)
	{
		this.dDay = dDay;
	}
	
	
}
