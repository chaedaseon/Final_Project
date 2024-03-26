// GuestFriendListFormController.java
// 이웃관리 리스트 출력

package com.study.mvc.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.study.mvc.model.GuestDAO;
import com.study.mvc.model.GuestDTO;

public class GuestFriendListController implements Controller
{

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// 액션 코드
		ModelAndView mav = new ModelAndView();
		
		// 세션 처리
		// 게스트 코드가 있는 경우에만 접근 가능
		HttpSession session = request.getSession();
		
		if (session.getAttribute("guCode")==null)
		{
			// 게스트 코드가 없는 경우 로그인 폼으로 이동
			mav.setViewName("redirect:loginform.do");
			return mav;
		}
		
		
		// 이웃관리 리스트 출력 실행
		String guCode = request.getParameter("guCode");
		
		ArrayList<GuestDTO> friendList = new ArrayList<GuestDTO>();
		
		GuestDAO dao = new GuestDAO();
		try
		{
			dao.connection();
			
			friendList = dao.frinedList(guCode);
			
			mav.addObject("friendList", friendList);
			mav.setViewName("/WEB-INF/view/guest/GuestFriendList.jsp");
			
			dao.close();
			
		} catch (Exception e)
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
