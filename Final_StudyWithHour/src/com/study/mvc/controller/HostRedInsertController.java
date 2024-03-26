/*==================================
	HostRedInsertController.java
===================================*/

package com.study.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.study.mvc.model.CafeDAO;


public class HostRedInsertController implements Controller
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
			String hoCode = (String)session.getAttribute("hoCode");
			String fbCode = request.getParameter("fbCode");
			String reasonCode = request.getParameter("reason");
			String file = request.getParameter("file");
			
			dao.connection();
			
			// 신고 요청 등록
			result = dao.addHostRed(fbCode, reasonCode, file);
			
			if (result < 1)
			{
				mav.setViewName("redirect:cafereservelist.do?hoCode=" + hoCode);
			}
			
			// 신고 내역 페이지로 이동
			mav.setViewName("redirect:hostredlist.do?hoCode=" + hoCode);
			
			dao.close();
		}
		catch (Exception e)
		{
			System.out.println(e.toString());
		}
				
		
		return mav;
		
	}

}
