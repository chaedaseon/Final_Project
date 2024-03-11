<%@page import="com.test.mvc.GuestDTO"%>
<%@page import="com.test.mvc.GuestDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	/* 게스트 세션 받아오기 */
	GuestDTO guest = (GuestDTO) session.getAttribute("guest");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FriendList.jsp</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="css/sideMenuStyle.css">
<link rel="stylesheet" type="text/css" href="css/guestPageStyle.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>

<header>
	<c:import url="Menu.jsp"></c:import>
</header>

<section>
	<div id="content">
		<c:import url="SideMenu.jsp"></c:import>
		
		<div class="rightContent_div">
			<div class="page_title">
				<span><span>이웃</span> 관리</span>
			</div>
		
			<div style="display: flex; justify-content: space-between; margin-top: 60px;">
			
				<div style="width: 40%">
					<div>
						♥ 찜한 이웃
					</div>
					<div style="width: 100%; height: 400px; overflow: auto; overflow-x: hidden;">
						<table style="width: 100%; margin: 10px;">
							<tr>
								<th>번호</th>
								<th>닉네임</th>
								<th>날짜</th>
								<th>관리</th>
							</tr>
							<c:forEach var="friendList" items="${friendList}">
								<c:if test="${friendList.ftCode eq 1 }">
									<tr>
										<td>1</td>
										<td>${friendList.guFmNick }</td>
										<td>${friendList.fmDate.substring(0, 11) }</td>
										<td><a href="frienddelete.do?guCode=<%=guest.getGuCode() %>&fmCode=${friendList.fmCode }">X</a></td>
									</tr>
								</c:if>
							</c:forEach>
						</table>			
					</div>
				</div>
				
				<div style="width: 40%;">
					<div>
						※ 차단한 이웃
					</div>			
					<div style="width: 100%; height: 400px; overflow: auto; overflow-x: hidden;">
						<table style="width: 100%; margin: 10px;">
							<tr>
								<th>번호</th>
								<th>닉네임</th>
								<th>날짜</th>
								<th>관리</th>
							</tr>
							<c:forEach var="friendList" items="${friendList}">
								<c:if test="${friendList.ftCode eq 2 }">
									<tr>
										<td>1</td>
										<td>${friendList.guFmNick }</td>
										<td>${friendList.fmDate.substring(0, 11) }</td>
										<td><a href="frienddelete.do?guCode=<%=guest.getGuCode() %>&fmCode=${friendList.fmCode }">X</a></td>
									</tr>
								</c:if>
							</c:forEach>
						</table>			
					</div>
				</div>
			</div>
		</div>
		
	</div>
</section>

<footer>
	<jsp:include page="/Footer.jsp" />
</footer>

</body>
</html>