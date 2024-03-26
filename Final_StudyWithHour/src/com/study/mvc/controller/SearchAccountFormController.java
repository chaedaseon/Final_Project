/*================================
   SearchAccountFormController.java
=================================*/

package com.study.mvc.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class SearchAccountFormController implements Controller
{

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// 액션 코드
		ModelAndView mav = new ModelAndView();

		// 계정 찾기 유형 데이터 확인 (아이디 / 비밀번호)
		// type = id / type = pw
		String searchType = request.getParameter("type");
		
		// 아이디 찾기를 선택한 경우
		if ("id".equals(searchType))
		{
			mav.setViewName("/WEB-INF/view/main/SearchIdForm.jsp");
		}
		
		// 비밀번호 찾기를 선택한 경우
		if ("pw".equals(searchType))
		{
			mav.setViewName("/WEB-INF/view/main/SearchPwForm.jsp");
		}	
		
		return mav;
		
	}
	
}
