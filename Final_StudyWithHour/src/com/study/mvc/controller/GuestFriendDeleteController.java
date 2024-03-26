// GuestFriendDeleteController.java
// 이웃 삭제 

package com.study.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.study.mvc.model.GuestDAO;

public class GuestFriendDeleteController implements Controller
{
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// 액션 코드
		ModelAndView mav = new ModelAndView();
		
		// 세션 처리과정
		// 게스트 코드가 있는 경우에만 접근 가능
		HttpSession session = request.getSession();
		
		if (session.getAttribute("guCode")==null)
		{
			// 게스트 코드가 없는 경우 로그인 폼으로 이동
			mav.setViewName("redirect:loginform.do");
			return mav;
		}
		
		
		String guCode = request.getParameter("guCode");
		String fmCode = request.getParameter("fmCode");
		
		GuestDAO dao = new GuestDAO();
		try
		{
			
			dao.connection();
			
			dao.friendRemove(guCode, fmCode);
			
			mav.setViewName("redirect:friendlist.do?guCode="+guCode);
			
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
