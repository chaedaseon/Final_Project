/*============================
	BoardRedController.java
	- 사용자 정의 컨트롤러
===========================*/

package com.study.mybatis.controller;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.study.mybatis.model.IBoardRedDAO;

@Controller
public class BoardRedController
{
	// 주요 속성 구성
	// mybatis 객체 의존성(자동) 주입
	@Autowired
	private SqlSession sqlSession;


	@RequestMapping(value = "/boardredinsert.do", method = RequestMethod.POST)	// 게시글 댓글 입력
	public String addRed(@RequestParam("reason_code")String reason_code, @RequestParam("boCode")String boCode, @RequestParam("redGuCode")String redGuCode)
	{
		IBoardRedDAO dao = sqlSession.getMapper(IBoardRedDAO.class);

		dao.addRed(reason_code, boCode, redGuCode);

		return "redirect:boardview.do?boCode=" + boCode;
	}
}
