package com.study.mybatis.model;

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

public class NoticeBoardDTO
{
	private String ntCode, ntTitle, ntContent, ntDate, ntWriter, ntModate, adCode;	// 공지사항 및 관리자 정보
	
	public String getAdCode()
	{
		return adCode;
	}
	public void setAdCode(String adCode)
	{
		this.adCode = adCode;
	}
	public String getNtModate()
	{
		return ntModate;
	}
	public void setNtModate(String ntModate)
	{
		this.ntModate = ntModate;
	}
	private int no, ntView;
	
	public String getNtCode()
	{
		return ntCode;
	}
	public void setNtCode(String ntCode)
	{
		this.ntCode = ntCode;
	}
	public String getNtTitle()
	{
		return ntTitle;
	}
	public void setNtTitle(String ntTitle)
	{
		this.ntTitle = ntTitle;
	}
	public String getNtContent()
	{
		return ntContent;
	}
	public void setNtContent(String ntContent)
	{
		this.ntContent = ntContent;
	}
	public String getNtDate()
	{
		return ntDate;
	}
	public void setNtDate(String ntDate)
	{
		this.ntDate = ntDate;
	}
	public int getNtView()
	{
		return ntView;
	}
	public void setNtView(int ntView)
	{
		this.ntView = ntView;
	}
	public String getNtWriter()
	{
		return ntWriter;
	}
	public void setNtWriter(String ntWriter)
	{
		this.ntWriter = ntWriter;
	}
	public int getNo()
	{
		return no;
	}
	public void setNo(int no)
	{
		this.no = no;
	}
}
