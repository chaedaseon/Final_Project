/*================================
   SearchAccountController.java
=================================*/

package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class SearchAccountController implements Controller
{

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// 액션 코드
		ModelAndView mav = new ModelAndView();

		
		// 회원 유형 데이터 확인 (게스트 userType = "guest" / 호스트 userType = "host")
		// 계정 찾기 유형 데이터 확인 (아이디 type="id" / 비밀번호 type="pw")
		String userType = request.getParameter("userType");
		String searchType = request.getParameter("searchType");
		
		// SearchIdForm.jsp에서 넘어온 데이터 
		// 입력한 사용자의 이름과 사용자 전화번호
		String searchIdName = request.getParameter("searchIdName"); 
		String searchIdTel = request.getParameter("searchIdTel");
		
		// SearchPwForm.jsp에서 넘어온 데이터
		// 입력한 사용자의 아이디, 이름, 전화번호
		String searchPwId = request.getParameter("searchPwId");
		String searchPwName = request.getParameter("serachPwName");
		String searchPwTel = request.getParameter("searchPwTel");
		 
		try
		{
			// 게스트 계정 찾기
			if (userType.equals("guest"))
			{
				GuestDAO dao = new GuestDAO();
				
				dao.connection();
				
				if(searchType.equals("id"))
				{
					String resultId = dao.searchId(searchIdName, searchIdTel);
					
					/* request.setAttribute("resultId", resultId); */
					mav.addObject("resultId", resultId);
					mav.setViewName("SearchAccount_ajax.jsp");
					return mav;
				}
				
				if(searchType.equals("pw"))
				{
					// 아이디, 이름, 전화번호가 일치하는 정보가 있는지 확인
					// 있으면 1, 없으면 0
					int resultPw = dao.searchPw(searchPwId, searchPwName, searchPwTel);
					
					mav.addObject("resultPw", resultPw);
					mav.setViewName("SearchAccount_ajax.jsp");
					
					return mav;
				}
				dao.close();
			}
		}
		
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
		return mav;
	}
}
;