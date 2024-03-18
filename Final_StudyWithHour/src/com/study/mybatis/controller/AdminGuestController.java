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

import com.study.mybatis.model.GuestDTO;
import com.study.mybatis.model.IAdminGuestDAO;
import com.study.mybatis.model.PaginationDTO;
import com.study.mybatis.model.StudyGroupDTO;



@Controller
public class AdminGuestController
{
	@Autowired
	private SqlSession sqlSession;

	
	// 회원 리스트 출력
	@RequestMapping(value="adminguestlist.do", method= RequestMethod.GET)
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
		IAdminGuestDAO dao = sqlSession.getMapper(IAdminGuestDAO.class);
		
		int currPageNo = 0;
		int range = 0;
		
		try {			
			currPageNo = Integer.parseInt(tmpcurrPageNo);
			range = Integer.parseInt(tmprange);
			
		} catch(NumberFormatException e) {
			currPageNo = 1;
			range = 1;			
		}
		
		ArrayList<GuestDTO> list = null;
		
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
		mav.setViewName("/WEB-INF/view/admin/AdminGuestList.jsp");
		return mav;			
		}
	}

	
	
	
	
	//-- 목록에서 특정 회원 클릭 : 회원의 상세 정보 열람
	@RequestMapping(value="adminguestinfo.do", method=RequestMethod.GET)
	public String guestInfo(Model model, String guCode, HttpServletRequest request)
	{
		
		HttpSession session =  request.getSession();
		
		String adCode = (String)session.getAttribute("adCode");
		
		if(adCode==null)
		{
			return "redirect:loginform.do";
		}
		
		
		IAdminGuestDAO dao = sqlSession.getMapper(IAdminGuestDAO.class);
				
		GuestDTO guest = dao.guestInfo(guCode);
		ArrayList<StudyGroupDTO> groupList = dao.runGroup(guCode);
		int penaltyCount = dao.penaltyCount(guCode);
		
		String categoryCode = guest.getCategoryCode();
		String category = "";
		
		switch (categoryCode)
		{
		case "1": category = "자격증";
			break;
		case "2": category = "취업";
		break;
		case "3": category = "외국어";
		break;
		case "4": category = "면접";
		break;
		case "5": category = "취미";
		break;
		case "6": category = "학업";
		break;
		case "7": category = "자기개발";
		break;
		case "8": category = "기타";
		break;
		}
		
		String unregDate = " - ";
		String reason=" - ";
		
		
		if (dao.guestUnregCk(guCode)==1)
		{
			GuestDTO unReg = dao.guestUnreg(guCode);
			unregDate = unReg.getGuUnndate();

			switch (unReg.getReasonCode())
			{
			case "101": reason = "개인정보 노출 우려";
				break;
			case "102": reason = "재가입 목적";
			break;
			case "103": reason = "서비스 불만족";
			break;
			case "104": reason = "이용 안함";
			break;
			case "105": reason = "기타";
			break;
			case "106": reason = "계정 차단";
			break;
			case "107": reason = "회원 탈퇴";
			break;
			}
			
		}
		
		String currPageNo = request.getParameter("currPageNo");
		String range = request.getParameter("range");
		String searchType = request.getParameter("searchType");
		String keyword = request.getParameter("keyword");
		
		//String currPageNo = (String)session.getAttribute("currPageNo");
		//String range = (String)session.getAttribute("range");
		//String searchType = (String)session.getAttribute("searchType");
		//String keyword = (String)session.getAttribute("keyword");
		
		model.addAttribute("currPageNo", currPageNo);
		model.addAttribute("range", range);
		model.addAttribute("searchType", searchType);
		model.addAttribute("keyword", keyword);
		
		
		System.out.println("정보값 넘어가는 테스트 "+ currPageNo);
		System.out.println(range);
		System.out.println(searchType);
		System.out.println(keyword);
		
		
		
		model.addAttribute("guest", guest);
		model.addAttribute("groupList", groupList);	
		model.addAttribute("category", category);	
		model.addAttribute("penaltyCount", penaltyCount);
		
		model.addAttribute("unregDate", unregDate);
		model.addAttribute("reason", reason);
		
		
		return "/WEB-INF/view/admin/AdminGuestInfo.jsp";
	}
	
}
