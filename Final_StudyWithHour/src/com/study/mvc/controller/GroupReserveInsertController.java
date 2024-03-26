/*==================================
	GroupReserveInsertController.java
	- 사용자 정의 컨트롤러 클래스
===================================*/

package com.study.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.study.mvc.model.GroupDAO;
import com.study.mvc.model.GroupDTO;

public class GroupReserveInsertController implements Controller
{
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// 액션 코드
		ModelAndView mav = new ModelAndView();
		
		// session 설정
		// 게스트 코드가 있는 경우에만 접근 가능
		HttpSession session = request.getSession();
		
		if (session.getAttribute("guCode")==null)
		{
			// 게스트 코드가 없는 경우 로그인 폼으로 이동
			mav.setViewName("redirect:loginform.do");
			return mav;
		}
		
		GroupDAO dao = new GroupDAO();
		GroupDTO dto = new GroupDTO();
		
		try
		{
			// 이전 페이지로부터 넘어온 데이터 수신
			String grCode = request.getParameter("gr_code");
			String guCode = request.getParameter("gu_code");
			String srCode = request.getParameter("srCode");
			String reserveDate = request.getParameter("reserveDate");
			String reserveHour1 = request.getParameter("reserveHour1");
			String reserveHour2 = request.getParameter("reserveHour2");
			String reserveCount = request.getParameter("reserveCount");
			dao.connection();
			
			// 그룹, 게스트 코드로 그룹가입코드 조회
			String gjCode = dao.searchGjcode(guCode, grCode);
			
			// 예약 요청을 위해 정보 넣기
			dto.setReStartDate(reserveDate);
			dto.setReStartHour(reserveHour1);
			dto.setReEndHour(reserveHour2);
			dto.setReCount(Integer.parseInt(reserveCount));
			dto.setGjCode(gjCode);
			dto.setSrCode(srCode);
			
			// 스터디룸 예약 요청
			dao.roomReserveAdd(dto);
			
			// 예약내역 페이지로 이동
			mav.setViewName("redirect:groupreservelist.do?gu_code=" + guCode + "&gr_code=" + grCode);
			
			dao.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
			mav.addObject("msg", "<script language='javascript' type='text/javascript'> alert('잘못된 접근입니다.');</script>");
		}
				
		
		return mav;
		
	}

}
