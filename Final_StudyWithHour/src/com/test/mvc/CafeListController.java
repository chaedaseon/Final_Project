/*==================================
	CafeListController.java
	- 사용자 정의 컨트롤러 클래스
===================================*/

package com.test.mvc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

// ※ Spring 의 『Controller』 인터페이스를 구현하는 방법을 통해
//    사용자 정의 컨트롤러 클래스를 구성한다.
//    cf.Controller Annotation 활용
public class CafeListController implements Controller
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
		
		MyUtil myUtil = new MyUtil();
		CafeDAO dao = new CafeDAO();
		ArrayList<CafeDTO> cafeList = new ArrayList<CafeDTO>();
		try
		{	
			// 이전 페이지로부터 넘어온 데이터 수신
			//-- hoCode
			String hoCode = request.getParameter("hoCode");
			dao.connection();
			
			String pageNum = request.getParameter("pageNum");
			int currentPage = 1;
			if (pageNum != null)
				currentPage = Integer.parseInt(pageNum);
			
			int dataCount = dao.cafeCount(hoCode);
			int numPerPage = 4;										//-- 한 페이지에 표시할 데이터 갯수
			int totalPage = myUtil.getPageCount(numPerPage, dataCount);
			
			if (currentPage > totalPage)
				currentPage = totalPage;
			
			int start = (currentPage-1) * numPerPage + 1;
			int end = currentPage * numPerPage;
			//String param = "";
			
			String listUrl = "cafelist.do?hoCode=" + hoCode;
			
			String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
			
			
			String articleUrl = "cafedetail.do";
			
			/*
			if (pageNum != null)
			{
				articleUrl = articleUrl + "?pageNum=" + currentPage;
			}
			*/
			cafeList = dao.lists(hoCode, start, end);
			
			mav.addObject("cafeList", cafeList);
			mav.addObject("articleUrl", articleUrl);
			mav.addObject("dataCount", dataCount);
			mav.addObject("pageIndexList", pageIndexList);
			
			mav.setViewName("StudyCafeList.jsp");
			//mav.setViewName("/WEB-INF/view/StudyCafeList.jsp");
			
			dao.close();
		}
		catch (Exception e)
		{
			System.out.println(e.toString());
		}		
		
		return mav;
		
	}

}
