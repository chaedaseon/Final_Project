package com.test.mybatis;

/* ==================================================
	IBoardStudyGroupDAO.java
	- 인터페이스
  	- 스터디그룹 모집 액션 처리 메소드 선언
=====================================================*/

import java.util.ArrayList;
import java.util.Map;


public interface IBoardStudyGroupDAO
{
	public ArrayList<BoardStudyGroupDTO> list(int vNum);	// 전체 그룹 리스트 조회
	public ArrayList<BoardStudyGroupDTO> dDaylist(int vNum); // 신규 개설 그룹 리스트 조회
	public int count();									// 전체 그룹 갯수 카운트
	public int dDayListcount();									// 전체 그룹 갯수 카운트
	public void insertGroupRegistration(Map<String, Object> params);
}
