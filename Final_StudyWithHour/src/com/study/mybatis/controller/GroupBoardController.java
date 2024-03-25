/*========================================
	AdminReportAllBBSController.java
	- 관리자 화면에서 커뮤니티 신고에 대한 처리
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.study.mvc.model.BoardDTO;
import com.study.mybatis.model.GroupBoardDTO;
import com.study.mybatis.model.IGroupBoardDAO;
import com.study.mybatis.model.PaginationDTO;
import com.study.mybatis.model.ReportBBSDTO;

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


		
	
}
