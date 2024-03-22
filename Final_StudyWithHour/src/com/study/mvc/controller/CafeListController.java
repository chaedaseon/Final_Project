/*==================================
	CafeListController.java
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
			
			// 이전 페이지로부터 넘어온 페이지 번호 수신
			String pageNum = request.getParameter("pageNum");
			
			// 현재 페이지를 1로 지정
			// 만약 페이지번호가 있을 경우 현재 페이지는 페이지번호로 지정
			int currentPage = 1;
			if (pageNum != null)
				currentPage = Integer.parseInt(pageNum);
			
			// 호스트의 스터디카페 개수 조회
			int dataCount = dao.cafeCount(hoCode);
			// 한 페이지에 표시할 데이터 갯수
			int numPerPage = 4;				
			// numPerPage, dataCount 로 전체 페이지 갯수 조회
			int totalPage = myUtil.getPageCount(numPerPage, dataCount);
			
			// 전체 페이지 수가 현재 페이지 수보다 작을 경우 
			if (currentPage > totalPage)
				currentPage = totalPage;
			
			// 현재 페이지와 표시할 데이터 갯수에 따른 시작값과 끝값 구하기
			int start = (currentPage-1) * numPerPage + 1;
			int end = currentPage * numPerPage;
			
			String listUrl = "cafelist.do?hoCode=" + hoCode;
			
			String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
			
			// 페이지 번호가 있는 경우 현재페이지 번호를 함께 전달
			String articleUrl = "cafedetail.do";
			
			if (pageNum != null)
			{
				articleUrl = articleUrl + "?pageNum=" + currentPage;
			}
			
			// 스터디카페 목록 정보 조회
			cafeList = dao.lists(hoCode, start, end);
			
			mav.addObject("cafeList", cafeList);
			mav.addObject("articleUrl", articleUrl);
			mav.addObject("dataCount", dataCount);
			mav.addObject("pageIndexList", pageIndexList);
			
			// 스터디카페 목록으로 이동
			mav.setViewName("/WEB-INF/view/host/StudyCafeList.jsp");
			
			dao.close();
		}
		catch (Exception e)
		{
			System.out.println(e.toString());
		}		
		
		return mav;
		
	}

}
