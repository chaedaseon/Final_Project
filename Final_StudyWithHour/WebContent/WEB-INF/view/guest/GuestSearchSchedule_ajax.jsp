<%@page import="com.study.mybatis.model.GuestCalendarDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String gu_code = request.getParameter("gu_code");
	
	ArrayList<GuestCalendarDTO> scheduleList = (ArrayList<GuestCalendarDTO>)request.getAttribute("schedulelist");
			
	String result = "";
	
	for (GuestCalendarDTO schedule : scheduleList) 
	{
		StringBuffer sb = new StringBuffer();
		
		sb.append("{\"sch_code\":\"" + schedule.getSch_code() + "\"");
		sb.append(",\"sch_name\":\"" + schedule.getSch_name() + "\"");
		sb.append(",\"sch_content\":\"" + schedule.getSch_content() + "\"");
		sb.append(",\"sch_date\":\"" + schedule.getSch_date() + "\"},");
		
		result += sb.toString();
	}
		
	// 마지막 컴마 제거
	result = result.substring(0, result.length()-1);
	
	// JSON 배열 객체 구성
	result = "[" + result + "]";
	
	out.println(result);
%>
