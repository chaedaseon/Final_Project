package com.test.mybatis;

/*
게시글 테이블
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

public class CommunityBoardDTO
{
	private String boCode, boDate, boTitle, boContent, boMoDate, boFile, bsCode, boWriter, searchNum, searchTitle, searchNick; // 게시글 코드, 작성날짜, 제목, 내용, 마지막수정일, 업로드파일경로, 분류코드, 게스트코드
	private int no, boView, replyCount;
	
	public int getReplyCount()
	{
		return replyCount;
	}
	public void setReplyCount(int replyCount)
	{
		this.replyCount = replyCount;
	}
	public String getSearchTitle()
	{
		return searchTitle;
	}
	public void setSearchTitle(String searchTitle)
	{
		this.searchTitle = searchTitle;
	}
	public String getSearchNum()
	{
		return searchNum;
	}
	public void setSearchNum(String searchNum)
	{
		this.searchNum = searchNum;
	}
	public String getSearchNick()
	{
		return searchNick;
	}
	public void setSearchNick(String searchNick)
	{
		this.searchNick = searchNick;
	}
	public String getBoCode()
	{
		return boCode;
	}
	public void setBoCode(String boCode)
	{
		this.boCode = boCode;
	}
	public String getBoDate()
	{
		return boDate;
	}
	public int getNo()
	{
		return no;
	}
	public void setNo(int no)
	{
		this.no = no;
	}
	public void setBoDate(String boDate)
	{
		this.boDate = boDate;
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
	public String getBoMoDate()
	{
		return boMoDate;
	}
	public void setBoMoDate(String boMoDate)
	{
		this.boMoDate = boMoDate;
	}
	public String getBoFile()
	{
		return boFile;
	}
	public void setBoFile(String boFile)
	{
		this.boFile = boFile;
	}
	public String getBsCode()
	{
		return bsCode;
	}
	public void setBsCode(String bsCode)
	{
		this.bsCode = bsCode;
	}

	public String getBoWriter()
	{
		return boWriter;
	}
	public void setBoWriter(String boWriter)
	{
		this.boWriter = boWriter;
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
