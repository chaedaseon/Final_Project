<%@page import="com.study.mvc.model.GuestDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
					<ul class="nav nav-tabs" id="myTab" role="tablist" style="margin-top: 50px; font-size: 18px;">
						<li class="nav-item" role="presentation">
					   		<button class="nav-link active" id="scrap-tab" data-bs-toggle="tab" data-bs-target="#scrap-tab-pane" type="button" role="tab"
					   		 aria-controls="scrap-tab-pane" aria-selected="true">스크랩</button>
					  	</li>
					  	<li class="nav-item" role="presentation">
					    	<button class="nav-link" id="groupScrap-tab" data-bs-toggle="tab" data-bs-target="#groupScrap-tab-pane" type="button" role="tab"
					    	 aria-controls="profile-tab-pane" aria-selected="false">그룹 스크랩</button>
					  	</li>
					</ul>
					
					<!-- 탭 영역 --------------------------------------------------------------------------------------->
					<div class="tab-content" id="myTabContent">
					
						<!-- 스크랩 탭 눌렀을 때 나타나는 영역 --------------------------------------------------------->
					  	
					  	
					  	<div class="tab-pane fade show active" id="scrap-tab-pane" role="tabpanel" aria-labelledby="scrap-tab" tabindex="0">
							<table class="board_list">
								<tr>
									<!-- <th style="width: 5%;">No</th> -->
									<th style="width: 8%;">게시판</th>
									<th style="width: 22%;">제목</th>
									<th style="width: 40%;">내용</th>
									<th style="width: 15%;">작성자</th>
									<th style="width: 10%;">스크랩 일자</th>
									<th style="width: 5%;">취소</th>
								</tr>
								<tr class="spacer"></tr>
								
								<c:if test="${empty scrapList }">
									<tr>
										<td colspan="6" style="text-align: center;">스크랩 내역이 존재하지 않습니다.</td>
									</tr>
								</c:if>
								
								<c:forEach var="scrapList" items="${scrapList }">
									<tr>
										<!-- <td>1</td> -->
										<td>${scrapList.bfList }</td>
										<td><a href="boardview.do?boCode=${scrapList.boCode }">[${scrapList.bsList}]  ${scrapList.boTitle }</a></td>
										<td>${scrapList.boContent }</td>
										<td>${scrapList.guNick }</td>
										<td>${scrapList.scrapDate.substring(0,10) }</td>
										<td><a href="boardscrapdelete.do?boCode=${scrapList.boCode }&guCode=<%=guest.getGuCode()%>">취소</a></td>
									</tr>
								</c:forEach>
								<tr class="spacer"></tr>
							</table>
						</div>
						<!-- 스크랩 탭 눌렀을 때 나타나는 영역 end --------------------------------------------------------->
						
						<!-- 그룹스크랩 탭 눌렀을 때 나타나는 영역 --------------------------------------------------------->
					  	<div class="tab-pane fade" id="groupScrap-tab-pane" role="tabpanel" aria-labelledby="groupScrap-tab" tabindex="0">
							<table class="board_list">
								<tr>
									<!-- <th>No</th> -->
									<th style="width: 10%;">그룹명</th>
									<th style="width: 20%;">제목</th>
									<th style="width: 40%;">내용</th>
									<th style="width: 15%;">작성자</th>
									<th style="width: 10%;">스크랩 일자</th>
									<th style="width: 5%;">취소</th>
								</tr>
								<tr class="spacer"></tr>
								
								<c:if test="${empty groupScrapList }">
									<tr>
										<td colspan="5" style="text-align: center;">스크랩 내역이 존재하지 않습니다.</td>
									</tr>
								</c:if>
								
								<c:forEach var="groupScrapList" items="${groupScrapList }">
									<tr>
										<!-- <td>1</td> -->
										<td>${groupScrapList.grName }</td>
										<td>${groupScrapList.gbTitle }</td>
										<td>${groupScrapList.gbContent }</td>
										<td>${groupScrapList.guNick }</td>
										<td>${groupScrapList.gbsDate.substring(0,10) }</td>
										<td><a href="#">취소</a></td>
									</tr>
								</c:forEach>
								<tr class="spacer"></tr>
							</table>
						</div>
						<!-- 그룹스크랩 탭 눌렀을 때 나타나는 영역 end --------------------------------------------------------->
					</div>
				</div>	
				<%-- 
				<nav aria-label="Page navigation example" class="paging">
				  	<ul class="pagination">
					    <li class="page-item disabled">
					    	<a class="page-link">◁</a>
					    </li>
				  		<c:if test="${dataCount != 0 }">
				  			<li class="page-item">${pageIndexList }</li>
				  		</c:if>
					    <li class="page-item">
					    	<a class="page-link" href="#">▷</a>
					    </li>
				
					    <li class="page-item"><a class="page-link" href="#">1</a></li>
					    <li class="page-item"><a class="page-link" href="#">2</a></li>
					    <li class="page-item"><a class="page-link" href="#">3</a></li>
					    <li class="page-item"><a class="page-link" href="#">4</a></li>
					    <li class="page-item"><a class="page-link" href="#">5</a></li>
				  	</ul>
				</nav>
				 --%>
			</div>
		</div>
		 
	</section>
	
	<footer>
	 	<c:import url="/WEB-INF/view/main/Footer.jsp"></c:import>
	</footer>

</body>
</html>