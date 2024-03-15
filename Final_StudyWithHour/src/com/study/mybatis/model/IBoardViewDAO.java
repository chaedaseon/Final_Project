package com.study.mybatis.model;

/* ==================================================
	ICommunityBoardDAO.java
	- 인터페이스
  	- 커뮤니티 게시판 액션 처리 메소드 선언
=====================================================*/

import java.util.ArrayList;


public interface IBoardViewDAO
{
	public ArrayList<BoardViewDTO> list(String boCode);	// 하나의 게시글 리스트 조회
	public ArrayList<BoardViewDTO> replyList(String boCode); // 하나의 댓글 리스트 조회
	public ArrayList<BoardViewDTO> reReplyList(); 		// 대댓글 리스트 조회
	public int allReplyCount(String boCode); 			// 해당 게시물의 대댓글 갯수 카운트
	public int addReply(BoardViewDTO board);			// 댓글 입력
	public int addReReply(BoardViewDTO board);
	public int increaseBoardView(String boCode, int boView);	// 게시글 조회수 증가
	public int boardView(String boCode);
	public int boardViewDelete(String boCode);
	public int boardViewModify(BoardViewDTO board);
	public int boardViewModifyReply(BoardViewDTO board);
	public int boardViewModifyRereply(BoardViewDTO board);
	public int boardViewDeleteReply(String rpCode);
	public int boardViewDeleteRereply(String rreCode);
}
