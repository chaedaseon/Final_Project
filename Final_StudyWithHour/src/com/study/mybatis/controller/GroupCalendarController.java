package com.study.mybatis.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.study.mybatis.model.GroupCalendarDTO;
import com.study.mybatis.model.GuestDTO;
import com.study.mybatis.model.IGroupCalendarDAO;
import com.study.mybatis.model.IGroupContentDAO;

@Controller
public class GroupCalendarController
{
	@Autowired
	private SqlSession sqlsession;

	// 페이지 요청
	@RequestMapping(value = "/groupcalendarlist.do", method=RequestMethod.GET)
	public String calendarList(ModelMap model, HttpServletRequest request //, String grCode
			)
	{

		// 그룹코드는 그룹진입때부터 계속 주소창에서 갖고있는 것으로 상정
		// - 지금은 임시로 grCode = '1' 로 상정
		
		IGroupContentDAO dao = sqlsession.getMapper(IGroupContentDAO.class);
		IGroupCalendarDAO calDao = sqlsession.getMapper(IGroupCalendarDAO.class);
		
		String grCode = "1";
		
		HttpSession session =  request.getSession();
		
		String guCode = (String)session.getAttribute("guCode");
		
		HashMap<String, String> ckMap = new HashMap<String, String>();
		ckMap.put("grCode", grCode);
		ckMap.put("guCode", guCode);
		
		int joinGroupCk = dao.joinGroupCK(ckMap);
		
		//로그인 상태가 아닐 경우
		if(guCode==null)
		{
			
			return ("redirect:loginform.do");		
		}
		//로그인 상태지만 그룹에 가입한 상태가 아닐 경우
		else if(joinGroupCk==0)
		{
			return "studywithhour.do";
			
		}
		else
		{
			String gjCode = calDao.leadMember(grCode, guCode);
			
			model.addAttribute("gjCode", gjCode);
			model.addAttribute("guCode", guCode);
			model.addAttribute("grCode", grCode);
			return "/WEB-INF/view/group/GroupCalendar.jsp";	
		}
		
		

	}

	// 그룹 일정 조회 (에이작스 처리)
	@RequestMapping(value = "/groupschedulelist.do", method=RequestMethod.POST)
	public String scheduleList(ModelMap model, String grCode)
	{
		IGroupCalendarDAO dao = sqlsession.getMapper(IGroupCalendarDAO.class);
		ArrayList<GroupCalendarDTO> list = dao.groupScheduleList(grCode);
		
		model.addAttribute("list", list);
		return "/WEB-INF/view/group/GroupCalendar_ajax.jsp";
	}



	// 개인 일정 조회 (에이작스 처리)
	@RequestMapping(value = "/groupsearchschedule.do", method=RequestMethod.POST)
	public String searchSchedule(ModelMap model,@RequestParam("grCode") String grCode,@RequestParam("gschDate") String gschDate)
	{	
		IGroupCalendarDAO dao = sqlsession.getMapper(IGroupCalendarDAO.class);
		//HashMap<String, Object> map = new HashMap<String, Object>();
		//map.put("grCode", grCode);
		//map.put("gschDate", gschDate);
		
		ArrayList<GroupCalendarDTO> schedulelist = dao.groupSearchSchedule(grCode, gschDate);
		
		for (int i = 0; i < schedulelist.size(); i++)
		{
			String str = "";
			GroupCalendarDTO gsch =  schedulelist.get(i);
			if(gsch.getAttCk().equals("1"))
			{
				ArrayList<String> memlist = dao.attlMemberNick(gsch.getGschCode());
				for (int j = 0; j < memlist.size(); j++)
				{
					str += memlist.get(j) + " ";
				}
			}
			
			schedulelist.get(i).setMemberListNickName(str);
		}
		
		model.addAttribute("schedulelist", schedulelist);
		
		return "/WEB-INF/view/group/GroupSearchSchedule_ajax.jsp";
	}

