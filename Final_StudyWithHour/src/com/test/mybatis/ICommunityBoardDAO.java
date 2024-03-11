package com.test.mybatis;

/* ==================================================
	ICommunityBoardDAO.java
	- 인터페이스
  	- 커뮤니티 게시판 액션 처리 메소드 선언
=====================================================*/

import java.util.ArrayList;


public interface ICommunityBoardDAO
{
	public ArrayList<CommunityBoardDTO> list(int vNum);	// 리스트 조회
	public ArrayList<CommunityBoardDTO> usedBookList(int vNum);	// 리스트 조회
	public ArrayList<CommunityBoardDTO> searchBsCodeList(String bsCode, int vNum);	// 리스트 조회
	public ArrayList<CommunityBoardDTO> usedBookSearchBsCodeList(String bsCode, int vNum);	// 리스트 조회
	public ArrayList<CommunityBoardDTO> searchTitleList(String searchTitle ,int vNum);	// 리스트 조회
	public ArrayList<CommunityBoardDTO> searchNum(String searchNum); // 게시글 조회
	public ArrayList<CommunityBoardDTO> searchNickList(String searchNick, int vNum);
	public int count();								// 전체 글 카운트
	public int scBsCount(String searchBsCode);		// 전체 글 카운트
	public int scTitleCount(String searchTitle);	// 제목 조회 카운트
	public int scNickCount(String searchNick);		// 작성자 조회 카운트
	public int allReplyCount(String boCode);		// 해당 게시물의 댓글+대댓글 수 카운트
	public int insert(CommunityBoardDTO board); 	// 게시글 등록
	public int update(CommunityBoardDTO board);		// 게시글 수정
	public int delete(String bocode); 				// 게시글 삭제
	public int maxBocode();							// 게시글 번호 최대값
}
