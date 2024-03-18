<%@page import="com.study.mvc.model.GuestDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	<c:import url="/WEB-INF/view/main/Menu.jsp"></c:import>
</header>

<section>
	<div id="content">
		<c:import url="/WEB-INF/view/main/SideMenu.jsp"></c:import>
		
		<div class="rightContent_div">
			<div class="page_title">
				<span><span>이웃</span> 관리</span>
			</div>
		
			<div class="friend_list">
				<div style="width: 40%">
					<div>
						♥ 찜한 이웃
					</div>
					<div class="like_list">
						<table>
							<tr>
								<!-- <th>번호</th> -->
								<th>닉네임</th>
								<th>찜한 일자</th>
								<th>이웃 삭제</th>
							</tr>
							<c:forEach var="friendList" items="${friendList}">
								<c:if test="${friendList.ftCode eq 1 }">
								<tr>
									<%-- <td>${i}</td> --%>
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
					<div class="block_list">
						<table>
							<tr>
								<!-- <th>번호</th> -->
								<th>닉네임</th>
								<th>찜한 일자</th>
								<th>이웃 삭제</th>
							</tr>
							<c:forEach var="friendList" items="${friendList}">
								<c:if test="${friendList.ftCode eq 2 }">
									<tr>
										<!-- <td>1</td> -->
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
 	<c:import url="/WEB-INF/view/main/Footer.jsp"></c:import>
</footer>

</body>
</html>