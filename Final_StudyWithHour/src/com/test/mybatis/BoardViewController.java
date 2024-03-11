/*============================
	CommunityBoardController.java
	- 사용자 정의 컨트롤러
===========================*/

package com.test.mybatis;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BoardViewController
{
	//주요 속성 구성
    //mybatis 객체 의존성(자동) 주입
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/boardview.do")
    public String boardView(ModelMap model, @RequestParam String boCode, HttpServletRequest request, HttpServletResponse response) 
	{
        IBoardViewDAO dao = sqlSession.getMapper(IBoardViewDAO.class);
        
        int boView = dao.boardView(boCode);
        
        // 쿠키 생성을 위한 변수 선언
        boolean alreadyViewed = false;

        // 게시글이 이미 조회되었는지 확인
        try
		{
        	Cookie[] cookies = request.getCookies();	// 쿠키 생성
        	if (cookies != null) 						// 쿠키가 존재할 경우
        	{
        		for (Cookie cookie : cookies) 			// 쿠키의 목록중에서 
        		{
        			if (cookie.getName().equals("viewed_" + boCode)) // viewed_ + boCode 의 이름을 가진 쿠키가 있다면
        			{
        				alreadyViewed = true;						// 이미 조회된 게시물
        				break;
        			}
        		}
        	}
        	
        	// 이미 조회된 경우 쿠키 생성하지 않고 조회수 증가하지 않음
        	if (!alreadyViewed) {	// 조회되지 않았다면
        		// 쿠키 생성
        		Cookie viewedCookie = new Cookie("viewed_" + boCode, "true"); // viewed_ + boCode 의 이름을 가진 쿠키 생성
        		viewedCookie.setMaxAge(24 * 60 * 60); // 쿠키 유효기간 설정 (1일)
        		response.addCookie(viewedCookie);	  // 쿠키 추가
        		
        		// 조회수 증가
        		dao.increaseBoardView(boCode, boView);	// 조회수 증가 쿼리문 실행
        	}
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}

        // 게시물 내용 및 관련 정보 가져오기
        ArrayList<BoardViewDTO> list = dao.list(boCode); 		// 게시물 뷰 페이지에 출력할 내용 리스트
        ArrayList<BoardViewDTO> replyList = dao.replyList(boCode); // 게시물 뷰 페이지에 출력할 댓글 리스트
        ArrayList<BoardViewDTO> reReplyList = dao.reReplyList(); // 게시물 뷰 페이지에 출력할 대댓글 리스트
        int allReplyCount = dao.allReplyCount(boCode);

        // 모델에 데이터 추가
        model.addAttribute("list", list);
        model.addAttribute("replyList", replyList);
        model.addAttribute("reReplyList", reReplyList);
        model.addAttribute("allReplyCount", allReplyCount);

        // 상세 페이지 호출
        return "/BoardView.jsp"; 
        //return "/WEB-INF/view/BoardView.jsp";    // 공지사항 게시판 호출
    }
	
	@RequestMapping(value="/boardreplyinsert.do", method = RequestMethod.POST)
    public String boardInsertReply(BoardViewDTO board)
    {
		IBoardViewDAO dao = sqlSession.getMapper(IBoardViewDAO.class);
		
        dao.addReply(board);
 
        return "redirect:boardview.do?boCode=" + board.getBoCode();
    }
	
	@RequestMapping(value="/boardrereplyinsert.do", method = RequestMethod.POST)
    public String boardInsertRereply(BoardViewDTO board)
    {
		IBoardViewDAO dao = sqlSession.getMapper(IBoardViewDAO.class);
		
        dao.addReReply(board);
 
        return "redirect:boardview.do?boCode=" + board.getBoCode();
    }
	
	@RequestMapping(value="/boardviewmodifyform.do", method = RequestMethod.GET)
    public String boardViewModifyForm(ModelMap model, @RequestParam String boCode)
    {
		IBoardViewDAO dao = sqlSession.getMapper(IBoardViewDAO.class);
		
		ArrayList<BoardViewDTO> list = dao.list(boCode);
		
		model.addAttribute("list", list);
		
        return "/BoardCommunityUpdateForm.jsp";
        //return "/WEB-INF/view/BoardCommunityUpdateForm.jsp";
    }
	
	@RequestMapping(value="/boardviewmodify.do", method = RequestMethod.POST)
    public String boardViewModify(BoardViewDTO board)
    {
		IBoardViewDAO dao = sqlSession.getMapper(IBoardViewDAO.class);
		
		dao.boardViewModify(board);
		
		return "redirect:boardview.do?boCode=" + board.getBoCode();
    }
	
	@RequestMapping(value="/boardviewmodify.do", method = RequestMethod.POST)
    public String boardViewDelete(BoardViewDTO board)
    {
		IBoardViewDAO dao = sqlSession.getMapper(IBoardViewDAO.class);
		
		dao.boardViewModify(board);
		
		return "redirect:boardview.do?boCode=" + board.getBoCode();
    }
	
	@RequestMapping(value="/boardreplymodify.do", method = RequestMethod.POST)
    public String boardViewModifyReply(BoardViewDTO board)
    {
		IBoardViewDAO dao = sqlSession.getMapper(IBoardViewDAO.class);
		
		dao.boardViewModifyReply(board);
		
		return "redirect:boardview.do?boCode=" + board.getBoCode();
    }
	
	@RequestMapping(value="/boardrereplymodify.do", method = RequestMethod.POST)
    public String boardViewModifyRereply(BoardViewDTO board)
    {
		IBoardViewDAO dao = sqlSession.getMapper(IBoardViewDAO.class);
		
		dao.boardViewModifyRereply(board);
		
		return "redirect:boardview.do?boCode=" + board.getBoCode();
    }
	
	@RequestMapping(value="/boardviewreplydelete.do", method = RequestMethod.POST)
    public String boardViewDeleteReply(BoardViewDTO board)
    {
		IBoardViewDAO dao = sqlSession.getMapper(IBoardViewDAO.class);
		
		dao.boardViewDeleteReply(board.getRpCode());
		
		return "redirect:boardview.do?boCode=" + board.getBoCode();
    }
	
	@RequestMapping(value="/boardviewrereplydelete.do", method = RequestMethod.POST)
    public String boardViewDeleteRereply(BoardViewDTO board)
    {
		IBoardViewDAO dao = sqlSession.getMapper(IBoardViewDAO.class);
		
		String rreCode = board.getRreCode();
		
		dao.boardViewDeleteRereply(rreCode);
		
		return "redirect:boardview.do?boCode=" + board.getBoCode();
    }
	/*
	 @RequestMapping(value="/boardviewscrap.do", method = RequestMethod.POST)
	 public Map<String, Object> handleScrapRequest(@RequestParam("boCode") String boCode, @RequestParam("guCode") String guCode) 
	 {
        Map<String, Object> response = new HashMap<String, Object>();
        
        // 여기에서 중복 확인 등의 로직 수행
        
        boolean isDuplicate = true; // 중복되었다고 가정
        
        if (isDuplicate) {
            response.put("success", false);
            response.put("message", "이미 스크랩한 게시물입니다.");
        } else {
            // 중복되지 않은 경우에는 스크랩을 처리하고 성공 메시지를 반환
            // 여기에서 스크랩 처리 로직 수행
            
            response.put("success", true);
            response.put("message", "스크랩이 완료되었습니다.");
        }
        
        return response;
    }
    */
}
