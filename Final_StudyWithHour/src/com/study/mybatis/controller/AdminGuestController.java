/*========================================
	AdminGuestController.java
	- 관리자 화면에서 일반회원 관련 컨트롤
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
		
		// 현재 페이지 번호, 페이지 범위 가져오기 (없을 경우 둘다 1로)
		try {			
			currPageNo = Integer.parseInt(tmpcurrPageNo);
			range = Integer.parseInt(tmprange);
			
		} catch(NumberFormatException e) {
			currPageNo = 1;
			range = 1;			
		}
		
		
		ArrayList<GuestDTO> list = null;
		
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
		
		// 검색을 위해 검색타입-검색어 HashMap으로 지정
		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("searchType", searchType);
		paraMap.put("keyword", keyword);		
		
		// dto에 검색타입/검색어 저장
		PaginationDTO pg = new PaginationDTO();
		pg.setSearchType(searchType);
		pg.setKeyword(keyword);
		
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
		mav.setViewName("/WEB-INF/view/admin/AdminGuestList.jsp");
		return mav;			
		}
	}

	
	
	
	
	//-- 목록에서 특정 회원 클릭 : 회원의 상세 정보 열람
	@RequestMapping(value="adminguestinfo.do", method=RequestMethod.GET)
	public String guestInfo(Model model, String guCode, HttpServletRequest request)
	{
		
		HttpSession session =  request.getSession();
		
		//세션에서 adCode 가져오기
		String adCode = (String)session.getAttribute("adCode");
		
		// 관리자 로그인상태 아닐 경우 로그인폼으로		
		if(adCode==null)
		{
			return "redirect:loginform.do";
		}
		
		
		IAdminGuestDAO dao = sqlSession.getMapper(IAdminGuestDAO.class);
		
		// guCode 에 맞는 회원 정보 가져오기
		GuestDTO guest = dao.guestInfo(guCode);
		
		//해당 회원이 활동중인 스터디그룹 리스트 가져오기
		ArrayList<StudyGroupDTO> groupList = dao.runGroup(guCode);
		
		// 해당 회원의 유효 패널티 갯수 가져오기
		int penaltyCount = dao.penaltyCount(guCode);
		
		// 해당 회원이 입력한 카테고리코드 가져오기
		String categoryCode = guest.getCategoryCode();
		String category = "";
		
		//카테고리 코드로 카테고리 이름 입력
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
		
		// 비활성화 계정일 경우 탈퇴 일자와 탈퇴 사유를 가져오기
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
		
		
		//이전 페이지 페이지, 페이지길이, 검색타입, 검색어 가져오기
		String currPageNo = request.getParameter("currPageNo");
		String range = request.getParameter("range");
		String searchType = request.getParameter("searchType");
		String keyword = request.getParameter("keyword");

		
		//이전 페이지 페이지, 페이지길이, 검색타입, 검색어 전달하기
		model.addAttribute("currPageNo", currPageNo);
		model.addAttribute("range", range);
		model.addAttribute("searchType", searchType);
		model.addAttribute("keyword", keyword);
		
		//게스트 정보, 활동중인 스터디그룹 정보, 카테고리이름, 패널티 갯수 등 전달하기
		model.addAttribute("guest", guest);
		model.addAttribute("groupList", groupList);	
		model.addAttribute("category", category);	
		model.addAttribute("penaltyCount", penaltyCount);
		
		//비활성화 정보 전달하기
		model.addAttribute("unregDate", unregDate);
		model.addAttribute("reason", reason);
		
		
		return "/WEB-INF/view/admin/AdminGuestInfo.jsp";
	}
	
}
