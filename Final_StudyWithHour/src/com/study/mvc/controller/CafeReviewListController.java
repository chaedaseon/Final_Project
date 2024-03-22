/*==================================
	CafeReviewListController.java
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
import com.study.mvc.model.ReasonDTO;
import com.study.util.MyUtil;

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
			
			// 이전 페이지로부터 넘어온 페이지 번호 수신
			String pageNum = request.getParameter("pageNum");
			// 현재 페이지를 1로 지정
						// 만약 페이지번호가 있을 경우 현재 페이지는 페이지번호로 지정
			int currentPage = 1;
			if (pageNum != null)
				currentPage = Integer.parseInt(pageNum);
			
			// 검색이 없는 경우 기본 설정(최초 요청일 경우)
			if (scState == null)
				scState = "scAll";
			
			if (searchKey == null)
			{
				searchKey = "scafe";
				searchValue = "";
			}
			
			// 검색이 호스트 전체 보유카페인지 특정카페인지에 따른 분기
			if (scCode != null)
				dataCount = dao.cafeReviewCount(scCode, searchKey, searchValue);
			else	
				dataCount = dao.hostReviewCount(hoCode, searchKey, searchValue);
			
			//-- 한 페이지에 표시할 데이터 갯수
			int numPerPage = 10;	
			// numPerPage, dataCount 로 전체 페이지 갯수 조회//-- 한 페이지에 표시할 데이터 갯수
			int totalPage = myUtil.getPageCount(numPerPage, dataCount);
			
			// 전체 페이지 수가 현재 페이지 수보다 작을 경우
			if (currentPage > totalPage)
				currentPage = totalPage;
			
			// 현재 페이지와 표시할 데이터 갯수에 따른 시작값과 끝값 구하기
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
			// 사유 내역 조회
			reason = dao.reasonLists();
			// 호스트 전체 카페 내역 조회 
			cafe = dao.lists(hoCode, start, end);
			
			mav.addObject("cafe", cafe);
			mav.addObject("review", review);
			mav.addObject("reason", reason);
			mav.addObject("dataCount", dataCount);
			mav.addObject("pageIndexList", pageIndexList);
			mav.addObject("searchKey", searchKey);
			mav.addObject("searchValue", searchValue);
			
			// 스터디카페 리뷰 확인 페이지로 이동
			mav.setViewName("/WEB-INF/view/host/StudyCafeReview.jsp");
			
			dao.close();
		}
		catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;
		
	}

}
