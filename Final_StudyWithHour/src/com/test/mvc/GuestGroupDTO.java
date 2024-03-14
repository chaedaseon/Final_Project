// GuestDTO.java

package com.test.mvc;

public class GuestGroupDTO
{
	// 주요 속성 구성(GuestGroup - 게스트 페이지에서 가입 내역 확인 가능)
	
	// 스터디그룹 개설 요청
	private String grCode, grDate, grName, grCount, grSubject, grComment, ageCode, genderCode, lsCode, categoryCode, goCode;
	
	// 스터디그룹 가입 요청
	private String gjCode, gjDate;
	
	// 스터디그룹 개설요청 처리
	private String gcCode;
	
	// 스터디그룹 모집 기간 종료 후 처리 상태
	private String rsCode, rsState;
	
	// 스터디그룹 해체
	private String brCode, brDate;
	
	// 스터디그룹 탈퇴
	private String gunCode, gunDate;

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

	public String getGrCount()
	{
		return grCount;
	}

	public void setGrCount(String grCount)
	{
		this.grCount = grCount;
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
	
	
}
