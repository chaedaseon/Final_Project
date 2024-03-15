package com.study.mybatis.model;

/* ==================================================
	ICommunityBoardDAO.java
	- 인터페이스
  	- 공지사항 게시판 액션 처리 메소드 선언
=====================================================*/

import java.util.ArrayList;


public interface INoticeBoardDAO
{
	public ArrayList<NoticeBoardDTO> list(int vNum);	// 리스트 조회
	public int count();								// 전체 글 카운트
	public ArrayList<NoticeBoardDTO> searchTitleList(String searchTitle ,int vNum);	// 리스트 조회
	public ArrayList<NoticeBoardDTO> searchNum(String searchNum); // 게시글 조회
	public ArrayList<NoticeBoardDTO> searchNickList(String searchNick, int vNum);
	public int scTitleCount(String searchTitle);	// 제목 조회 카운트
	public int scNickCount(String searchNick);		// 작성자 조회 카운트
	public ArrayList<NoticeBoardDTO> noticeViewlist(String ntCode);
	public int increaseNoticeView(String ntCode);	// 조회수 증가
	public int noticeModify(NoticeBoardDTO nt);	// 공지사항 수정
	public int noticeDelete(String ntCode);	// 공지사항 삭제
}
