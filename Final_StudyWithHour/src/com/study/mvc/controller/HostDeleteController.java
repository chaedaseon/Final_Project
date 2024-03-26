// HostDeleteController.java
// 호스트회원탈퇴 

package com.study.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.study.mvc.model.HostDAO;

public class HostDeleteController implements Controller
{
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// 액션 코드
		ModelAndView mav = new ModelAndView();
		
		// 세션 처리과정
		// 호스트코드가 있는 경우에만 접근 가능
		HttpSession session = request.getSession();
		
		if (session.getAttribute("hoCode")==null)
		{
			// 호스트코드가 없는 경우 로그인 폼으로 이동
			mav.setViewName("redirect:loginform.do");
			return mav;
		}
		
		String hoCode = request.getParameter("hoCode");
		String reasonCode = request.getParameter("reasonCode");
		
		
		HostDAO dao = new HostDAO();
		try
		{
			dao.connection();
			
			dao.remove(hoCode, reasonCode);
			
			session.removeAttribute("hoCode");
			mav.setViewName("studywithhour.do");
			
		}
		catch (Exception e) 
		{
			System.out.println(e.toString());
		}
		finally 
		{
			dao.close();
		}
		
		return mav;
		
	}
}
