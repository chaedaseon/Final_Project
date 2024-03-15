/*==================================
	GroupMeetListController.java
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

// ※ Spring 의 『Controller』 인터페이스를 구현하는 방법을 통해
//    사용자 정의 컨트롤러 클래스를 구성한다.
//    cf.Controller Annotation 활용
public class GroupMeetListController implements Controller
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
		ArrayList<GroupDTO> meet = new ArrayList<GroupDTO>();
		
		try
		{
			dao.connection();
			
			String grCode = request.getParameter("grCode");
			String searchKey = request.getParameter("searchKey");
			String searchValue = request.getParameter("searchValue");
			String searchDate = request.getParameter("searchDate");
			
			String pageNum = request.getParameter("pageNum");
			int currentPage = 1;
			if (pageNum != null)
				currentPage = Integer.parseInt(pageNum);

			if (searchKey==null)
			{
				searchKey = "attDate";
				searchValue = "";		
			}
			
			if (searchDate==null)
			{
				searchDate = "regDate";
				searchValue = "";		
			}
			
			int dataCount = dao.groupMeetCount(grCode, searchKey, searchValue);
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
			
			String listUrl = "groupmeetlist.do?grCode=" + grCode + param;
			
			String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
			
			
			String articleUrl = "groupmeetlist.do";
			
			if (param.equals(""))
			{
				articleUrl = articleUrl + "?pageNum=" + currentPage;
			}
			else
			{
				articleUrl = articleUrl + "?pageNum=" + currentPage + param;
			}
			
			
			meet = dao.groupMeetList(grCode, searchKey, searchValue, searchDate, start, end);
			
			mav.addObject("meet", meet);
			mav.addObject("searchKey", searchKey);
			mav.addObject("searchValue", searchValue);
			mav.addObject("pageIndexList", pageIndexList);
			mav.addObject("dataCount", dataCount);
			mav.addObject("searchDate", searchDate);
			
			mav.setViewName("/WEB-INF/view/group/GroupMeetList.jsp");
			
			dao.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
				
		
		return mav;
		
	}

}
