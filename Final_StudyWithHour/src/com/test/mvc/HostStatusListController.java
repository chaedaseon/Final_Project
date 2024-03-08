/*==================================
	HostStatusListController.java
	- 사용자 정의 컨트롤러 클래스
===================================*/

package com.test.mvc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

// ※ Spring 의 『Controller』 인터페이스를 구현하는 방법을 통해
//    사용자 정의 컨트롤러 클래스를 구성한다.
//    cf.Controller Annotation 활용
public class HostStatusListController implements Controller
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
		ArrayList<CafeDTO> cafe = new ArrayList<CafeDTO>();
		int totalCount = 0;
		int stateYetCount = 0;
		int stateDoneCount = 0;
		int noshowCount = 0;
		int cancelCount = 0;
		
		try
		{
			String hoCode = request.getParameter("hoCode");
			String scCode = request.getParameter("scCode");
			String cfState = request.getParameter("cfState");
			String code = "";
			dao.connection();
			
			cafe = dao.lists(hoCode, 1, 10);
			
			if (cfState == null)
			{
				cfState = "cfAll";
				code = hoCode;
			}
			else if (cfState.equals("cfAll"))
			{
				code = hoCode;
			}
			else
				code = cfState;
			
			totalCount = dao.cafeAllCount(code, cfState);
			stateYetCount = dao.cafeStateCount(code, cfState, "이용예정");
			stateDoneCount = dao.cafeStateCount(code, cfState, "이용완료");
			noshowCount = dao.cafeStateCount(code, cfState, "노쇼");
			cancelCount = totalCount - (stateYetCount + stateDoneCount + noshowCount);
			
			mav.addObject("cancelCount", cancelCount);
			mav.addObject("stateYetCount", stateYetCount);
			mav.addObject("stateDoneCount", stateDoneCount);
			
			mav.addObject("noshowCount", noshowCount);
			mav.addObject("totalCount", totalCount);
			mav.addObject("cafe", cafe);
			mav.addObject("scCode", scCode);
			/*
			request.setAttribute("cancelCount", cancelCount);
			request.setAttribute("stateYetCount", stateYetCount);
			request.setAttribute("stateDoneCount", stateDoneCount);
			*/
			
			mav.setViewName("StatisticsList.jsp");
			//mav.setViewName("StatisticsList_ajax.jsp");
			//mav.setViewName("redirect:hoststatuslist.do?hoCode=" +hoCode+ "&scCode=" + cfState);
			//mav.setViewName("/WEB-INF/view/StatisticsList.jsp");
			
			dao.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
				
		
		return mav;
		
	}

}
