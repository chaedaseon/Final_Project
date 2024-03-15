/*==================================
	HostRedListController.java
	- 사용자 정의 컨트롤러 클래스
===================================*/

package com.study.mvc.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.study.mvc.model.CafeDAO;
import com.study.mvc.model.CafeDTO;
import com.study.util.MyUtil;

public class HostRedListController implements Controller
{
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// 액션 코드		
		ModelAndView mav = new ModelAndView();
		
		// session 설정
		// 호스트코드가 있는 경우에만 접근 가능
		HttpSession session = request.getSession();
		
		if (session.getAttribute("hoCode")==null)
		{
			// 호스트코드가 없는 경우 로그인 폼으로 이동
			mav.setViewName("redirect:loginform.do");
			return mav;
		}
		
		CafeDAO dao = new CafeDAO();
		MyUtil myUtil = new MyUtil();
		ArrayList<CafeDTO> red = new ArrayList<CafeDTO>();
		
		try
		{
			dao.connection();
			
			String hoCode = request.getParameter("hoCode");
			String searchKey = request.getParameter("searchKey");
			String searchValue = request.getParameter("searchValue");
			String hrState = request.getParameter("hrState");
			String adState = request.getParameter("adState");
			
			String pageNum = request.getParameter("pageNum");
			int currentPage = 1;
			if (pageNum != null)
				currentPage = Integer.parseInt(pageNum);
			
			if (hrState == null)
				hrState = "hrAll";
			if (adState == null)
				adState = "adAll";
			
			if (searchKey == null)
			{
				searchKey = "group";
				searchValue = "";
			}
			
			int dataCount = dao.reserveCount(hoCode, searchKey, searchValue, hrState, adState);
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
			
			String listUrl = "hostredlist.do?hoCode=" + hoCode + param;
			
			String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
			
			
			red = dao.hostRedLists(hoCode, start, end, searchKey, searchValue, hrState, adState);
			
			mav.addObject("red", red);
			mav.addObject("dataCount", dataCount);
			mav.addObject("pageIndexList", pageIndexList);
			mav.addObject("searchKey", searchKey);	
			mav.addObject("searchValue", searchValue);	
			mav.addObject("hrState", hrState);	
			mav.addObject("adState", adState);	
			
			mav.setViewName("/WEB-INF/view/host/HostRedList.jsp");
			
			dao.close();
		}
		catch (Exception e)
		{
			System.out.println(e.toString());
		}
				
		
		return mav;
		
	}

}
