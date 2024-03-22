<%@page import="com.study.mybatis.model.GuestCalendarDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%

	// 페이지 로드될 때, 실행되는 에이작스 (DB에 있는 일정의 날짜와 달력에 그려진 날짜가 동일하면 일정 제목 출력하기)
	
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();

	String gu_code = request.getParameter("gu_code");
	
	ArrayList<GuestCalendarDTO> scheduleList = (ArrayList<GuestCalendarDTO>) request.getAttribute("list");

	String result = "";
	
	// 제이슨 형태로 구성 (일정 코드, 일정 제목, 일정 내용, 일정 날짜로 구성)
	for (GuestCalendarDTO schedule : scheduleList) 
	{
		StringBuffer sb = new StringBuffer();
		
		sb.append("{\"sch_code\":\"" + schedule.getSch_code() + "\"");
		sb.append(",\"sch_name\":\"" + schedule.getSch_name() + "\"");
		sb.append(",\"sch_content\":\"" + schedule.getSch_content() + "\"");
		sb.append(",\"sch_date\":\"" + schedule.getSch_date().substring(0,11) + "\"},");
		
		result += sb.toString();
	}
		
	// 마지막 컴마 제거
	result = result.substring(0, result.length()-1);
	
	// JSON 배열 객체 구성
	result = "[" + result + "]";
	
	out.println(result);
	
%>
