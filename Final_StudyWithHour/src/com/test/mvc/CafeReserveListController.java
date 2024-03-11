/*==================================
	CafeReserveListController.java
===================================*/

package com.test.mvc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class CafeReserveListController implements Controller
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
		ArrayList<CafeDTO> reserve = new ArrayList<CafeDTO>();
		ArrayList<ReasonDTO> reason = new ArrayList<ReasonDTO>();
		int countCancel = 0;
		
		try
		{
			dao.connection();
			String hoCode = request.getParameter("hoCode");
			
			// 이전 페이지로부터 넘어온 검색분류 및 검색어
			String searchKey = request.getParameter("searchKey");
			String searchValue = request.getParameter("searchValue");
			String fbState = request.getParameter("fbState");
			String reState = request.getParameter("reState");
			
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
			
			int dataCount = dao.getDataCount(hoCode, searchKey, searchValue, fbState, reState);
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
			
			String listUrl = "cafereservelist.do?hoCode=" + hoCode + param;
			
			String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
			
			
			String articleUrl = "cafereservedetail.do";
			
			if (param.equals(""))
			{
				articleUrl = articleUrl + "?pageNum=" + currentPage;
			}
			else
			{
				articleUrl = articleUrl + "?pageNum=" + currentPage + param;
			}
					
			reserve = dao.ReserveSearchLists(hoCode, start, end, searchKey, searchValue, fbState, reState);
			countCancel = dao.countCancel(hoCode);
			reason = dao.reasonLists();
			
			mav.addObject("reserve", reserve);
			mav.addObject("reason", reason);
			mav.addObject("countCancel", countCancel);	
			mav.addObject("dataCount", dataCount);	
			mav.addObject("pageIndexList", pageIndexList);	
			mav.addObject("articleUrl", articleUrl);	
			mav.addObject("searchKey", searchKey);	
			mav.addObject("searchValue", searchValue);	
			mav.addObject("fbState", fbState);	
			mav.addObject("reState", reState);	
			
			mav.setViewName("HostReservationList.jsp");
			//mav.setViewName("/WEB-INF/view/HostReservationList.jsp");
			
			dao.close();
		}
		catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;
		
	}

}
