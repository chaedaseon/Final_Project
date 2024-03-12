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

@Controller
public class GroupController
{
	// 주요 속성 구성
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/groupmemberlist.do", method=RequestMethod.GET)
	public String MemberList(ModelMap model, String gr_code)
	{	
		IGroupDAO dao = sqlSession.getMapper(IGroupDAO.class);
		
		try
		{
			model.addAttribute("memberCount", dao.memberCount(gr_code));
			model.addAttribute("member", dao.memberList(gr_code));
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		//return "/WEB-INF/view/GroupReservationList.jsp";
		return "GroupMemberList.jsp";
	}
}
