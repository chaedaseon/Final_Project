<%@page import="com.study.mvc.model.HostDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	// 호스트 세션 받아오기
	HostDTO host = (HostDTO) session.getAttribute("host");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CafeReservationInfo.jsp</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="css/sideMenuStyle.css">
<link rel="stylesheet" type="text/css" href="css/hostPageStyle.css">
<link rel="stylesheet" type="text/css" href="css/RegFormStyle.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
	<header>
		<c:import url="/WEB-INF/view/main/Menu.jsp"></c:import>
	</header>
	
	<section>
		<div id="content">
			<c:import url="/WEB-INF/view/main/SideMenu.jsp"></c:import>

			<div class="rightContent_div">
				<div class="regInfo_div">
					<div class="page_title">
						<span><span>상세정보</span></span>
					</div>
					<div class="sorting_div"></div>
					
					<h4>예약정보</h4>
					<table class="register_table">
						<tr class="spacer"></tr>
						<tr>
							<td>이용예정일자</td>
							<c:set var="reDate" value="${info.reStartDate }"/>
							<td>${fn:substring(reDate, 0, 11)}</td>
						</tr>
						<tr>
							<td>이용예정시간</td>
							<td>${info.reStartHour } ~ ${info.reEndHour }</td>
						</tr>
						<tr>
							<td>스터디카페</td>
							<td>${info.scName }</td>
						</tr>
						<tr>
							<td>스터디룸</td>
							<td>${info.srName }</td>
						</tr>
						<tr> 
							<td>스터디그룹 (예약자)</td>
							<td>${info.grName } (${info.guNick })</td>
						</tr>
						<tr> 
							<td>이용예정인원</td>
							<td>${info.reCount }명</td>
						</tr>
						<tr class="spacer"></tr>
					</table>
					
					<div style="display: flex; justify-content: flex-end;">
						<button type="button" class="signUp" onclick="location.href='cafereservelist.do?hocode=<%=host.getHoCode()%>'">목 록</button>					
					</div>		
			
				</div>
			</div>
		</div>
		  


	</section>

	<footer>
	 	<c:import url="/WEB-INF/view/main/Footer.jsp"></c:import>
	</footer>
</body>
</html>