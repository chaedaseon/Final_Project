/*============================
	CafeDTO.java
	- 스터디카페 관련 DTO
============================*/

package com.study.mvc.model;

public class CafeDTO
{
	// 주요 속성 구성 ----------------------------------------------------------------------------------------
	// 페이지 번호 속성
	private String rNum;
	
	// 스터디카페 정보 관련 속성 → StudyCafe 테이블
	private String scCode, scName, scAddr1, scAddr2, scTel, scOpenHour, scCloseHour, scConvenient
		, scSurround, scCaution, scDetail, scResnumber, scDate, scFile, adPerDate, hoCode, adCode, adChCode;						
	
	// 스터디카페 예약 관련 속성 → Reservation 테이블
	private String reCode, reStartDate, reStartHour, reEndHour, reState;
	int reCount;
	
	// 예약자 관련 속성 
	private String guNick, gjCode, grName, guId;
	
	// 피드백 관련 속성 → Feedback 테이블
	private String fbCode, fbState, fbStateCode;	
	
	// 스터디카페 후기 관련 속성 → Review 테이블
	private String rvCode, rvContent, rvDate;
	
	// 스터디룸 관련 속성 → StudyRoom 테이블
	private String srCode, srName;
	private int srCount, srPrice;
	
	// 호스트 신고 관련 속성 → Host_Red 테이블
	private String hrCode, hrDate, reasonCode, redCode, hrdDate, reason, redState, grCode, hrState;
	
	
	
	
	
	// getter / setter 구성 -------------------------------------------------------------------------------------		
	public String getScCode()
	{
		return scCode;
	}
	
	public void setScCode(String scCode)
	{
		this.scCode = scCode;
	}

	public int getReCount()
	{
		return reCount;
	}

	public void setReCount(int reCount)
	{
		this.reCount = reCount;
	}

	public String getHrDate()
	{
		return hrDate;
	}

	public void setHrDate(String hrDate)
	{
		this.hrDate = hrDate;
	}

	public String getReasonCode()
	{
		return reasonCode;
	}

	public void setReasonCode(String reasonCode)
	{
		this.reasonCode = reasonCode;
	}

	public String getRedCode()
	{
		return redCode;
	}

	public void setRedCode(String redCode)
	{
		this.redCode = redCode;
	}

	public String getHrdDate()
	{
		return hrdDate;
	}

	public void setHrdDate(String hrdDate)
	{
		this.hrdDate = hrdDate;
	}

	public String getReason()
	{
		return reason;
	}

	public void setReason(String reason)
	{
		this.reason = reason;
	}

	public String getRedState()
	{
		return redState;
	}

	public void setRedState(String redState)
	{
		this.redState = redState;
	}

	public String getGrCode()
	{
		return grCode;
	}

	public void setGrCode(String grCode)
	{
		this.grCode = grCode;
	}

	public String getHrState()
	{
		return hrState;
	}

	public void setHrState(String hrState)
	{
		this.hrState = hrState;
	}

	public String getSrCode()
	{
		return srCode;
	}

	public void setSrCode(String srCode)
	{
		this.srCode = srCode;
	}

	public int getSrCount()
	{
		return srCount;
	}

	public void setSrCount(int srCount)
	{
		this.srCount = srCount;
	}

	public int getSrPrice()
	{
		return srPrice;
	}

	public void setSrPrice(int srPrice)
	{
		this.srPrice = srPrice;
	}

	public String getRvCode()
	{
		return rvCode;
	}

	public void setRvCode(String rvCode)
	{
		this.rvCode = rvCode;
	}

	public String getRvContent()
	{
		return rvContent;
	}

	public void setRvContent(String rvContent)
	{
		this.rvContent = rvContent;
	}

	public String getRvDate()
	{
		return rvDate;
	}

	public void setRvDate(String rvDate)
	{
		this.rvDate = rvDate;
	}

	public String getReCode()
	{
		return reCode;
	}

	public void setReCode(String reCode)
	{
		this.reCode = reCode;
	}

	public String getReStartDate()
	{
		return reStartDate;
	}

	public void setReStartDate(String reStartDate)
	{
		this.reStartDate = reStartDate;
	}

	public String getReStartHour()
	{
		return reStartHour;
	}

	public void setReStartHour(String reStartHour)
	{
		this.reStartHour = reStartHour;
	}

