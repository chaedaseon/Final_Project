/*==================================
	GroupPenaltyListController.java
	- 사용자 정의 컨트롤러 클래스
===================================*/

package com.study.mvc.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.study.mvc.model.GroupDAO;
import com.study.mvc.model.GroupDTO;
import com.study.util.MyUtil;

public class GroupPenaltyListController implements Controller
{
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// 액션 코드
		
		ModelAndView mav = new ModelAndView();
		
		// session 설정
		/*
		HttpSession session = request.getSession();
		
		if (session.getAttribute("name")==null)
		{
			mav.setViewName("redirect:loginform.action");
			return mav;
		}
		else if (session.getAttribute("admin")==null)
		{
			mav.setViewName("redirect:logout.action");
			return mav;
		}
		*/
		
		GroupDAO dao = new GroupDAO();
		MyUtil myUtil = new MyUtil();
		ArrayList<GroupDTO> group = new ArrayList<GroupDTO>();
		
		try
		{
			dao.connection();
			
			String grCode = request.getParameter("grCode");
			String searchKey = request.getParameter("searchKey");
			String searchValue = request.getParameter("searchValue");
			String pgState = request.getParameter("pgState");
			
			String pageNum = request.getParameter("pageNum");
			int currentPage = 1;
			if (pageNum != null)
				currentPage = Integer.parseInt(pageNum);
			
			if (pgState == null)
				pgState = "pgAll";
			
			if (searchKey==null)
			{
				searchKey = "pgDate";
				searchValue = "";		
			}
			
			int dataCount = dao.groupPenalCount(grCode, searchKey, searchValue, pgState);
			int numPerPage = 10;										//-- 한 페이지에 표시할 데이터 갯수
			int totalPage = myUtil.getPageCount(numPerPage, dataCount);
			
			if (currentPage > totalPage)
				currentPage = totalPage;
			
			int start = (currentPage-1) * numPerPage + 1;
			int end = currentPage * numPerPage;
			
			String param = "";
			
			if (!searchValue.equals(""))
			{
				param += "&searchKey=" + searchKey;
				param += "&searchValue=" + searchValue;
			}
			
			String listUrl = "grouppenaltylist.do?grCode=" + grCode + param;
			
			String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
			
			
			String articleUrl = "grouppenaltylist.do";
			
			if (param.equals(""))
			{
				articleUrl = articleUrl + "?pageNum=" + currentPage;
			}
			else
			{
				articleUrl = articleUrl + "?pageNum=" + currentPage + param;
			}
			
			group = dao.groupPenalList(grCode, searchKey, searchValue, pgState, start, end);
			
			mav.addObject("group", group);
			mav.addObject("pageIndexList", pageIndexList);
			mav.addObject("dataCount", dataCount);
			mav.addObject("searchKey", searchKey);
			mav.addObject("searchValue", searchValue);
			mav.addObject("pgState", pgState);
			
			mav.setViewName("/WEB-INF/view/host/GroupPenaltyList.jsp");
			
			dao.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
				
		
		return mav;
		
	}

}
