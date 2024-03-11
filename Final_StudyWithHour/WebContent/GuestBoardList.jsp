<%@page import="com.test.mvc.GuestDTO"%>
<%@page import="com.test.mvc.GuestDAO"%>
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
					<span><span>작성글</span> 내역</span>
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
					   		<button class="nav-link active" id="board-tab" data-bs-toggle="tab" data-bs-target="#board-tab-pane" type="button" role="tab"
					   		 aria-controls="home-tab-pane" aria-selected="true" onclick="location.href='guestboardlist.do?type=board&guCode=<%= guest.getGuCode()%>'">게시글</button>
					  	</li>
					  	<li class="nav-item" role="presentation">
					    	<button class="nav-link" id="groupBoard-tab" data-bs-toggle="tab" data-bs-target="#groupBoard-tab-pane" type="button" role="tab"
					    	 aria-controls="profile-tab-pane" aria-selected="false" onclick="location.href='guestgroupboardlist.do?type=board&guCode=<%= guest.getGuCode()%>'">그룹 게시글</button>
					  	</li>
					</ul>
					
					
					
					<div class="tab-content" id="myTabContent">
					  	<div class="tab-pane fade show active" id="board-tab-pane" role="tabpanel" aria-labelledby="board-tab" tabindex="0">
							<table class="red_list">
								<tr>
									<th>No</th>
									<th>게시판 분류</th>
									<th>게시물 소분류</th>
									<th>제목</th>
									<th>내용</th>
									<th>작성 일자</th>
									<th>조회수</th>
								</tr>
								<tr class="spacer"></tr>
								<c:forEach var="boardList" items="${boardList }">
																	
									<tr>
										<td>1</td>
										<td>${boardList.bsList }</td>
										<td>${boardList.bfList }</td>
										<td>${boardList.boTitle }</td>
										<td>${boardList.boContent.substring(0,15) }...</td>
										<td>${boardList.boDate.substring(0,11) }</td>
										<td>${boardList.boView }</td>
									</tr>
								</c:forEach>
								<tr class="spacer"></tr>
							</table>
						</div>
					
					  	<div class="tab-pane fade" id="groupBoard-tab-pane" role="tabpanel" aria-labelledby="groupBoard-tab" tabindex="0">
							<table class="red_list">
								<tr>
									<th>No</th>
									<th>그룹명</th>
									<th>제목</th>
									<th>내용</th>
									<th>작성 일자</th>
									<th>조회수</th>
								</tr>
								<tr class="spacer"></tr>
								<c:forEach var="groupBoardList" items="${groupBoardList }">
																	
									<tr>
										<td>1</td>
										<td>${groupBoardList.grName }</td>
										<td>${groupBoardList.gbTitle }</td>
										<td>${groupBoardList.gbContent.substring(0,15) }...</td>
										<td>${groupBoardList.gbDate.substring(0,11) }</td>
										<td>${groupBoardList.gbView }</td>
									</tr>
								</c:forEach>
								<tr class="spacer"></tr>
							</table>
						</div>
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