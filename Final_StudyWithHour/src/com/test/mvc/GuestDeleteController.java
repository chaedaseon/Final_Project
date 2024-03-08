// GuestUnregController.java
// 회원탈퇴 

package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class GuestDeleteController implements Controller
{
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// 액션 코드
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		
		// 세션 처리과정
		
		
		String guCode = request.getParameter("guCode");
		String reasonCode = request.getParameter("reasonCode");
		
		try
		{
			GuestDAO dao = new GuestDAO();
			
			dao.remove(guCode, reasonCode);
			
			session.removeAttribute("guCode");
			mav.setViewName("MainPage.jsp");
			
			dao.close();
			
		}
		catch (Exception e) 
		{
			System.out.println(e.toString());
		}
		
			
		
		return mav;
		
	}
}
