package com.study.mybatis.model;

/*
게시글 테이블
CREATE TABLE GROUP_BOARD
( GB_CODE       VARCHAR2(20)
, GB_DATE       DATE            DEFAULT SYSDATE
, GB_TITLE      VARCHAR2(100)   NOT NULL
, GB_CONTENT    VARCHAR2(4000)  NOT NULL
, GB_VIEW       NUMBER(5)       DEFAULT 0
, GB_MODATE     DATE            DEFAULT SYSDATE
, GB_FILE       VARCHAR2(320)
, GJ_CODE       VARCHAR2(20)
, CONSTRAINT GROUP_BOARD_PK_GB_CODE PRIMARY KEY(GB_CODE)
, CONSTRAINT GROUP_BOARD_FK_GJ_CODE FOREIGN KEY(GJ_CODE) REFERENCES GROUP_JOIN(GJ_CODE)
);

*/

public class GroupBoardDTO
{
	private String guCode, gbCode, gbDate, gbTitle, gbContent, gbMoDate, gbFile, bsCode, gbWriter, searchNum, searchTitle, searchNick; // 게시글 코드, 작성날짜, 제목, 내용, 마지막수정일, 업로드파일경로, 분류코드, 게스트코드
	private int no, gbView, replyCount;
	
	
	
	public String getGuCode()
	{
		return guCode;
	}
	public void setGuCode(String guCode)
	{
		this.guCode = guCode;
	}
	public String getGbCode()
	{
		return gbCode;
	}
	public void setGbCode(String gbCode)
	{
		this.gbCode = gbCode;
	}
	public String getGbDate()
	{
		return gbDate;
	}
	public void setGbDate(String gbDate)
	{
		this.gbDate = gbDate;
	}
	public String getGbTitle()
	{
		return gbTitle;
	}
	public void setGbTitle(String gbTitle)
	{
		this.gbTitle = gbTitle;
	}
	public String getGbContent()
	{
		return gbContent;
	}
	public void setGbContent(String gbContent)
	{
		this.gbContent = gbContent;
	}
	public String getGbMoDate()
	{
		return gbMoDate;
	}
	public void setGbMoDate(String gbMoDate)
	{
		this.gbMoDate = gbMoDate;
	}
	public String getGbFile()
	{
		return gbFile;
	}
	public void setGbFile(String gbFile)
	{
		this.gbFile = gbFile;
	}
	public String getBsCode()
	{
		return bsCode;
	}
	public void setBsCode(String bsCode)
	{
		this.bsCode = bsCode;
	}
	public String getGbWriter()
	{
		return gbWriter;
	}
	public void setGbWriter(String gbWriter)
	{
		this.gbWriter = gbWriter;
	}
	public String getSearchNum()
	{
		return searchNum;
	}
	public void setSearchNum(String searchNum)
	{
		this.searchNum = searchNum;
	}
	public String getSearchTitle()
	{
		return searchTitle;
	}
	public void setSearchTitle(String searchTitle)
	{
		this.searchTitle = searchTitle;
	}
	public String getSearchNick()
	{
		return searchNick;
	}
	public void setSearchNick(String searchNick)
	{
		this.searchNick = searchNick;
	}
	public int getNo()
	{
		return no;
	}
	public void setNo(int no)
	{
		this.no = no;
	}
	public int getGbView()
	{
		return gbView;
	}
	public void setGbView(int gbView)
	{
		this.gbView = gbView;
	}
	public int getReplyCount()
	{
		return replyCount;
	}
	public void setReplyCount(int replyCount)
	{
		this.replyCount = replyCount;
	}
}
