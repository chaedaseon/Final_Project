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
public class AdminStudyGroupController
{
	@Autowired
	private SqlSession sqlSession;

	
	// 스터디그룹 리스트 조회 (vNum = 해당 페이지 번호)
	@RequestMapping(value="adminstudygrouplist.do", method=RequestMethod.GET)
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
			IAdminStudyGroupDAO dao = sqlSession.getMapper(IAdminStudyGroupDAO.class);
		
		int currPageNo = 0;
		int range = 0;
		
		try {			
			currPageNo = Integer.parseInt(tmpcurrPageNo);
			range = Integer.parseInt(tmprange);
			
		} catch(NumberFormatException e) {
			currPageNo = 1;
			range = 1;			
		}
		
		ArrayList<StudyGroupDTO> list = null;
		
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
		mav.setViewName("AdminGroupList.jsp");
		return mav;			
		}
	}

	
	
	
	//-- 목록에서 특정 스터디그룹 클릭 : 스터디그룹의 상세 정보 열람
	@RequestMapping(value="adminstudygroupinfo.do", method=RequestMethod.GET)
	public String studyGroupInfo(Model model, String grCode, HttpServletRequest request)
	{
		
		HttpSession session =  request.getSession();
		
		String adCode = (String)session.getAttribute("adCode");
		
		if(adCode==null)
		{
			return "redirect:loginform.do";
		}
		
		IAdminStudyGroupDAO dao = sqlSession.getMapper(IAdminStudyGroupDAO.class);
				
		StudyGroupDTO studyGroup = dao.studyGroupInfo(grCode);
		//개설 일자
		String leaderCode = dao.leaderCode(grCode);
		String leaderId = dao.leaderId(leaderCode);
		
		
		int pCount = dao.groupPenaltyCount(grCode);
		
		String locationFirst = dao.locationFirst(studyGroup.getLfCode());
		String locationSecond = dao.locationSecond(studyGroup.getLsCode());
		
		String location = locationFirst + " " +  locationSecond;
		
		ArrayList<GuestDTO> groupMember = dao.groupMember(grCode);
		int groupCount = dao.groupCount(grCode);
		
		ArrayList<Map<String, Object>> groupRecord = dao.groupRecord(grCode);
		
		// 그룹 해체 데이터가 있을 경우 
		if (dao.groupUnreg(grCode)!=null)
		{
			StudyGroupDTO groupUnreg = dao.groupUnreg(grCode);
			model.addAttribute("groupUnreg", groupUnreg);
		}
		
		String currPageNo = request.getParameter("currPageNo");
		String range = request.getParameter("range");
		String searchType = request.getParameter("searchType");
		String keyword = request.getParameter("keyword");
		

		model.addAttribute("currPageNo", currPageNo);
		model.addAttribute("range", range);
		model.addAttribute("searchType", searchType);
		model.addAttribute("keyword", keyword);
		
		
		model.addAttribute("studyGroup", studyGroup);
		model.addAttribute("pCount", pCount);
		model.addAttribute("leaderId", leaderId);
		model.addAttribute("location", location);
		model.addAttribute("groupMember", groupMember);	
		model.addAttribute("groupCount", groupCount);
		model.addAttribute("groupRecord", groupRecord);
		
		return "/AdminGroupInfo.jsp";
	}
	
}
