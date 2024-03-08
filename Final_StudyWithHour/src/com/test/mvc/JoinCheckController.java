// JoinCheckController.java
// 아이디, 닉네임 중복 검사 컨트롤러

package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class JoinCheckController implements Controller
{

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// 액션 코드
		
		ModelAndView mav = new ModelAndView();
		
		String check = request.getParameter("check");		// id : 아이디 중복확인, nick : 닉네임 중복확인
		
		// 게스트 아이디 중복 확인
		if (check != null && check.equals("id"))
		{
			String guId = request.getParameter("guId");
			
			int idCount = 0;
			
			try
			{
				GuestDAO dao = new GuestDAO();
				dao.connection();
				idCount = dao.idCheck(guId); 
				
				mav.addObject("idCount", idCount);
				/* mav.setViewName("WEB-INF/view/Join_ajax"); */
				mav.setViewName("Join_ajax.jsp");
				
				dao.close();
			} catch (Exception e)
			{
				System.out.println(e.toString());
			}
		}
		
		// 게스트 닉네임 중복 확인
		if (check != null && check.equals("nick"))
		{
			String guNick = request.getParameter("guNick");
			
			String nick = "";
			
			try
			{
				GuestDAO dao = new GuestDAO();
				
				dao.connection();
				
				nick = dao.nickCheck(guNick); 
				
				mav.addObject("nick", nick);
				
				/* mav.setViewName("WEB-INF/view/Join_ajax"); */
				mav.setViewName("CheckNick_ajax.jsp");
				
				dao.close();
			} catch (Exception e)
			{
				System.out.println(e.toString());
			}
		}
		
		
		
		return mav;
		
	}
	
}
