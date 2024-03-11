/*==================================
	CafeDetailController.java
	- 사용자 정의 컨트롤러 클래스
===================================*/

package com.test.mvc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

// ※ Spring 의 『Controller』 인터페이스를 구현하는 방법을 통해
//    사용자 정의 컨트롤러 클래스를 구성한다.
//    cf.Controller Annotation 활용
public class CafeDetailController implements Controller
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
		CafeDTO cafe = new CafeDTO();
		ArrayList<CafeDTO> review = new ArrayList<CafeDTO>();
		ArrayList<CafeDTO> room = new ArrayList<CafeDTO>();
		int count = 0;
		
		try
		{
			dao.connection();
			
			// 이전 페이지(StudyCafeList.jsp)로부터 넘어온 데이터 수신
			//-- scCode : 스터디카페코드
			String scCode = request.getParameter("scCode");
			
			cafe = dao.searchCode(scCode);						// 해당 카페 정보
			review = dao.reviewNewLists(scCode, 0, 5);			// 해당 카페 리뷰 내역
			count = dao.cafeReviewCount(scCode, "scafe", "");	// 해당 카페 리뷰 내역 개수
			room = dao.roomList(scCode);
			
			mav.addObject("cafe", cafe);
			mav.addObject("review", review);
			mav.addObject("count", count);
			mav.addObject("room", room);
			mav.addObject("scCode", scCode);
			
			mav.setViewName("StudyCafeInfo.jsp");
			//mav.setViewName("/WEB-INF/view/StudyCafeList.jsp");
			
			dao.close();
		}
		catch (Exception e)
		{
			System.out.println(e.toString());
		}
				
		
		return mav;
		
	}

}
