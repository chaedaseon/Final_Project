/*============================
	CommunityBoardController.java
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
		
		// 기준 페이지에 대한 목록 받아오기
		ArrayList<BoardStudyGroupDTO> list = dao.list(vNum);
		
		int count = dao.count();
		
		
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
		if(dao.list(vNum-2).size() == 0)
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
		
		String urlparam = "boardstudygrouplist";
		//-- 목록에 출력할 공지사항 리스트
		model.addAttribute("list", list);
		//-- 글 갯수가 9개 이하라면 페이징 출력 안할 count
		model.addAttribute("count", count);
		//-- 출력해줄 페이지 목록
		model.addAttribute("page", page);
		//-- 현재 목록 기준 페이지
		model.addAttribute("vNum", vNum);
		//-- 현재 목록 기준 페이지 마지막 번호
		model.addAttribute("lastNum", lastNum);
		
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
		ArrayList<BoardStudyGroupDTO> list = dao.dDaylist(vNum);
		
		int count = dao.dDayListcount();
		
		
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
				
				if(dao.list(vNum-3).size() != 0)
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
		
		String urlparam = "boardstudygroupnew";
		//-- 목록에 출력할 공지사항 리스트
		model.addAttribute("list", list);
		//-- 글 갯수가 9개 이하라면 페이징 출력 안할 count
		model.addAttribute("count", count);
		//-- 출력해줄 페이지 목록
		model.addAttribute("page", page);
		//-- 현재 목록 기준 페이지
		model.addAttribute("vNum", vNum);
		//-- 현재 목록 기준 페이지 마지막 번호
		model.addAttribute("lastNum", lastNum);
		
		model.addAttribute("urlparam", urlparam);
		
		return "/StudyGroupList.jsp";
		//return "/WEB-INF/view/StudyGroupList.jsp";	// 커뮤니티 게시판 호출
	}
	
	@RequestMapping(value = "/groupopeninsertform.do") // 커뮤니티 게시글 작성 폼 요청시
    public String boardInsertForm()
    {
		return "/GroupOpenInsertForm.jsp";
		//return "/WEB-INF/view/GroupOpenInsertForm.jsp";		// 커뮤니티 게시글 작성 폼 호출
    }
	
    // 입력
	/*
	@RequestMapping(value="/communityboardinsert.do", method = RequestMethod.POST)
    public String boardInsert(BoardStudyGroupDTO group)
    {
		IBoardStudyGroupDAO dao = sqlSession.getMapper(IBoardStudyGroupDAO.class);
		
		Map<String, Object> call = new HashMap<String, Object>();
		call.put("param1", "a");
		call.put("param2", "a"); 
		System.out.println( call.toString() );
		// param1 = a , param2 = a
		
		System.out.println( call.toString() );
		// param1 = a , param2 = a , param3 = procedure_result
 
        return "redirect:communityboardlist.do";
    }
    */
}

