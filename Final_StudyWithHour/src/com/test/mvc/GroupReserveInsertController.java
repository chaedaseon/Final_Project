/*==================================
	GroupReserveInsertController.java
	- 사용자 정의 컨트롤러 클래스
===================================*/

package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

// ※ Spring 의 『Controller』 인터페이스를 구현하는 방법을 통해
//    사용자 정의 컨트롤러 클래스를 구성한다.
//    cf.Controller Annotation 활용
public class GroupReserveInsertController implements Controller
{
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// 액션 코드
		
		ModelAndView mav = new ModelAndView();
		
		// session 설정
		/*
		HttpSession session = request.getSession();
		
		if (session.getAttribute("name")==null)
		{
			mav.setViewName("redirect:loginform.action");
			return mav;
		}
		else if (session.getAttribute("admin")==null)
		{
			mav.setViewName("redirect:logout.action");
			return mav;
		}
		*/
		
		GroupDAO dao = new GroupDAO();
		GroupDTO dto = new GroupDTO();
		
		try
		{
			String gjCode = request.getParameter("gjCode");
			String srCode = request.getParameter("srCode");
			String reserveDate = request.getParameter("reserveDate");
			String reserveHour1 = request.getParameter("reserveHour1");
			String reserveHour2 = request.getParameter("reserveHour2");
			String reserveCount = request.getParameter("reserveCount");
			dao.connection();
			
			dto.setReStartDate(reserveDate);
			dto.setReStartHour(reserveHour1);
			dto.setReEndHour(reserveHour2);
			dto.setReCount(Integer.parseInt(reserveCount));
			dto.setGjCode(gjCode);
			dto.setSrCode(srCode);
			
			dao.roomReserveAdd(dto);
			
			mav.setViewName("redirect:groupreservesearch.do?&gjCode="+gjCode);
			
			dao.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
				
		
		return mav;
		
	}

}
