// ModifyInfoCheckController.java
// 회원가입 

package com.study.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class HostMyPageFormController implements Controller
{

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// 액션 코드
		ModelAndView mav = new ModelAndView();
		
		// 세션 처리과정
		HttpSession session = request.getSession();
		
		
		if (session.getAttribute("hoCode")==null)	
		{
			
			mav.setViewName("redirect:loginform.action");
			return mav;
		}
		
		String hoCode = (String)session.getAttribute("hoCode");
		
		mav.addObject("hoCode", hoCode);
		
		
		mav.setViewName("/WEB-INF/view/host/HostMyPage.jsp");
		
		return mav;
	}
}
