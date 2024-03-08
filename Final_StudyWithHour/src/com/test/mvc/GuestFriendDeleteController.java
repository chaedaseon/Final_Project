// GuestFriendDeleteController.java
// 이웃 삭제 

package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class GuestFriendDeleteController implements Controller
{
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// 액션 코드
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		
		// 세션 처리과정
		
		
		String guCode = request.getParameter("guCode");
		String fmCode = request.getParameter("fmCode");
		
		try
		{
			GuestDAO dao = new GuestDAO();
			
			dao.connection();
			
			dao.friendRemove(guCode, fmCode);
			
			dao.close();
			
			mav.setViewName("redirect:friendlist.do?guCode="+guCode);
			
		}
		catch (Exception e) 
		{
			System.out.println(e.toString());
		}
		
		return mav;
		
	}
}
