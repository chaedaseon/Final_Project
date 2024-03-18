/*==================================
	GroupReserveSearchFormController.java
	- 사용자 정의 컨트롤러 클래스
===================================*/

package com.study.mvc.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.study.mvc.model.CafeDAO;
import com.study.mvc.model.CafeDTO;
import com.study.mvc.model.GroupDTO;

// ※ Spring 의 『Controller』 인터페이스를 구현하는 방법을 통해
//    사용자 정의 컨트롤러 클래스를 구성한다.
//    cf.Controller Annotation 활용
public class GroupReserveSearchFormController implements Controller
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
		
		CafeDAO dao = new CafeDAO();
		ArrayList<CafeDTO> lists = new ArrayList<CafeDTO>();
		ArrayList<GroupDTO> lfList = new ArrayList<GroupDTO>();
		int count = 0;
		String lsCode = "";
		
		try
		{
			dao.connection();
			
			// 이전 페이지로부터 넘어온 데이터 수신
			//-- 검색(예약날짜, 지역1, 지역2, 이용시작시간, 이용종료시간, 인원수), 지역코드
			String reserveDate = request.getParameter("reserveDate");
			String reserveAddr1 = request.getParameter("reserveAddr1");
			String reserveAddr2 = request.getParameter("reserveAddr2");
			String reserveHour1 = request.getParameter("reserveHour1");
			String reserveHour2 = request.getParameter("reserveHour2");
			String reserveCount = request.getParameter("reserveCount");
			String lfCode = request.getParameter("lfCode");
			String guCode = request.getParameter("gu_code");
			String grCode = request.getParameter("gr_code");
			
			// 검색에 따른 스터디룸 내역 조회
			lists = dao.searchLists(reserveDate, reserveAddr1, reserveAddr2, reserveHour1, reserveHour2, reserveCount);
			// 검색에 따른 스터디룸 개수 조회
			count = dao.cafeCount(reserveDate, reserveAddr1, reserveAddr2, reserveHour1, reserveHour2, reserveCount);
			// 지역 검색을 위한 지역 대분류 내역 조회
			lfList = dao.lfList();
			// 게스트가 선택한 지역에 따른 지역 중분류 내역 조회
			lsCode = dao.searchLs(reserveAddr2);
			
			mav.addObject("reserveDate", reserveDate);
			mav.addObject("reserveAddr1", reserveAddr1);
			mav.addObject("reserveAddr2", reserveAddr2);
			mav.addObject("reserveHour1", reserveHour1);
			mav.addObject("reserveHour2", reserveHour2);
			mav.addObject("reserveCount", reserveCount);
			mav.addObject("grCode", grCode);
			mav.addObject("count", count);
			mav.addObject("lists", lists);
			mav.addObject("lfList", lfList);
			mav.addObject("lsCode", lsCode);
			mav.addObject("lfCode", lfCode);
			
			 
			mav.setViewName("/WEB-INF/view/reservation/Reservation.jsp");
			
			dao.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
				
		return mav;
		
	}

}
