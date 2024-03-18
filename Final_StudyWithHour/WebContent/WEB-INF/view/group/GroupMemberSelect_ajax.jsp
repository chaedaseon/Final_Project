<%@page import="com.study.mybatis.model.GuestDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.study.mybatis.model.GroupCalendarDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String gu_code = request.getParameter("gu_code");
	
	ArrayList<GuestDTO> memberList = (ArrayList<GuestDTO>) request.getAttribute("memberList");

	String result = "";
	
	for (GuestDTO member : memberList) 
	{
		
		StringBuffer sb = new StringBuffer();
		
		sb.append("{\"gjCode\":\"" + member.getGjCode() + "\"");
		sb.append(",\"guNick\":\"" + member.getGuNick() + "\"},");
		
		result += sb.toString();
	} 
		
	// 마지막 컴마 제거
	result = result.substring(0, result.length()-1);

	// JSON 배열 객체 구성
	result = "[" + result + "]";
	out.println(result);
%>