	// 일정 추가 - 선택 가능한 그룹원(참석자) 목록 노출
	@RequestMapping(value = "/groupselectattmember.do", method=RequestMethod.POST)
	public String selectAttMember(ModelMap model, @RequestParam("grCode") String grCode, @RequestParam("guCode") String guCode)
	{
		IGroupCalendarDAO dao = sqlsession.getMapper(IGroupCalendarDAO.class);

		
		ArrayList<GuestDTO> memberList = dao.groupMemberSelect(grCode);
		
		String leadMember = dao.leadMember(grCode, guCode);
		model.addAttribute("memberList", memberList);
		model.addAttribute("leadMember", leadMember);
		
		return "/WEB-INF/view/group/GroupMemberSelect_ajax.jsp";
	}	
	
	
	// 그룹 일정 등록 수행
	@RequestMapping(value = "/groupscheduleinsert.do", method=RequestMethod.POST)
	public String groupCalendarInsert(GroupCalendarDTO group, @RequestParam("guCode")String guCode,  @RequestParam("grCode")String grCode
			)
	{
		IGroupCalendarDAO dao = sqlsession.getMapper(IGroupCalendarDAO.class);
		String leadMemeber = dao.leadMember(grCode, guCode);
		//그룹번호와 게스트번호로 그룹가입요청코드 받아온 후 GroupCalendarDTO에 넣어줌
		group.setLeadMember(leadMemeber); 
		
		
		// 만약 종일일 경우 null 상태로 되어 있으므로 24시간으로 값 변경
		if(group.getStartHour() == null || group.getEndHour()==null)
		{
			group.setStartHour("00:00");
			group.setEndHour("24:00");
		}

		// 일정 삽입
		dao.groupScheduleAdd(group);
		
		
		return "redirect:groupcalendarlist.do?grCode="+grCode;
	}
	
	// 그룹 모임 등록 수행
	@RequestMapping(value = "/groupscheduleinsertwith.do", method=RequestMethod.POST)
	public String groupCalendarInsertWith(GroupCalendarDTO group, @RequestParam("guCode")String guCode,  @RequestParam("grCode")String grCode
			, @RequestParam List<String> member
			)
	{
		IGroupCalendarDAO dao = sqlsession.getMapper(IGroupCalendarDAO.class);
		String leadMemeber = dao.leadMember(grCode, guCode);
		//그룹번호와 게스트번호로 그룹가입요청코드 받아온 후 GroupCalendarDTO에 넣어줌
		group.setLeadMember(leadMemeber); 
		
		// 만약 종일일 경우 null 상태로 되어 있으므로 24시간으로 값 변경
		if(group.getStartHour() == null || group.getEndHour()==null)
		{
			group.setStartHour("00:00");
			group.setEndHour("24:00");
		}
		
		// 일정 삽입
		dao.groupScheduleAdd(group);
		
		
		//만약 모임 유형이 모임일 경우
		if(group.getAttCk().equals("1"))
		{
			//직전 모임 코드 가져옴
			String gschCode = dao.getGschCode(leadMemeber);
			
			// 참석자 코드 인서트
			for (int i = 0; i < member.size(); i++)
			{
				HashMap<String, Object > memberMap = new HashMap<String, Object>();
				memberMap.put("gjCode", member.get(i));
				memberMap.put("gschCode", gschCode);
				dao.attListInsert(memberMap);
			}
			
		}
		
		return "redirect:groupcalendarlist.do?grCode="+grCode;
	}
	

		
	// 그룹 일정 삭제 수행
	@RequestMapping(value ="/groupscheduledelete.do", method=RequestMethod.POST)	
	public String groupCalendarDel(GroupCalendarDTO group, @RequestParam("guCode")String guCode,  @RequestParam("grCode")String grCode)
	{
		IGroupCalendarDAO dao = sqlsession.getMapper(IGroupCalendarDAO.class);
		
		HashMap<String, Object> mapCk = new HashMap<String, Object>();
		mapCk.put("gschCode",group.getGschCode() );
		mapCk.put("attCk",group.getAttCk());

		// 예약 삭제
		if(group.getAttCk().equals("1"))
		{
			// 모임일 경우 참석자부터 삭제
			dao.attMemDel(group.getGschCode());
			
		}
		
		//일정 삭제
		dao.gschDel(group.getGschCode());
		
		return "redirect:groupcalendarlist.do?grCode="+grCode;
	}	
	
	/*	
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
	*/
}
