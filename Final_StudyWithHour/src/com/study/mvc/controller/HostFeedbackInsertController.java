/*==================================
	HostFeedbackInsertController.java
	- 사용자 정의 컨트롤러 클래스
===================================*/

package com.study.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.study.mvc.model.CafeDAO;

// ※ Spring 의 『Controller』 인터페이스를 구현하는 방법을 통해
//    사용자 정의 컨트롤러 클래스를 구성한다.
//    cf.Controller Annotation 활용
public class HostFeedbackInsertController implements Controller
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
		int result = 0;
		
		try
		{
			String scCode = request.getParameter("scCode");
			String hoCode = request.getParameter("hoCode");
			String reCode = request.getParameter("reCode");
			String feed = request.getParameter("feed");
			
			dao.connection();
			result = dao.feedbackAdd(feed, reCode);
			
			if (result < 1)
			{
				mav.setViewName("redirect:cafereservelist.do?hoCode=" + hoCode);
			}
			
			mav.setViewName("redirect:cafereservelist.do?hoCode=" + hoCode);
			
			dao.close();
		}
		catch (Exception e)
		{
			System.out.println(e.toString());
		}
				
		
		return mav;
		
	}

}
