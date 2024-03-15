/*============================
	CommunityBoardController.java
	- 사용자 정의 컨트롤러
===========================*/

package com.study.mybatis.controller;

import java.util.ArrayList;

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

import com.study.mybatis.model.INoticeBoardDAO;
import com.study.mybatis.model.NoticeBoardDTO;

@Controller
public class NoticeBoardController
{
	//주요 속성 구성
    //mybatis 객체 의존성(자동) 주입
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/boardnoticelist.do", method = RequestMethod.GET) // 공지사항 게시판 메인 페이지 요청
	public String noticeBoardList(ModelMap model, Integer vNum)
	{
		INoticeBoardDAO dao = sqlSession.getMapper(INoticeBoardDAO.class);
		
		if (vNum == null)
		{
			vNum = 1;
		}
		
		// 기준 페이지에 대한 목록 받아오기
		ArrayList<NoticeBoardDTO> list = dao.list(vNum);
		
		int count = dao.count();
		
		
		// 페이지 목록 만들 ArrayList
		ArrayList<Integer> page = new ArrayList<Integer>();
		
		
		//-- 현재 선택 페이지 전후(-2 ~ +2) 로 페이지를 만들 수 있는 값이 있다면
		//   페이징 목록에 추가 (페이지 번호는 5개까지)
		//-- -2~기준, 기준~2가 없을 경우 반대쪽 수로 채워줌
		int n = vNum;
		
		// 기준 번호보다 1~2 큰 페이지에 값이 없을 경우
		// 이전 페이지 번호를 가져와 리스트에 넣어주기
		if(dao.list(vNum+2).size() == 0)
		{
			if(dao.list(vNum+1).size() == 0)
			{
				if(dao.list(vNum-4).size() != 0)
					page.add(vNum-4);
				
				if(dao.list(vNum-3).size() != 0)
					page.add(vNum-3);
			}
			else
			{
				if(dao.list(vNum-3).size() != 0)
					page.add(vNum-3);					
			}

		}

		for (int i = n-2; i <= n+2; i++)
		{
			if(dao.list(i).size() != 0)
			{
				page.add(i);
			}
		}
		
		// 기준 번호보다 1~2 작은 페이지에 값이 없을 경우
		// 이후 페이지 번호를 가져와 리스트에 넣어주기
		if(dao.list(vNum-2).size() == 0)
		{
			
			if(dao.list(vNum-1).size() == 0)
			{
				if(dao.list(vNum+3).size() != 0)
					page.add(vNum+3);
				if(dao.list(vNum+4).size() != 0)
					page.add(vNum+4);
			}
			else
			{
				if(dao.list(vNum+3).size() != 0)
					page.add(vNum+3);					
			}
		}
		// 페이지 목록의 마지막 번호 저장하기
		int lastNum = page.get(page.size()-1);
		
		String urlparam = "noticeboardlist";
		//-- 목록에 출력할 공지사항 리스트
		model.addAttribute("list", list);
		//-- 글 갯수가 9개 이하라면 페이징 출력 안할 count
		model.addAttribute("count", count);
		//-- 출력해줄 페이지 목록
		model.addAttribute("page", page);
		//-- 현재 목록 기준 페이지
		model.addAttribute("vNum", vNum);
		//-- 현재 목록 기준 페이지 마지막 번호
		model.addAttribute("lastNum", lastNum);
		
		model.addAttribute("urlparam", urlparam);
		
		return "/WEB-INF/view/board/NoticeBoardList.jsp";	// 공지사항 게시판 호출
	}
	
	@RequestMapping(value = "/boardnoticesearchnum.do", method = RequestMethod.GET) // 공지사항 게시판 검색기능
	public String noticeBoardSearchNum(ModelMap model, @RequestParam("searchNum") String searchNum)
	{
		INoticeBoardDAO dao = sqlSession.getMapper(INoticeBoardDAO.class);
		
		// 기준 페이지에 대한 목록 받아오기
		ArrayList<NoticeBoardDTO> searchNumList = dao.searchNum(searchNum);
		
		int count = dao.count();
		
		int page = 1;
		
		String urlparam = "noticeboardsearchNum";
		
		//-- 목록에 출력할 공지사항 리스트
		model.addAttribute("list", searchNumList);
		//-- 글 갯수가 9개 이하라면 페이징 출력 안할 count
		model.addAttribute("count", count);
		//-- 출력해줄 페이지 목록
		model.addAttribute("page", page);
		
		model.addAttribute("urlparam", urlparam);
		
		return "/WEB-INF/view/board/NoticeBoardList.jsp";	// 공지사항 게시판 호출
	}
	
