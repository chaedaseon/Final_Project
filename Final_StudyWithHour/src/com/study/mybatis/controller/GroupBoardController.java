/*========================================
	AdminReportAllBBSController.java
	- 관리자 화면에서 커뮤니티 신고에 대한 처리
========================================*/


package com.study.mybatis.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.study.mybatis.model.GroupBoardDTO;
import com.study.mybatis.model.IGroupBoardDAO;
import com.study.mybatis.model.PaginationDTO;

@Controller
public class GroupBoardController
{
	@Autowired
	private SqlSession sqlSession;
	

	// 그룹 게시물 리스트 조회
	@RequestMapping(value="groupboardlist.do", method=RequestMethod.GET)
	public ModelAndView boardList(HttpServletRequest request, ModelAndView mav, 
			@RequestParam(value = "currPageNo", required = false, defaultValue = "1") String tmpcurrPageNo, 
			@RequestParam(value = "range", required = false, defaultValue = "1") String tmprange,
			@RequestParam(value = "searchType", required = false, defaultValue = "1") String tmpsearchType,
			String gr_code, String gu_code) 
	{
		
		
		HttpSession session = request.getSession();
		String guCode = (String)session.getAttribute("guCode");
		
		
		// 
		
		//로그인 상태가 아닐 경우
		if(guCode==null)
		{
			mav.setViewName("redirect:loginform.do");
			return mav;		
		}
		else
		{
		
		IGroupBoardDAO dao = sqlSession.getMapper(IGroupBoardDAO.class);
		
		int currPageNo = 0;
		int range = 0;
		// 현재 페이지 번호, 페이지 범위 가져오기 (없을 경우 둘다 1로)		
		try {			
			currPageNo = Integer.parseInt(tmpcurrPageNo);
			range = Integer.parseInt(tmprange);
			
		} catch(NumberFormatException e) {
			currPageNo = 1;
			range = 1;			
		}
		
		ArrayList<GroupBoardDTO> list = null;
		
		// 검색 타입과 검색어 설정		
		String searchType = "";
		String keyword = request.getParameter("keyword");
		// 만약 검색타입이 없을 경우 공백		
		try {			
			searchType = tmpsearchType;
			
		} catch(NumberFormatException e) {
			searchType = "";		
		}
		
		// 검색어 공백 처리		
		if(keyword == null || "".equals(keyword) || keyword.trim().isEmpty() ) {
			keyword = "";
		}	   	
		
		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("searchType", searchType);
		paraMap.put("keyword", keyword);		
		
		// dto에 검색타입/검색어 저장		
		PaginationDTO pg = new PaginationDTO();
		pg.setSearchType(searchType);
		pg.setKeyword(keyword);
		pg.setGrCode(gr_code);

		
		// 게시물의 총 갯수 가져오기		
		int totalCnt = dao.boardTotalCnt(pg);	

		// dto 내부의 pageInfo로 값 세팅		
		pg.pageInfo(currPageNo, range, totalCnt);
		
		
		// 세팅한 dto로 페이지네이션 리스트 출력		
		list = dao.boardListPaging(pg);
		
		
		if(!"".equals(searchType) && !"".equals(keyword)) {
			mav.addObject("paraMap", paraMap);
		}
		
		// 페이지에 페이지처리한 리스트와 페이지네이션 보내기 		
		mav.addObject("pagination", pg);
		mav.addObject("list", list);
		mav.addObject("gr_code", gr_code);
		mav.addObject("gu_code", gu_code);
		
		mav.setViewName("/WEB-INF/view/group/GroupBoardList.jsp");
		return mav;			
		}
	}

	@RequestMapping(value = "/groupboardcontent.do", method = RequestMethod.GET)	// 그룹 게시글 상세보기 페이지
	public String groupBoardView(ModelMap model, @RequestParam String gbCode
			, @RequestParam String gu_code, @RequestParam String gr_code 
			, HttpServletRequest request, HttpServletResponse response)
	{
		IGroupBoardDAO dao = sqlSession.getMapper(IGroupBoardDAO.class);

		int gbView = dao.boardView(gbCode);

		// 쿠키 생성을 위한 변수 선언
		boolean alreadyViewed = false;

		// 게시글이 이미 조회되었는지 확인
		try
		{
			Cookie[] cookies = request.getCookies(); // 쿠키 생성
			if (cookies != null) // 쿠키가 존재할 경우
			{
				for (Cookie cookie : cookies) // 쿠키의 목록중에서
				{
					if (cookie.getName().equals("Gbviewed_" + gbCode)) // viewed_ + boCode 의 이름을 가진 쿠키가 있다면
					{
						alreadyViewed = true; // 이미 조회된 게시물
						break;
					}
				}
			}

			// 이미 조회된 경우 쿠키 생성하지 않고 조회수 증가하지 않음
			if (!alreadyViewed)
			{ // 조회되지 않았다면
				// 쿠키 생성
				Cookie viewedCookie = new Cookie("Gbviewed_" + gbCode, "true"); // viewed_ + boCode 의 이름을 가진 쿠키 생성
				viewedCookie.setMaxAge(24 * 60 * 60); // 쿠키 유효기간 설정 (1일)
				response.addCookie(viewedCookie); // 쿠키 추가

				// 조회수 증가
				dao.increaseBoardView(gbCode, gbView); // 조회수 증가 쿼리문 실행
			}

		} catch (Exception e)
		{
			System.out.println(e.toString());
		}

		// 게시물 내용 및 관련 정보 가져오기
		ArrayList<GroupBoardDTO> list = dao.groupBoardViewList(gbCode); // 게시물 뷰 페이지에 출력할 내용 리스트
		ArrayList<GroupBoardDTO> replyList = dao.replyList(gbCode); // 게시물 뷰 페이지에 출력할 댓글 리스트
		int allReplyCount = dao.replyCount(gbCode);
		String gjCode = dao.selectGjCode(gu_code, gr_code);
		
		// 모델에 데이터 추가
		model.addAttribute("list", list);
		model.addAttribute("replyList", replyList);
		model.addAttribute("allReplyCount", allReplyCount);
		model.addAttribute("gjCode", gjCode);

		// 상세 페이지 호출
		return "/WEB-INF/view/group/GroupBoardView.jsp"; // 게시물 상세페이지 호출
	}	
	
	
	@RequestMapping(value = "/groupboardreplyinsert.do", method = RequestMethod.POST) // 게시글 댓글 입력
	public String groupBoardInsertReply(GroupBoardDTO dto, @RequestParam String gu_code, @RequestParam String gr_code)
	{ 
		IGroupBoardDAO dao = sqlSession.getMapper(IGroupBoardDAO.class);
	  
		dao.addReply(dto);
	  
		return "redirect:groupboardcontent.do?gbCode=" + dto.getGbCode() + "&gu_code=" + gu_code + "&gr_code=" + gr_code; 
	}
	 
}
