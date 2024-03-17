// GuestReplyListFormController.java
// 전체 댓글 작성 내역(그룹 제외)

package com.study.mvc.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.study.mvc.model.GroupBoardDAO;
import com.study.mvc.model.GroupBoardDTO;
import com.study.mvc.model.GuestBoardDAO;
import com.study.mvc.model.GuestBoardDTO;


public class GuestReplyListController implements Controller
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
		
		GuestBoardDAO guest = new GuestBoardDAO();
		GroupBoardDAO group = new GroupBoardDAO();
		String guCode = request.getParameter("guCode");
		try
		{
			guest.connection();
			group.connection();
			
			ArrayList<GuestBoardDTO> replyList = new ArrayList<GuestBoardDTO>();
			ArrayList<GroupBoardDTO> groupReplyList = new ArrayList<GroupBoardDTO>();
			
			// 전체 게시판 작성 댓글 내역
			replyList = guest.replyList(guCode);
			mav.addObject("replyList", replyList);
			
			// 그룹 게시판 작성 댓글 내역
			groupReplyList = group.groupReplyList(guCode);
			mav.addObject("groupReplyList", groupReplyList);
			
			mav.setViewName("/WEB-INF/view/guest/GuestReplyList.jsp?guCode="+guCode);

			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		finally
		{
			group.close();
			guest.close();
		}
	
		
		return mav;
	}
}
