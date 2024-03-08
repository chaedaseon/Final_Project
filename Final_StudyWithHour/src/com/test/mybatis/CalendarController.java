package com.test.mybatis;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CalendarController
{
	@Autowired
	private SqlSession sqlsession;
	
	// 개인 일정 등록 수행
	@RequestMapping(value = "/guestcalendarinsert.do", method=RequestMethod.POST)
	public String gusetCalendarInsert(CalendarDTO calendar, String gu_code)
	{
		ICalendarDAO dao = sqlsession.getMapper(ICalendarDAO.class);
		
		dao.add(calendar);
		
		return "redirect:guestcalendar.do";
	}
	
	// 개인 일정 조회
	@RequestMapping(value = "/guestcalendarlist.do", method=RequestMethod.GET)
	public String guestCalendarList(ModelMap model, String gu_code)
	{
		ICalendarDAO dao = sqlsession.getMapper(ICalendarDAO.class);
		
		CalendarDTO test = dao.list(gu_code).get(0);
		
		model.addAttribute("list", dao.list(gu_code));
		
		// return "/WEB-INF/view/GuestCalendar.jsp";
		return "GuestCalendar.jsp";
	}
	
	
	
}
