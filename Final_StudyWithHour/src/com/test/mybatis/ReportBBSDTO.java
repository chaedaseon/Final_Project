package com.test.mybatis;


public class ReportBBSDTO
{
	// 목록에 주로 사용하는 내용 (신고유형타입, 신고번호, 내용(제목/댓글), 그룹이름, 처리결과(승인/미승인), 신고한날짜)
	private String rtype, code, content, grname, redcode, rdate;
	private int num;
	
	// 내용에 주로 사용하는 내용 
    /*
	-- RPUSER : 신고유저
	-- REPORTED : 신고당한
	-- RPCODE : 신고당한 글의 고유 번호
	-- RPCONTENT : 신고당한내용
	-- RPDATE : 신고당한 날짜
	-- RPREASON : 신고사유코드
	-- RDDATE : 신고처리일자
	-- REDCODE :  신고처리결과
	*/
	private String rpUser, reported, rpCode, rpSubject, rpContent, rpDate, rpReason, rdDate;
	
	
	public String getRpUser()
	{
		return rpUser;
	}
	public void setRpUser(String rpUser)
	{
		this.rpUser = rpUser;
	}
	public String getReported()
	{
		return reported;
	}
	public void setReported(String reported)
	{
		this.reported = reported;
	}
	public String getRpCode()
	{
		return rpCode;
	}
	public void setRpCode(String rpCode)
	{
		this.rpCode = rpCode;
	}
	public String getRpSubject()
	{
		return rpSubject;
	}
	public void setRpSubject(String rpSubject)
	{
		this.rpSubject = rpSubject;
	}
	public String getRpContent()
	{
		return rpContent;
	}
	public void setRpContent(String rpContent)
	{
		this.rpContent = rpContent;
	}
	public String getRpDate()
	{
		return rpDate;
	}
	public void setRpDate(String rpDate)
	{
		this.rpDate = rpDate;
	}
	public String getRpReason()
	{
		return rpReason;
	}
	public void setRpReason(String rpReason)
	{
		this.rpReason = rpReason;
	}
	public String getRdDate()
	{
		return rdDate;
	}
	public void setRdDate(String rdDate)
	{
		this.rdDate = rdDate;
	}
	public void setRedcode(String redcode)
	{
		this.redcode = redcode;
	}
	public String getRtype()
	{
		return rtype;
	}
	public void setRtype(String rtype)
	{
		this.rtype = rtype;
	}
	public String getCode()
	{
		return code;
	}
	public void setCode(String code)
	{
		this.code = code;
	}
	public String getContent()
	{
		return content;
	}
	public void setContent(String content)
	{
		this.content = content;
	}
	public String getGrname()
	{
		return grname;
	}
	public void setGrname(String grname)
	{
		this.grname = grname;
	}
	public String getRedcode()
	{
		return redcode;
	}
	public void setRedcord(String redcode)
	{
		this.redcode = redcode;
	}
	public String getRdate()
	{
		return rdate;
	}
	public void setRdate(String rdate)
	{
		this.rdate = rdate;
	}
	public int getNum()
	{
		return num;
	}
	public void setNum(int num)
	{
		this.num = num;
	}
}
