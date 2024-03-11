<%@page import="com.test.mvc.HostDTO"%>
<%@page import="com.test.mvc.HostDAO"%>
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
<title>StudyCafeList.jsp</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="css/sideMenuStyle.css">
<link rel="stylesheet" type="text/css" href="css/hostPageStyle.css">
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
				<div class="content_div">
					<div class="page_title">
						<span><span><%=host.getHoName() %></span>님 보유스터디카페 내역</span>
					</div>
					<div class="sorting_div"></div>
					<c:forEach var="cafe" items="${cafeList }">
					<a href="${articleUrl }?scCode=${cafe.scCode }">
					<div class="col-md-12">
						<div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm" style="height: 150px;">
							<div class="col p-4 d-flex flex-column">
								<h5 class="mb-0">${cafe.scCode }. ${cafe.scName }</h5>								
								<p class="card-text">
									📍${cafe.scAddr1 }, ${cafe.scAddr2 }<br> 
									🕐${cafe.scOpenHour } ~ ${cafe.scCloseHour }<br>
									<c:choose>
									<c:when test="${cafe.adChCode == 2}">
										<span>❔대기</span>
									</c:when>
									<c:otherwise>
										<c:choose>
										<c:when test="${cafe.adPerDate != null }">
										<span>✔️승인</span>
										</c:when>
										<c:otherwise>
										<span>❗반려</span>
										</c:otherwise>
										</c:choose>
									</c:otherwise>
									</c:choose>
								</p>
							</div>
							<c:choose>
							<c:when test="${cafe.scFile==null}">
								<div class="col-auto d-none d-lg-block">
									<img src="images/studycafe.jpg" style="width: 200px; height: 200px;">
								</div>
							</c:when>
							<c:otherwise>
								<div class="col-auto d-none d-lg-block">
									<img src="${cafe.scFile }" style="width: 200px; height: 200px;">
								</div>
							</c:otherwise>
							</c:choose>
						</div>
					</div>
					</a>
					</c:forEach>
					<div class="col-md-12" style="display: flex; justify-content: flex-end;">
						<button type="button" class="btn search_btn" onclick="location.href='cafeinsertform.do?hoCode=<%=host.getHoCode() %>'">스터디카페 등록</button>
						<br>
					</div>
				</div>
				
				<!-- 페이징 ------------------------------------------------------------>
				<nav aria-label="Page navigation example paging" class="paging">
					<ul class="pagination">
						<c:if test="${dataCount != 0 }">
							<li class="page-item">${pageIndexList }</li>
						</c:if>						
					</ul>
				</nav>
			</div>
		</div>

	</section>

	<footer>
		<jsp:include page="/Footer.jsp" />
	</footer>


</body>
</html>