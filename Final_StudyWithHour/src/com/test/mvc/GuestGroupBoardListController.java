// GuestBoardListFormController.java
// 게시물 작성 내역

package com.test.mvc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class GuestGroupBoardListController implements Controller
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
		
		GroupBoardDAO dao = new GroupBoardDAO();
		
		try
		{
			// 게시물/댓글 타입 확인 → board / reply
			String type = request.getParameter("type");
			String guCode = request.getParameter("guCode");
			dao.connection();
			
			if(type!=null && type.equals("board"))
			{
				// 게시글 작성 리스트 출력 실행
				ArrayList<GroupBoardDTO> groupBoardList = new ArrayList<GroupBoardDTO>();
				
				groupBoardList = dao.groupBoardList(guCode);
				
				mav.addObject("groupBoardList", groupBoardList);
			
			} // board일 경우 end
			
			
			if(type!=null && type.equals("reply"))
			{
				
			}
			
			
			/* mav.setViewName("/WEB-INF/view/GuestRedList.jsp"); */
			mav.setViewName("GuestBoardList.jsp");
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		finally
		{
			dao.close();
		}
	
		
		return mav;
	}
}
