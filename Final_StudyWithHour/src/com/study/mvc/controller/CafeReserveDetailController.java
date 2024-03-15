/*==================================
	CafeReserveDetailController.java
===================================*/

package com.study.mvc.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.study.mvc.model.CafeDAO;
import com.study.mvc.model.CafeDTO;

public class CafeReserveDetailController implements Controller
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
		CafeDTO info = new CafeDTO();
		
		try
		{
			String code = request.getParameter("code");
			
			dao.connection();
			info = dao.ReserveInfoLists(code);
			
			mav.addObject("info", info);
			
			mav.setViewName("/WEB-INF/view/host/CafeReservationInfo.jsp");
			
			dao.close();
		}
		catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;
		
	}

}
