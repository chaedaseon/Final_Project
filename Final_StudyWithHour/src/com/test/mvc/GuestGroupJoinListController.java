// GuestGroupJoinListController.java
// 그룹 가입 신청 내역

package com.test.mvc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class GuestGroupJoinListController implements Controller
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
		
		GroupDAO group = new GroupDAO();
		String guCode = request.getParameter("guCode");
		try
		{
			group.connection();
			
			// 전체(모두 접근 가능한) 게시글 작성 리스트 출력 실행
			ArrayList<GroupDTO> groupJoinList = new ArrayList<GroupDTO>();
			
			// 전체 게시판 작성글 내역
			//groupJoinList = group.boardList(guCode);
			mav.addObject("groupJoinList", groupJoinList);
			
			/* mav.setViewName("/WEB-INF/view/GuestGroupJoinList.jsp?guCode="+guCode); */
			mav.setViewName("GuestGroupJoinList.jsp?guCode="+guCode);

			
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
