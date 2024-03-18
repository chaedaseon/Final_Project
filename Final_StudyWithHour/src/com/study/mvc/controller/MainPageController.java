/*================================
   SearchAccountController.java
=================================*/

package com.study.mvc.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.study.mvc.model.CafeDAO;
import com.study.mvc.model.CafeDTO;
import com.study.mvc.model.GuestDAO;
import com.study.mvc.model.HostDAO;
import com.study.mvc.model.MainPageDAO;
import com.study.mybatis.model.BoardStudyGroupDTO;
import com.study.mybatis.model.CommunityBoardDTO;
import com.study.mybatis.model.NoticeBoardDTO;

public class MainPageController implements Controller
{

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// 액션 코드
		ModelAndView mav = new ModelAndView();
		
		MainPageDAO dao = new MainPageDAO();
		
		dao.connection();
		
		ArrayList<NoticeBoardDTO> noticeList =  dao.latestNoticeList();
		CafeDTO newCafe = dao.searchNewCafe();
		ArrayList<CafeDTO> reserveTopCafe = dao.reserveTopCafe();
		ArrayList<BoardStudyGroupDTO> studyGroupList = dao.latestStudyGroupList();
		ArrayList<CommunityBoardDTO> popBoardList = dao.popBoardList();
		ArrayList<CommunityBoardDTO> BoardList = dao.latestBoardList();
		
		mav.addObject("reserveTopCafe", reserveTopCafe);
		mav.addObject("newCafe", newCafe);
		mav.addObject("noticeList", noticeList);
		mav.addObject("studyGroupList", studyGroupList);
		mav.addObject("popBoardList", popBoardList);
		mav.addObject("BoardList", BoardList);
		mav.setViewName("/WEB-INF/view/main/MainPage.jsp");
		
		dao.close();
		
		return mav;
	}
}
;