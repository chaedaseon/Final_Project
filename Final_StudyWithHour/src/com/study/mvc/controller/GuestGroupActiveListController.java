// GuestGroupJoinListFormController.java
// 그룹 가입 신청 내역

package com.study.mvc.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.study.mvc.model.GuestGroupDAO;
import com.study.mvc.model.GuestGroupDTO;

public class GuestGroupActiveListController implements Controller
{
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// 액션 코드
		ModelAndView mav = new ModelAndView();
		
		// 세션 처리
		// 게스트 코드가 있는 경우에만 접근 가능
		HttpSession session = request.getSession();
		
		if (session.getAttribute("guCode")==null)
		{
			// 게스트 코드가 없는 경우 로그인 폼으로 이동
			mav.setViewName("redirect:loginform.do");
			return mav;
		}
		
		GuestGroupDAO group = new GuestGroupDAO();
		String guCode = request.getParameter("guCode");
		try
		{
			group.connection();
			
			// 현재 활동중인 그룹 리스트 출력 실행
			ArrayList<GuestGroupDTO> groupActiveList = new ArrayList<GuestGroupDTO>();
			
			groupActiveList = group.groupActiveList(guCode);
			mav.addObject("groupActiveList", groupActiveList);
			
			
			mav.setViewName("/WEB-INF/view/guest/GuestGroupActiveList.jsp?guCode="+guCode);

			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		finally
		{
			group.close();
		}
	
		
		return mav;
	}
}
