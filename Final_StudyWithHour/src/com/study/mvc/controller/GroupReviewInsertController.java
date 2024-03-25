/*==================================
	GroupReviewInsertController.java
	- 사용자 정의 컨트롤러 클래스
===================================*/

package com.study.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.study.mvc.model.GroupDAO;

public class GroupReviewInsertController implements Controller
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
		
		GroupDAO dao = new GroupDAO();
		
		try
		{
			String grCode = request.getParameter("gr_code");
			String guCode = request.getParameter("gu_code");
			String fbCode = request.getParameter("fb_code");
			String rvContent = request.getParameter("rvContent");
			dao.connection();
			
			// 리뷰 등록
			dao.reviewAdd(fbCode, rvContent);
			
			// 그룹 예약내역 페이지로 이동
			mav.setViewName("redirect:groupreservelist.do?gr_code=" + grCode + "&gu_code=" + guCode);
			
			dao.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
				
		
		return mav;
		
	}

}
