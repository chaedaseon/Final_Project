/*==================================
	LocationListController.java
	- 사용자 정의 컨트롤러 클래스
===================================*/

package com.study.mvc.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.study.mvc.model.CafeDAO;
import com.study.mvc.model.GroupDTO;

// ※ Spring 의 『Controller』 인터페이스를 구현하는 방법을 통해
//    사용자 정의 컨트롤러 클래스를 구성한다.
//    cf.Controller Annotation 활용
public class LocationListController implements Controller
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
		ArrayList<GroupDTO> lsName = new ArrayList<GroupDTO>();
		String lfCode = "";
		
		try
		{
			dao.connection();
			
			// 이전 페이지로부터 넘어온 데이터 조회
			//-- 지역 이름, 그룹코드
			String lfList = request.getParameter("lfList");
			String grCode = request.getParameter("grCode");
			String guCode = request.getParameter("guCode");
			
			// 지역이름으로 지역코드 조회
			lfCode = dao.searchLf(lfList);
			// 지역코드로 지역중분류 조회
			lsName = dao.lsList(lfCode);
			
			mav.addObject("lsName", lsName);
			mav.setViewName("groupreservesearch.do?guCode=" +guCode+ "&grCode=" + grCode + "&lfCode=" + lfCode);
			
			dao.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
				
		
		return mav;
		
	}

}
