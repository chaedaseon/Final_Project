/*==================================
	GroupMeetFormController.java
	- 사용자 정의 컨트롤러 클래스
===================================*/

package com.study.mvc.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.study.mvc.model.GroupDAO;
import com.study.mvc.model.GroupDTO;

public class GroupMeetFormController implements Controller
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
		GroupDTO meet = new GroupDTO();
		ArrayList<GroupDTO> attMem = new ArrayList<GroupDTO>();
		ArrayList<GroupDTO> unattMem = new ArrayList<GroupDTO>();
		ArrayList<GroupDTO> preattMem = new ArrayList<GroupDTO>();
		String meetContent = "";
		
		try
		{
			// 이전 페이지로부터 넘어온 데이터 수신
			String gschCode = request.getParameter("gschCode");
			String grCode = request.getParameter("gr_code");
			String guCode = request.getParameter("gu_code");
			
			dao.connection();
			
			// 모임정보 조회
			meet = dao.meetInfo(gschCode);
			// 불참자멤버 조회
			unattMem = dao.unAttMemberList(gschCode);
			// 참석자멤버 조회
			attMem = dao.attMemberList(gschCode);
			// 참석예정자멤버 조회
			preattMem = dao.PreAttMemberList(gschCode);
			// 모임기록 조회
			meetContent = dao.meetRecord(gschCode);
			
			mav.addObject("grCode", grCode);
			mav.addObject("meet", meet);
			mav.addObject("attMem", attMem);
			mav.addObject("unattMem", unattMem);
			mav.addObject("preattMem", preattMem);
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
