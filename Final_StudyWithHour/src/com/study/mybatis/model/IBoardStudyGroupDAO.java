package com.study.mybatis.model;

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
	public ArrayList<BoardStudyGroupDTO> addList(int vNum); // 신규 개설 그룹 리스트 조회
	public ArrayList<BoardStudyGroupDTO> endList(int vNum); // 신규 개설 그룹 리스트 조회
	public ArrayList<BoardStudyGroupDTO> lsList(String lfCode); // 신규 개설 그룹 리스트 조회
	public ArrayList<BoardStudyGroupDTO> selectGrcode(String grCode); // 모집글 하나의 정보 리스트
	public int count();									// 전체 그룹 갯수 카운트
	public int dDayListcount();									// 모집중인 그룹 갯수 카운트
	public int addListCount();									// 추가모집 그룹 갯수 카운트
	public int endListCount();									// 모집종료 그룹 갯수 카운트
	public int insertGroupRegistration(BoardStudyGroupDTO group);	// 모집글 등록
	public int callGroupJoinProcedure(Map<String, Object> data);	// 가입요청
	public int callGroupRegistrationProcedure(Map<String, Object> data);	// 그룹 모집글 등록
	public int updateGroupRegistration(Map<String, Object> data);	// 그룹 모집글 수정
	public int groupUnregProcedure(Map<String, Object> data);	// 그룹 모집글 수정
}
