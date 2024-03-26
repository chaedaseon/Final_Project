/*==================================
	ReserveViewSearchFormController.java
	- 사용자 정의 컨트롤러 클래스
===================================*/

package com.study.mvc.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.study.mvc.model.CafeDAO;
import com.study.mvc.model.CafeDTO;
import com.study.mvc.model.GroupDTO;

public class ReserveViewSearchFormController implements Controller
{
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// 액션 코드
		ModelAndView mav = new ModelAndView();
		
		// session 설정
		//-- 없음 → 누구나 접근 가능
		
		CafeDAO dao = new CafeDAO();
		ArrayList<GroupDTO> lfList = new ArrayList<GroupDTO>();
		ArrayList<CafeDTO> lists = new ArrayList<CafeDTO>();
		int count = 0;
		
		try
		{
			dao.connection();
			
			// 이전 페이지로부터 넘어온 데이터 수신
			//-- 지역 
			String reserveAddr = request.getParameter("reserveAddr");
			
			// 지역 리스트 조회
			lfList = dao.lfList();
			// 스터디카페 개수 조회
			count = dao.lfSearchCount(reserveAddr);
			// 스터디카페 내역 조회
			lists = dao.lfSearchLists(reserveAddr);
			
			mav.addObject("count", count);
			mav.addObject("lists", lists);
			mav.addObject("lfList", lfList);
			mav.addObject("reserveAddr", reserveAddr);
			
			// 스터디카페 둘러보기 페이지로 이동
			mav.setViewName("/WEB-INF/view/reservation/ReservationView.jsp");
			
			dao.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
				
		return mav;
		
	}

}
