// GuestScrapDeleteController.java
// 게시물 스크랩 내역 삭제

package com.study.mvc.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.study.mvc.model.GuestBoardDAO;

public class GuestScrapDeleteController implements Controller
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
		
		GuestBoardDAO guest = new GuestBoardDAO();
		try
		{
			String guCode = request.getParameter("guCode");
			String boCode = request.getParameter("boCode");
			
			guest.connection();
			
			// 전체(모두 접근 가능한) 게시글 스크랩 인서트 실행
			guest.scrapRemove(guCode, boCode);
			
			mav.setViewName("redirect:guestscraplist.do?guCode="+guCode);

			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		finally
		{
			guest.close();
		}
	
		
		return mav;
	}
}
