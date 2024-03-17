/*=====================
	GroupController.java
	- 컨트롤러
=====================*/

package com.study.mybatis.controller;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.study.mybatis.model.GroupBoardDTO;
import com.study.mybatis.model.IGroupContentDAO;
import com.study.mybatis.model.IGroupDAO;

@Controller
public class GroupController
{
	// 주요 속성 구성
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/groupmemberlist.do", method=RequestMethod.GET)
	public String memberList(ModelMap model, String gr_code)
	{	
		IGroupDAO dao = sqlSession.getMapper(IGroupDAO.class);
		
		try
		{
			model.addAttribute("memberCount", dao.memberCount(gr_code));
			model.addAttribute("member", dao.memberList(gr_code));
			model.addAttribute("addMemberCount", dao.addMemberCount(gr_code));
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return "/WEB-INF/view/group/GroupReservationList.jsp";
	}
	
	@RequestMapping(value="/groupmemberinsert.do", method=RequestMethod.POST)
	public String memberAdd(@RequestParam("gr_code")String gr_code, @RequestParam("period_code")String period_code)
	{
		IGroupDAO dao = sqlSession.getMapper(IGroupDAO.class);
		
		try
		{
			dao.addMember(gr_code, period_code);
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return "redirect:groupmemberlist.do?gr_code="+ gr_code;
	}
	
	// 그룹 메인 연결
	@RequestMapping(value="/grouppagemain.do", method = RequestMethod.GET)
	public String groupmain(@RequestParam("gu_code")String gu_code, @RequestParam("gr_code")String gr_code, ModelMap model)
	{
		IGroupDAO dao = sqlSession.getMapper(IGroupDAO.class);
		IGroupContentDAO cdao = sqlSession.getMapper(IGroupContentDAO.class);
		
		//그룹장 닉네임 가져오기
		String leaderNick = cdao.getLeaderNick(gr_code);
		ArrayList<String> memberNick = cdao.getMemberNick(gr_code);
		
		//그룹원 닉네임 가져오기
		
		
		// 최근 게시물
		ArrayList<GroupBoardDTO> boardList =  cdao.lastestGroupBoard(gr_code);
		// 최근 그룹 이력
		ArrayList<Map<String, Object>> recordList = cdao.lastestGroupRecord(gr_code);
		
		
		model.addAttribute("guCode", gu_code);
		model.addAttribute("grCode", gr_code);
		model.addAttribute("boardList", boardList);
		model.addAttribute("recordList", recordList);
		model.addAttribute("leaderNick", leaderNick);
		model.addAttribute("memberNick", memberNick);
		
		return "/WEB-INF/view/group/GroupPageMain.jsp";
	}
	
}
