// GuestRedListController.java
// 게시물 & 댓글 신고 내역

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

public class GuestRedListController implements Controller
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
		try
		{
			String guCode = request.getParameter("guCode");
			guest.connection();
			group.connection();
			
			// 게시글 신고 내역
			ArrayList<GuestBoardDTO> redBoardList = new ArrayList<GuestBoardDTO>();
			redBoardList = guest.redBoardList(guCode);
			mav.addObject("redBoardList", redBoardList);
			
			// 댓글&대댓글 신고 내역
			ArrayList<GuestBoardDTO> redReplyList = new ArrayList<GuestBoardDTO>();
			redReplyList = guest.redReplyList(guCode);
			mav.addObject("redReplyList", redReplyList);
			
			// 그룹 게시글 신고 내역
			ArrayList<GroupBoardDTO> redGroupBoardList = new ArrayList<GroupBoardDTO>();
			redGroupBoardList = group.redGroupBoardList(guCode);
			mav.addObject("redGroupBoardList", redGroupBoardList);
			
			// 그룹 댓글 신고 내역
			ArrayList<GroupBoardDTO> redGroupReplyList = new ArrayList<GroupBoardDTO>();
			redGroupReplyList = group.redGroupReplyList(guCode);
			mav.addObject("redGroupReplyList", redGroupReplyList);
			
			mav.setViewName("/WEB-INF/view/guest/GuestRedList.jsp");
			
			
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
