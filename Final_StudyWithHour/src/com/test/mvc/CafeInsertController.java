/*==================================
	CafeInsertController.java
	- 사용자 정의 컨트롤러 클래스
===================================*/

package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

// ※ Spring 의 『Controller』 인터페이스를 구현하는 방법을 통해
//    사용자 정의 컨트롤러 클래스를 구성한다.
//    cf.Controller Annotation 활용
public class CafeInsertController implements Controller
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
		
		// 이전 페이지(StudyCafeRegForm.jsp)로부터 넘어온 데이터 수신
		// → name ~ caution
		String scName = request.getParameter("name");
		String scResnumber = request.getParameter("resNumber");
		String tel1 = request.getParameter("tel1");
		String tel2 = request.getParameter("tel2");
		String tel3 = request.getParameter("tel3");
		String scAddr1 = request.getParameter("addr1");
		String scAddr2 = request.getParameter("addr2");
		String scOpenHour = request.getParameter("startHour");
		String scCloseHour = request.getParameter("closeHour");
		String scCaution = request.getParameter("caution");
		String scDetail = request.getParameter("detail");
		String[] ConvenientList = request.getParameterValues("checkCon");
		String[] SurroundList = request.getParameterValues("checkSur");
		String scFile = request.getParameter("fileRoute");
		String hoCode = request.getParameter("hoCode");
		
		String scTel = tel1 + tel2 + tel3;
		
		String scSurround = "";
		String scConvenient = "";
		
		if (ConvenientList != null)
		{
			for (int i=0; i<ConvenientList.length; i++)
				scConvenient += ConvenientList[i] + ",";
		}
		scConvenient = scConvenient.substring(0, scConvenient.length()-1);
		
		if (SurroundList != null)
		{
			for (int i=0; i<SurroundList.length; i++)
				scSurround += SurroundList[i] + ",";
		}
		scSurround = scSurround.substring(0, scSurround.length()-1);
		
		
		try
		{
			CafeDAO dao = new CafeDAO();
			CafeDTO cafe = new CafeDTO();
			dao.connection(); 
			
			cafe.setScName(scName);
			cafe.setScTel(scTel);
			cafe.setScResnumber(scResnumber);
			cafe.setScAddr1(scAddr1);
			cafe.setScAddr2(scAddr2);
			cafe.setScOpenHour(scOpenHour);
			cafe.setScCloseHour(scCloseHour);
			cafe.setScConvenient(scConvenient);
			cafe.setScSurround(scSurround);
			cafe.setScCaution(scCaution);
			cafe.setScDetail(scDetail);
			cafe.setScFile(scFile);
			cafe.setHoCode(hoCode);
			
			
			dao.add(cafe);
			
			//mav.setViewName("/WEB-INF/view/StudyCafeList.jsp");
			mav.setViewName("redirect:cafelist.do");
			
			dao.close();
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}		
		
		return mav;
		
	}

}
