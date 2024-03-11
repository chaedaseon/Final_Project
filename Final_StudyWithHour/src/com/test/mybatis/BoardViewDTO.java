package com.test.mybatis;

/*
게시판 테이블

CREATE TABLE BOARD
( BO_CODE       VARCHAR2(20)
, BO_DATE       DATE            DEFAULT SYSDATE
, BO_TITLE      VARCHAR2(100)   NOT NULL
, BO_CONTENT    VARCHAR2(4000)  NOT NULL
, BO_VIEW       NUMBER(5)       DEFAULT 0
, BO_MODATE     DATE            DEFAULT SYSDATE
, BO_FILE       VARCHAR2(320)
, BS_CODE       VARCHAR2(20)
, GU_CODE       VARCHAR2(20)
, CONSTRAINT BOARD_PK_BO_CODE PRIMARY KEY(BO_CODE)
, CONSTRAINT BOARD_FK_BS_CODE FOREIGN KEY(BS_CODE) REFERENCES BOARD_SECOND(BS_CODE)
, CONSTRAINT BOARD_FK_GU_CODE FOREIGN KEY(GU_CODE) REFERENCES GUEST(GU_CODE)
);
*/

public class BoardViewDTO
{
	private String boCode, boTitle, boContent, boFile, boDate, boWriter, boModate, bsCode; // 게시글 정보
	private String rpCode, rpDate, rpContent, rpModate, rpWriter, guCode;		   // 댓글 정보
	private String rreCode, rreDate, rreContent, rreModate, rreWriter;			   // 대댓글 정보
	private int no, boView, replyCount;											   // 게시글 순번, 조회수, 전체 댓글 수
	
	public String getBoFile()
	{
		return boFile;
	}
	public void setBoFile(String boFile)
	{
		this.boFile = boFile;
	}
	
	public String getGuCode()
	{
		return guCode;
	}
	public void setGuCode(String guCode)
	{
		this.guCode = guCode;
	}
	
	public String getRreCode()
	{
		return rreCode;
	}
	public void setRreCode(String rreCode)
	{
		this.rreCode = rreCode;
	}
	public String getRreDate()
	{
		return rreDate;
	}
	public void setRreDate(String rreDate)
	{
		this.rreDate = rreDate;
	}
	public String getRreContent()
	{
		return rreContent;
	}
	public void setRreContent(String rreContent)
	{
		this.rreContent = rreContent;
	}
	public String getRreModate()
	{
		return rreModate;
	}
	public void setRreModate(String rreModate)
	{
		this.rreModate = rreModate;
	}
	public String getRreWriter()
	{
		return rreWriter;
	}
	public void setRreWriter(String rreWriter)
	{
		this.rreWriter = rreWriter;
	}
	public String getRpWriter()
	{
		return rpWriter;
	}
	public void setRpWriter(String rpWriter)
	{
		this.rpWriter = rpWriter;
	}
	
	public String getRpCode()
	{
		return rpCode;
	}
	public void setRpCode(String rpCode)
	{
		this.rpCode = rpCode;
	}
	public String getRpDate()
	{
		return rpDate;
	}
	public void setRpDate(String rpDate)
	{
		this.rpDate = rpDate;
	}
	public String getRpContent()
	{
		return rpContent;
	}
	public void setRpContent(String rpContent)
	{
		this.rpContent = rpContent;
	}
	public String getRpModate()
	{
		return rpModate;
	}
	public void setRpModate(String rpModate)
	{
		this.rpModate = rpModate;
	}
	public String getBsCode()
	{
		return bsCode;
	}
	public void setBsCode(String bsCode)
	{
		this.bsCode = bsCode;
	}
	public int getReplyCount()
	{
		return replyCount;
	}
	public void setReplyCount(int replyCount)
	{
		this.replyCount = replyCount;
	}
	public String getBoCode()
	{
		return boCode;
	}
	public void setBoCode(String boCode)
	{
		this.boCode = boCode;
	}
	public String getBoTitle()
	{
		return boTitle;
	}
	public void setBoTitle(String boTitle)
	{
		this.boTitle = boTitle;
	}
	public String getBoContent()
	{
		return boContent;
	}
	public void setBoContent(String boContent)
	{
		this.boContent = boContent;
	}
	public String getBoDate()
	{
		return boDate;
	}
	public void setBoDate(String boDate)
	{
		this.boDate = boDate;
	}
	public String getBoWriter()
	{
		return boWriter;
	}
	public void setBoWriter(String boWriter)
	{
		this.boWriter = boWriter;
	}
	public String getBoModate()
	{
		return boModate;
	}
	public void setBoModate(String boModate)
	{
		this.boModate = boModate;
	}
	public int getNo()
	{
		return no;
	}
	public void setNo(int no)
	{
		this.no = no;
	}
	public int getBoView()
	{
		return boView;
	}
	public void setBoView(int boView)
	{
		this.boView = boView;
	}
}
