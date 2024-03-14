package com.test.mvc;

public class GuestBoardDTO
{
	// 전체 게시판, 댓글, 신고 관련 속성 구성
	// 게시판
	private String guCode, boCode, boDate, boTitle, boContent, boModate, boFile, bsList, bfList;
	private String borCode, borDate, reasonCode, reason, redstate;
	private String brdCode, brdDate, redCode;
	private int boView;
	
	// 댓글
	private String rpCode, rpDate, rpContent, rpModate;
	private String brCode, brDate;
	private String rrdCode, rrdDate;
	private int replyCount;
	
	// 대댓글
	private String rreCode, rreContent, rreDate, rrdModate;
	private String rerCode, rerDate;
	private String rerdCode, rerdDate;
	
	// 스크랩
	private String scrapCode, scrapDate, guNick, guId;
	
	// getter / setter 구성
	public String getGuCode()
	{
		return guCode;
	}
	public void setGuCode(String guCode)
	{
		this.guCode = guCode;
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
	public int getBoView()
	{
		return boView;
	}
	public void setBoView(int boView)
	{
		this.boView = boView;
	}
	public String getBoModate()
	{
		return boModate;
	}
	public void setBoModate(String boModate)
	{
		this.boModate = boModate;
	}
	public String getBoFile()
	{
		return boFile;
	}
	public void setBoFile(String boFile)
	{
		this.boFile = boFile;
	}
	public String getBsList()
	{
		return bsList;
	}
	public void setBsList(String bsList)
	{
		this.bsList = bsList;
	}
	public String getBorCode()
	{
		return borCode;
	}
	public void setBorCode(String borCode)
	{
		this.borCode = borCode;
	}
	public String getBorDate()
	{
		return borDate;
	}
	public void setBorDate(String borDate)
	{
		this.borDate = borDate;
	}
	public String getReasonCode()
	{
		return reasonCode;
	}
	public void setReasonCode(String reasonCode)
	{
		this.reasonCode = reasonCode;
	}
	public String getReason()
	{
		return reason;
	}
	public void setReason(String reason)
	{
		this.reason = reason;
	}
	public String getRedstate()
	{
		return redstate;
	}
	public void setRedstate(String redstate)
	{
		this.redstate = redstate;
	}
	public String getBrdCode()
	{
		return brdCode;
	}
	public void setBrdCode(String brdCode)
	{
		this.brdCode = brdCode;
	}
	public String getBrdDate()
	{
		return brdDate;
	}
	public void setBrdDate(String brdDate)
	{
		this.brdDate = brdDate;
	}
	public String getRedCode()
	{
		return redCode;
	}
	public void setRedCode(String redCode)
	{
		this.redCode = redCode;
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
	public String getBrCode()
	{
		return brCode;
	}
	public void setBrCode(String brCode)
	{
		this.brCode = brCode;
	}
	public String getBrDate()
	{
		return brDate;
	}
	public void setBrDate(String brDate)
	{
		this.brDate = brDate;
	}
	public String getRrdCode()
	{
		return rrdCode;
	}
	public void setRrdCode(String rrdCode)
	{
		this.rrdCode = rrdCode;
	}
	public String getRrdDate()
	{
		return rrdDate;
	}
	public void setRrdDate(String rrdDate)
	{
		this.rrdDate = rrdDate;
	}
	public String getRreCode()
	{
		return rreCode;
	}
	public void setRreCode(String rreCode)
	{
		this.rreCode = rreCode;
	}
	public String getRreContent()
	{
		return rreContent;
	}
	public void setRreContent(String rreContent)
	{
		this.rreContent = rreContent;
	}
	public String getRreDate()
	{
		return rreDate;
	}
	public void setRreDate(String rreDate)
	{
		this.rreDate = rreDate;
	}
	public String getRrdModate()
	{
		return rrdModate;
	}
	public void setRrdModate(String rrdModate)
	{
		this.rrdModate = rrdModate;
	}
	public String getRerCode()
	{
		return rerCode;
	}
	public void setRerCode(String rerCode)
	{
		this.rerCode = rerCode;
	}
	public String getRerDate()
	{
		return rerDate;
	}
	public void setRerDate(String rerDate)
	{
		this.rerDate = rerDate;
	}
	public String getRerdCode()
	{
		return rerdCode;
	}
	public void setRerdCode(String rerdCode)
	{
		this.rerdCode = rerdCode;
	}
	public String getRerdDate()
	{
		return rerdDate;
	}
	public void setRerdDate(String rerdDate)
	{
		this.rerdDate = rerdDate;
	}
	public String getBfList()
	{
		return bfList;
	}
	public void setBfList(String bfList)
	{
		this.bfList = bfList;
	}
	
	public int getReplyCount()
	{
		return replyCount;
	}
	public void setReplyCount(int replyCount)
	{
		this.replyCount = replyCount;
	}
	public String getScrapCode()
	{
		return scrapCode;
	}
	public void setScrapCode(String scrapCode)
	{
		this.scrapCode = scrapCode;
	}
	public String getScrapDate()
	{
		return scrapDate;
	}
	public void setScrapDate(String scrapDate)
	{
		this.scrapDate = scrapDate;
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
	
	
	
	
	
}
