<%@page import="com.test.mvc.GuestDTO"%>
<%@page import="com.test.mvc.GuestDAO"%>
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
<title>GuestRedList.jsp</title>
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
					<span><span>신고</span> 내역</span>
				</div>
				
				<div>
					<div class="red_list">
						<select class="red_sorting">
							<option selected="selected">--처리 상태--</option>
							<option>승인</option>
							<option>반려</option>
						</select>
					</div>
					<ul class="nav nav-tabs" id="myTab" role="tablist" style="margin-top: 50px; font-size: 18px;">
						<li class="nav-item" role="presentation">
					   		<button class="nav-link active" id="boardred-tab" data-bs-toggle="tab" data-bs-target="#boardred-tab-pane" type="button" role="tab"
					   		 aria-controls="home-tab-pane" aria-selected="true" onclick="location.href=guestredlist.do?type=board">게시판 신고</button>
					  	</li>
					  	<li class="nav-item" role="presentation">
					    	<button class="nav-link" id="replyred-tab" data-bs-toggle="tab" data-bs-target="#replyred-tab-pane" type="button" role="tab"
					    	 aria-controls="profile-tab-pane" aria-selected="false" onclick="location.href='#'">댓글 신고</button>
					  	</li>
					  	<li class="nav-item" role="presentation">
					    	<button class="nav-link" id="groupboardred-tab" data-bs-toggle="tab" data-bs-target="#groupboardred-tab-pane" type="button" role="tab"
					    	 aria-controls="contact-tab-pane" aria-selected="false" onclick="location.href='#'">그룹 게시글 신고</button>
					  	</li>
					  	<li class="nav-item" role="presentation">
					    	<button class="nav-link" id="groupreplyred-tab" data-bs-toggle="tab" data-bs-target="#groupreplyred-tab-pane" type="button" role="tab"
					    	 aria-controls="contact-tab-pane" aria-selected="false" onclick="location.href='#'">그룹 댓글 신고</button>
					  	</li>
					</ul>
					<div class="tab-content" id="myTabContent">
					  	<div class="tab-pane fade show active" id="boardred-tab-pane" role="tabpanel" aria-labelledby="boardred-tab" tabindex="0">
							<table class="red_list">
								<tr>
									<th>No</th>
									<th>게시판</th>
									<th>게시글 내용</th>
									<th>신고 사유</th>
									<th>신고 일자</th>
									<th>처리 상태</th>
									<th>처리 일자</th>
								</tr>
								<tr class="spacer"></tr>
								<c:forEach var="redBoardList" items="${redBoardList }">
									<tr>
										<td>1</td>
										<td>${redBoardList.bfList }</td>
										<td>
											${redBoardList.bsList }
											<c:choose>
												<c:when test="${fn:length(redBoardList.boContent) > 15 }">
													${redBoardList.boContent.substring(0,14) }...
												</c:when>	
												<c:otherwise>
													${redBoardList.boContent }
												</c:otherwise>									
											</c:choose>
										</td> 
										<td>${redBoardList.reason }</td>
										<td>${redBoardList.borDate.substring(0,11) }</td>
										<td>${redBoardList.redstate }</td>
										<td>${redBoardList.brdDate.substring(0,11) }</td>
									</tr>
								</c:forEach>
								<tr class="spacer"></tr>
							</table>
						</div>
						
						
					  	<div class="tab-pane fade" id="reply-tab-pane" role="tabpanel" aria-labelledby="reply-tab" tabindex="0">
					  		<table class="red_list">
								<tr>
									<th>No</th>
									<th>게시판</th>
									<th>댓글 내용</th>
									<th>신고 사유</th>
									<th>신고 일자</th>
									<th>처리 상태</th>
									<th>처리 일자</th>
								</tr>
								<tr class="spacer"></tr>
								<c:forEach var="redBoardList" items="${redBoardList }">
									<tr>
										<td>1</td>
										<td>${redBoardList.boTitle }</td>
										<td>${redBoardList.reason }</td>
										<td>${redBoardList.borDate.substring(0,11) }</td>
										<td>${redBoardList.redstate }</td>
										<td>${redBoardList.borDate.substring(0,11) }</td>
									</tr>
								</c:forEach>
								<tr class="spacer"></tr>
							</table>
					  	</div>
					  	<div class="tab-pane fade" id="groupboardred-tab-pane" role="tabpanel" aria-labelledby="groupboardred-tab" tabindex="0">...</div>
					  	<div class="tab-pane fade" id="groupreplyred-tab-pane" role="tabpanel" aria-labelledby="groupreplyred-tab" tabindex="0">...</div>
					</div>
				</div>	
				
				<nav aria-label="Page navigation example" class="paging">
				  	<ul class="pagination">
					    <li class="page-item disabled">
					    	<a class="page-link">◁</a>
					    </li>
				  		<%-- <c:if test="${dataCount != 0 }">
				  			<li class="page-item">${pageIndexList }</li>
				  		</c:if> --%>
					    <li class="page-item">
					    	<a class="page-link" href="#">▷</a>
					    </li>
				  	<!-- 
					    <li class="page-item"><a class="page-link" href="#">1</a></li>
					    <li class="page-item"><a class="page-link" href="#">2</a></li>
					    <li class="page-item"><a class="page-link" href="#">3</a></li>
					    <li class="page-item"><a class="page-link" href="#">4</a></li>
					    <li class="page-item"><a class="page-link" href="#">5</a></li>
				  	 -->
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