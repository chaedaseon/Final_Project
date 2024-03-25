/*==================================
	GuestProfileInfoController.java
	- 사용자 정의 컨트롤러 클래스
===================================*/

package com.study.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.study.mvc.model.GuestDAO;
import com.study.mvc.model.GuestDTO;

public class GuestProfileInfoController implements Controller
{
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// 액션 코드
		
		ModelAndView mav = new ModelAndView();
		
		// session 설정
		// 세션 처리
		// 게스트 코드가 있는 경우에만 접근 가능
		HttpSession session = request.getSession();
		
		if (session.getAttribute("guCode")==null)
		{
			// 게스트 코드가 없는 경우 로그인 폼으로 이동
			mav.setViewName("redirect:loginform.do");
			return mav;
		}
		
		GuestDAO dao = new GuestDAO();
		GuestDTO member = new GuestDTO();
		int count = 0;
		
		try
		{
			dao.connection();
			
			String grCode = request.getParameter("gr_code");
			String guCode = request.getParameter("gu_code");
			
			// 게스트 정보 내역 조회
			member = dao.guestInfoList(guCode);
			// 해당 게스트를 찜한 이웃 수 조회
			count = dao.friendCount(guCode);
			
			mav.addObject("grCode", grCode);
			mav.addObject("count", count);
			mav.addObject("member", member);
			
			// 게스트 프로필 카드 페이지로 이동
			mav.setViewName("/WEB-INF/view/guest/GuestProfileCard.jsp");
			
			dao.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
				
		
		return mav;
		
	}

}

