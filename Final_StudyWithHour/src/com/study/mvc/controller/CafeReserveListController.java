/*==================================
	CafeReserveListController.java
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
			
			// 이전 페이지로부터 넘어온 페이지 번호 수신
			String pageNum = request.getParameter("pageNum");
			// 현재 페이지를 1로 지정
			// 만약 페이지번호가 있을 경우 현재 페이지는 페이지번호로 지정
			int currentPage = 1;
			if (pageNum != null)
				currentPage = Integer.parseInt(pageNum);
			
			// 이용상태/예약상태 검색이 없는 경우 기본 설정
			if (fbState == null)
				fbState = "fbAll";
			if (reState == null)
				reState = "reAll";
			
			// 검색어가 없는 경우 기본 설정
			if (searchKey==null)
			{
				searchKey = "resDate";
				searchValue = "";		
			}
			
			// 출력할 데이터 개수 조회
			int dataCount = dao.getDataCount(hoCode, searchKey, searchValue, fbState, reState);
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
			
			// 검색어가 있으면 param 에 검색어와 검색분류 데이터 보관
			if (!searchValue.equals(""))
			{
				param += "&searchKey=" + searchKey;
				param += "&searchValue=" + searchValue;
			}
			
			String listUrl = "cafereservelist.do?hoCode=" + hoCode + param;
			
			String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
			
			// 페이지 번호가 있는 경우 현재페이지 번호를 함께 전달
			String articleUrl = "cafereservedetail.do";
			
			if (param.equals(""))
			{
				articleUrl = articleUrl + "?pageNum=" + currentPage;
			}
			else
			{
				articleUrl = articleUrl + "?pageNum=" + currentPage + param;
			}
			
			// 검색어에 따른 예약 내역 조회
			reserve = dao.ReserveSearchLists(hoCode, start, end, searchKey, searchValue, fbState, reState);
			// 예약 취소 개수 조회
			countCancel = dao.countCancel(hoCode);
			// 사유 내역 조회
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
			
			// 호스트 예약 내역 페이지로 이동
			mav.setViewName("/WEB-INF/view/host/HostReservationList.jsp");
			
			dao.close();
		}
		catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;
		
	}

}
