// GuestFriendListFormController.java
// 이웃관리 

package com.test.mvc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class GuestFriendListController implements Controller
{

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// 액션 코드
		ModelAndView mav = new ModelAndView();
		
		// 세션 처리
		
		
		// 이웃관리 리스트 출력 실행
		String guCode = request.getParameter("guCode");
		
		ArrayList<GuestDTO> friendList = new ArrayList<GuestDTO>();
		
		try
		{
			GuestDAO dao = new GuestDAO();
			
			dao.connection();
			
			friendList = dao.frinedList(guCode);
			
			mav.addObject("friendList", friendList);
			/* mav.setViewName("/WEB-INF/view/GuestFriendList.jsp"); */
			mav.setViewName("GuestFriendList.jsp");
			
			dao.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
	
		
		return mav;
	}
}
