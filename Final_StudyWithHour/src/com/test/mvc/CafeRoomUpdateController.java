/*==================================
	SampleController.java
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
public class CafeRoomUpdateController implements Controller
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
		
		CafeDAO dao = new CafeDAO();
		CafeDTO dto = new CafeDTO();
		
		try
		{
			dao.connection();
			
			String scCode = request.getParameter("scCode");
			String srCode = request.getParameter("srCode");
			String srName = request.getParameter("name");
			String srCount = request.getParameter("srCount");
			String srPrice = request.getParameter("price");
			
			
			dto.setSrCode(srCode);
			dto.setSrName(srName);
			dto.setSrCount(Integer.parseInt(srCount));
			dto.setSrPrice(Integer.parseInt(srPrice));
			
			dao.modifyRoom(dto);
			
			mav.addObject("srCode", srCode);
			mav.setViewName("redirect:cafedetail.do?scCode = " + scCode);
			
			dao.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
				
		
		return mav;
		
	}

}
