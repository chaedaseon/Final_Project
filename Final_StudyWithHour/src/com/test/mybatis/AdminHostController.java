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

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class AdminHostController
{
	@Autowired
	private SqlSession sqlSession;

/*	
	// 호스트 회원 리스트 조회 (vNum = 해당 페이지 번호)
	@RequestMapping(value="adminhostlist.do", method=RequestMethod.GET)
	public String hostList(Model model, Integer vNum, HttpServletRequest request)
	{
		
		HttpSession session =  request.getSession();
		
		String adCode = (String)session.getAttribute("adCode");
		
		if(adCode==null)
		{
			return "redirect:loginform.do";
		}
		
		
		if(vNum == null)
		{
			vNum = 1;
		}
		
		IAdminHostDAO dao = sqlSession.getMapper(IAdminHostDAO.class);
		
		
		// 회원 수 확인하기
		int count = dao.count();
		
		ArrayList<HostDTO> list = dao.hostList(vNum);
		
		
		// 페이지 목록 만들 ArrayList
		ArrayList<Integer> page = new ArrayList<Integer>();
		
		
		//-- 현재 선택 페이지 전후(-2 ~ +2) 로 페이지를 만들 수 있는 값이 있다면
		//   페이징 목록에 추가 (페이지 번호는 5개까지)
		//-- -2~기준, 기준~2가 없을 경우 반대쪽 수로 채워줌
		int n = vNum;
		
		// 기준 번호보다 1~2 큰 페이지에 값이 없을 경우
		// 이전 페이지 번호를 가져와 리스트에 넣어주기

		if(dao.hostList(vNum+2).size() == 0)
		{
			if(dao.hostList(vNum+1).size() == 0)
			{
				if(dao.hostList(vNum-4).size() != 0)
					page.add(vNum-4);
				
				if(dao.hostList(vNum-3).size() != 0)
					page.add(vNum-3);
			}
			else
			{
				if(dao.hostList(vNum-3).size() != 0)
					page.add(vNum-3);					
			}

		}

		for (int i = n-2; i <= n+2; i++)
		{
			if(dao.hostList(i).size() != 0)
			{
				page.add(i);
			}
		}
		
		// 기준 번호보다 1~2 작은 페이지에 값이 없을 경우
		// 이후 페이지 번호를 가져와 리스트에 넣어주기
		if(dao.hostList(vNum-2).size() == 0)
		{
			
			if(dao.hostList(vNum-1).size() == 0)
			{
				if(dao.hostList(vNum+3).size() != 0)
					page.add(vNum+3);
				if(dao.hostList(vNum+4).size() != 0)
					page.add(vNum+4);
			}
			else
			{
				if(dao.hostList(vNum+3).size() != 0)
					page.add(vNum+3);					
			}
			
			

		}
		
		// 페이지 목록의 마지막 번호 저장하기
		int lastNum = page.get(page.size()-1);
			
		
		model.addAttribute("list", list);
		model.addAttribute("count", count);	
		model.addAttribute("vNum", vNum);
		model.addAttribute("page", page);
		model.addAttribute("lastNum", lastNum);
		
		return "/AdminHostList.jsp";
	}
*/	

	
	// 공지사항 리스트 출력
	@RequestMapping(value="adminhostlist.do", method= RequestMethod.GET)
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
		IAdminHostDAO dao = sqlSession.getMapper(IAdminHostDAO.class);
		
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
		
		System.out.println("1" + currPageNo);
		System.out.println("2" + range);
		System.out.println("3" + totalCnt);
		System.out.println("4 검색타입" + pg.getSearchType());
		System.out.println("5" + pg.getKeyword());
		System.out.println("6 날것검색n" + searchType);
		
		pg.pageInfo(currPageNo, range, totalCnt);
		
		
		
		list = dao.boardListPaging(pg);
		
		
		if(!"".equals(searchType) && !"".equals(keyword)) {
			mav.addObject("paraMap", paraMap);
		}
		
		mav.addObject("pagination", pg);
		mav.addObject("list", list);
		mav.setViewName("AdminHostList.jsp");
		return mav;			
		}
	}
	
	

	//-- 목록에서 특정 회원 클릭 : 회원의 상세 정보 열람
	@RequestMapping(value="adminhostinfo.do", method=RequestMethod.GET)
	public String hostInfo(Model model, String hoCode, HttpServletRequest request)
	{
		
		
		HttpSession session =  request.getSession();
		
		String adCode = (String)session.getAttribute("adCode");
		
		if(adCode==null)
		{
			return "redirect:loginform.do";
		}
		
		
		IAdminHostDAO dao = sqlSession.getMapper(IAdminHostDAO.class);
				
		HostDTO host = dao.hostInfo(hoCode);
		ArrayList<StudyCafeDTO> cafeList = dao.manageCafe(hoCode);
		
		String reason = "-";
		if (host.getHoUnDate()!=null)
		{
			
			switch (host.getReasonCode())
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
		else
		{
			host.setHoUnDate("-");
		}

		String currPageNo = request.getParameter("currPageNo");
		String range = request.getParameter("range");
		String searchType = request.getParameter("searchType");
		String keyword = request.getParameter("keyword");

		model.addAttribute("currPageNo", currPageNo);
		model.addAttribute("range", range);
		model.addAttribute("searchType", searchType);
		model.addAttribute("keyword", keyword);
			
		
		
		
		model.addAttribute("host", host);
		model.addAttribute("cafeList", cafeList);
		model.addAttribute("reason", reason);
		
		return "/AdminHostInfo.jsp";
	}

}
