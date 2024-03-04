/*================================
   LogoutController.java
=================================*/

package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class LogoutController implements Controller
{

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// 액션 코드
		ModelAndView mav = new ModelAndView();
		
		// 세션에 구성된 속성값 제거
		HttpSession session = request.getSession();
		
		session.removeAttribute("adCode");
		session.removeAttribute("guCode");
		session.removeAttribute("hoCode");
		
		mav.setViewName("redirect:MainPage.jsp");
		
		
		return mav;
		
	}
	
}
