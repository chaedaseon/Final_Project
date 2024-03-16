// GuestPenaltyListController.java
// 패널티 부여 내역

package com.study.mvc.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.study.mvc.model.GuestBoardDAO;
import com.study.mvc.model.GuestBoardDTO;

public class GuestPenaltyListController implements Controller
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
		
		GuestBoardDAO dao = new GuestBoardDAO();
		
		try
		{
			String guCode = request.getParameter("guCode");
			dao.connection();
			
			ArrayList<GuestBoardDTO> penaltyList = new ArrayList<GuestBoardDTO>();
			
			penaltyList = dao.penaltyList(guCode);
			
			mav.addObject("penaltyList", penaltyList);
			
			mav.setViewName("/WEB-INF/view/guest/GuestPenaltyList.jsp");
			
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
