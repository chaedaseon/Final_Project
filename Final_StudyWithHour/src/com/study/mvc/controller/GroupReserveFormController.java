/*==================================
	GroupReserveFormController.java
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

public class GroupReserveFormController implements Controller
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
		
		CafeDAO dao = new CafeDAO();
		ArrayList<CafeDTO> cafe = new ArrayList<CafeDTO>();
		
		try
		{
			// 이전 페이지로부터 넘어온 데이터 수신
			String grCode = request.getParameter("gr_code");
			String srCode = request.getParameter("srCode");
			String reserveDate = request.getParameter("reserveDate");
			String reserveAddr1 = request.getParameter("reserveAddr1");
			String reserveAddr2 = request.getParameter("reserveAddr2");
			String reserveHour1 = request.getParameter("reserveHour1");
			String reserveHour2 = request.getParameter("reserveHour2");
			String reserveCount = request.getParameter("reserveCount");
			
			dao.connection();
			
			// 스터디룸 정보 조회
			cafe = dao.roomInfoList(srCode);
			
			mav.addObject("grCode", grCode);
			mav.addObject("cafe", cafe);
			mav.addObject("reserveDate", reserveDate);
			mav.addObject("reserveAddr1", reserveAddr1);
			mav.addObject("reserveAddr2", reserveAddr2);
			mav.addObject("reserveHour1", reserveHour1);
			mav.addObject("reserveHour2", reserveHour2);
			mav.addObject("reserveCount", reserveCount);
			
			// 예약 확인 페이지로 이동
			mav.setViewName("/WEB-INF/view/reservation/ReservationInfo.jsp");
			
			dao.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
				
		
		return mav;
		
	}

}
