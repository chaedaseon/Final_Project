/*============================
	BoardStudyGroupController.java
	- 사용자 정의 컨트롤러
===========================*/

package com.test.mybatis;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardStudyGroupController
{
	//주요 속성 구성
    //mybatis 객체 의존성(자동) 주입
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/boardgrouplist.do", method = RequestMethod.GET) 
	public String BoardStudyGroupList(ModelMap model, Integer vNum)
	{
		IBoardStudyGroupDAO dao = sqlSession.getMapper(IBoardStudyGroupDAO.class);
		
		if (vNum == null)
		{
			vNum = 1;
		}
		
		// 쿼리문의 반환값이 null일 수 있기 때문에 예외처리
		try
		{
			// 기준 페이지에 대한 목록 받아오기
			ArrayList<BoardStudyGroupDTO> list = dao.list(vNum);
			//-- 목록에 출력할 공지사항 리스트
			if (list == null)
			{
				String nulllist = null;
				model.addAttribute("list", nulllist);
			}
			else
			{
				// 페이지 목록 만들 ArrayList
				ArrayList<Integer> page = new ArrayList<Integer>();
				
				//-- 현재 선택 페이지 전후(-2 ~ +2) 로 페이지를 만들 수 있는 값이 있다면
				//   페이징 목록에 추가 (페이지 번호는 5개까지)
				//-- -2~기준, 기준~2가 없을 경우 반대쪽 수로 채워줌
				int n = vNum;
				
				// 기준 번호보다 1~2 큰 페이지에 값이 없을 경우
				// 이전 페이지 번호를 가져와 리스트에 넣어주기
				if(dao.list(vNum+2).size() == 0)
				{
					if(dao.list(vNum+1).size() == 0)
					{
						if(dao.list(vNum-4).size() != 0)
							page.add(vNum-4);
						
						if(dao.list(vNum-3).size() != 0)
							page.add(vNum-3);
					}
					else
					{
						if(dao.list(vNum-3).size() != 0)
							page.add(vNum-3);					
					}

				}

				for (int i = n-2; i <= n+2; i++)
				{
					if(dao.list(i).size() != 0)
					{
						page.add(i);
					}
				}
				
				// 기준 번호보다 1~2 작은 페이지에 값이 없을 경우
				// 이후 페이지 번호를 가져와 리스트에 넣어주기
				if(dao.dDaylist(vNum-2).size() == 0)
				{
					
					if(dao.list(vNum-1).size() == 0)
					{
						if(dao.list(vNum+3).size() != 0)
							page.add(vNum+3);
						if(dao.list(vNum+4).size() != 0)
							page.add(vNum+4);
					}
					else
					{
						if(dao.list(vNum+3).size() != 0)
							page.add(vNum+3);					
					}
				}
				// 페이지 목록의 마지막 번호 저장하기
				int lastNum = page.get(page.size()-1);
				
				int count = dao.count();
				
				model.addAttribute("list", list);
				
				model.addAttribute("count", count);
				//-- 출력해줄 페이지 목록
				model.addAttribute("page", page);
				//-- 현재 목록 기준 페이지 마지막 번호
				model.addAttribute("lastNum", lastNum);
				//-- 현재 목록 기준 페이지
				model.addAttribute("vNum", vNum);
			}
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		String urlparam = "boardstudygrouplist";
		
		model.addAttribute("urlparam", urlparam);
		
		return "/StudyGroupList.jsp";
		//return "/WEB-INF/view/StudyGroupList.jsp";	
	}
	
	
	@RequestMapping(value = "/boardgroupnew.do", method = RequestMethod.GET) 
	public String BoardStudyGroupListCategory(ModelMap model, Integer vNum)
	{
		IBoardStudyGroupDAO dao = sqlSession.getMapper(IBoardStudyGroupDAO.class);
		
		if (vNum == null)
		{
			vNum = 1;
		}
		
		// 기준 페이지에 대한 목록 받아오기
		try
		{
			ArrayList<BoardStudyGroupDTO> list = dao.dDaylist(vNum);
			//-- 목록에 출력할 공지사항 리스트
			if (list == null)
			{
				String nulllist = null;
				model.addAttribute("list", nulllist);
			}
			else
			{
				// 페이지 목록 만들 ArrayList
				ArrayList<Integer> page = new ArrayList<Integer>();
				
				//-- 현재 선택 페이지 전후(-2 ~ +2) 로 페이지를 만들 수 있는 값이 있다면
				//   페이징 목록에 추가 (페이지 번호는 5개까지)
				//-- -2~기준, 기준~2가 없을 경우 반대쪽 수로 채워줌
				int n = vNum;
				
				// 기준 번호보다 1~2 큰 페이지에 값이 없을 경우
				// 이전 페이지 번호를 가져와 리스트에 넣어주기
				if(dao.dDaylist(vNum+2).size() == 0)
				{
					if(dao.dDaylist(vNum+1).size() == 0)
					{
						if(dao.dDaylist(vNum-4).size() != 0)
							page.add(vNum-4);
						
						if(dao.dDaylist(vNum-3).size() != 0)
							page.add(vNum-3);
					}
					else
					{
						if(dao.dDaylist(vNum-3).size() != 0)
							page.add(vNum-3);					
					}

				}

				for (int i = n-2; i <= n+2; i++)
				{
					if(dao.dDaylist(i).size() != 0)
					{
						page.add(i);
					}
				}
				
				// 기준 번호보다 1~2 작은 페이지에 값이 없을 경우
				// 이후 페이지 번호를 가져와 리스트에 넣어주기
				if(dao.dDaylist(vNum-2).size() == 0)
				{
					
					if(dao.dDaylist(vNum-1).size() == 0)
					{
						if(dao.dDaylist(vNum+3).size() != 0)
							page.add(vNum+3);
						if(dao.dDaylist(vNum+4).size() != 0)
							page.add(vNum+4);
					}
					else
					{
						if(dao.dDaylist(vNum+3).size() != 0)
							page.add(vNum+3);					
					}
				}
				// 페이지 목록의 마지막 번호 저장하기
				int lastNum = page.get(page.size()-1);
				
				int count = dao.dDayListcount();
				
				model.addAttribute("list", list);
				
				model.addAttribute("count", count);
				//-- 출력해줄 페이지 목록
				model.addAttribute("page", page);
				//-- 현재 목록 기준 페이지 마지막 번호
				model.addAttribute("lastNum", lastNum);
				//-- 현재 목록 기준 페이지
				model.addAttribute("vNum", vNum);
			}
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		String urlparam = "boardstudygroupnew";
		//-- 글 갯수가 12개 이하라면 페이징 출력 안할 count
		model.addAttribute("urlparam", urlparam);
		
		return "/StudyGroupList.jsp";
		//return "/WEB-INF/view/StudyGroupList.jsp";	// 그룹 모집 게시판 호출
	}
	
	@RequestMapping(value = "/boardgroupadd.do", method = RequestMethod.GET) 
	public String BoardStudyGroupListAdd(ModelMap model, Integer vNum)
	{
		IBoardStudyGroupDAO dao = sqlSession.getMapper(IBoardStudyGroupDAO.class);
		
		if (vNum == null)
		{
			vNum = 1;
		}
		
		// 기준 페이지에 대한 목록 받아오기
		try
		{
			ArrayList<BoardStudyGroupDTO> list = dao.addList(vNum);
			//-- 목록에 출력할 공지사항 리스트
			if (list == null)
			{
				String nulllist = null;
				model.addAttribute("list", nulllist);
			}
			else
			{
				// 페이지 목록 만들 ArrayList
				ArrayList<Integer> page = new ArrayList<Integer>();
				
				//-- 현재 선택 페이지 전후(-2 ~ +2) 로 페이지를 만들 수 있는 값이 있다면
				//   페이징 목록에 추가 (페이지 번호는 5개까지)
				//-- -2~기준, 기준~2가 없을 경우 반대쪽 수로 채워줌
				int n = vNum;
				
				// 기준 번호보다 1~2 큰 페이지에 값이 없을 경우
				// 이전 페이지 번호를 가져와 리스트에 넣어주기
				if(dao.addList(vNum+2).size() == 0)
				{
					if(dao.addList(vNum+1).size() == 0)
					{
						if(dao.addList(vNum-4).size() != 0)
							page.add(vNum-4);
						
						if(dao.addList(vNum-3).size() != 0)
							page.add(vNum-3);
					}
					else
					{
						if(dao.addList(vNum-3).size() != 0)
							page.add(vNum-3);					
					}

				}

				for (int i = n-2; i <= n+2; i++)
				{
					if(dao.addList(i).size() != 0)
					{
						page.add(i);
					}
				}
				
				// 기준 번호보다 1~2 작은 페이지에 값이 없을 경우
				// 이후 페이지 번호를 가져와 리스트에 넣어주기
				if(dao.addList(vNum-2).size() == 0)
				{
					
					if(dao.addList(vNum-1).size() == 0)
					{
						if(dao.addList(vNum+3).size() != 0)
							page.add(vNum+3);
						if(dao.addList(vNum+4).size() != 0)
							page.add(vNum+4);
					}
					else
					{
						if(dao.addList(vNum+3).size() != 0)
							page.add(vNum+3);					
					}
				}
				// 페이지 목록의 마지막 번호 저장하기
				int lastNum = page.get(page.size()-1);
				
				int count = dao.addListCount();
				
				model.addAttribute("list", list);
				
				model.addAttribute("count", count);
				//-- 출력해줄 페이지 목록
				model.addAttribute("page", page);
				//-- 현재 목록 기준 페이지 마지막 번호
				model.addAttribute("lastNum", lastNum);
				//-- 현재 목록 기준 페이지
				model.addAttribute("vNum", vNum);
			}
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		String urlparam = "boardstudygroupadd";
		//-- 글 갯수가 12개 이하라면 페이징 출력 안할 count
		model.addAttribute("urlparam", urlparam);
		
		return "/StudyGroupList.jsp";
		//return "/WEB-INF/view/StudyGroupList.jsp";	// 그룹 모집 게시판 호출
	}
	
	@RequestMapping(value = "/boardgroupend.do", method = RequestMethod.GET) 
	public String BoardStudyGroupListEnd(ModelMap model, Integer vNum)
	{
		IBoardStudyGroupDAO dao = sqlSession.getMapper(IBoardStudyGroupDAO.class);
		
		if (vNum == null)
		{
			vNum = 1;
		}
		
		// 기준 페이지에 대한 목록 받아오기
		try
		{
			ArrayList<BoardStudyGroupDTO> list = dao.endList(vNum);
			//-- 목록에 출력할 공지사항 리스트
			if (list == null)
			{
				String nulllist = null;
				model.addAttribute("list", nulllist);
			}
			else
			{
				// 페이지 목록 만들 ArrayList
				ArrayList<Integer> page = new ArrayList<Integer>();
				
				//-- 현재 선택 페이지 전후(-2 ~ +2) 로 페이지를 만들 수 있는 값이 있다면
				//   페이징 목록에 추가 (페이지 번호는 5개까지)
				//-- -2~기준, 기준~2가 없을 경우 반대쪽 수로 채워줌
				int n = vNum;
				
				// 기준 번호보다 1~2 큰 페이지에 값이 없을 경우
				// 이전 페이지 번호를 가져와 리스트에 넣어주기
				if(dao.endList(vNum+2).size() == 0)
				{
					if(dao.endList(vNum+1).size() == 0)
					{
						if(dao.endList(vNum-4).size() != 0)
							page.add(vNum-4);
						
						if(dao.endList(vNum-3).size() != 0)
							page.add(vNum-3);
					}
					else
					{
						if(dao.endList(vNum-3).size() != 0)
							page.add(vNum-3);					
					}

				}

				for (int i = n-2; i <= n+2; i++)
				{
					if(dao.endList(i).size() != 0)
					{
						page.add(i);
					}
				}
				
				// 기준 번호보다 1~2 작은 페이지에 값이 없을 경우
				// 이후 페이지 번호를 가져와 리스트에 넣어주기
				if(dao.endList(vNum-2).size() == 0)
				{
					
					if(dao.endList(vNum-1).size() == 0)
					{
						if(dao.endList(vNum+3).size() != 0)
							page.add(vNum+3);
						if(dao.endList(vNum+4).size() != 0)
							page.add(vNum+4);
					}
					else
					{
						if(dao.endList(vNum+3).size() != 0)
							page.add(vNum+3);					
					}
				}
				// 페이지 목록의 마지막 번호 저장하기
				int lastNum = page.get(page.size()-1);
				
				int count = dao.endListCount();
				
				model.addAttribute("list", list);
				
				model.addAttribute("count", count);
				//-- 출력해줄 페이지 목록
				model.addAttribute("page", page);
				//-- 현재 목록 기준 페이지 마지막 번호
				model.addAttribute("lastNum", lastNum);
				//-- 현재 목록 기준 페이지
				model.addAttribute("vNum", vNum);
			}
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		String urlparam = "boardstudygroupend";
		//-- 글 갯수가 12개 이하라면 페이징 출력 안할 count
		model.addAttribute("urlparam", urlparam);
		
		return "/StudyGroupList.jsp";
		//return "/WEB-INF/view/StudyGroupList.jsp";	// 그룹 모집 게시판 호출
	}
	
	@RequestMapping(value = "/groupopeninsertform.do") // 그룹 모집글 작성 폼 요청시
    public String groupInsertForm(ModelMap model)
    {
		IBoardStudyGroupDAO dao = sqlSession.getMapper(IBoardStudyGroupDAO.class);
		
		ArrayList<BoardStudyGroupDTO> list1 = dao.lsList("1");
		model.addAttribute("list1", list1);
		
		ArrayList<BoardStudyGroupDTO> list2 = dao.lsList("2");
		model.addAttribute("list2", list2);
		
		ArrayList<BoardStudyGroupDTO> list3 = dao.lsList("3");
		model.addAttribute("list3", list3);
		
		ArrayList<BoardStudyGroupDTO> list4 = dao.lsList("4");
		model.addAttribute("list4", list4);
		
		ArrayList<BoardStudyGroupDTO> list5 = dao.lsList("5");
		model.addAttribute("list5", list5);
		
		ArrayList<BoardStudyGroupDTO> list6 = dao.lsList("6");
		model.addAttribute("list6", list6);
		
		ArrayList<BoardStudyGroupDTO> list7 = dao.lsList("7");
		model.addAttribute("list7", list7);
		
		ArrayList<BoardStudyGroupDTO> list8 = dao.lsList("8");
		model.addAttribute("list8", list8);
		
		ArrayList<BoardStudyGroupDTO> list9 = dao.lsList("9");
		model.addAttribute("list9", list9);
		
		ArrayList<BoardStudyGroupDTO> list10 = dao.lsList("10");
		model.addAttribute("list10", list10);
		
		ArrayList<BoardStudyGroupDTO> list11 = dao.lsList("11");
		model.addAttribute("list11", list11);
		
		ArrayList<BoardStudyGroupDTO> list12 = dao.lsList("12");
		model.addAttribute("list12", list12);
		
		ArrayList<BoardStudyGroupDTO> list13 = dao.lsList("13");
		model.addAttribute("list13", list13);
		
		ArrayList<BoardStudyGroupDTO> list14 = dao.lsList("14");
		model.addAttribute("list14", list14);
		
		ArrayList<BoardStudyGroupDTO> list15 = dao.lsList("15");
		model.addAttribute("list15", list15);
		
		ArrayList<BoardStudyGroupDTO> list16 = dao.lsList("16");
		model.addAttribute("list16", list16);
		
		ArrayList<BoardStudyGroupDTO> list17 = dao.lsList("17");
		model.addAttribute("list17", list17);
		
		
		return "/GroupOpenInsertForm.jsp";
		//return "/WEB-INF/view/GroupOpenInsertForm.jsp";
    }
	
	@RequestMapping(value="/groupopeninsert.do", method = RequestMethod.POST)
    public String groupInsert(BoardStudyGroupDTO group)
    {
		IBoardStudyGroupDAO dao = sqlSession.getMapper(IBoardStudyGroupDAO.class);
		
		dao.insertGroupRegistration(group);
 
        return "redirect:boardgrouplist.do";
    }
	
	@RequestMapping(value="/groupjoin.do", method = RequestMethod.POST)
    public String groupJoin(ModelMap model,  @RequestParam Map<String, Object> data)
    {
		IBoardStudyGroupDAO dao = sqlSession.getMapper(IBoardStudyGroupDAO.class);
		
		String response = "";
		
        try 
        {
            dao.callGroupJoinProcedure(data);
            response = "가입이 성공적으로 처리되었습니다.";
        } catch (Exception e) 
        {
        	response = "조건에 부합하지 않습니다. 모집글의 상세정보와 본인의 현재 그룹 가입 정보를 확인하세요.";
        }
        
        model.addAttribute("response", response);
        
        
        return "/GroupBoard_ajax.jsp";
    }
	
	@RequestMapping(value="/groupregistration.do", method = RequestMethod.POST)
    public String groupReg(ModelMap model,  @RequestParam Map<String, Object> data)
    {
		IBoardStudyGroupDAO dao = sqlSession.getMapper(IBoardStudyGroupDAO.class);
		
		String response = "";
		System.out.println(data);
        try 
        {
            dao.callGroupRegistrationProcedure(data);
            response = "모집글이 성공적으로 게시되었습니다.";
        } catch (Exception e) 
        {
        	System.out.println(e.toString());
        	response = "조건에 부합하지 않습니다. 모집글의 상세정보와 본인의 오늘 올린 모집글의 갯수가 3개 이상인지 확인하세요.";
        }
        
        model.addAttribute("response", response);
        System.out.println(response);
        
        return "/GroupBoard_ajax.jsp";
    }
}