	@RequestMapping(value = "/boardnoticesearchtitle.do", method = RequestMethod.GET) // 커뮤니티 게시판 요청시
	public String noticeBoardSearchTitle(ModelMap model, @RequestParam("searchTitle") String searchTitle ,@RequestParam("vNum") int vNum)
	{
		INoticeBoardDAO dao = sqlSession.getMapper(INoticeBoardDAO.class);
		
		// 기준 페이지에 대한 목록 받아오기
		ArrayList<NoticeBoardDTO> searchTitleList = dao.searchTitleList(searchTitle, vNum);
		
		int count = dao.scTitleCount(searchTitle);
		
		// 페이지 목록 만들 ArrayList
		ArrayList<Integer> page = new ArrayList<Integer>();
		
		//-- 현재 선택 페이지 전후(-2 ~ +2) 로 페이지를 만들 수 있는 값이 있다면
		//   페이징 목록에 추가 (페이지 번호는 5개까지)
		//-- -2~기준, 기준~2가 없을 경우 반대쪽 수로 채워줌
		int n = vNum;
		
		// 기준 번호보다 1~2 큰 페이지에 값이 없을 경우
		// 이전 페이지 번호를 가져와 리스트에 넣어주기
		if(dao.searchTitleList(searchTitle,vNum+2).size() == 0)
		{
			if(dao.searchTitleList(searchTitle,vNum+1).size() == 0)
			{
				if(dao.searchTitleList(searchTitle,vNum-4).size() != 0)
					page.add(vNum-4);
				
				if(dao.searchTitleList(searchTitle,vNum-3).size() != 0)
					page.add(vNum-3);
			}
			else
			{
				if(dao.searchTitleList(searchTitle,vNum-3).size() != 0)
					page.add(vNum-3);					
			}

		}

		for (int i = n-2; i <= n+2; i++)
		{
			if(dao.searchTitleList(searchTitle,i).size() != 0)
			{
				page.add(i);
			}
		}
		
		// 기준 번호보다 1~2 작은 페이지에 값이 없을 경우
		// 이후 페이지 번호를 가져와 리스트에 넣어주기
		if(dao.searchTitleList(searchTitle,vNum-2).size() == 0)
		{
			
			if(dao.searchTitleList(searchTitle,vNum-1).size() == 0)
			{
				if(dao.searchTitleList(searchTitle,vNum+3).size() != 0)
					page.add(vNum+3);
				if(dao.searchTitleList(searchTitle,vNum+4).size() != 0)
					page.add(vNum+4);
			}
			else
			{
				if(dao.searchTitleList(searchTitle,vNum+3).size() != 0)
					page.add(vNum+3);					
			}
		}
		// 페이지 목록의 마지막 번호 저장하기
		int lastNum = page.get(page.size()-1);
		
		String urlparam = "noticeboardsearchTitle";
		//-- 목록에 출력할 공지사항 리스트
		model.addAttribute("list", searchTitleList);
		//-- 글 갯수가 9개 이하라면 페이징 출력 안할 count
		model.addAttribute("count", count);
		//-- 출력해줄 페이지 목록
		model.addAttribute("page", page);
		//-- 현재 목록 기준 페이지
		model.addAttribute("vNum", vNum);
		//-- 현재 목록 기준 페이지 마지막 번호
		model.addAttribute("lastNum", lastNum);
		
		model.addAttribute("urlparam", urlparam);
	
		return "/WEB-INF/view/board/NoticeBoardList.jsp";	// 공지사항 게시판 호출
	}
	
	@RequestMapping(value = "/boardnoticesearchnick.do", method = RequestMethod.GET) // 커뮤니티 게시판 요청시
	public String communityBoardSearchNick(ModelMap model, @RequestParam("searchNick") String searchNick ,@RequestParam("vNum") int vNum)
	{
		INoticeBoardDAO dao = sqlSession.getMapper(INoticeBoardDAO.class);
		
		// 기준 페이지에 대한 목록 받아오기
		ArrayList<NoticeBoardDTO> searchNickList = dao.searchNickList(searchNick, vNum);
		
		int count = dao.scNickCount(searchNick);
		
		
		// 페이지 목록 만들 ArrayList
		ArrayList<Integer> page = new ArrayList<Integer>();
		
		
		//-- 현재 선택 페이지 전후(-2 ~ +2) 로 페이지를 만들 수 있는 값이 있다면
		//   페이징 목록에 추가 (페이지 번호는 5개까지)
		//-- -2~기준, 기준~2가 없을 경우 반대쪽 수로 채워줌
		int n = vNum;
		
		// 기준 번호보다 1~2 큰 페이지에 값이 없을 경우
		// 이전 페이지 번호를 가져와 리스트에 넣어주기
		if(dao.searchNickList(searchNick,vNum+2).size() == 0)
		{
			if(dao.searchNickList(searchNick,vNum+1).size() == 0)
			{
				if(dao.searchNickList(searchNick,vNum-4).size() != 0)
					page.add(vNum-4);
				
				if(dao.searchNickList(searchNick,vNum-3).size() != 0)
					page.add(vNum-3);
			}
			else
			{
				if(dao.searchNickList(searchNick,vNum-3).size() != 0)
					page.add(vNum-3);					
			}

		}

		for (int i = n-2; i <= n+2; i++)
		{
			if(dao.searchNickList(searchNick,i).size() != 0)
			{
				page.add(i);
			}
		}
		
		// 기준 번호보다 1~2 작은 페이지에 값이 없을 경우
		// 이후 페이지 번호를 가져와 리스트에 넣어주기
		if(dao.searchNickList(searchNick,vNum-2).size() == 0)
		{
			
			if(dao.searchNickList(searchNick,vNum-1).size() == 0)
			{
				if(dao.searchNickList(searchNick,vNum+3).size() != 0)
					page.add(vNum+3);
				if(dao.searchNickList(searchNick,vNum+4).size() != 0)
					page.add(vNum+4);
			}
			else
			{
				if(dao.searchNickList(searchNick,vNum+3).size() != 0)
					page.add(vNum+3);					
			}
		}
		// 페이지 목록의 마지막 번호 저장하기
		int lastNum = page.get(page.size()-1);
		
		String urlparam = "noticeboardsearchNick";
		//-- 목록에 출력할 공지사항 리스트
		model.addAttribute("list", searchNickList);
		//-- 글 갯수가 9개 이하라면 페이징 출력 안할 count
		model.addAttribute("count", count);
		//-- 출력해줄 페이지 목록
		model.addAttribute("page", page);
		//-- 현재 목록 기준 페이지
		model.addAttribute("vNum", vNum);
		//-- 현재 목록 기준 페이지 마지막 번호
		model.addAttribute("lastNum", lastNum);
		
		model.addAttribute("urlparam", urlparam);
	
		return "/WEB-INF/view/board/NoticeBoardList.jsp";	// 공지사항 게시판 호출
	}
	
