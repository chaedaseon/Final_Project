// JoinFormController.java
// 회원가입 

package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class JoinFormController implements Controller
{

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// 액션 코드
		ModelAndView mav = new ModelAndView();
		
		// 회원가입 폼 연결
		// type 값이 1이면 게스트 회원가입, 2이면 호스트 회원가입
		String type = request.getParameter("type");
		String url = "";
		
		try
		{
			if (type.equals("1"))
			{
				/* url = "/WEB-INF/view/GuestJoinForm"; */
				url = "GuestJoinForm.jsp";
				mav.setViewName(url);
				mav.addObject("type", type);
			}
			
			else if (type.equals("2"))
			{
				/* url = "/WEB-INF/view/HostJoinForm"; */
				url = "HostJoinForm.jsp";
				mav.setViewName(url);
				mav.addObject("type", type);
			}
		}
		catch (Exception e) 
		{
			System.out.println(e.toString());
		}
		
		return mav;
	}
}
