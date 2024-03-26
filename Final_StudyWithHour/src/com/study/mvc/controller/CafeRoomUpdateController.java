/*==================================
   SampleController.java
   - 사용자 정의 컨트롤러 클래스
===================================*/

package com.study.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.study.mvc.model.CafeDAO;
import com.study.mvc.model.CafeDTO;

public class CafeRoomUpdateController implements Controller
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
      CafeDTO dto = new CafeDTO();
      
      try
      {
         dao.connection();
         
         // 이전페이지로부터 넘어온 데이터 수신
         String scCode = request.getParameter("scCode");
         String srCode = request.getParameter("updateCode");
         String srName = request.getParameter("updateName");
         String srCount = request.getParameter("updateCount");
         String srPrice = request.getParameter("updatePrice");
         
         // 스터디룸 수정 정보 
         dto.setSrCode(srCode);
         dto.setSrName(srName);
         dto.setSrCount(Integer.parseInt(srCount));
         dto.setSrPrice(Integer.parseInt(srPrice));
         
         // 스터디룸 수정
         dao.modifyRoom(dto);
         
         // 카페 정보 페이지로 이동
         mav.setViewName("redirect:cafedetail.do?scCode=" + scCode);
         
         dao.close();
         
      } catch (Exception e)
      {
         System.out.println(e.toString());
      }
            
      
      return mav;
      
   }

}