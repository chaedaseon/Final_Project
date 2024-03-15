// ModifyInfoCheckController.java
// 회원가입 

package com.study.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class GuestUpdateFormController implements Controller
{

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// 액션 코드
		ModelAndView mav = new ModelAndView();
		
		// 세션 처리과정
		HttpSession session = request.getSession();
		
		/*
		if (session.getAttribute("guCode")==null)	
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
		
		String guCode = (String)session.getAttribute("guCode");
		
		mav.addObject("guCode", guCode);
		
		
		// 마이페이지 정보 수정 및 회원 탈퇴 전 비밀번호 확인 폼 연결
		mav.setViewName("/WEB-INF/view/guest/GuestMyPage.jsp");
		
		return mav;
	}
}
