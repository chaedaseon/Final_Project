/*==================================
	GroupMeetListController.java
	- 사용자 정의 컨트롤러 클래스
===================================*/

package com.study.mvc.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.study.mvc.model.GroupDAO;
import com.study.mvc.model.GroupDTO;
import com.study.util.MyUtil;

public class GroupMeetListController implements Controller
{
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// 액션 코드
		ModelAndView mav = new ModelAndView();
		
		// session 설정
		// 게스트코드가 있는 경우에만 접근 가능
		HttpSession session = request.getSession();
		
		if (session.getAttribute("guCode")==null)
		{
			// 게스트코드가 없는 경우 로그인 폼으로 이동
			mav.setViewName("redirect:loginform.do");
			return mav;
		}
		
		GroupDAO dao = new GroupDAO();
		MyUtil myUtil = new MyUtil();
		ArrayList<GroupDTO> meet = new ArrayList<GroupDTO>();
		
		try
		{
			dao.connection();
			
			// 이전 페이지로부터 넘어온 데이터 수신
			String grCode = request.getParameter("gr_code");
			String searchKey = request.getParameter("searchKey");
			String searchValue = request.getParameter("searchValue");
			String searchDate = request.getParameter("searchDate");
			
			// 이전 페이지로부터 넘어온 페이지 번호 수신
			String pageNum = request.getParameter("pageNum");
			// 현재 페이지를 1로 지정
			// 만약 페이지번호가 있을 경우 현재 페이지는 페이지번호로 지정
			int currentPage = 1;
			if (pageNum != null)
				currentPage = Integer.parseInt(pageNum);
			
			// 검색어가 없을 때 기본 값 설정
			if (searchKey==null)
			{
				searchKey = "attDate";
				searchValue = "";		
			}
			
			// 검색어가 없을 때 기본 값 설정
			if (searchDate==null)
			{
				searchDate = "regDate";
				searchValue = "";		
			}
			
			// 출력할 데이터 개수 조회
			int dataCount = dao.groupMeetCount(grCode, searchKey, searchValue);
			// 한 페이지에 표시할 데이터 갯수
			int numPerPage = 10;		
			// numPerPage, dataCount 로 전체 페이지 갯수 조회
			int totalPage = myUtil.getPageCount(numPerPage, dataCount);
			
			// 전체 페이지 수가 현재 페이지 수보다 작을 경우 
			if (currentPage > totalPage)
				currentPage = totalPage;
			
			// 현재 페이지와 표시할 데이터 갯수에 따른 시작값과 끝값 구하기
			int start = (currentPage-1) * numPerPage + 1;
			int end = currentPage * numPerPage;
			
			String param = "";
			
			if (!searchValue.equals(""))
			{
				param += "&searchKey=" + searchKey;
				param += "&searchValue=" + searchValue;
			}
			
			String listUrl = "groupmeetlist.do?grCode=" + grCode + param;
			
			String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
			
			// 모임 내역 조회
			meet = dao.groupMeetList(grCode, searchKey, searchValue, searchDate, start, end);
			
			mav.addObject("meet", meet);
			mav.addObject("searchKey", searchKey);
			mav.addObject("searchValue", searchValue);
			mav.addObject("pageIndexList", pageIndexList);
			mav.addObject("dataCount", dataCount);
			mav.addObject("searchDate", searchDate);
			mav.addObject("grCode", grCode);
			
			// 모임내역 페이지로 이동
			mav.setViewName("/WEB-INF/view/group/GroupMeetList.jsp");
			
			dao.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
				
		
		return mav;
		
	}

}
