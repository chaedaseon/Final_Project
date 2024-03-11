/*========================================
	AdminNoticeController.java
	- 관리자 화면에서 공지사항 컨트롤
========================================*/


package com.test.mybatis;
import java.util.ArrayList;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class AdminLoginController
{
	@Autowired
	private SqlSession sqlSession;

	
	// 로그인 폼으로 이동
	@RequestMapping("adminloginform.do")
	public String adminLoginForm()
	{

		return "redirect:AdminLoginForm.jsp";
	}
	
	// 로그인 폼 입력 후
	@RequestMapping(value="adminlogin.do", method=RequestMethod.POST)
	public String adminLogin(Model model, AdminDTO dto)
	{
		
		IAdminLoginDAO dao = sqlSession.getMapper(IAdminLoginDAO.class);
		int result = dao.adminLogin(dto);
		
		if(result != 0)
		{
			System.out.println("로그인 성공!");
			
			//HttpServletRequest httpSession;
			//= session.getSession();
			
			return "redirect:adminnoticelist.do?vNum=1";
			
			
		}
		else
		{
			System.out.println("로그인 실패");
			model.addAttribute("error","error");
			return "redirect:adminloginform.do";
		}
		
	}
	
}
