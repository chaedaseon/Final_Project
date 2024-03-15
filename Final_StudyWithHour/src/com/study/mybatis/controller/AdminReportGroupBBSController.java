package com.study.mybatis.controller;

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

import com.study.mybatis.model.IAdminReportGroupBBSDAO;
import com.study.mybatis.model.PaginationDTO;
import com.study.mybatis.model.ReportBBSDTO;

@Controller
public class AdminReportGroupBBSController
{
	@Autowired
	private SqlSession sqlSession;
	

	// 그룹 게시물 신고 리스트 조회 (게시물&댓글&대댓글)
	@RequestMapping(value="adminreportgroupbbslist.do", method=RequestMethod.GET)
	public ModelAndView boardList(HttpServletRequest request, ModelAndView mav, 
			@RequestParam(value = "currPageNo", required = false, defaultValue = "1") String tmpcurrPageNo, 
			@RequestParam(value = "range", required = false, defaultValue = "1") String tmprange,
			@RequestParam(value = "searchType", required = false, defaultValue = "1") String tmpsearchType) 
	{
		HttpSession session = request.getSession();
		String adCode = (String)session.getAttribute("adCode");
		
		
		// 관리자 로그인상태 아닐 경우 로그인폼으로
		if(adCode==null)
		{
			
			mav.setViewName("loginform.do");
			return mav;	
		}		
		else
		{
		IAdminReportGroupBBSDAO dao = sqlSession.getMapper(IAdminReportGroupBBSDAO.class);
		
		int currPageNo = 0;
		int range = 0;
		
		try {			
			currPageNo = Integer.parseInt(tmpcurrPageNo);
			range = Integer.parseInt(tmprange);
			
		} catch(NumberFormatException e) {
			currPageNo = 1;
			range = 1;			
		}
		
		ArrayList<ReportBBSDTO> list = null;
		
		String searchType = "";
		String keyword = request.getParameter("keyword");
		
		try {			
			searchType = tmpsearchType;
			
		} catch(NumberFormatException e) {
			searchType = "";		
		}
		
		
		if(keyword == null || "".equals(keyword) || keyword.trim().isEmpty() ) {
			keyword = "";
		}	   	
		
		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("searchType", searchType);
		paraMap.put("keyword", keyword);		
		
		PaginationDTO pg = new PaginationDTO();
		pg.setSearchType(searchType);
		pg.setKeyword(keyword);
		
		
		int totalCnt = dao.boardTotalCnt(pg);	
		
		pg.pageInfo(currPageNo, range, totalCnt);
		
		
		
		list = dao.boardListPaging(pg);
		
		
		if(!"".equals(searchType) && !"".equals(keyword)) {
			mav.addObject("paraMap", paraMap);
		}
		
		mav.addObject("pagination", pg);
		mav.addObject("list", list);
		mav.setViewName("/WEB-INF/view/admin/AdminReportGroupBBSList.jsp");
		return mav;			
		}
	}

	
	// 그룹 신고 상세 조회
	@RequestMapping(value="adminreportgroupbbscontent.do", method=RequestMethod.GET)
	public String adminList(Model model,String rtype, String code, HttpServletRequest request)
	{
		
		HttpSession session =  request.getSession();
		
		String adCode = (String)session.getAttribute("adCode");
		
		if(adCode==null)
		{
			return "redirect:loginform.do";
		}
		
		IAdminReportGroupBBSDAO dao = sqlSession.getMapper(IAdminReportGroupBBSDAO.class);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("rtype", rtype);
		map.put("code", code);
	
		
		ReportBBSDTO report = dao.reportContent(map);
		
		
		String reportUser = dao.userId(report.getRpUser());
		String reportUserCode = dao.userGucode(report.getRpUser());
		String reportedUser = dao.userId(report.getReported());
		String reportedUserCode = dao.userGucode(report.getReported());
		
		
		String boardTitle = "";
		String boardCode = "";
		if (rtype.equals("2"))
		{
			boardCode = dao.replyBoardCode(report.getRpCode());
			boardTitle = dao.boardTitle(boardCode);
			model.addAttribute("boardCode", boardCode);
			model.addAttribute("boardTitle", boardTitle);
		}
		System.out.println(boardCode);
		System.out.println(boardTitle);
		
		String currPageNo = request.getParameter("currPageNo");
		String range = request.getParameter("range");
		String searchType = request.getParameter("searchType");
		String keyword = request.getParameter("keyword");
		

		model.addAttribute("currPageNo", currPageNo);
		model.addAttribute("range", range);
		model.addAttribute("searchType", searchType);
		model.addAttribute("keyword", keyword);
		
		
		
		
		
		model.addAttribute("report", report);
		model.addAttribute("code", code);
		model.addAttribute("rtype", rtype);
		model.addAttribute("reportUser", reportUser);
		model.addAttribute("reportUserCode", reportUserCode);
		model.addAttribute("reportedUser", reportedUser);
		model.addAttribute("reportedUserCode", reportedUserCode);
		
		
		return "/WEB-INF/view/admin/AdminReportGroupBBSContent.jsp";
	}

