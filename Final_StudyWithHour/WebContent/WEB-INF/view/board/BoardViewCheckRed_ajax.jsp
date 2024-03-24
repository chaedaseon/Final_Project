<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	/* 신고 처리 완료 시, 신고 버튼 숨기기 위한 ajax */
%>
<%= request.getParameter("checkRed")%>
