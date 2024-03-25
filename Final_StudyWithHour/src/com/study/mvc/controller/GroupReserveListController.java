/*==================================
	GroupReserveListController.java
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

public class GroupReserveListController implements Controller
{
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// 액션 코드
		
		ModelAndView mav = new ModelAndView();
		
		// session 설정
		// 게스트 코드가 있는 경우에만 접근 가능
		HttpSession session = request.getSession();
		
		if (session.getAttribute("guCode")==null)
		{
			// 게스트 코드가 없는 경우 로그인 폼으로 이동
			mav.setViewName("redirect:loginform.do");
			return mav;
		}
		
		GroupDAO dao = new GroupDAO();
		MyUtil myUtil = new MyUtil();
		ArrayList<GroupDTO> group = new ArrayList<GroupDTO>();
		
		try
		{
			dao.connection();
			
			// 이전 페이지로부터 넘어온 데이터 수신
			String grCode = request.getParameter("gr_code");
			String searchKey = request.getParameter("searchKey");
			String searchValue = request.getParameter("searchValue");
			String fbState = request.getParameter("fbState");
			String reState = request.getParameter("reState");
			
			// 페이징 처리
			String pageNum = request.getParameter("pageNum");
			int currentPage = 1;
			if (pageNum != null)
				currentPage = Integer.parseInt(pageNum);
			
			if (fbState == null)
				fbState = "fbAll";
			if (reState == null)
				reState = "reAll";
			
			if (searchKey==null)
			{
				searchKey = "resDate";
				searchValue = "";		
			}
			
			int dataCount = dao.groupReserveCount(grCode, searchKey, searchValue, fbState, reState);
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
			
			String listUrl = "groupreservelist.do?grCode=" + grCode + param;
			
			String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
			
			
			String articleUrl = "groupreservelist.do";
			
			if (param.equals(""))
			{
				articleUrl = articleUrl + "?pageNum=" + currentPage;
			}
			else
			{
				articleUrl = articleUrl + "?pageNum=" + currentPage + param;
			}
			
			// 그룹 예약 내역 조회
			group = dao.groupReserveList(grCode, searchKey, searchValue, fbState, reState, start, end);
			
			mav.addObject("grCode", grCode);
			mav.addObject("group", group);
			mav.addObject("dataCount", dataCount);
			mav.addObject("pageIndexList", pageIndexList);
			mav.addObject("searchKey", searchKey);
			mav.addObject("searchValue", searchValue);
			mav.addObject("fbState", fbState);
			mav.addObject("reState", reState);
			
			// 그룹 예약 내역 페이지로 이동
			mav.setViewName("/WEB-INF/view/group/GroupReserveList.jsp");
			
			dao.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
				
		
		return mav;
		
	}

}