	public String getReEndHour()
	{
		return reEndHour;
	}

	public void setReEndHour(String reEndHour)
	{
		this.reEndHour = reEndHour;
	}

	public String getReState()
	{
		return reState;
	}

	public void setReState(String reState)
	{
		this.reState = reState;
	}

	public String getSrName()
	{
		return srName;
	}

	public void setSrName(String srName)
	{
		this.srName = srName;
	}

	public String getGuNick()
	{
		return guNick;
	}

	public void setGuNick(String guNick)
	{
		this.guNick = guNick;
	}

	public String getGjCode()
	{
		return gjCode;
	}

	public void setGjCode(String gjCode)
	{
		this.gjCode = gjCode;
	}

	public String getGrName()
	{
		return grName;
	}

	public void setGrName(String grName)
	{
		this.grName = grName;
	}

	public String getGuId()
	{
		return guId;
	}

	public void setGuId(String guId)
	{
		this.guId = guId;
	}

	public String getHrCode()
	{
		return hrCode;
	}

	public void setHrCode(String hrCode)
	{
		this.hrCode = hrCode;
	}

	public String getFbCode()
	{
		return fbCode;
	}

	public void setFbCode(String fbCode)
	{
		this.fbCode = fbCode;
	}

	public String getFbState()
	{
		return fbState;
	}

	public void setFbState(String fbState)
	{
		this.fbState = fbState;
	}

	public String getFbStateCode()
	{
		return fbStateCode;
	}

	public void setFbStateCode(String fbStateCode)
	{
		this.fbStateCode = fbStateCode;
	}

	public String getrNum()
	{
		return rNum;
	}

	public void setrNum(String rNum)
	{
		this.rNum = rNum;
	}


	public String getScName()
	{
		return scName;
	}

	public void setScName(String scName)
	{
		this.scName = scName;
	}

	public String getScAddr1()
	{
		return scAddr1;
	}

	public void setScAddr1(String scAddr1)
	{
		this.scAddr1 = scAddr1;
	}

	public String getScAddr2()
	{
		return scAddr2;
	}

	public void setScAddr2(String scAddr2)
	{
		this.scAddr2 = scAddr2;
	}

	public String getScTel()
	{
		return scTel;
	}

	public void setScTel(String scTel)
	{
		this.scTel = scTel;
	}

	public String getScOpenHour()
	{
		return scOpenHour;
	}

	public void setScOpenHour(String scOpenHour)
	{
		this.scOpenHour = scOpenHour;
	}

	public String getScCloseHour()
	{
		return scCloseHour;
	}

	public void setScCloseHour(String scCloseHour)
	{
		this.scCloseHour = scCloseHour;
	}

	public String getScConvenient()
	{
		return scConvenient;
	}

	public void setScConvenient(String scConvenient)
	{
		this.scConvenient = scConvenient;
	}

	public String getScSurround()
	{
		return scSurround;
	}

	public void setScSurround(String scSurround)
	{
		this.scSurround = scSurround;
	}

	public String getScCaution()
	{
		return scCaution;
	}

	public void setScCaution(String scCaution)
	{
		this.scCaution = scCaution;
	}

	public String getScDetail()
	{
		return scDetail;
	}

	public void setScDetail(String scDetail)
	{
		this.scDetail = scDetail;
	}

	public String getScResnumber()
	{
		return scResnumber;
	}

	public void setScResnumber(String scResnumber)
	{
		this.scResnumber = scResnumber;
	}

	public String getScDate()
	{
		return scDate;
	}

	public void setScDate(String scDate)
	{
		this.scDate = scDate;
	}

	public String getScFile()
	{
		return scFile;
	}

	public void setScFile(String scFile)
	{
		this.scFile = scFile;
	}

	public String getAdPerDate()
	{
		return adPerDate;
	}

	public void setAdPerDate(String adPerDate)
	{
		this.adPerDate = adPerDate;
	}

	public String getHoCode()
	{
		return hoCode;
	}

	public void setHoCode(String hoCode)
	{
		this.hoCode = hoCode;
	}

	public String getAdCode()
	{
		return adCode;
	}

	public void setAdCode(String adCode)
	{
		this.adCode = adCode;
	}

	public String getAdChCode()
	{
		return adChCode;
	}

	public void setAdChCode(String adChCode)
	{
		this.adChCode = adChCode;
	}
	
	
}
