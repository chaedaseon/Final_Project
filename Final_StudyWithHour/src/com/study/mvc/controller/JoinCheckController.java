// JoinCheckController.java
// 아이디, 닉네임 중복 검사 컨트롤러

package com.study.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.study.mvc.model.GuestDAO;
import com.study.mvc.model.HostDAO;

public class JoinCheckController implements Controller
{

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// 액션 코드
		
		ModelAndView mav = new ModelAndView();
		
		String userType = request.getParameter("userType");	// guest : 게스트, host : 호스트
		String check = request.getParameter("check");		// id : 아이디 중복확인, nick : 닉네임 중복확인
															// pw : 비밀번호 확인, info : 회원가입 전 개인정보 일치 여부 확인
		
		// 게스트 관련 확인
		if(userType != null && userType.equals("guest"))
		{
			GuestDAO dao = new GuestDAO();
			
			try
			{
				dao.connection();
				
				// 게스트 아이디 중복 확인
				if (check != null && check.equals("id"))
				{
					String guId = request.getParameter("guId");
					
					int idCount = 0;
					
					idCount = dao.idCheck(guId); 
					
					mav.addObject("idCount", idCount);
					mav.setViewName("/WEB-INF/view/main/Join_ajax.jsp");
				}
				// 게스트 닉네임 중복 확인
				if (check != null && check.equals("nick"))
				{
					String guNick = request.getParameter("guNick");
					
					int nickCount = 0;
					
					nickCount = dao.nickCheck(guNick); 
					
					mav.addObject("nickCount", nickCount);
					
					mav.setViewName("/WEB-INF/view/main/CheckNick_ajax.jsp");
				}
				// 게스트 개인정보 중복 확인
				if(check != null && check.equals("info"))
				{
					String guName = request.getParameter("guName");
					String guSsn = request.getParameter("guSsn");
					String guTel = request.getParameter("guTel");
					
					int infoCount = 0;
					
					infoCount = dao.infoCheck(guName, guSsn, guTel);
					
					mav.addObject("infoCount", infoCount);
					mav.setViewName("/WEB-INF/view/main/CheckInfo_ajax.jsp");
				}	
				// 게스트 비밀번호 확인 (정보 수정 시 사용)
				if(check != null && check.equals("pw"))
				{
					String guCode = request.getParameter("guCode");
					String guPwCheck = request.getParameter("guPwCheck");
					
					int pwCount = 0;
					
					pwCount = dao.pwCheck(guCode, guPwCheck);
					
					mav.addObject("pwCount", pwCount);
					
					mav.setViewName("/WEB-INF/view/main/CheckPw_ajax.jsp");
					
				}
					
			}
			catch (Exception e) 
			{
				System.out.println(e.toString());
			}
			finally 
			{
				dao.close();
			}
		}
		
		// 호스트 관련 확인
		if(userType != null && userType.equals("host"))
		{
			HostDAO dao = new HostDAO();
			
			try
			{
				dao.connection();
				
				// 호스트 아이디 중복 확인
				if (check != null && check.equals("id"))
				{
					String hoId = request.getParameter("hoId");
					
					int idCount = 0;
					
					idCount = dao.idCheck(hoId); 
					
					mav.addObject("idCount", idCount);
					mav.setViewName("WEB-INF/view/main/CheckId_ajax.jsp"); 
				}
				// 호스 개인정보 중복 확인
				if(check != null && check.equals("info"))
				{
					String hoName = request.getParameter("hoName");
					String hoSsn = request.getParameter("hoSsn");
					String hoTel = request.getParameter("hoTel");
					
					int infoCount = 0;
					
					infoCount = dao.infoCheck(hoName, hoSsn, hoTel);
					
					mav.addObject("infoCount", infoCount);
					mav.setViewName("/WEB-INF/view/main/CheckInfo_ajax.jsp");
					
				}	
				
				// 호스트 비밀번호 확인 (정보 수정 시 사용)
				if(check != null && check.equals("pw"))
				{
					String hoCode = request.getParameter("hoCode");
					String hoPwCheck = request.getParameter("hoPwCheck");
					
					int pwCount = 0;
					
					pwCount = dao.pwCheck(hoCode, hoPwCheck);
					
					mav.addObject("pwCount", pwCount);
					
					mav.setViewName("/WEB-INF/view/main/CheckPw_ajax.jsp");
				}
					
			}
			catch (Exception e) 
			{
				System.out.println(e.toString());
			}
			finally 
			{
				dao.close();
			}
		}

		return mav;
		
	}
	
}
