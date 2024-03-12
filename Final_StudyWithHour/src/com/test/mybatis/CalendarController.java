package com.test.mybatis;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CalendarController
{
	@Autowired
	private SqlSession sqlsession;

	// 페이지 요청
	@RequestMapping(value = "/guestcalendarlist.do", method=RequestMethod.GET)
	public String calendarList(ModelMap model, String gu_code)
	{
		IGuestCalendarDAO dao = sqlsession.getMapper(IGuestCalendarDAO.class);
		
		ArrayList<GuestCalendarDTO> list = dao.scheduleList(gu_code);
		
		model.addAttribute("list", list);
		
		/* return "/WEB-INF/view/GuestCalendar.jsp"; */
		return "GuestCalendar.jsp";
	}
	
	// 개인 일정 조회 (에이작스 처리)
	@RequestMapping(value = "/schedulelist.do", method=RequestMethod.GET)
	public String scheduleList(ModelMap model, String gu_code)
	{
		IGuestCalendarDAO dao = sqlsession.getMapper(IGuestCalendarDAO.class);
		
		ArrayList<GuestCalendarDTO> list = dao.scheduleList(gu_code);
		
		model.addAttribute("list", list);
		
		// return "/WEB-INF/view/GuestCalendar_ajax.jsp";
		return "GuestCalendar_ajax.jsp";
	}
	
	// 개인 일정 조회 (에이작스 처리)
	/*
	@RequestMapping(value = "/searchschedule.do", method=RequestMethod.GET)
	public String searchSchedule(ModelMap model, @RequestParam("gu_code")String gu_code, @RequestParam("sch_date")String sch_date)
	{
		IGuestCalendarDAO dao = sqlsession.getMapper(IGuestCalendarDAO.class);
		
		ArrayList<GuestCalendarDTO> list = dao.searchSchedule(gu_code, sch_date);
		
		model.addAttribute("list", list);
		
		// return "/WEB-INF/view/GuestCalendar_ajax.jsp";
		return "GuestCalendar_ajax.jsp";
	}
	*/
	// 개인 일정 등록 수행
	@RequestMapping(value = "/guestscheduleinsert.do", method=RequestMethod.POST)
	public String gusetCalendarInsert(GuestCalendarDTO guest, @RequestParam("gu_code")String gu_code)
	{
		IGuestCalendarDAO dao = sqlsession.getMapper(IGuestCalendarDAO.class);
		
		guest.setGu_code(gu_code);
		
		dao.scheduleAdd(guest);
		
		return "redirect:guestcalendarlist.do?gu_code="+gu_code;
	}
	
}
