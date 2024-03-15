/*============================
	CommunityBoardController.java
	- 사용자 정의 컨트롤러
===========================*/

package com.study.mybatis.controller;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.study.mybatis.model.CommunityBoardDTO;
import com.study.mybatis.model.ICommunityBoardDAO;

@Controller
public class CommunityBoardController
{
	//주요 속성 구성
    //mybatis 객체 의존성(자동) 주입
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/boardcommunitylist.do", method = RequestMethod.GET) // 커뮤니티 게시판 메인 페이지 요청
	public String communityBoardList(ModelMap model, Integer vNum)
	{
		ICommunityBoardDAO dao = sqlSession.getMapper(ICommunityBoardDAO.class);
		
		if (vNum == null)
		{
			vNum = 1;
		}
		
		// 쿼리문의 반환값이 null일 수 있기 때문에 예외처리
		try
		{
			// 기준 페이지에 대한 목록 받아오기
			ArrayList<CommunityBoardDTO> list = dao.list(vNum);
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
		
		String urlparam = "communityboardlist";
		
		model.addAttribute("urlparam", urlparam);
		
		return "/WEB-INF/view/board/CommunityBoardList.jsp";	// 커뮤니티 게시판 호출
	}
	
	@RequestMapping(value = "/boardusedbooksearchcategory.do", method = RequestMethod.GET) // 중고책방 게시판 호출
	public String usedBookListSearchCategory(ModelMap model, @RequestParam("bsCode") String bsCode ,@RequestParam("vNum") int vNum)
	{
		ICommunityBoardDAO dao = sqlSession.getMapper(ICommunityBoardDAO.class);
		
		// 기준 페이지에 대한 목록 받아오기
		
		try
		{
			ArrayList<CommunityBoardDTO> list = dao.usedBookSearchBsCodeList(bsCode, vNum);
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
				if(dao.usedBookSearchBsCodeList(bsCode, vNum+2).size() == 0)
				{
					if(dao.usedBookSearchBsCodeList(bsCode, vNum+1).size() == 0)
					{
						if(dao.usedBookSearchBsCodeList(bsCode, vNum-4).size() != 0)
							page.add(vNum-4);
						
						if(dao.usedBookSearchBsCodeList(bsCode, vNum-3).size() != 0)
							page.add(vNum-3);
					}
					else
					{
						if(dao.usedBookSearchBsCodeList(bsCode, vNum-3).size() != 0)
							page.add(vNum-3);					
					}

				}

				for (int i = n-2; i <= n+2; i++)
				{
					if(dao.usedBookSearchBsCodeList(bsCode, i).size() != 0)
					{
						page.add(i);
					}
				}
				
				// 기준 번호보다 1~2 작은 페이지에 값이 없을 경우
				// 이후 페이지 번호를 가져와 리스트에 넣어주기
				if(dao.usedBookSearchBsCodeList(bsCode, vNum-2).size() == 0)
				{
					
					if(dao.usedBookSearchBsCodeList(bsCode, vNum-1).size() == 0)
					{
						if(dao.usedBookSearchBsCodeList(bsCode, vNum+3).size() != 0)
							page.add(vNum+3);
						if(dao.usedBookSearchBsCodeList(bsCode, vNum+4).size() != 0)
							page.add(vNum+4);
					}
					else
					{
						if(dao.usedBookSearchBsCodeList(bsCode, vNum+3).size() != 0)
							page.add(vNum+3);					
					}
				}
				int count = dao.scBsCount(bsCode);
				// 페이지 목록의 마지막 번호 저장하기
				int lastNum = page.get(page.size()-1);
				
				//-- 목록에 출력할 공지사항 리스트
				model.addAttribute("list", list);
				//-- 글 갯수가 8개 이하라면 페이징 출력 안할 count
				model.addAttribute("count", count);
				//-- 출력해줄 페이지 목록
				model.addAttribute("page", page);
				//-- 현재 목록 기준 페이지
				model.addAttribute("vNum", vNum);
				//-- 현재 목록 기준 페이지 마지막 번호
				model.addAttribute("lastNum", lastNum);
			}
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		String urlparam = "usedbooksearchcategory";
		model.addAttribute("urlparam", urlparam);
		
		return "/WEB-INF/view/board/UsedBookBoardList.jsp";	// 커뮤니티 게시판 호출
	}
	
	@RequestMapping(value = "/boardusedbooklist.do", method = RequestMethod.GET) // 중고책방 게시판 호출
	public String usedBookList(ModelMap model, Integer vNum)
	{
		ICommunityBoardDAO dao = sqlSession.getMapper(ICommunityBoardDAO.class);
		
		if (vNum == null)
		{
			vNum = 1;
		}
		
		// 기준 페이지에 대한 목록 받아오기
		ArrayList<CommunityBoardDTO> list = dao.usedBookList(vNum);
		
		int count = dao.count();
		
		
		// 페이지 목록 만들 ArrayList
		ArrayList<Integer> page = new ArrayList<Integer>();
		
		
		//-- 현재 선택 페이지 전후(-2 ~ +2) 로 페이지를 만들 수 있는 값이 있다면
		//   페이징 목록에 추가 (페이지 번호는 5개까지)
		//-- -2~기준, 기준~2가 없을 경우 반대쪽 수로 채워줌
		int n = vNum;
		
		// 기준 번호보다 1~2 큰 페이지에 값이 없을 경우
		// 이전 페이지 번호를 가져와 리스트에 넣어주기
		if(dao.usedBookList(vNum+2).size() == 0)
		{
			if(dao.usedBookList(vNum+1).size() == 0)
			{
				if(dao.usedBookList(vNum-4).size() != 0)
					page.add(vNum-4);
				
				if(dao.usedBookList(vNum-3).size() != 0)
					page.add(vNum-3);
			}
			else
			{
				if(dao.usedBookList(vNum-3).size() != 0)
					page.add(vNum-3);					
			}

		}

		for (int i = n-2; i <= n+2; i++)
		{
			if(dao.usedBookList(i).size() != 0)
			{
				page.add(i);
			}
		}
		
		// 기준 번호보다 1~2 작은 페이지에 값이 없을 경우
		// 이후 페이지 번호를 가져와 리스트에 넣어주기
		if(dao.usedBookList(vNum-2).size() == 0)
		{
			
			if(dao.usedBookList(vNum-1).size() == 0)
			{
				if(dao.usedBookList(vNum+3).size() != 0)
					page.add(vNum+3);
				if(dao.usedBookList(vNum+4).size() != 0)
					page.add(vNum+4);
			}
			else
			{
				if(dao.usedBookList(vNum+3).size() != 0)
					page.add(vNum+3);					
			}
		}
		// 페이지 목록의 마지막 번호 저장하기
		int lastNum = page.get(page.size()-1);
		
		String urlparam = "usedbookboardlist";
		//-- 목록에 출력할 공지사항 리스트
		model.addAttribute("list", list);
		//-- 글 갯수가 8개 이하라면 페이징 출력 안할 count
		model.addAttribute("count", count);
		//-- 출력해줄 페이지 목록
		model.addAttribute("page", page);
		//-- 현재 목록 기준 페이지
		model.addAttribute("vNum", vNum);
		//-- 현재 목록 기준 페이지 마지막 번호
		model.addAttribute("lastNum", lastNum);
		
		model.addAttribute("urlparam", urlparam);
		
		return "/WEB-INF/view/board/UsedBookBoardList.jsp";	// 커뮤니티 게시판 호출
	}
	
	@RequestMapping(value = "/boardcommunitysearchcategory.do", method = RequestMethod.GET) // 커뮤니티 게시판 메인 페이지 요청
	public String communityBoardSearchCategory(ModelMap model, @RequestParam("bsCode") String bsCode ,@RequestParam("vNum") int vNum)
	{
		ICommunityBoardDAO dao = sqlSession.getMapper(ICommunityBoardDAO.class);
		
		// 기준 페이지에 대한 목록 받아오기
		ArrayList<CommunityBoardDTO> list = dao.searchBsCodeList(bsCode, vNum);
		
		int count = dao.count();
		
		
		// 페이지 목록 만들 ArrayList
		ArrayList<Integer> page = new ArrayList<Integer>();
		
		
		//-- 현재 선택 페이지 전후(-2 ~ +2) 로 페이지를 만들 수 있는 값이 있다면
		//   페이징 목록에 추가 (페이지 번호는 5개까지)
		//-- -2~기준, 기준~2가 없을 경우 반대쪽 수로 채워줌
		int n = vNum;
		
		// 기준 번호보다 1~2 큰 페이지에 값이 없을 경우
		// 이전 페이지 번호를 가져와 리스트에 넣어주기
		if(dao.searchBsCodeList(bsCode, vNum+2).size() == 0)
		{
			if(dao.searchBsCodeList(bsCode, vNum+1).size() == 0)
			{
				if(dao.searchBsCodeList(bsCode, vNum-4).size() != 0)
					page.add(vNum-4);
				
				if(dao.searchBsCodeList(bsCode, vNum-3).size() != 0)
					page.add(vNum-3);
			}
			else
			{
				if(dao.searchBsCodeList(bsCode, vNum-3).size() != 0)
					page.add(vNum-3);					
			}

		}

		for (int i = n-2; i <= n+2; i++)
		{
			if(dao.searchBsCodeList(bsCode, i).size() != 0)
			{
				page.add(i);
			}
		}
		
		// 기준 번호보다 1~2 작은 페이지에 값이 없을 경우
		// 이후 페이지 번호를 가져와 리스트에 넣어주기
		if(dao.searchBsCodeList(bsCode, vNum-2).size() == 0)
		{
			
			if(dao.searchBsCodeList(bsCode, vNum-1).size() == 0)
			{
				if(dao.searchBsCodeList(bsCode, vNum+3).size() != 0)
					page.add(vNum+3);
				if(dao.searchBsCodeList(bsCode, vNum+4).size() != 0)
					page.add(vNum+4);
			}
			else
			{
				if(dao.searchBsCodeList(bsCode, vNum+3).size() != 0)
					page.add(vNum+3);					
			}
		}
		// 페이지 목록의 마지막 번호 저장하기
		int lastNum = page.get(page.size()-1);
		
		String urlparam = "communityboardsearchBsCode";
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
		
		return "/WEB-INF/view/board/CommunityBoardList.jsp";	// 커뮤니티 게시판 호출
	}
	
	@RequestMapping(value = "/boardcommunitysearchnum.do", method = RequestMethod.GET) // 커뮤니티 게시판 요청시
	public String communityBoardSearchNum(ModelMap model, @RequestParam("searchNum") String searchNum)
	{
		ICommunityBoardDAO dao = sqlSession.getMapper(ICommunityBoardDAO.class);
		
		// 기준 페이지에 대한 목록 받아오기
		ArrayList<CommunityBoardDTO> searchNumList = dao.searchNum(searchNum);
		
		int count = dao.count();
		
		int page = 1;
		
		String urlparam = "communityboardsearchNum";
		
		//-- 목록에 출력할 공지사항 리스트
		model.addAttribute("list", searchNumList);
		//-- 글 갯수가 9개 이하라면 페이징 출력 안할 count
		model.addAttribute("count", count);
		//-- 출력해줄 페이지 목록
		model.addAttribute("page", page);
		
		model.addAttribute("urlparam", urlparam);
		
		return "/WEB-INF/view/board/CommunityBoardList.jsp";	// 커뮤니티 게시판 호출
	}
	
	@RequestMapping(value = "/boardcommunitysearchtitle.do", method = RequestMethod.GET) // 커뮤니티 게시판 요청시
	public String communityBoardSearchTitle(ModelMap model, @RequestParam("searchTitle") String searchTitle ,@RequestParam("vNum") int vNum)
	{
		ICommunityBoardDAO dao = sqlSession.getMapper(ICommunityBoardDAO.class);
		
		// 기준 페이지에 대한 목록 받아오기
		ArrayList<CommunityBoardDTO> searchTitleList = dao.searchTitleList(searchTitle, vNum);
		
		int count = dao.scTitleCount(searchTitle);
		
		
		// 페이지 목록 만들 ArrayList
		ArrayList<Integer> page = new ArrayList<Integer>();
		
		
		//-- 현재 선택 페이지 전후(-2 ~ +2) 로 페이지를 만들 수 있는 값이 있다면
		//   페이징 목록에 추가 (페이지 번호는 5개까지)
		//-- -2~기준, 기준~2가 없을 경우 반대쪽 수로 채워줌
		int n = vNum;
		
		// 기준 번호보다 1~2 큰 페이지에 값이 없을 경우
		// 이전 페이지 번호를 가져와 리스트에 넣어주기
		if(dao.searchTitleList(searchTitle,vNum+2).size() == 0)
		{
			if(dao.searchTitleList(searchTitle,vNum+1).size() == 0)
			{
				if(dao.searchTitleList(searchTitle,vNum-4).size() != 0)
					page.add(vNum-4);
				
				if(dao.searchTitleList(searchTitle,vNum-3).size() != 0)
					page.add(vNum-3);
			}
			else
			{
				if(dao.searchTitleList(searchTitle,vNum-3).size() != 0)
					page.add(vNum-3);					
			}

		}

		for (int i = n-2; i <= n+2; i++)
		{
			if(dao.searchTitleList(searchTitle,i).size() != 0)
			{
				page.add(i);
			}
		}
		
		// 기준 번호보다 1~2 작은 페이지에 값이 없을 경우
		// 이후 페이지 번호를 가져와 리스트에 넣어주기
		if(dao.searchTitleList(searchTitle,vNum-2).size() == 0)
		{
			
			if(dao.searchTitleList(searchTitle,vNum-1).size() == 0)
			{
				if(dao.searchTitleList(searchTitle,vNum+3).size() != 0)
					page.add(vNum+3);
				if(dao.searchTitleList(searchTitle,vNum+4).size() != 0)
					page.add(vNum+4);
			}
			else
			{
				if(dao.searchTitleList(searchTitle,vNum+3).size() != 0)
					page.add(vNum+3);					
			}
		}
		// 페이지 목록의 마지막 번호 저장하기
		int lastNum = page.get(page.size()-1);
		
		System.out.println(count);
		
		String urlparam = "communityboardsearchTitle";
		//-- 목록에 출력할 공지사항 리스트
		model.addAttribute("list", searchTitleList);
		//-- 글 갯수가 9개 이하라면 페이징 출력 안할 count
		model.addAttribute("count", count);
		//-- 출력해줄 페이지 목록
		model.addAttribute("page", page);
		//-- 현재 목록 기준 페이지
		model.addAttribute("vNum", vNum);
		//-- 현재 목록 기준 페이지 마지막 번호
		model.addAttribute("lastNum", lastNum);
		
		model.addAttribute("urlparam", urlparam);
	
		return "/WEB-INF/view/board/CommunityBoardList.jsp";	// 커뮤니티 게시판 호출
	}
	
	@RequestMapping(value = "/boardcommunitysearchnick.do", method = RequestMethod.GET) // 커뮤니티 게시판 요청시
	public String communityBoardSearchNick(ModelMap model, @RequestParam("searchNick") String searchNick ,@RequestParam("vNum") int vNum)
	{
		ICommunityBoardDAO dao = sqlSession.getMapper(ICommunityBoardDAO.class);
		
		// 기준 페이지에 대한 목록 받아오기
		ArrayList<CommunityBoardDTO> searchNickList = dao.searchNickList(searchNick, vNum);
		
		int count = dao.scNickCount(searchNick);
		
		
		// 페이지 목록 만들 ArrayList
		ArrayList<Integer> page = new ArrayList<Integer>();
		
		
		//-- 현재 선택 페이지 전후(-2 ~ +2) 로 페이지를 만들 수 있는 값이 있다면
		//   페이징 목록에 추가 (페이지 번호는 5개까지)
		//-- -2~기준, 기준~2가 없을 경우 반대쪽 수로 채워줌
		int n = vNum;
		
		// 기준 번호보다 1~2 큰 페이지에 값이 없을 경우
		// 이전 페이지 번호를 가져와 리스트에 넣어주기
		if(dao.searchNickList(searchNick,vNum+2).size() == 0)
		{
			if(dao.searchNickList(searchNick,vNum+1).size() == 0)
			{
				if(dao.searchNickList(searchNick,vNum-4).size() != 0)
					page.add(vNum-4);
				
				if(dao.searchNickList(searchNick,vNum-3).size() != 0)
					page.add(vNum-3);
			}
			else
			{
				if(dao.searchNickList(searchNick,vNum-3).size() != 0)
					page.add(vNum-3);					
			}

		}

		for (int i = n-2; i <= n+2; i++)
		{
			if(dao.searchNickList(searchNick,i).size() != 0)
			{
				page.add(i);
			}
		}
		
		// 기준 번호보다 1~2 작은 페이지에 값이 없을 경우
		// 이후 페이지 번호를 가져와 리스트에 넣어주기
		if(dao.searchNickList(searchNick,vNum-2).size() == 0)
		{
			
			if(dao.searchNickList(searchNick,vNum-1).size() == 0)
			{
				if(dao.searchNickList(searchNick,vNum+3).size() != 0)
					page.add(vNum+3);
				if(dao.searchNickList(searchNick,vNum+4).size() != 0)
					page.add(vNum+4);
			}
			else
			{
				if(dao.searchNickList(searchNick,vNum+3).size() != 0)
					page.add(vNum+3);					
			}
		}
		// 페이지 목록의 마지막 번호 저장하기
		int lastNum = page.get(page.size()-1);
		
		System.out.println(count);
		
		String urlparam = "communityboardsearchNick";
		//-- 목록에 출력할 공지사항 리스트
		model.addAttribute("list", searchNickList);
		//-- 글 갯수가 9개 이하라면 페이징 출력 안할 count
		model.addAttribute("count", count);
		//-- 출력해줄 페이지 목록
		model.addAttribute("page", page);
		//-- 현재 목록 기준 페이지
		model.addAttribute("vNum", vNum);
		//-- 현재 목록 기준 페이지 마지막 번호
		model.addAttribute("lastNum", lastNum);
		
		model.addAttribute("urlparam", urlparam);
	
		return "/WEB-INF/view/board/CommunityBoardList.jsp";	// 커뮤니티 게시판 호출
	}
	
	@RequestMapping(value = "/boardcommunityinsertform.do") // 커뮤니티 게시글 작성 폼 요청시
    public String boardInsertForm()
    {
		return "/WEB-INF/view/board/WritePostForm.jsp";		// 커뮤니티 게시글 작성 폼 호출
    }
	
    // 입력
	@RequestMapping(value="/communityboardinsert.do", method = RequestMethod.POST)
    public String boardInsert(CommunityBoardDTO board)
    {
		ICommunityBoardDAO dao = sqlSession.getMapper(ICommunityBoardDAO.class);
		
		try
		{
			dao.insert(board);
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
 
        return "redirect:boardcommunitylist.do";
    }
	
}
