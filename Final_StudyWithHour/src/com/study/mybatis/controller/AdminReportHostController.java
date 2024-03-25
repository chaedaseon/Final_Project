/*========================================
	AdminReportHostController.java
	- 관리자 화면에서 호스트 회원이 한 신고에 대한 처리
========================================*/


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

import com.study.mybatis.model.IAdminReportHostDAO;
import com.study.mybatis.model.PaginationDTO;
import com.study.mybatis.model.ReportBBSDTO;

@Controller
public class AdminReportHostController
{
	@Autowired
	private SqlSession sqlSession;
	

	// 호스트 신고 조회 
	@RequestMapping(value="adminreporthostlist.do", method=RequestMethod.GET)
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
		IAdminReportHostDAO dao = sqlSession.getMapper(IAdminReportHostDAO.class);
		
		int currPageNo = 0;
		int range = 0;
		// 현재 페이지 번호, 페이지 범위 가져오기 (없을 경우 둘다 1로)		
		try {			
			currPageNo = Integer.parseInt(tmpcurrPageNo);
			range = Integer.parseInt(tmprange);
			
		} catch(NumberFormatException e) {
			currPageNo = 1;
			range = 1;			
		}
		
		ArrayList<ReportBBSDTO> list = null;
		// 검색 타입과 검색어 설정			
		String searchType = "";
		String keyword = request.getParameter("keyword");
		// 만약 검색타입이 없을 경우 공백		
		try {			
			searchType = tmpsearchType;
			
		} catch(NumberFormatException e) {
			searchType = "";		
		}
		
		
		// 검색어 공백 처리	
		if(keyword == null || "".equals(keyword) || keyword.trim().isEmpty() ) {
			keyword = "";
		}	   	
		
		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("searchType", searchType);
		paraMap.put("keyword", keyword);		
		// dto에 검색타입/검색어 저장			
		PaginationDTO pg = new PaginationDTO();
		pg.setSearchType(searchType);
		pg.setKeyword(keyword);
		
		
		// 게시물의 총 갯수 가져오기			
		int totalCnt = dao.boardTotalCnt(pg);	
		// dto 내부의 pageInfo로 값 세팅		
		pg.pageInfo(currPageNo, range, totalCnt);
		
		
		// 세팅한 dto로 페이지네이션 리스트 출력		
		list = dao.boardListPaging(pg);
		
		
		// 페이지에 페이지처리한 리스트와 페이지네이션 보내기 	
		if(!"".equals(searchType) && !"".equals(keyword)) {
			mav.addObject("paraMap", paraMap);
		}
		
