// JoinFormController.java
// 회원가입 

package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class JoinTypeFormController implements Controller
{

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// 액션 코드
		ModelAndView mav = new ModelAndView();
		
		// 회원가입 폼 연결
		/* mav.setViewName("/WEB-INF/view/JoinFormType.jsp"); */
		mav.setViewName("JoinFormType.jsp");
		
		return mav;
	}
}
