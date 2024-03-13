/*========================================
	AdminNoticeController.java
	- 관리자 화면에서 공지사항 컨트롤
========================================*/


package com.test.mybatis;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class GroupTicketListController
{
	@Autowired
	private SqlSession sqlSession;


	// 휴공티켓 사용이력 리스트 출력
	@RequestMapping(value="groupticketlist.do", method=RequestMethod.GET)
	public ModelAndView boardList(HttpServletRequest request, ModelAndView mav,//String grCode, 
			@RequestParam(value = "currPageNo", required = false, defaultValue = "1") String tmpcurrPageNo, 
			@RequestParam(value = "range", required = false, defaultValue = "1") String tmprange
			) 
	{
		// 그룹코드는 그룹진입때부터 주소창에서 갖고있는 것으로 상정
		// - 지금은 임시로 grCode = '1' 로 상정
		
		String grCode = "1";
		
		HttpSession session =  request.getSession();
		IGroupContentDAO dao = sqlSession.getMapper(IGroupContentDAO.class);
		
		String guCode = (String)session.getAttribute("guCode");
		
		//로그인 상태가 아닐 경우
		if(guCode==null)
		{
			mav.setViewName("redirect:loginform.do");
			return mav;		
		}
		else
		{
			// 로그인 되었으나 그룹에 가입한 회원이 아닐 경우
			
			HashMap<String, String> ckMap = new HashMap<String, String>();
			ckMap.put("grCode", grCode);
			ckMap.put("guCode", guCode);
			
			int joinGroupCk = dao.joinGroupCK(ckMap);
			
			if(joinGroupCk<1)
			{
				// 이후 그룹 선택 페이지로 주소 수정
				mav.setViewName("redirect:loginform.do");
				return mav;	
			}
			else
			{
				
				int currPageNo = 0;
				int range = 0;
				
				try {			
					currPageNo = Integer.parseInt(tmpcurrPageNo);
					range = Integer.parseInt(tmprange);
					
				} catch(NumberFormatException e) {
					currPageNo = 1;
					range = 1;			
				}
				
				ArrayList<GuestDTO> list = null;
				
				
				
				PaginationDTO pg = new PaginationDTO();
				pg.setGrCode(grCode);
				
				int totalCnt = dao.ticketBoardTotalCnt(grCode);	
				
				
				pg.pageInfo(currPageNo, range, totalCnt);
				
				
				
				list = dao.ticketBoardListPaging(pg);
				
				
				
				mav.addObject("pagination", pg);
				mav.addObject("list", list);
				mav.setViewName("GroupTicketList.jsp");
				return mav;			
			}
			
		}
	}

		
	
}
