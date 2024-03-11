/*==================================
	CafeReviewListController.java
	- 사용자 정의 컨트롤러 클래스
===================================*/

package com.test.mvc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class CafeReviewListController implements Controller
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
		ArrayList<CafeDTO> review = new ArrayList<CafeDTO>();
		ArrayList<ReasonDTO> reason = new ArrayList<ReasonDTO>();
		ArrayList<CafeDTO> cafe = new ArrayList<CafeDTO>();
		int dataCount = 0;
		
		try
		{
			dao.connection();
			
			// 이전 페이지로부터 넘어온 데이터 수신
			String hoCode = request.getParameter("hoCode");
			String scCode = request.getParameter("scCode");
			String searchKey = request.getParameter("searchKey");
			String searchValue = request.getParameter("searchValue");
			String scState = request.getParameter("scState");
			
			String pageNum = request.getParameter("pageNum");
			int currentPage = 1;
			if (pageNum != null)
				currentPage = Integer.parseInt(pageNum);
			
			if (scState == null)
				scState = "scAll";
			
			if (searchKey == null)
			{
				searchKey = "scafe";
				searchValue = "";
			}
			
			if (scCode != null)
				dataCount = dao.cafeReviewCount(scCode, searchKey, searchValue);
			else	
				dataCount = dao.hostReviewCount(hoCode, searchKey, searchValue);
			
			int numPerPage = 10;										//-- 한 페이지에 표시할 데이터 갯수
			int totalPage = myUtil.getPageCount(numPerPage, dataCount);
			
			if (currentPage > totalPage)
				currentPage = totalPage;
			
			int start = (currentPage-1) * numPerPage + 1;
			int end = currentPage * numPerPage;
			
			String listUrl = "";
			
			
			if (scCode != null)		// 스터디카페코드가 있는 경우
			{
				listUrl = "cafereviewlist.do?scCode=" + scCode;
				review = dao.reviewLists(scCode, start, end, searchKey, searchValue);
			}
			else					// 호스트코드만 있는 경우
			{
				listUrl = "cafereviewlist.do?hoCode=" + hoCode;
				review = dao.reviewHostLists(hoCode, start, end, searchKey, searchValue);
			}
			
			String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
			reason = dao.reasonLists();
			cafe = dao.lists(hoCode, start, end);
			
			mav.addObject("cafe", cafe);
			mav.addObject("review", review);
			mav.addObject("reason", reason);
			mav.addObject("dataCount", dataCount);
			mav.addObject("pageIndexList", pageIndexList);
			mav.addObject("searchKey", searchKey);
			mav.addObject("searchValue", searchValue);
			
			mav.setViewName("StudyCafeReview.jsp");
			//mav.setViewName("/WEB-INF/view/StudyCafeReview.jsp");
			
			dao.close();
		}
		catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;
		
	}

}
