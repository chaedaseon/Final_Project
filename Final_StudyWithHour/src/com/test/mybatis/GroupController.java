/*=====================
	GroupController.java
	- 컨트롤러
=====================*/

package com.test.mybatis;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
		
		//return "/WEB-INF/view/GroupReservationList.jsp";
		return "GroupMemberList.jsp";
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
}
