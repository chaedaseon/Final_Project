// ModifyInfoCheckController.java
// 회원가입 

package com.study.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.study.mvc.model.GuestDAO;
import com.study.mvc.model.GuestDTO;

public class GuestUpdateController implements Controller
{
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// 액션 코드
		ModelAndView mav = new ModelAndView();
		
		// 세션 처리과정
		// 게스트 코드가 있는 경우에만 접근 가능
		HttpSession session = request.getSession();
		
		if (session.getAttribute("guCode")==null)
		{
			// 게스트 코드가 없는 경우 로그인 폼으로 이동
			mav.setViewName("redirect:loginform.do");
			return mav;
		}
				
		
		// 비밀번호 수정을 눌렀을 때, 수행되는 작업
		String modifyType = request.getParameter("modifyType");
		
		if (modifyType.equals("pw"))
		{
			
			String upGuPw = request.getParameter("upGuPw");
			String guCode = request.getParameter("guCode");
			
			GuestDAO dao = new GuestDAO();
			try
			{
				dao.connection();
				
				dao.modifyPw(upGuPw, guCode);
				
				mav.setViewName("redirect:guestmypage.do");
				
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
		
		// 비밀번호 변경이 아닌 정보 변경일 경우
		if (modifyType.equals("all"))
		{
			// GuestMyPage.jsp 에서 넘어온 정보 수정 데이터
			// → guCode, upGuNick, upGuTel, upGuEmail
			String guCode = request.getParameter("guCode");
			String upGuNick = request.getParameter("upGuNick");
			String upGuTel1 = request.getParameter("upGuTel1");
			String upGuTel2 = request.getParameter("upGuTel2");
			String upGuTel3 = request.getParameter("upGuTel3");
			String upGuTel = upGuTel1 + upGuTel2 + upGuTel3;
			String upGuEmail = request.getParameter("upGuEmail");
			
			// 정보 수정
			try
			{
				GuestDAO dao = new GuestDAO();
				GuestDTO dto = new GuestDTO();
				
				dao.connection();
				
				dto.setGuNick(upGuNick);
				dto.setGuTel(upGuTel);
				dto.setGuEmail(upGuEmail);
				dto.setGuCode(guCode);
				
				dao.modify(dto);
				
				mav.setViewName("redirect:guestmypage.do");
				
				dao.close();
				
			}
			catch (Exception e) 
			{
				System.out.println(e.toString());
			}
		}
		
		return mav;
	}
}
