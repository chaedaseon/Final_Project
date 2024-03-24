/*==================================
	CafeSearchFormController.java
	- 사용자 정의 컨트롤러 클래스
===================================*/

package com.study.mvc.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.study.mvc.model.CafeDAO;
import com.study.mvc.model.CafeDTO;
import com.study.mvc.model.GroupDTO;

public class CafeSearchFormController implements Controller
{
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// 액션 코드
		ModelAndView mav = new ModelAndView();
		
		CafeDAO dao = new CafeDAO();
		CafeDTO cafe = new CafeDTO();
		ArrayList<CafeDTO> room = new ArrayList<CafeDTO>();
		ArrayList<CafeDTO> review = new ArrayList<CafeDTO>();
		int count = 0;
		
		try
		{
			dao.connection();
			
			// 이전 페이지로부터 넘어온 데이터 수신
			String scCode = request.getParameter("scCode");
			
			// 스터디카페 정보 조회
			cafe = dao.searchCode(scCode);
			// 스터디카페 보유 스터디룸 개수 조회
			count = dao.roomCount(scCode);
			// 스터디카페 보유 스터디룸 정보 조회
			room = dao.roomList(scCode);
			// 스터디카페 리뷰 내역 조회
			review = dao.reviewNewLists(scCode, 1, 5);
			
			mav.addObject("cafe", cafe);
			mav.addObject("count", count);
			mav.addObject("room", room);
			mav.addObject("review", review);
			
			// 카페 상세 페이지로 이동
			mav.setViewName("/WEB-INF/view/reservation/ReservationViewInfo.jsp");
			
			dao.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
				
		return mav;
		
	}

}
