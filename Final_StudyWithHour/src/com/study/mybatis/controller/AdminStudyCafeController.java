/*========================================
	AdminNoticeController.java
	- 관리자 화면에서 공지사항 컨트롤
========================================*/


package com.study.mybatis.controller;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.study.mybatis.model.IAdminStudyCafeDAO;
import com.study.mybatis.model.PaginationDTO;
import com.study.mybatis.model.StudyCafeDTO;
import com.study.mybatis.model.StudyRoomDTO;


@Controller
public class AdminStudyCafeController
{
	@Autowired
	private SqlSession sqlSession;

	
	
	// 공지사항 리스트 출력
	@RequestMapping(value="adminstudycafelist.do", method= RequestMethod.GET)
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
		IAdminStudyCafeDAO dao = sqlSession.getMapper(IAdminStudyCafeDAO.class);
		
		int currPageNo = 0;
		int range = 0;
		
		try {			
			currPageNo = Integer.parseInt(tmpcurrPageNo);
			range = Integer.parseInt(tmprange);
			
		} catch(NumberFormatException e) {
			currPageNo = 1;
			range = 1;			
		}
		
		ArrayList<StudyCafeDTO> list = null;
		
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
		
		
		pg.pageInfo(currPageNo, range, totalCnt);
		
		
		
		list = dao.boardListPaging(pg);
		
		
		if(!"".equals(searchType) && !"".equals(keyword)) {
			mav.addObject("paraMap", paraMap);
		}
		
		mav.addObject("pagination", pg);
		mav.addObject("list", list);
		mav.setViewName("/WEB-INF/view/admin/AdminStudyCafeList.jsp");
		return mav;			
		}
	}

		
	

	//-- 목록에서 특정 스터디카페 클릭 : 스터디카페의 상세 정보 열람

	@RequestMapping(value="adminstudycafeinfo.do", method=RequestMethod.GET)
	public String studyCafeInfo(Model model, String scCode, HttpServletRequest request)
	{
		
		
		
		IAdminStudyCafeDAO dao = sqlSession.getMapper(IAdminStudyCafeDAO.class);
		
		HttpSession session = request.getSession();
		
		String adCode = (String)session.getAttribute("adCode");
		
		if(adCode == null)
		{
			return "loginform.do";
		}
				
		StudyCafeDTO studyCafe = dao.studyCafeInfo(scCode);
		ArrayList<StudyRoomDTO> studyRoomList = dao.studyRoomList(scCode);
		int studyRoomCount = dao.studyRoomCount(scCode);
		
		Object admin = session.getAttribute("admin");
		
		int cafeUnregCK = dao.cafeUnregCK(scCode);
		if(cafeUnregCK > 0)
		{
			String cafeUnregDate = dao.cafeUnregDate(scCode);
			model.addAttribute("cafeUnregDate", cafeUnregDate);
		}
		
		
		String currPageNo = request.getParameter("currPageNo");
		String range = request.getParameter("range");
		String searchType = request.getParameter("searchType");
		String keyword = request.getParameter("keyword");
		

		model.addAttribute("currPageNo", currPageNo);
		model.addAttribute("range", range);
		model.addAttribute("searchType", searchType);
		model.addAttribute("keyword", keyword);
				
		
		
		model.addAttribute("studyCafe", studyCafe);
		model.addAttribute("studyRoomList", studyRoomList);
		model.addAttribute("studyRoomCount", studyRoomCount);
		model.addAttribute("admin", admin);
		model.addAttribute("adCode", adCode);
		
		return "/WEB-INF/view/admin/AdminStudyCafeInfo.jsp";
	}

	//-- 목록에서 특정 스터디카페 클릭 : 스터디카페의 상세 정보 열람
	@RequestMapping(value="studycafecheck.do", method=RequestMethod.POST)
	public String studyCafeCheck(Model model, HttpServletRequest request)
	{
		
	
		IAdminStudyCafeDAO dao = sqlSession.getMapper(IAdminStudyCafeDAO.class);
		
		HttpSession session = request.getSession();
		
		String adCode = (String)session.getAttribute("adCode");
		
		if(adCode == null )
		{
			return "loginform.do";
		}
		
		String scCode = request.getParameter("scCode");
		String check = request.getParameter("check");
		String adCodeCK = request.getParameter("adCode").trim();
		
		
		
		String currPageNo = request.getParameter("currPageNo");
		String range = request.getParameter("range");
		String searchType = request.getParameter("searchType");
		String keyword = request.getParameter("keyword");
		

		model.addAttribute("currPageNo", currPageNo);
		model.addAttribute("range", range);
		model.addAttribute("searchType", searchType);
		model.addAttribute("keyword", keyword);
		
		String url = "redirect:adminstudycafelist.do";
		url += "?currPageNo=" + currPageNo;
		url += "&range=" + range;
		url += "&searchType=" + searchType;
		url += "&keyword=" + keyword;
		
		
		if(check.equals("1"))  // 승인, 승인날짜와 승인한 관리자 이름 추가
		{
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("scCode", scCode);
			map.put("adCodeCK", adCodeCK);
			dao.okCafe(map);
		}
		else					// 확인만 체크 (승인날짜/승인관리자X)
		{
		dao.notOkCafe(scCode);
		}
		return url;
	}
	
}
