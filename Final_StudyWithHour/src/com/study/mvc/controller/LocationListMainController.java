/*==================================
	LocationListMainController.java
	- 사용자 정의 컨트롤러 클래스
===================================*/

package com.study.mvc.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.study.mvc.model.CafeDAO;
import com.study.mvc.model.GroupDTO;

public class LocationListMainController implements Controller
{
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// 액션 코드
		ModelAndView mav = new ModelAndView();
		
		// session 설정
		// 게스트 코드가 있는 경우에만 접근 가능
		HttpSession session = request.getSession();
		
		if (session.getAttribute("guCode")==null)
		{
			// 게스트 코드가 없는 경우 로그인 폼으로 이동
			mav.setViewName("redirect:loginform.do");
			return mav;
		}
		
		CafeDAO dao = new CafeDAO();
		ArrayList<GroupDTO> lsName = new ArrayList<GroupDTO>();
		String lfCode = "";
		
		try
		{
			dao.connection();
			
			// 이전 페이지로부터 넘어온 데이터 조회
			//-- 지역 이름, 그룹코드
			String lfList = request.getParameter("lfList");
			String grCode = request.getParameter("gr_code");
			String guCode = request.getParameter("gu_code");
			
			// 지역이름으로 지역코드 조회
			lfCode = dao.searchLf(lfList);
			// 지역코드로 지역중분류 조회
			lsName = dao.lsList(lfCode);
			
			mav.addObject("lsName", lsName);
			mav.setViewName("mainreservesearch.do?gu_code=" +guCode+ "&gr_code=" + grCode + "&lfCode=" + lfCode);
			
			dao.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
				
		
		return mav;
		
	}

}
