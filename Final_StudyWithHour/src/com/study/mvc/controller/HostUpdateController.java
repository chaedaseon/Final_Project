// ModifyInfoCheckController.java
// 회원가입 

package com.study.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.study.mvc.model.HostDAO;
import com.study.mvc.model.HostDTO;

public class HostUpdateController implements Controller
{
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// 액션 코드
		ModelAndView mav = new ModelAndView();
		
		// 세션 처리과정
		// 호스트코드가 있는 경우에만 접근 가능
		HttpSession session = request.getSession();
		
		if (session.getAttribute("hoCode")==null)
		{
			// 호스트코드가 없는 경우 로그인 폼으로 이동
			mav.setViewName("redirect:loginform.do");
			return mav;
		}
		
		
		// 비밀번호 수정을 눌렀을 때, 수행되는 작업
		String modifyType = request.getParameter("modifyType");
		
		if (modifyType.equals("pw"))
		{
			
			String upHoPw = request.getParameter("upHoPw");
			String hoCode = request.getParameter("hoCode");
			
			HostDAO dao = new HostDAO();
			try
			{
				dao.connection();
				
				dao.modifyPw(upHoPw, hoCode);
				
				mav.setViewName("redirect:hostmypage.do");
				
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
			// HostMyPage.jsp 에서 넘어온 정보 수정 데이터
			// → hoCode, upHoNick, upHoTel, upHoEmail
			String hoCode = request.getParameter("hoCode");
			String upHoTel1 = request.getParameter("upHoTel1");
			String upHoTel2 = request.getParameter("upHoTel2");
			String upHoTel3 = request.getParameter("upHoTel3");
			String upHoTel = upHoTel1 + upHoTel2 + upHoTel3;
			String upHoEmail = request.getParameter("upHoEmail");
			
			// 정보 수정
			try
			{
				HostDAO dao = new HostDAO();
				HostDTO dto = new HostDTO();
				
				dao.connection();
				
				dto.setHoTel(upHoTel);
				dto.setHoEmail(upHoEmail);;
				dto.setHoCode(hoCode);;
				
				dao.modify(dto);
				
				mav.setViewName("redirect:hostmypage.do");
				
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
