package com.test.mvc;

public class GroupBoardDTO
{
	
	// 그룹 게시판, 댓글, 신고 관련 속성 구성
	
	private String guCode;
	
	// 그룹명
	private String grName;
	
	// 게시글 속성
	private String gbCode, gbDate, gbTitle, gbContent, gbModate, gbFile;
	private int gbView, replyCount;
	
	
	// getter / setter 구성
	public String getGuCode()
	{
		return guCode;
	}
	public void setGuCode(String guCode)
	{
		this.guCode = guCode;
	}
	public String getGrName()
	{
		return grName;
	}
	public void setGrName(String grName)
	{
		this.grName = grName;
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
	public int getGbView()
	{
		return gbView;
	}
	public void setGbView(int gbView)
	{
		this.gbView = gbView;
	}
	public String getGbModate()
	{
		return gbModate;
	}
	public void setGbModate(String gbModate)
	{
		this.gbModate = gbModate;
	}
	public String getGbFile()
	{
		return gbFile;
	}
	public void setGbFile(String gbFile)
	{
		this.gbFile = gbFile;
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
