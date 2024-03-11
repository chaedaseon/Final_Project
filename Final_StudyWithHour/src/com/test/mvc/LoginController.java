/*================================
   LoginController.java
   - 사용자 정의 컨트롤러 클래스
=================================*/

package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class LoginController implements Controller
{

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// 액션 코드
		ModelAndView mav = new ModelAndView();
		
		// LoginForm.jsp 에서 넘어온 데이터 확인
		// → userType, userId, userPW
		String userType = request.getParameter("userType");
		
		
		// 넘어온 로그인 타입이 관리자일 경우 
		if(userType.equals("admin"))
		{
			String adId = request.getParameter("userId");		// 관리자 아이디 = 관리자 코드!
			String adPw = request.getParameter("userPw");
			
			AdminDAO dao = new AdminDAO();
			try
			{
				dao.connection();
				
				String adCode = dao.login(adId, adPw);
				AdminDTO admin = dao.sessionAdmin(adCode);
				
				// 해당하는 회원 정보가 DB에 있을 경우
				if(adCode != null && adCode != "")
				{
					HttpSession session = request.getSession();
					
					session.setAttribute("adCode", adCode);			// 관리자 코드 세션에 담기
					session.setAttribute("admin", admin);			// 관리자 정보 세션에 담기
					
					// 로그인 성공 시, 메인페이지로 전환
					mav.setViewName("MainPage.jsp");
				}
				else
				{
					// 로그인 실패 시, 로그인 폼으로 전환
					mav.addObject("message", "error");
					mav.setViewName("redirect:loginform.do");
				}		
				
			} catch (Exception e)
			{
				System.out.println(e.toString());
			}
			finally
			{
				dao.close();
			}
			
		}
		// 넘어온 로그인 타입이 게스트일 경우
		else if (userType.equals("guest"))
		{	
			String guId = request.getParameter("userId");
			String guPw = request.getParameter("userPw");
			
			GuestDAO dao = new GuestDAO();
			
			try
			{
				dao.connection();
				
				String guCode = dao.login(guId, guPw);
				GuestDTO guest = dao.sessionGuest(guCode);
				
				// 해당하는 회원 정보가 DB에 있을 경우
				if (guCode != null && guCode != "")
				{
					HttpSession session = request.getSession();
					session.setAttribute("guCode", guCode);			// 게스트 코드 세션에 담기
					session.setAttribute("guest", guest);			// 게스트 개인/회원 정보 세션에 담기
					mav.setViewName("MainPage.jsp");
				}
				else
				{
					mav.addObject("message", "error");
					mav.setViewName("redirect:loginform.do");
				}	
				
			} catch (Exception e)
			{
				System.out.println(e.toString());
			}
			finally
			{
				dao.close();
			}
			
		}
		// 넘어온 로그인 타입이 호스트일 경우
		else if (userType.equals("host"))
		{
			String hoId = request.getParameter("userId");
			String hoPw = request.getParameter("userPw");
			
			HostDAO dao = new HostDAO();
			
			try
			{
				dao.connection();
				
				String hoCode = dao.login(hoId, hoPw);
				HostDTO host = dao.sessionHost(hoCode);
				
				// 해당하는 회원 정보가 DB에 있을 경우
				if (hoCode != null && hoCode != "")
				{
					HttpSession session = request.getSession();
					session.setAttribute("hoCode", hoCode);		// 호스트 코드 세션에 담기
					session.setAttribute("host", host);			// 호스트 개인/회원 정보 세션에 담기
					
					mav.setViewName("MainPage.jsp");
				}
				else
				{
					mav.addObject("message", "error");
					mav.setViewName("redirect:loginform.do");
				}
			} catch (Exception e)
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
