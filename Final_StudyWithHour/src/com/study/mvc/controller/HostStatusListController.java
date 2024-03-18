/*==================================
	HostStatusListController.java
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

// ※ Spring 의 『Controller』 인터페이스를 구현하는 방법을 통해
//    사용자 정의 컨트롤러 클래스를 구성한다.
//    cf.Controller Annotation 활용
public class HostStatusListController implements Controller
{
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// 액션 코드		
		ModelAndView mav = new ModelAndView();
		
		// session 설정
		// 호스트코드가 있는 경우에만 접근 가능
		HttpSession session = request.getSession();
		
		if (session.getAttribute("hoCode")==null)
		{
			// 호스트코드가 없는 경우 로그인 폼으로 이동
			mav.setViewName("redirect:loginform.do");
			return mav;
		}
		
		CafeDAO dao = new CafeDAO();
		ArrayList<CafeDTO> cafe = new ArrayList<CafeDTO>();
		int totalCount = 0;
		int stateYetCount = 0;
		int stateDoneCount = 0;
		int noshowCount = 0;
		int cancelCount = 0;
		
		int totalPrice = 0;
		int stateYetPrice = 0;
		int stateDonePrice = 0;
		int noshowPrice = 0;
		int cancelPrice = 0;
		
		try
		{
			// 이전 페이지로부터 넘어온 데이터 수신
			String hoCode = request.getParameter("hoCode");
			String scCode = request.getParameter("scCode");
			String cfState = request.getParameter("cfState");
			String code = "";
			dao.connection();
			
			// 호스트의 카페 내역 조회
			cafe = dao.lists(hoCode, 1, 10);
			
			if (cfState == null)
			{
				cfState = "cfAll";
				code = hoCode;
			}
			else if (cfState.equals("cfAll"))
			{
				code = hoCode;
			}
			else
				code = cfState;
			
			// 예약건수 통계내역
			totalCount = dao.cafeAllCount(code, cfState);
			stateYetCount = dao.cafeStateCount(code, cfState, "이용예정");
			stateDoneCount = dao.cafeStateCount(code, cfState, "이용완료");
			noshowCount = dao.cafeStateCount(code, cfState, "노쇼");
			cancelCount = totalCount - (stateYetCount + stateDoneCount + noshowCount);
			
			// 총액 통계내역 (이용완료 = 총액)
			totalPrice = dao.cafeAllPrice(code, cfState);
			stateDonePrice = dao.cafeStatePrice(code, cfState, "이용완료");
			noshowPrice = dao.cafeStatePrice(code, cfState, "노쇼");
			stateYetPrice = dao.cafeStateCount(code, cfState, "이용예정");
			cancelPrice = totalPrice - (stateYetPrice + stateDonePrice + noshowPrice);
			
			
			mav.addObject("cancelCount", cancelCount);
			mav.addObject("stateYetCount", stateYetCount);
			mav.addObject("stateDoneCount", stateDoneCount);
			mav.addObject("noshowCount", noshowCount);
			mav.addObject("totalCount", totalCount);
			
			mav.addObject("noshowPrice", noshowPrice);
			mav.addObject("stateYetPrice", stateYetPrice);
			mav.addObject("cancelPrice", cancelPrice);
			mav.addObject("stateDonePrice", stateDonePrice);
			mav.addObject("cafe", cafe);
			mav.addObject("scCode", scCode);
			
			//mav.setViewName("StatisticsList.jsp");
			mav.setViewName("/WEB-INF/view/host/StatisticsList.jsp");
			
			dao.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
				
		
		return mav;
		
	}

}
