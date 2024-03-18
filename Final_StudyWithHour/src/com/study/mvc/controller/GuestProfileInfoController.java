/*==================================
	GuestProfileInfoController.java
	- 사용자 정의 컨트롤러 클래스
===================================*/

package com.study.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.study.mvc.model.GuestDAO;
import com.study.mvc.model.GuestDTO;

// ※ Spring 의 『Controller』 인터페이스를 구현하는 방법을 통해
//    사용자 정의 컨트롤러 클래스를 구성한다.
//    cf.Controller Annotation 활용
public class GuestProfileInfoController implements Controller
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
		
		GuestDAO dao = new GuestDAO();
		GuestDTO member = new GuestDTO();
		int count = 0;
		
		try
		{
			dao.connection();
			
			String grCode = request.getParameter("gr_code");
			String guCode = request.getParameter("gu_code");
			member = dao.guestInfoList(guCode);
			count = dao.friendCount(guCode);
			
			mav.addObject("grCode", grCode);
			mav.addObject("count", count);
			mav.addObject("member", member);
			mav.setViewName("/WEB-INF/view/guest/GuestProfileCard.jsp");
			
			dao.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
				
		
		return mav;
		
	}

}

