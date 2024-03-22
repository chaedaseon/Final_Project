package com.study.mybatis.model;

/* ==================================================
	IBoardRedDAO.java
	- 인터페이스
  	- 커뮤니티 게시판 신고 처리 메소드 선언
=====================================================*/

public interface IBoardRedDAO
{
	public int addRed(String reason_code, String boCode, String redGuCode);	// 게시물 신고 처리
	
}
