// GuestDTO.java

package com.study.mvc.model;

public class GuestGroupDTO
{
	// 주요 속성 구성(GuestGroup - 게스트 페이지에서 가입 내역 확인 가능)
	
	// 스터디그룹 개설 요청 속성
	private String guCode, grCode, grDate, grName, grSubject, grComment, ageCode, genderCode, lsCode, categoryCode, goCode
	,ageRange, genderRange, lsList, categoryList;
	
	// 스터디그룹 가입 요청 속성
	private String gjCode, gjDate;
	
	// 스터디그룹 개설요청 처리 속성
	private String gcCode;
	
	// 그룹 모집 기간 완료 전 철회(게시글 삭제) 속성
	private String gurCode, gurDate;
	
	// 스터디그룹 모집 기간 종료 후 처리 상태 속성
	private String rsCode, rsState;
	
	// 스터디그룹 해체 속성
	private String brCode, brDate, brReasonCode;
	
	// 스터디그룹 탈퇴 속성
	private String gunCode, gunDate, gunReasonCode;
	
	private int grCount;
	
	// getter / setter 구성
	public String getGrCode()
	{
		return grCode;
	}

	public void setGrCode(String grCode)
	{
		this.grCode = grCode;
	}

	public String getGrDate()
	{
		return grDate;
	}

	public void setGrDate(String grDate)
	{
		this.grDate = grDate;
	}

	public String getGrName()
	{
		return grName;
	}

	public void setGrName(String grName)
	{
		this.grName = grName;
	}

	public String getGrSubject()
	{
		return grSubject;
	}

	public void setGrSubject(String grSubject)
	{
		this.grSubject = grSubject;
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

	public String getLsCode()
	{
		return lsCode;
	}

	public void setLsCode(String lsCode)
	{
		this.lsCode = lsCode;
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

	public String getGjCode()
	{
		return gjCode;
	}

	public void setGjCode(String gjCode)
	{
		this.gjCode = gjCode;
	}

	public String getGjDate()
	{
		return gjDate;
	}

	public void setGjDate(String gjDate)
	{
		this.gjDate = gjDate;
	}

	public String getGcCode()
	{
		return gcCode;
	}

	public void setGcCode(String gcCode)
	{
		this.gcCode = gcCode;
	}

	public String getRsCode()
	{
		return rsCode;
	}

	public void setRsCode(String rsCode)
	{
		this.rsCode = rsCode;
	}

	public String getRsState()
	{
		return rsState;
	}

	public void setRsState(String rsState)
	{
		this.rsState = rsState;
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

	public String getBrReasonCode()
	{
		return brReasonCode;
	}

	public void setBrReasonCode(String brReasonCode)
	{
		this.brReasonCode = brReasonCode;
	}

	public String getGunReasonCode()
	{
		return gunReasonCode;
	}

	public void setGunReasonCode(String gunReasonCode)
	{
		this.gunReasonCode = gunReasonCode;
	}

	public String getGuCode()
	{
		return guCode;
	}

	public void setGuCode(String guCode)
	{
		this.guCode = guCode;
	}

	public int getGrCount()
	{
		return grCount;
	}

	public void setGrCount(int grCount)
	{
		this.grCount = grCount;
	}

	
}
