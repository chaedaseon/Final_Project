package com.study.mybatis.model;

public class NoticeDTO
{
	// ntCode - 공지사항코드 / ntTitle - 공지사항제목 / ntContent - 공지사항내용
	// ntDate - 공지사항업로드날짜 / ntModate - 수정최종날짜 / adCode - 작성관리자코드
	//private String nt_code, nt_title, nt_content, nt_date, nt_modate, ad_code;
	
	private String ntCode, ntTitle, ntContent, ntDate, ntModate, adCode;
	// ntView - 조회수
	//private int nt_view;
	private int ntView;
	
	// getter / Setter 구성
	public String getNtCode()
	{
		return ntCode;
	}
	public void setNtCode(String ntCode)
	{
		this.ntCode = ntCode;
	}
	public String getNtTitle()
	{
		return ntTitle;
	}
	public void setNtTitle(String ntTitle)
	{
		this.ntTitle = ntTitle;
	}
	public String getNtContent()
	{
		return ntContent;
	}
	public void setNtContent(String ntContent)
	{
		this.ntContent = ntContent;
	}
	public String getNtDate()
	{
		return ntDate;
	}
	public void setNtDate(String ntDate)
	{
		this.ntDate = ntDate;
	}
	public String getNtModate()
	{
		return ntModate;
	}
	public void setNtModate(String ntModate)
	{
		this.ntModate = ntModate;
	}
	public String getAdCode()
	{
		return adCode;
	}
	public void setAdCode(String adCode)
	{
		this.adCode = adCode;
	}
	public int getNtView()
	{
		return ntView;
	}
	public void setNtView(int ntView)
	{
		this.ntView = ntView;
	}
	
	


}
