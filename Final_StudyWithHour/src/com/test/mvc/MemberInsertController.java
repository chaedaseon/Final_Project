// MemberInsertController.java
// 게스트 / 호스트의 회원가입 처리 컨트롤러

package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

// ※ Spring 의 『Controller』 인터페이스를 구현하는 방법을 통해
//    사용자 정의 컨트롤러 클래스를 구성한다.
//    cf. Controller Annotation 활용
public class MemberInsertController implements Controller
{
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		// 게스트 회원처리(1)인지 호스트 회원처리(2)인지 type 값으로 확인
		String type = request.getParameter("type");
		
		// 게스트 회원가입일 경우
		if (type.equals("1"))
		{
			// GuestJoinForm.jsp 에서 넘어온 데이터 수신
			// → guId, guPw, guName, guSsn, guTel, guEmail, guNick, guCategoryCode
			String guId = request.getParameter("guId");
			String guPw = request.getParameter("guPw");
			String guName = request.getParameter("guName");
			String guSsn1 = request.getParameter("guSsn1");
			String guSsn2 = request.getParameter("guSsn2");
			String guTel1 = request.getParameter("guTel1");
			String guTel2 = request.getParameter("guTel2");
			String guTel3 = request.getParameter("guTel3");
			String guEmail = request.getParameter("guEmail");
			String guNick = request.getParameter("guNick");
			String guCategoryCode = request.getParameter("guCategoryCode");
			
			// 주민번호랑 전화번호는 나눠서 받기 때문에 결합이 필요함!
			String guSsn = guSsn1 + guSsn2;
			String guTel = guTel1 + guTel2 + guTel3;
		
			try
			{
				// GuestDTO 구성
				GuestDTO guest = new GuestDTO();
				
				guest.setGuId(guId);
				guest.setGuPw(guPw);
				guest.setGuSsn(guSsn);
				guest.setGuName(guName);
				guest.setGuTel(guTel);
				guest.setGuEmail(guEmail);
				guest.setGuNick(guNick);
				guest.setGuCategoryCode(guCategoryCode);
				
				GuestDAO dao = new GuestDAO();
				dao.connection();
				// insert 쿼리문 수행하는 dao의 add() 메소드 호출
				dao.add(guest);
				
				// 회원 가입 이후 로그인 된 상태로 유지하기 위한 세션 처리
				String guCode = dao.login(guId, guPw);
				HttpSession session = request.getSession();
				session.setAttribute("guCode", guCode);	
				guest = dao.sessionGuest(guCode);
				session.setAttribute("guest", guest);
				
				dao.close();
				
			} catch (Exception e)
			{
				System.out.println(e.toString());
			}
			mav.setViewName("MainPage.jsp");
		}
		
		// 호스트 회원가입일 경우
		if(type.equals("2"))
		{
			// HostJoinForm.jsp 에서 넘어온 데이터 수신
			// → hoId, hoPw, hoName, hoSsn, hoTel, hoEmail
			String hoId = request.getParameter("hoId");
			String hoPw = request.getParameter("hoPw");
			String hoName = request.getParameter("hoName");
			String hoSsn1 = request.getParameter("hoSsn1");
			String hoSsn2 = request.getParameter("hoSsn2");
			String hoTel1 = request.getParameter("hoTel1");
			String hoTel2 = request.getParameter("hoTel2");
			String hoTel3 = request.getParameter("hoTel3");
			String hoEmail = request.getParameter("hoEmail");
			
			// 주민번호랑 전화번호는 나눠서 받기 때문에 결합이 필요함!
			String hoSsn = hoSsn1 + hoSsn2;
			String hoTel = hoTel1 + hoTel2 + hoTel3;
					
			try
			{
				// HostDTO 구성
				HostDTO host = new HostDTO();
				
				host.setHoId(hoId);
				host.setHoPw(hoPw);
				host.setHoSsn(hoSsn);
				host.setHoName(hoName);
				host.setHoTel(hoTel);
				host.setHoEmail(hoEmail);
				
				HostDAO dao = new HostDAO();
				dao.connection();
				// insert 쿼리문 수행하는 dao의 add() 메소드 호출
				dao.add(host);
				dao.close();
				
			} catch (Exception e)
			{
				System.out.println(e.toString());
			}
			
			mav.setViewName("/MainPage.jsp");
			
		}
			
			return mav;
			
	}
	
}
