package com.test.mybatis;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminAdminController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="adminadminlist.do", method=RequestMethod.GET)
	public String adminList(Model model,Integer vNum, HttpServletRequest request)
	{
		
		HttpSession session =  request.getSession();
		
		String adCode = (String)session.getAttribute("adCode");
		
		if(adCode==null)
		{
			return "redirect:loginform.do";
		}
		
		if(vNum == null)
		{
			vNum = 1;
		}
		
		IAdminAdminDAO dao = sqlSession.getMapper(IAdminAdminDAO.class);
		
		ArrayList<AdminDTO> list = dao.adminList(vNum);
		int count = dao.count();
		
		String nextId = "ADMIN" + String.format("%03d", count+1);
		
		// 페이지 목록 만들 ArrayList
		ArrayList<Integer> page = new ArrayList<Integer>();
		
		
		//-- 현재 선택 페이지 전후(-2 ~ +2) 로 페이지를 만들 수 있는 값이 있다면
		//   페이징 목록에 추가 (페이지 번호는 5개까지)
		//-- -2~기준, 기준~2가 없을 경우 반대쪽 수로 채워줌
		int n = vNum;
		
		// 기준 번호보다 1~2 큰 페이지에 값이 없을 경우
		// 이전 페이지 번호를 가져와 리스트에 넣어주기

		if(dao.adminList(vNum+2).size() == 0)
		{
			if(dao.adminList(vNum+1).size() == 0)
			{
				if(dao.adminList(vNum-4).size() != 0)
					page.add(vNum-4);
				
				if(dao.adminList(vNum-3).size() != 0)
					page.add(vNum-3);
			}
			else
			{
				if(dao.adminList(vNum-3).size() != 0)
					page.add(vNum-3);					
			}

		}

		for (int i = n-2; i <= n+2; i++)
		{
			if(dao.adminList(i).size() != 0)
			{
				page.add(i);
			}
		}
		
		// 기준 번호보다 1~2 작은 페이지에 값이 없을 경우
		// 이후 페이지 번호를 가져와 리스트에 넣어주기
		if(dao.adminList(vNum-2).size() == 0)
		{
			
			if(dao.adminList(vNum-1).size() == 0)
			{
				if(dao.adminList(vNum+3).size() != 0)
					page.add(vNum+3);
				if(dao.adminList(vNum+4).size() != 0)
					page.add(vNum+4);
			}
			else
			{
				if(dao.adminList(vNum+3).size() != 0)
					page.add(vNum+3);					
			}
			
			

		}
		
		// 페이지 목록의 마지막 번호 저장하기
		int lastNum = page.get(page.size()-1);
			
		
	

		model.addAttribute("list", list);
		model.addAttribute("count", count);
		model.addAttribute("nextId", nextId);
		model.addAttribute("vNum", vNum);
		model.addAttribute("page", page);
		model.addAttribute("lastNum", lastNum);
		
		return "AdminAdminList.jsp";
	}
	
	// 관리자 계정 생성
	@RequestMapping(value="adminadmininsert.do", method=RequestMethod.POST)
	public String adminInsert(Model model, String adPw, HttpServletRequest request)
	{
		HttpSession session =  request.getSession();
		
		String adCode = (String)session.getAttribute("adCode");
		
		if(adCode==null)
		{
			return "redirect:loginform.do";
		}
		
		IAdminAdminDAO dao = sqlSession.getMapper(IAdminAdminDAO.class);
		
		dao.adminInsert(adPw);
		
		return "redirect:adminadminlist.do";
	}
	
	// 관리자 계정 비활성화 
	@RequestMapping(value="adminadminstate.do", method=RequestMethod.GET)
	public String adminState(Model model,String adCodeUnreg, HttpServletRequest request)
	{
		HttpSession session =  request.getSession();
		
		String adCode = (String)session.getAttribute("adCode");
		
		if(adCode==null)
		{
			return "redirect:loginform.do";
		}
		
		IAdminAdminDAO dao = sqlSession.getMapper(IAdminAdminDAO.class);
		
		 dao.adminState(adCodeUnreg);
		
		return "redirect:adminadminlist.do?vNum=1";
	}
	
}
