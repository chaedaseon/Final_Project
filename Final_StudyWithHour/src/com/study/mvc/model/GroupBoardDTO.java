package com.study.mvc.model;

public class GroupBoardDTO
{
	
	// 그룹 게시판, 댓글, 신고 관련 속성 구성
	private String guCode;
	
	// 그룹명
	private String grName;
	
	// 게시글 속성
	private String gbCode, gbDate, gbTitle, gbContent, gbModate, gbFile;
	private int gbView, replyCount;
	
	// 그룹 댓글 속성
	private String greCode, greDate, greContent, greModate;
	
	// 패널티 속성
	private String startDate, endDate, reason, reasonCode;
	private String grDate;
	
	// 그룹 스크랩 속성
	private String gbsCode, gbsDate, gjCode, guNick, guId;
	
	// 그룹 게시글 신고 속성
	private String gbrCode, gbrDate, gbrdDate, redstate;

	// 그룹 댓글 신고 속성
	private String grrCode, grrDate, grrdDate; 
	
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
	public String getGreCode()
	{
		return greCode;
	}
	public void setGreCode(String greCode)
	{
		this.greCode = greCode;
	}
	public String getGreDate()
	{
		return greDate;
	}
	public void setGreDate(String greDate)
	{
		this.greDate = greDate;
	}
	public String getGreContent()
	{
		return greContent;
	}
	public void setGreContent(String greContent)
	{
		this.greContent = greContent;
	}
	public String getGreModate()
	{
		return greModate;
	}
	public void setGreModate(String greModate)
	{
		this.greModate = greModate;
	}
	public String getReason()
	{
		return reason;
	}
	public void setReason(String reason)
	{
		this.reason = reason;
	}
	public String getStartDate()
	{
		return startDate;
	}
	public void setStartDate(String startDate)
	{
		this.startDate = startDate;
	}
	public String getEndDate()
	{
		return endDate;
	}
	public void setEndDate(String endDate)
	{
		this.endDate = endDate;
	}
	public String getGrDate()
	{
		return grDate;
	}
	public void setGrDate(String grDate)
	{
		this.grDate = grDate;
	}
	public String getReasonCode()
	{
		return reasonCode;
	}
	public void setReasonCode(String reasonCode)
	{
		this.reasonCode = reasonCode;
	}
	public String getGbsCode()
	{
		return gbsCode;
	}
	public void setGbsCode(String gbsCode)
	{
		this.gbsCode = gbsCode;
	}
	public String getGbsDate()
	{
		return gbsDate;
	}
	public void setGbsDate(String gbsDate)
	{
		this.gbsDate = gbsDate;
	}
	public String getGjCode()
	{
		return gjCode;
	}
	public void setGjCode(String gjCode)
	{
		this.gjCode = gjCode;
	}
	public String getGuNick()
	{
		return guNick;
	}
	public void setGuNick(String guNick)
	{
		this.guNick = guNick;
	}
	public String getGuId()
	{
		return guId;
	}
	public void setGuId(String guId)
	{
		this.guId = guId;
	}
	public String getGbrCode()
	{
		return gbrCode;
	}
	public void setGbrCode(String gbrCode)
	{
		this.gbrCode = gbrCode;
	}
	public String getGbrDate()
	{
		return gbrDate;
	}
	public void setGbrDate(String gbrDate)
	{
		this.gbrDate = gbrDate;
	}
	public String getGbrdDate()
	{
		return gbrdDate;
	}
	public void setGbrdDate(String gbrdDate)
	{
		this.gbrdDate = gbrdDate;
	}
	public String getRedstate()
	{
		return redstate;
	}
	public void setRedstate(String redstate)
	{
		this.redstate = redstate;
	}
	public String getGrrCode()
	{
		return grrCode;
	}
	public void setGrrCode(String grrCode)
	{
		this.grrCode = grrCode;
	}
	public String getGrrDate()
	{
		return grrDate;
	}
	public void setGrrDate(String grrDate)
	{
		this.grrDate = grrDate;
	}
	public String getGrrdDate()
	{
		return grrdDate;
	}
	public void setGrrdDate(String grrdDate)
	{
		this.grrdDate = grrdDate;
	}
	
	
	
}
