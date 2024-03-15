<%@page import="com.study.mvc.model.GuestDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	// 게스트 세션 받아오기
	GuestDTO guest = (GuestDTO) session.getAttribute("guest");
    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GuestScrapList.jsp</title>
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
					<span><span>스크랩</span> 내역</span>
				</div>
				
				<div>
					<div class="board_list">
						<select class="red_sorting">
							<option selected="selected">--처리 상태--</option>
							<option>승인</option>
							<option>반려</option>
						</select>
					</div>
					<ul class="nav nav-tabs" id="myTab" role="tablist" style="margin-top: 50px; font-size: 18px;">
						<li class="nav-item" role="presentation">
					   		<button class="nav-link active" id="board-tab" data-bs-toggle="tab" data-bs-target="#board-tab-pane" type="button" role="tab"
					   		 aria-controls="home-tab-pane" aria-selected="true">스크랩</button>
					  	</li>
					  	<li class="nav-item" role="presentation">
					    	<button class="nav-link" id="groupBoard-tab" data-bs-toggle="tab" data-bs-target="#groupBoard-tab-pane" type="button" role="tab"
					    	 aria-controls="profile-tab-pane" aria-selected="false">그룹 스크랩</button>
					  	</li>
					</ul>
					
					<!-- 탭 영역 --------------------------------------------------------------------------------------->
					<div class="tab-content" id="myTabContent">
					
						<!-- 스크랩 탭 눌렀을 때 나타나는 영역 --------------------------------------------------------->
					  	<div class="tab-pane fade show active" id="board-tab-pane" role="tabpanel" aria-labelledby="board-tab" tabindex="0">
							<table class="board_list">
								<tr>
									<th>No</th>
									<th>게시판</th>
									<th>제목</th>
									<th>작성자</th>
									<th>스크랩 일자</th>
								</tr>
								<tr class="spacer"></tr>
								
								<c:if test="${empty scrapList }">
									<tr>
										<td colspan="6" style="text-align: center;">스크랩 내역이 존재하지 않습니다.</td>
									</tr>
								</c:if>
								
								<c:forEach var="scrapList" items="${scrapList }">
									<tr>
										<td>1</td>
										<td>${scrapList.bfList }</td>
										<td>[${scrapList.bsList}]  ${scrapList.boTitle }</td>
										<td>${scrapList.guNick } (${scrapList.guId})</td>
										<td>${scrapList.scrapDate.substring(0,10) }</td>
									</tr>
								</c:forEach>
								<tr class="spacer"></tr>
							</table>
						</div>
						<!-- 스크랩 탭 눌렀을 때 나타나는 영역 end --------------------------------------------------------->
						
						<!-- 그룹스크랩 탭 눌렀을 때 나타나는 영역 --------------------------------------------------------->
					  	<div class="tab-pane fade" id="groupBoard-tab-pane" role="tabpanel" aria-labelledby="groupBoard-tab" tabindex="0">
							<table class="board_list">
								<tr>
									<th>No</th>
									<th>게시판</th>
									<th>제목</th>
									<th>작성자</th>
									<th>스크랩 일자</th>
								</tr>
								<tr class="spacer"></tr>
								
								<c:if test="${empty groupScrapList }">
									<tr>
										<td colspan="6" style="text-align: center;">스크랩 내역이 존재하지 않습니다.</td>
									</tr>
								</c:if>
								
								<c:forEach var="groupScrapList" items="${groupScrapList }">
									<tr>
										<td>1</td>
										<td>${scrapList.bfList }</td>
										<td>[${scrapList.bsList}]  ${scrapList.boTitle }</td>
										<td>${scrapList.guNick } (${scrapList.guId})</td>
										<td>${scrapList.scrapDate.substring(0,10) }</td>
									</tr>
								</c:forEach>
								<tr class="spacer"></tr>
							</table>
						</div>
						<!-- 그룹스크랩 탭 눌렀을 때 나타나는 영역 end --------------------------------------------------------->
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
	 	<c:import url="/WEB-INF/view/main/Footer.jsp"></c:import>
	</footer>

</body>
</html>