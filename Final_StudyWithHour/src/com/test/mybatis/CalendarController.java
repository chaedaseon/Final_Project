package com.test.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CalendarController
{
	@Autowired
	private SqlSession sqlsession;

	// 페이지 요청
	
	@RequestMapping(value = "/guestcalendarlist.do", method=RequestMethod.GET)
	public String calendarList(String gu_code)
	{
		//IGuestCalendarDAO dao = sqlsession.getMapper(IGuestCalendarDAO.class);
		
		return "GuestCalendar.jsp";
	}
	
	// 개인 일정 조회
	@RequestMapping(value = "/schedulelist.do", method=RequestMethod.GET)
	public String scheduleList(ModelMap model, String gu_code)
	{
		IGuestCalendarDAO dao = sqlsession.getMapper(IGuestCalendarDAO.class);
		
		List<GuestCalendarDTO> list = dao.scheduleList(gu_code);
		
		model.addAttribute("list", list);
		
		// return "/WEB-INF/view/GuestCalendar.jsp";
		// return "GuestCalendar.jsp";
		return "GuestCalendar_ajax.jsp";
	}
	
	
	/*
	@RequestMapping(value = "/guestcalendarlist.do", method=RequestMethod.GET)
	@ResponseBody
	public List<GuestCalendarDTO> guestCalendarList(String gu_code) 
	{
	    IGuestCalendarDAO dao = sqlsession.getMapper(IGuestCalendarDAO.class);
	    
	    List<GuestCalendarDTO> list = dao.calendarList(gu_code);
	   
	    return list;
	}
	*/
	
	// 개인 일정 등록 수행
	@RequestMapping(value = "/guestcalendarinsert.do", method=RequestMethod.POST)
	public String gusetCalendarInsert(GuestCalendarDTO guest, String gu_code)
	{
		IGuestCalendarDAO dao = sqlsession.getMapper(IGuestCalendarDAO.class);
		
		dao.calendarAdd(guest);
		
		return "redirect:guestcalendar.do";
	}
	
}
