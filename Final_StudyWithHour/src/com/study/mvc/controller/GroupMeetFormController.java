/*==================================
	GroupMeetFormController.java
	- 사용자 정의 컨트롤러 클래스
===================================*/

package com.study.mvc.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.study.mvc.model.GroupDAO;
import com.study.mvc.model.GroupDTO;


// ※ Spring 의 『Controller』 인터페이스를 구현하는 방법을 통해
//    사용자 정의 컨트롤러 클래스를 구성한다.
//    cf.Controller Annotation 활용
public class GroupMeetFormController implements Controller
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
		GroupDTO meet = new GroupDTO();
		ArrayList<GroupDTO> attMem = new ArrayList<GroupDTO>();
		ArrayList<GroupDTO> unattMem = new ArrayList<GroupDTO>();
		String meetContent = "";
		
		try
		{
			String gschCode = request.getParameter("gschCode");
			String grCode = request.getParameter("gr_code");
			String guCode = request.getParameter("gu_code");
			
			dao.connection();
			
			meet = dao.meetInfo(gschCode);
			attMem = dao.meetMemberList(gschCode);
			meetContent = dao.meetRecord(gschCode);
			unattMem = dao.unattMemberList(gschCode);
			
			String gjCode = dao.searchGjcode(guCode, grCode);
			
			mav.addObject("gjCode", gjCode);
			mav.addObject("meet", meet);
			mav.addObject("attMem", attMem);
			mav.addObject("unattMem", unattMem);
			mav.addObject("meetContent", meetContent);
			
			// 모임기록 작성폼으로 이동
			mav.setViewName("/WEB-INF/view/group/MeetInsertForm.jsp");
			
			dao.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
				
		
		return mav;
		
	}

}
