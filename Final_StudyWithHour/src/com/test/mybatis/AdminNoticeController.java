/*========================================
	AdminNoticeController.java
	- 관리자 화면에서 공지사항 컨트롤
========================================*/


package com.test.mybatis;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Request;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javafx.scene.control.Pagination;


@Controller
public class AdminNoticeController
{
	@Autowired
	private SqlSession sqlSession;
	
	// 공지사항 리스트 출력
	@RequestMapping(value="adminnoticelist.do", method= RequestMethod.GET)
	public ModelAndView boardList(HttpServletRequest request, ModelAndView mav, 
			@RequestParam(value = "currPageNo", required = false, defaultValue = "1") String tmpcurrPageNo, 
			@RequestParam(value = "range", required = false, defaultValue = "1") String tmprange,
			@RequestParam(value = "searchType", required = false, defaultValue = "1") String tmpsearchType) 
	{
		HttpSession session = request.getSession();
		String adCode = (String)session.getAttribute("adCode");
		
		
		// 관리자 로그인상태 아닐 경우 로그인폼으로
		if(adCode==null)
		{
			
			mav.setViewName("loginform.do");
			return mav;	
		}		
		else
		{
		IAdminNoticeDAO dao = sqlSession.getMapper(IAdminNoticeDAO.class);
		
		int currPageNo = 0;
		int range = 0;
		
		try {			
			currPageNo = Integer.parseInt(tmpcurrPageNo);
			range = Integer.parseInt(tmprange);
			
		} catch(NumberFormatException e) {
			currPageNo = 1;
			range = 1;			
		}
		
		ArrayList<NoticeDTO> list = null;
		
		String searchType = "";
		String keyword = request.getParameter("keyword");
		
		try {			
			searchType = tmpsearchType;
			
		} catch(NumberFormatException e) {
			searchType = "";		
		}
		
		
		if(keyword == null || "".equals(keyword) || keyword.trim().isEmpty() ) {
			keyword = "";
		}	   	
		
		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("searchType", searchType);
		paraMap.put("keyword", keyword);		
		
		PaginationDTO pg = new PaginationDTO();
		pg.setSearchType(searchType);
		pg.setKeyword(keyword);
		
		
		int totalCnt = dao.boardTotalCnt(pg);	
		
		//System.out.println("1" + currPageNo);
		//System.out.println("2" + range);
		//System.out.println("3" + totalCnt);
		//System.out.println("4 검색타입" + pg.getSearchType());
		//System.out.println("5" + pg.getKeyword());
		//System.out.println("6 날것검색n" + searchType);
		
		pg.pageInfo(currPageNo, range, totalCnt);
		
		
		
		list = dao.boardListPaging(pg);
		
		
		if(!"".equals(searchType) && !"".equals(keyword)) {
			mav.addObject("paraMap", paraMap);
		}
		
		mav.addObject("pagination", pg);
		mav.addObject("list", list);
		mav.setViewName("AdminNoticeBoardList.jsp");
		return mav;			
		}
	}


	
	// 공지 입력 폼으로 이동
	@RequestMapping("/adminnoticeinsertform.do")
	public String noticeInsertForm(HttpServletRequest request, Model model)
	{
		
		HttpSession session = request.getSession();
		String adCode = (String)session.getAttribute("adCode");
		
		
		// 관리자 로그인상태 아닐 경우 로그인폼으로
		if(adCode==null)
		{
			return "redirect:loginform.do";
		}	
		
		model.addAttribute("adCode",adCode);
		
		
		return "AdminNoticeBoardForm.jsp";
	}
	
	// 공지사항에서 입력 후 
	@RequestMapping(value="/adminnoticeinsert.do", method=RequestMethod.POST)
	public String noticeInsert(NoticeDTO dto, HttpServletRequest request)
	{
		
		HttpSession session = request.getSession();
		String adCode = (String)session.getAttribute("adCode");
		
		
		// 관리자 로그인상태 아닐 경우 로그인폼으로
		if(adCode==null)
		{
			return "redirect:loginform.do";
		}
		
		//String searchType = request.getParameter("searchType");
		//String keyword = request.getParameter("keyword");
		
		
		
		IAdminNoticeDAO dao = sqlSession.getMapper(IAdminNoticeDAO.class);
		
		dao.add(dto);
		
		
		return "redirect:adminnoticelist.do?vNum=1";
	}
	
}