	// 그룹 신고 처리
	@RequestMapping(value="adminreportgroupbbscontent.do", method=RequestMethod.POST)
	public String adminList(Model model, HttpServletRequest request)
	{	
		
		HttpSession session =  request.getSession();
		
		String adCode = (String)session.getAttribute("adCode");
		
		if(adCode==null)
		{
			return "redirect:loginform.do";
		}
		
		IAdminReportGroupBBSDAO dao = sqlSession.getMapper(IAdminReportGroupBBSDAO.class);
		
		String falseReport = request.getParameter("lie");			// 1일 경우 허위신고, 0일 경우 허위신고가 아님
		String rtype = request.getParameter("rtype");				// 신고타입 1 : 게시물 / 2 : 댓글 / 3 : 대댓글
		String code = request.getParameter("code");					// 신고 번호
		String rpUser = request.getParameter("rpUser");				// (허위신고의 경우) 신고한 사람의 코드
		String redCode = request.getParameter("redCode");			// 1 : 승인 / 2 : 반려		
		String reported = request.getParameter("reportedUserCode");	// 신고당한 사람 코드

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("rtype", rtype);
		map.put("code", code);
		map.put("redCode", redCode);
		
		dao.groupBBSReportProcess(map);
		
		
		
		String currPageNo = request.getParameter("currPageNo");
		String range = request.getParameter("range");
		String searchType = request.getParameter("searchType");
		String keyword = request.getParameter("keyword");
		
		
		String url = "redirect:adminreportallbbslist.do";
		url += "?currPageNo=" + currPageNo;
		url += "&range=" + range;
		url += "&searchType=" + searchType;
		url += "&keyword=" + keyword;
		
		
		if (redCode.equals("1"))
		{
			int pCount = dao.penaltyCount(reported);
			
			// 만약 해당 회원의 패널티가 3개일 경우 차단 진행
			// 1. 해당 회원이 가입한 스터디그룹 탈퇴 처리
			//   1.1. 해당 회원이 그룹장일 경우, 해당 그룹에 가장 먼저 가입한 인원에게 그룹장 위임
			// 2. 차단 시점 이후의 예약내역이 있는지 조회
			//   ㄴ 있을 경우, 해당 그룹의 그룹장으로 예약자 수정
			//   ㄴ 해당 회원이 그룹장일 경우 1.1에서 그룹장을 위임받은 회원에게 예약 내역 이관
			if(pCount==3)
			{
				//해당 회원이 가입한 스터디그룹 있는지 확인
				int joinGroupCount = dao.joinGroupCount(reported);
				
				// 1개 이상일 경우
				if(joinGroupCount > 0)
				{
					ArrayList<String> joinCodeList = dao.joinGroupList(reported);
					
					for (int i = 0; i < joinCodeList.size(); i++)
					{
						String gjCode;
						String leaderCode;
						String updateLeaderCode;
						
						//가입요청코드 가져오기 
						gjCode = joinCodeList.get(i);
						
						// 가입코드로 해당 그룹의 그룹장 확인
						leaderCode = dao.searchLeaderCode(gjCode);
						System.out.println("그룹장 :" + leaderCode);
						// 해당 가입코드로 예약되어 있는지 갯수 체크
						int reservationCount = dao.reservationCk(gjCode);
						
						// 만약 해당 회원이 그룹장이라면
						if(gjCode.equals(leaderCode))
						{
							// 해당 그룹에서 (차단 회원을 제외한) 가장 먼저 가입한 사람의 가입요청코드 출력 
							updateLeaderCode = dao.searchJoinDate(gjCode);
							// 해당 회원으로 그룹장 변경
							dao.changeLeader(updateLeaderCode);
							
							// 해당 회원이 예약한(차단시점 이후 이용예정) 예약내역이 있는지 확인
							if( reservationCount > 0)
							{
								// 예약 내역(예약 코드) 가져오기
								ArrayList<String> reservationList = dao.reservationList(gjCode);
								for (int j = 0; j < reservationList.size(); j++)
								{
									HashMap<String, Object> rsMap = new HashMap<String, Object>();
									rsMap.put("leaderCode", updateLeaderCode);
									rsMap.put("reCode", reservationList.get(j));
									dao.updateReservation(rsMap);
								}
								
							}
							
						}//end 그룹장이라면
						else 	// 그룹장이 아니라면
						{
							// 해당 회원이 예약한(차단시점 이후 이용예정) 예약내역이 있는지 확인
							if( reservationCount > 0)
							{
								// 예약 내역(예약 코드) 가져오기 
								// 기존 그룹장 코드 입력
								ArrayList<String> reservationList = dao.reservationList(gjCode);
								
								for (int j = 0; j < reservationList.size(); j++)
								{
									HashMap<String, Object> rsMap = new HashMap<String, Object>();
									
									System.out.println("그룹장2 :" + leaderCode);
									rsMap.put("leaderCode", leaderCode);
									rsMap.put("reCode", reservationList.get(j));
									dao.updateReservation(rsMap);
								}
								
							}
							
						}// end 그룹장이 아니라면
						
						
						
						// 해당 그룹코드 그룹 탈퇴 처리
						dao.unregMember(gjCode);
						
						
					}// end for(그룹가입요청코드 가져오기 반복)
					
				}//스터디그룹 처리 끝
				
				
				//-- 게스트 비활성화 테이블에 insert 
				dao.unregGuest(reported);
				
				
			}// 차단 과정 끝
			
		}
	
		
		
		return url;
	}
	
}
