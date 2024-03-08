/*=====================
	ReasonDTO.java
	- 호스트의 신고사유 DTO
=====================*/

package com.test.mvc;

public class ReasonDTO
{
	// 주요 속성 구성
	private String reasonCode, reason;
	
	// getter / setter 구성
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
	
}
