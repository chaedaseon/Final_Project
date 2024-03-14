<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String msg = (String)request.getAttribute("response");
	
	System.out.println(msg);
	
	String result = "";
	
	StringBuffer sb = new StringBuffer();
	
	sb.append("{\"msg\":\""+msg+"\"}");
	
	result = sb.toString();
	
	out.println(result);
%>