	@RequestMapping(value = "/noticeview.do", method = RequestMethod.GET) // 공지사항 게시판 뷰 페이지 요청
	public String boardView(ModelMap model, @RequestParam String ntCode, HttpServletRequest request, HttpServletResponse response)
	{
		INoticeBoardDAO dao = sqlSession.getMapper(INoticeBoardDAO.class);
		
		boolean alreadyViewed = false;

        // 게시글이 이미 조회되었는지 확인
        try
		{
        	Cookie[] cookies = request.getCookies();	// 쿠키 생성
        	if (cookies != null) 						// 쿠키가 존재할 경우
        	{
        		for (Cookie cookie : cookies) 			// 쿠키의 목록중에서 
        		{
        			if (cookie.getName().equals("NTviewed_" + ntCode)) // viewed_ + boCode 의 이름을 가진 쿠키가 있다면
        			{
        				alreadyViewed = true;						// 이미 조회된 게시물
        				break;
        			}
        		}
        	}
        	
        	// 이미 조회된 경우 쿠키 생성하지 않고 조회수 증가하지 않음
        	if (!alreadyViewed) {	// 조회되지 않았다면
        		// 쿠키 생성
        		Cookie viewedCookie = new Cookie("NTviewed_" + ntCode, "true"); // viewed_ + boCode 의 이름을 가진 쿠키 생성
        		viewedCookie.setMaxAge(24 * 60 * 60); // 쿠키 유효기간 설정 (1일)
        		response.addCookie(viewedCookie);	  // 쿠키 추가
        		
        		// 조회수 증가
        		dao.increaseNoticeView(ntCode);	// 조회수 증가 쿼리문 실행
        	}
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		ArrayList<NoticeBoardDTO> noticeViewlist = dao.noticeViewlist(ntCode); // 게시물 뷰 페이지에 출력할 내용 리스트
		
		//-- 공지사항 상세페이지 내용 리스트 전달
		model.addAttribute("list", noticeViewlist);
		
		return "/WEB-INF/view/board/NoticeBoardView.jsp";	// 공지사항 게시판 호출
	}
	
	@RequestMapping(value = "/noticeviewmodifyform.do", method = RequestMethod.GET)	// 게시글 수정 폼 요청
	public String noticeViewModifyForm(ModelMap model, @RequestParam String ntCode)
	{
		INoticeBoardDAO dao = sqlSession.getMapper(INoticeBoardDAO.class);

		ArrayList<NoticeBoardDTO> list = dao.noticeViewlist(ntCode);

		model.addAttribute("list", list);

		return "/WEB-INF/view/board/BoardCommunityUpdateForm.jsp";
	}

	@RequestMapping(value = "/noticeviewmodify.do", method = RequestMethod.POST)	// 게시글 수정
	public String boardViewModify(NoticeBoardDTO nt)
	{
		INoticeBoardDAO dao = sqlSession.getMapper(INoticeBoardDAO.class);

		dao.noticeModify(nt);

		return "redirect:noticeboardview.do?ntCode=" + nt.getNtCode();
	}

	
	  @RequestMapping(value="/noticeviewdelete.do", method = RequestMethod.GET)	// 게시글 삭제
	  public String boardViewDelete(@RequestParam String ntCode) 
	  { 
		  INoticeBoardDAO dao = sqlSession.getMapper(INoticeBoardDAO.class);
		  
		  dao.noticeDelete(ntCode);
		  
		  return "redirect:boardnoticelist.do"; 
	  }
}
