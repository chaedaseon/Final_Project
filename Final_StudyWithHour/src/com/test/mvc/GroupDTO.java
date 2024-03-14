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
	private String reCode, reStartDate, reStartHour, reEndHour, reState, srCode;	
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

	// 그룹 정보 관련 속성
   private String grDate, grSubject, grComment, ageCode, genderCode, categoryCode, goCode, ageRange, genderRange, goCheck, gpCode;
   private int grCount, groupPw;
   
   // 지역 관련 속성 → Location_First / Location_Second
   private String lfCode, lfList, lsCode, lsList;
   
   // 참석예정자 관련 속성
   private String member, membercode, attlCode, uatState, meetState, meetContent;
	
	// 그룹 개설 요청 속성
	private String categoryList, gjDate;
	
	// 그룹 모집 기간 완료 전 철회(게시글 삭제) 속성
	private String gurCode, gurDate;
	
	// 스터디그룹 개설 요청 처리 속성
	private String gcCode, rCode;
	
	// 모집 기간 종료 후 처리 상태
	private String rsCode;
	
	// 그룹 해체 속성
	private String brCode, brDate, brReasonCode;
	
	// 그룹 탈퇴 속성
	private String gunCode, gunDate, gunReasonCode;
	
	
	
	
	// getter / setter 구성	-----------------------------------------------------------------------
	public String getRvCode()
	{
		return rvCode;
	}
	public void setRvCode(String rvCode)
	{
		this.rvCode = rvCode;
	}
	public String getSrCode()
	{
		return srCode;
	}
	public void setSrCode(String srCode)
	{
		this.srCode = srCode;
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
	public String getGrDate()
	{
		return grDate;
	}
	public void setGrDate(String grDate)
	{
		this.grDate = grDate;
	}
	public String getGrSubject()
	{
		return grSubject;
	}
	public void setGrSubject(String grSubject)
	{
		this.grSubject = grSubject;
	}
	public String getAgeRange()
	{
		return ageRange;
	}
	public void setAgeRange(String ageRange)
	{
		this.ageRange = ageRange;
	}
	public String getGenderRange()
	{
		return genderRange;
	}
	public void setGenderRange(String genderRange)
	{
		this.genderRange = genderRange;
	}
	public String getLsList()
	{
		return lsList;
	}
	public void setLsList(String lsList)
	{
		this.lsList = lsList;
	}
	public String getCategoryList()
	{
		return categoryList;
	}
	public void setCategoryList(String categoryList)
	{
		this.categoryList = categoryList;
	}
	public int getGrCount()
	{
		return grCount;
	}
	public void setGrCount(int grCount)
	{
		this.grCount = grCount;
	}
	public String getGjDate()
	{
		return gjDate;
	}
	public void setGjDate(String gjDate)
	{
		this.gjDate = gjDate;
	}
	public String getGurCode()
	{
		return gurCode;
	}
	public void setGurCode(String gurCode)
	{
		this.gurCode = gurCode;
	}
	public String getGurDate()
	{
		return gurDate;
	}
	public void setGurDate(String gurDate)
	{
		this.gurDate = gurDate;
	}
	public String getGcCode()
	{
		return gcCode;
	}
	public void setGcCode(String gcCode)
	{
		this.gcCode = gcCode;
	}
	public String getrCode()
	{
		return rCode;
	}
	public void setrCode(String rCode)
	{
		this.rCode = rCode;
	}
	public String getRsCode()
	{
		return rsCode;
	}
	public void setRsCode(String rsCode)
	{
		this.rsCode = rsCode;
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
	public String getBrReasonCode()
	{
		return brReasonCode;
	}
	public void setBrReasonCode(String brReasonCode)
	{
		this.brReasonCode = brReasonCode;
	}
	public String getGunCode()
	{
		return gunCode;
	}
	public void setGunCode(String gunCode)
	{
		this.gunCode = gunCode;
	}
	public String getGunDate()
	{
		return gunDate;
	}
	public void setGunDate(String gunDate)
	{
		this.gunDate = gunDate;
	}
	public String getGunReasonCode()
	{
		return gunReasonCode;
	}
	public void setGunReasonCode(String gunReasonCode)
	{
		this.gunReasonCode = gunReasonCode;
	}
	public String getGrComment()
	{
		return grComment;
	}
	public void setGrComment(String grComment)
	{
		this.grComment = grComment;
	}
	public String getAgeCode()
	{
		return ageCode;
	}
	public void setAgeCode(String ageCode)
	{
		this.ageCode = ageCode;
	}
	public String getGenderCode()
	{
		return genderCode;
	}
	public void setGenderCode(String genderCode)
	{
		this.genderCode = genderCode;
	}
	public String getCategoryCode()
	{
		return categoryCode;
	}
	public void setCategoryCode(String categoryCode)
	{
		this.categoryCode = categoryCode;
	}
	public String getGoCode()
	{
		return goCode;
	}
	public void setGoCode(String goCode)
	{
		this.goCode = goCode;
	}
	public String getGoCheck()
	{
		return goCheck;
	}
	public void setGoCheck(String goCheck)
	{
		this.goCheck = goCheck;
	}
	public String getGpCode()
	{
		return gpCode;
	}
	public void setGpCode(String gpCode)
	{
		this.gpCode = gpCode;
	}
	public int getGroupPw()
	{
		return groupPw;
	}
	public void setGroupPw(int groupPw)
	{
		this.groupPw = groupPw;
	}
	public String getLfCode()
	{
		return lfCode;
	}
	public void setLfCode(String lfCode)
	{
		this.lfCode = lfCode;
	}
	public String getLfList()
	{
		return lfList;
	}
	public void setLfList(String lfList)
	{
		this.lfList = lfList;
	}
	public String getLsCode()
	{
		return lsCode;
	}
	public void setLsCode(String lsCode)
	{
		this.lsCode = lsCode;
	}
	public String getMember()
	{
		return member;
	}
	public void setMember(String member)
	{
		this.member = member;
	}
	public String getMembercode()
	{
		return membercode;
	}
	public void setMembercode(String membercode)
	{
		this.membercode = membercode;
	}
	public String getAttlCode()
	{
		return attlCode;
	}
	public void setAttlCode(String attlCode)
	{
		this.attlCode = attlCode;
	}
	public String getUatState()
	{
		return uatState;
	}
	public void setUatState(String uatState)
	{
		this.uatState = uatState;
	}
	public String getMeetState()
	{
		return meetState;
	}
	public void setMeetState(String meetState)
	{
		this.meetState = meetState;
	}
	public String getMeetContent()
	{
		return meetContent;
	}
	public void setMeetContent(String meetContent)
	{
		this.meetContent = meetContent;
	}
	
	
	
}
