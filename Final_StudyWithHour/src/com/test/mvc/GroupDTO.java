/*=====================
	GroupReserveDTO.java
	- 스터디그룹예약 DTO
=====================*/

package com.test.mvc;

public class GroupDTO
{
	// 주요 속성 구성 -----------------------------------------------------------------------------
	// 페이지 번호 속성
	private String rNum;
	
	// 스터디카페예약 관련 속성
	private String reCode, reStartDate, reStartHour, reEndHour, reState;	
	private int reCount;
	
	// 이용피드백 관련 속성
	private String fbCode, fbState, fbStateCode;		
	
	// 스터디카페 관련 속성
	private String scCode, scName, srName, srPrice;	
	
	// 스터디그룹 & 스터디그룹원 관련 속성
	private String guNick, gjCode, guId, grCode, grName, guCode, guName;	
	
	// 패널티 관련 속성
	private String rvCode, hrdCode, pgCode, pgStartDate, hrdDate, pgEndDate, pgState, reason;			
	
	// 모임 관련 속성
	private String gschCode, gschDate, gschName, gschContent, gschLocation, gschStartHour, gschEndHour, attState, gschRegDate;

	
	
	// getter / setter 구성	-----------------------------------------------------------------------
	public String getRvCode()
	{
		return rvCode;
	}
	public void setRvCode(String rvCode)
	{
		this.rvCode = rvCode;
	}
	public String getGschRegDate()
	{
		return gschRegDate;
	}
	public void setGschRegDate(String gschRegDate)
	{
		this.gschRegDate = gschRegDate;
	}
	public String getGuCode()
	{
		return guCode;
	}
	public void setGuCode(String guCode)
	{
		this.guCode = guCode;
	}
	public String getGuName()
	{
		return guName;
	}
	public void setGuName(String guName)
	{
		this.guName = guName;
	}
	public String getGschCode()
	{
		return gschCode;
	}
	public void setGschCode(String gschCode)
	{
		this.gschCode = gschCode;
	}
	public String getGschDate()
	{
		return gschDate;
	}
	public void setGschDate(String gschDate)
	{
		this.gschDate = gschDate;
	}
	public String getGschName()
	{
		return gschName;
	}
	public void setGschName(String gschName)
	{
		this.gschName = gschName;
	}
	public String getGschContent()
	{
		return gschContent;
	}
	public void setGschContent(String gschContent)
	{
		this.gschContent = gschContent;
	}
	public String getGschLocation()
	{
		return gschLocation;
	}
	public void setGschLocation(String gschLocation)
	{
		this.gschLocation = gschLocation;
	}
	public String getGschStartHour()
	{
		return gschStartHour;
	}
	public void setGschStartHour(String gschStartHour)
	{
		this.gschStartHour = gschStartHour;
	}
	public String getGschEndHour()
	{
		return gschEndHour;
	}
	public void setGschEndHour(String gschEndHour)
	{
		this.gschEndHour = gschEndHour;
	}
	public String getAttState()
	{
		return attState;
	}
	public void setAttState(String attState)
	{
		this.attState = attState;
	}
	public String getReason()
	{
		return reason;
	}
	public void setReason(String reason)
	{
		this.reason = reason;
	}
	public String getPgEndDate()
	{
		return pgEndDate;
	}
	public void setPgEndDate(String pgEndDate)
	{
		this.pgEndDate = pgEndDate;
	}
	public String getPgState()
	{
		return pgState;
	}
	public void setPgState(String pgState)
	{
		this.pgState = pgState;
	}
	public void setPgStartDate(String pgStartDate)
	{
		this.pgStartDate = pgStartDate;
	}
	public String getHrdCode()
	{
		return hrdCode;
	}
	public void setHrdCode(String hrdCode)
	{
		this.hrdCode = hrdCode;
	}
	public String getPgCode()
	{
		return pgCode;
	}
	public void setPgCode(String pgCode)
	{
		this.pgCode = pgCode;
	}
	public String getPgStartDate()
	{
		return pgStartDate;
	}
	public void setPgDate(String PgStartDate)
	{
		this.pgStartDate = PgStartDate;
	}
	public String getHrdDate()
	{
		return hrdDate;
	}
	public void setHrdDate(String hrdDate)
	{
		this.hrdDate = hrdDate;
	}
	public String getReCode()
	{
		return reCode;
	}
	public String getrNum()
	{
		return rNum;
	}
	public void setrNum(String rNum)
	{
		this.rNum = rNum;
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
	public int getReCount()
	{
		return reCount;
	}
	public void setReCount(int reCount)
	{
		this.reCount = reCount;
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
	public String getScCode()
	{
		return scCode;
	}
	public void setScCode(String scCode)
	{
		this.scCode = scCode;
	}
	public String getScName()
	{
		return scName;
	}
	public void setScName(String scName)
	{
		this.scName = scName;
	}
	public String getSrName()
	{
		return srName;
	}
	public void setSrName(String srName)
	{
		this.srName = srName;
	}
	public String getSrPrice()
	{
		return srPrice;
	}
	public void setSrPrice(String srPrice)
	{
		this.srPrice = srPrice;
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
	public String getGuId()
	{
		return guId;
	}
	public void setGuId(String guId)
	{
		this.guId = guId;
	}
	public String getGrCode()
	{
		return grCode;
	}
	public void setGrCode(String grCode)
	{
		this.grCode = grCode;
	}
	public String getGrName()
	{
		return grName;
	}
	public void setGrName(String grName)
	{
		this.grName = grName;
	}
	
}
