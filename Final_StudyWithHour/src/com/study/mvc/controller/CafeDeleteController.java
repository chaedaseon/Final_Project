/*==================================
	CafeDeleteController.java
	- 사용자 정의 컨트롤러 클래스
===================================*/

package com.study.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.study.mvc.model.CafeDAO;

public class CafeDeleteController implements Controller
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
		
		try
		{
			// 이전 페이지(StudyCafeInfo.jsp)로부터 넘어온 데이터 수신
			// scCode, hoCode
			String scCode = request.getParameter("scCode");
			String hoCode = request.getParameter("hoCode");

			dao.connection();
			
			// 수신한 데이터로 스터디카페 비활성화
			int result = dao.remove(scCode, hoCode);
			
			// 카페 비활성화가 안될 경우 스터디카페 상세정보로 다시 돌아감
			if (result <= 0)
			{
				mav.setViewName("redirect:cafedetail.do?scCode=" + scCode);
			}
			
			// 카페 비활성화가 되는 경우 스터디카페 목록으로 돌아감
			mav.setViewName("redirect:cafelist.do");
			
			dao.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;
		
	}

}
