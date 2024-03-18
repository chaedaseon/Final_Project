/*==================================
	GroupReserveFormController.java
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

// ※ Spring 의 『Controller』 인터페이스를 구현하는 방법을 통해
//    사용자 정의 컨트롤러 클래스를 구성한다.
//    cf.Controller Annotation 활용
public class GroupReserveFormController implements Controller
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
		ArrayList<CafeDTO> cafe = new ArrayList<CafeDTO>();
		
		try
		{
			String grCode = request.getParameter("grCode");
			String srCode = request.getParameter("srCode");
			String scCode = request.getParameter("scCode");
			String reserveDate = request.getParameter("reserveDate");
			String reserveAddr1 = request.getParameter("reserveAddr1");
			String reserveAddr2 = request.getParameter("reserveAddr2");
			String reserveHour1 = request.getParameter("reserveHour1");
			String reserveHour2 = request.getParameter("reserveHour2");
			String reserveCount = request.getParameter("reserveCount");
			
			dao.connection();
			
			cafe = dao.roomInfoList(srCode);
			
			mav.addObject("cafe", cafe);
			mav.addObject("reserveDate", reserveDate);
			mav.addObject("reserveAddr1", reserveAddr1);
			mav.addObject("reserveAddr2", reserveAddr2);
			mav.addObject("reserveHour1", reserveHour1);
			mav.addObject("reserveHour2", reserveHour2);
			mav.addObject("reserveCount", reserveCount);
			
			mav.setViewName("/WEB-INF/view/reservation/ReservationInfo.jsp");
			
			dao.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
				
		
		return mav;
		
	}

}
