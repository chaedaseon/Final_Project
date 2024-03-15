/*==================================
	CafeRoomDeleteController.java
	- 사용자 정의 컨트롤러 클래스
===================================*/

package com.study.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.study.mvc.model.CafeDAO;

// ※ Spring 의 『Controller』 인터페이스를 구현하는 방법을 통해
//    사용자 정의 컨트롤러 클래스를 구성한다.
//    cf.Controller Annotation 활용
public class CafeRoomDeleteController implements Controller
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
		int reCount = 0;
		
		try
		{
			String srCode = request.getParameter("srCode");
			String scCode = request.getParameter("scCode");
			dao.connection();
			
			reCount = dao.roomReserveCount(srCode);
			
			if (reCount > 0)
			{
				request.setAttribute("msg", "예약내역이 존재하여 삭제가 불가합니다.");
		        request.setAttribute("url", "/");
				mav.setViewName("redirect:cafedetail.do?scCode=" + scCode);
			}			
			else
				result = dao.roomRemove(srCode);
				mav.setViewName("redirect:cafedetail.do?scCode=" + scCode);
	
				
			if (result <= 0)
				mav.setViewName("redirect:cafedetail.do?scCode=" + scCode);
			
			
			
			dao.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
				
		
		return mav;
		
	}

}
