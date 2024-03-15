package com.study.mybatis.controller;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.study.mybatis.model.GuestCalendarDTO;
import com.study.mybatis.model.IGuestCalendarDAO;

@Controller
public class GuestCalendarController
{
	@Autowired
	private SqlSession sqlsession;

	// 페이지 요청
	@RequestMapping(value = "/guestcalendarlist.do", method=RequestMethod.GET)
	public String calendarList(ModelMap model, String gu_code)
	{
		//IGuestCalendarDAO dao = sqlsession.getMapper(IGuestCalendarDAO.class);
		
		//ArrayList<GuestCalendarDTO> list = dao.scheduleList(gu_code);
		
		//model.addAttribute("list", list);
		
		return "/WEB-INF/view/guest/GuestCalendar.jsp";
	}
	
	// 개인 일정 조회 (에이작스 처리)
	@RequestMapping(value = "/schedulelist.do", method=RequestMethod.GET)
	public String scheduleList(ModelMap model, String gu_code)
	{
		IGuestCalendarDAO dao = sqlsession.getMapper(IGuestCalendarDAO.class);
		
		ArrayList<GuestCalendarDTO> list = dao.scheduleList(gu_code);
		
		model.addAttribute("list", list);
		
		return "/WEB-INF/view/guest/GuestCalendar_ajax.jsp";
	}
	
	// 개인 일정 조회 (에이작스 처리)
	@RequestMapping(value = "/searchschedule.do", method=RequestMethod.GET)
	public String searchSchedule(ModelMap model, @RequestParam("gu_code")String gu_code, @RequestParam("sch_date")String sch_date)
	{
		IGuestCalendarDAO dao = sqlsession.getMapper(IGuestCalendarDAO.class);
		
		ArrayList<GuestCalendarDTO> schedulelist = dao.searchSchedule(gu_code, sch_date);
		
		model.addAttribute("schedulelist", schedulelist);
		
		return "/WEB-INF/view/gueset/GuestSearchSchedule_ajax.jsp";
	}
	
	// 개인 일정 등록 수행
	@RequestMapping(value = "/guestscheduleinsert.do", method=RequestMethod.POST)
	public String gusetCalendarInsert(GuestCalendarDTO guest, @RequestParam("gu_code")String gu_code)
	{
		IGuestCalendarDAO dao = sqlsession.getMapper(IGuestCalendarDAO.class);
		
		dao.scheduleAdd(guest);
		
		return "redirect:guestcalendarlist.do?gu_code="+gu_code;
	}
	
	// 개인 일정 수정 수행
	@RequestMapping(value ="/guestscheduleupdate.do", method=RequestMethod.POST)
	public String guestCalendarUpdate(GuestCalendarDTO guest, @RequestParam("gu_code")String gu_code,@RequestParam("sch_code")String sch_code, @RequestParam("sch_date")String sch_date, @RequestParam("sch_name")String sch_name, @RequestParam("sch_content")String sch_content)
	{
		IGuestCalendarDAO dao = sqlsession.getMapper(IGuestCalendarDAO.class);
		
		dao.scheduleModify(guest);
		
		return "redirect:guestcalendarlist.do?gu_code="+gu_code;
	}
	
	// 개인 일정 삭제 수행
	@RequestMapping(value ="/guestscheduledelete.do", method=RequestMethod.POST)
	public String guestCalendarDelete(@RequestParam("sch_code")String sch_code, String gu_code)
	{
		IGuestCalendarDAO dao = sqlsession.getMapper(IGuestCalendarDAO.class);
		
		dao.scheduleRemove(sch_code);
		
		return "redirect:guestcalendarlist.do?gu_code="+gu_code;
	}
	
}
