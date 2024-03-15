/*================================
   SearchAccountController.java
=================================*/

package com.study.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.study.mvc.model.GuestDAO;
import com.study.mvc.model.HostDAO;

public class MainPageController implements Controller
{

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// 액션 코드
		ModelAndView mav = new ModelAndView();

		mav.setViewName("/WEB-INF/view/main/MainPage.jsp");
			
		return mav;
	}
}
;