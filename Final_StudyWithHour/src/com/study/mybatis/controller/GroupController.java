/*=====================
	GroupController.java
	- 컨트롤러
=====================*/

package com.study.mybatis.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.study.mybatis.model.GroupBoardDTO;
import com.study.mybatis.model.GroupCalendarDTO;
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
		
		//그룹장, 그룹원 닉네임 가져오기
		String leaderNick = cdao.getLeaderNick(gr_code);
		ArrayList<String> memberNick = cdao.getMemberNick(gr_code);
		
		// 디데이 가능한 일정 가져오기
		ArrayList<GroupCalendarDTO> ddayList = cdao.gschDdayList(gr_code);
		
		
		
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
		model.addAttribute("ddayList", ddayList);
		
		return "/WEB-INF/view/group/GroupPageMain.jsp";
	}
	
	// 그룹 탈퇴 연결
	@RequestMapping(value="/groupunregprocess.do", method = RequestMethod.POST)
	public String groupunreg(@RequestParam("guCode")String gu_code, @RequestParam("grCode")String gr_code, @RequestParam("reason")String reason, ModelMap model)
	{
		IGroupContentDAO cdao = sqlSession.getMapper(IGroupContentDAO.class);
		//그룹 코드 가져오기
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("guCode",gu_code );
		map.put("grCode",gr_code );
		String gjCode = cdao.getGjCode(map);
		
		//그룹 탈퇴 테이블에 인서트
		HashMap<String, String> unregMap = new HashMap<String, String>();
		unregMap.put("reason", reason);
		unregMap.put("gjCode", gjCode);
		cdao.groupUnregInsert(unregMap);
		
		model.addAttribute("guCode", gu_code);
		model.addAttribute("grCode", gr_code);
		
		return "redirect:studywithhour.do";
	}
	
}