		mav.addObject("pagination", pg);
		mav.addObject("list", list);
		mav.setViewName("/WEB-INF/view/admin/AdminReportHostList.jsp");
		return mav;			
		}
	}

	
	// 호스트 신고 상세 조회
	
	@RequestMapping(value="adminreporthostcontent.do", method=RequestMethod.GET)
	public String adminList(Model model, String rtype, String code, HttpServletRequest request)
	{

		
		HttpSession session =  request.getSession();
		
		String adCode = (String)session.getAttribute("adCode");
		
		// 세션에서 가져온 adCode 없을 경우 로그인창으로		
		if(adCode==null)
		{
			return "redirect:loginform.do";
		}
		
		IAdminReportHostDAO dao = sqlSession.getMapper(IAdminReportHostDAO.class);
	
		//이전 페이지 페이지, 페이지길이, 검색타입, 검색어 가져온 후 전달
		String currPageNo = request.getParameter("currPageNo");
		String range = request.getParameter("range");
		String searchType = request.getParameter("searchType");
		String keyword = request.getParameter("keyword");
		

		model.addAttribute("currPageNo", currPageNo);
		model.addAttribute("range", range);
		model.addAttribute("searchType", searchType);
		model.addAttribute("keyword", keyword);
		
		ReportBBSDTO report = new ReportBBSDTO();
		
		// 신고코드로 신고정보 가져오기
		if (rtype.contentEquals("306"))
		{
			 report = dao.reportContentReview(code);
		}
		else
		{
			 report = dao.reportContentUse(code);
		}
		// 신고한 스터디카페 코드
		String studycafeCode = dao.getScCode(report.getRpCode());
		// 신고한 스터디카페 이름
		String studycafeName = dao.getScName(studycafeCode);		
		// 신고한 호스트 아이디
		String hostUser = dao.hostId(report.getRpUser());
		// 신고당한 그룹 이름
		String groupName = dao.groupName(report.getReported());

		
		model.addAttribute("studycafeCode", studycafeCode);
		model.addAttribute("studycafeName", studycafeName);			
		model.addAttribute("groupName", groupName);			
		
		model.addAttribute("hostUser", hostUser);
		model.addAttribute("report", report);
		model.addAttribute("code", code);
		model.addAttribute("rtype", rtype);

		// 리뷰 신고일 경우 리뷰내용 추가 전달
		// 이용내역일 경우 해당 첨부파일 전달
		if (rtype.equals("306"))				//-- 리뷰
		{
		
			String reviewContent = dao.reviewContent(code);
			
			
			model.addAttribute("reviewContent", reviewContent);
		}
		else 									//-- 이용내역 신고
		{
			String file = dao.getFile(code);
			model.addAttribute("file", file);
			
		}

		
		//model.addAttribute("reportUser", reportUser);
		//model.addAttribute("reportedUser", reportedUser);

		
		return "/WEB-INF/view/admin/AdminReportHostContent.jsp";
	}

	// 신고 내용 처리 
	@RequestMapping(value="adminreporthostprocess.do", method=RequestMethod.POST)
	public String reportHostProcess(Model model, String hrCode, String redCode, HttpServletRequest request)
	{
		
		
		HttpSession session =  request.getSession();
		
		String adCode = (String)session.getAttribute("adCode");
		
		// 관리자 로그인 상태가 아닐 경우 로그인폼으로 
		if(adCode==null)
		{
			return "redirect:loginform.do";
		}
		
		IAdminReportHostDAO dao = sqlSession.getMapper(IAdminReportHostDAO.class);
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("hrCode",hrCode);
		map.put("redCode", redCode);
		
		//신고당한 그룹 코드 가져오기
		String grCode = dao.getGrCode(hrCode);
		
		// 신고코드와 신고승인/미승인 여부 처리
		dao.reportHostProcess(map);
		
		
		String currPageNo = request.getParameter("currPageNo");
		String range = request.getParameter("range");
		String searchType = request.getParameter("searchType");
		String keyword = request.getParameter("keyword");
		
		
		String url = "redirect:adminreporthostlist.do";
		url += "?currPageNo=" + currPageNo;
		url += "&range=" + range;
		url += "&searchType=" + searchType;
		url += "&keyword=" + keyword;
		
		
		
		int pCount = dao.penaltyCount(grCode);
		// 호스트 신고 처리 후, 그룹 패널티가 3개일 경우
		if(pCount==3)
		{
			//그룹개설요청처리코드 가져오기
			String gcCode = dao.getGcCode(grCode);
			//그룹 해체 insert
			dao.groupBreak(gcCode);
			//그룹개설요청처리코드로 break 테이블의 고유코드 가져오기
			String brCode = dao.getBrCode(gcCode);
			// 해당 그룹의 유효멤버(탈퇴하지않은) 리스트 가져와서 list로 답기
			//  GJ_CODE 출력
			ArrayList<String> list = dao.breakMemberList(grCode);
			
			// 각 그룹원을 그룹 탈퇴 시키기 + 그룹해체 패널티 부여하기
			for (int i = 0; i < list.size(); i++)
			{
				String gjCode = list.get(i);
				// 그룹 탈퇴 시키기
				dao.breakMemberUnreg(gjCode);
				
				HashMap<String, Object> breakMap = new HashMap<String, Object>();
				breakMap.put("gjCode", gjCode);
				breakMap.put("brCode", brCode);
				
				// 그룹 해체 패널티 부여하기
				dao.breakPenaltyMember(breakMap);
				// 해체 패널티 부여 이후 해당 gjcode의 gucode(회원)의 패널티 갯수 확인
				String guCode = dao.getGucode(gjCode);
				
				int pGuCount = dao.penaltyCountGuest(guCode);
				if(pGuCount==3)
				{
					//해당 회원이 가입한 스터디그룹 있는지 확인
					int joinGroupCount = dao.joinGroupCount(guCode);
					
					// 1개 이상일 경우
					if(joinGroupCount > 0)
					{
						ArrayList<String> joinCodeList = dao.joinGroupList(guCode);
						
						for (int n = 0; n < joinCodeList.size(); n++)
						{
							String allGjCode;
							String leaderCode;
							String updateLeaderCode;
							
							//가입요청코드 가져오기 
							allGjCode = joinCodeList.get(n);
							
							// 가입코드로 해당 그룹의 그룹장 확인
							leaderCode = dao.searchLeaderCode(allGjCode);
							// 해당 가입코드로 예약되어 있는지 갯수 체크
							int reservationCount = dao.reservationCk(allGjCode);
							
							// 만약 해당 회원이 그룹장이라면
							if(allGjCode.equals(leaderCode))
							{
								// 해당 그룹에서 (차단 회원을 제외한) 가장 먼저 가입한 사람의 가입요청코드 출력 
								updateLeaderCode = dao.searchJoinDate(allGjCode);
								// 해당 회원으로 그룹장 변경
								dao.changeLeader(updateLeaderCode);
								
								// 해당 회원이 예약한(차단시점 이후 이용예정) 예약내역이 있는지 확인
								if( reservationCount > 0)
								{
									// 예약 내역(예약 코드) 가져오기
									ArrayList<String> reservationList = dao.reservationList(allGjCode);
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
									ArrayList<String> reservationList = dao.reservationList(allGjCode);
									
									for (int j = 0; j < reservationList.size(); j++)
									{
										HashMap<String, Object> rsMap = new HashMap<String, Object>();
										
										rsMap.put("leaderCode", leaderCode);
										rsMap.put("reCode", reservationList.get(j));
										dao.updateReservation(rsMap);
									}
									
								}
								
							}// end 그룹장이 아니라면
							
							
							
							// 해당 그룹코드 그룹 탈퇴 처리
							dao.unregMember(allGjCode);
							
							
						}// end for(그룹가입요청코드 가져오기 반복)
						
					}//스터디그룹 처리 끝
					
					
					//-- 게스트 비활성화 테이블에 insert 
					dao.unregGuest(guCode);
					
					
				}// 차단 과정 끝
				
			}
			
			
		}

		
		return url;
	}
	
}
