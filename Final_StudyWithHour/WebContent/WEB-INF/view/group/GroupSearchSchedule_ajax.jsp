<%@page import="com.study.mybatis.model.GroupCalendarDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	
	ArrayList<GroupCalendarDTO> scheduleList = (ArrayList<GroupCalendarDTO>) request.getAttribute("schedulelist");

	String result = "";
	
	for (GroupCalendarDTO gsch : scheduleList) 
	{
		
		StringBuffer sb = new StringBuffer();
		
		sb.append("{\"gschCode\":\"" + gsch.getGschCode() + "\"");
		sb.append(",\"gschName\":\"" + gsch.getGschName() + "\"");
		sb.append(",\"gschDate\":\"" + gsch.getGschDate() + "\"");
		sb.append(",\"startHour\":\"" + gsch.getStartHour() + "\"");
		sb.append(",\"endHour\":\"" + gsch.getEndHour() + "\"");
		sb.append(",\"content\":\"" + gsch.getContent() + "\"");
		sb.append(",\"location\":\"" + gsch.getLocation() + "\"");
		sb.append(",\"leadMember\":\"" + gsch.getLeadMember() + "\"");
		sb.append(",\"attCk\":\"" + gsch.getAttCk()+ "\"");
		sb.append(",\"memberListNickName\":\"" + gsch.getMemberListNickName()+ "\"");
		sb.append(",\"gschType\":\"" + gsch.getGschType() + "\"},");
		
		result += sb.toString();
	}
		
	// 마지막 컴마 제거
	result = result.substring(0, result.length()-1);
	
	// JSON 배열 객체 구성
	result = "[" + result + "]";
	
	out.println(result);
%>
