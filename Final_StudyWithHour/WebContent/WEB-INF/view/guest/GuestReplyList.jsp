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
<title>GuestReplyList.jsp</title>
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
					<span><span>작성 댓글</span> 내역</span>
				</div>
				
				<div>
					<ul class="nav nav-tabs" id="myTab" role="tablist" style="margin-top: 50px; font-size: 18px;">
						<li class="nav-item" role="presentation">
					   		<button class="nav-link active" id="reply-tab" data-bs-toggle="tab" data-bs-target="#reply-tab-pane" type="button" role="tab"
					   		 aria-controls="reply-tab-pane" aria-selected="true">댓글</button>
					  	</li>
					  	<li class="nav-item" role="presentation">
					    	<button class="nav-link" id="groupReply-tab" data-bs-toggle="tab" data-bs-target="#groupReply-tab-pane" type="button" role="tab"
					    	 aria-controls="groupReply-tab-pane" aria-selected="false">그룹 댓글</button>
					  	</li>
					</ul>
					
					<!-- 탭 영역 --------------------------------------------------------------------------------------->
					<div class="tab-content" id="myTabContent">
					
						<!-- 댓글 탭 눌렀을 때 나타나는 영역 --------------------------------------------------------->
					  	<div class="tab-pane fade show active" id="reply-tab-pane" role="tabpanel" aria-labelledby="reply-tab" tabindex="0">
							<table class="board_list">
								<tr>
									<th style="width: 5%;">No</th>
									<th style="width: 10%;">게시판</th>
									<th style="width: 30%;">본문 제목</th>
									<th style="width: 40%;">댓글 내용</th>
									<th style="width: 15%;">작성 일자</th>
								</tr>
								<tr class="spacer"></tr>
								<c:if test="${empty replyList }">
									<tr>
										<td colspan="5" style="text-align: center;">작성 댓글이 존재하지 않습니다.</td>
									</tr>
								</c:if>
								
								<c:forEach var="replyList" items="${replyList }">
									<tr>
										<td>1</td>
										<td>${replyList.bfList }</td>
										<td><a href="boardview.do?boCode=${replyList.boCode }">[${replyList.bsList }] ${replyList.boTitle }</a></td>
										<td>${replyList.rpContent }</td>										
										<td>${replyList.rpDate.substring(0,11) }</td>
									</tr>
								</c:forEach>
								<tr class="spacer"></tr>
							</table>
						</div>
						<!-- 댓글 탭 눌렀을 때 나타나는 영역 end --------------------------------------------------------->
						
						<!-- 그룹 댓글 탭 눌렀을 때 나타나는 영역 --------------------------------------------------------->
					  	<div class="tab-pane fade" id="groupReply-tab-pane" role="tabpanel" aria-labelledby="groupReply-tab" tabindex="0">
							<table class="board_list">
								<tr>
									<th>No</th>
									<th>그룹명</th>
									<th>본문 제목</th>
									<th>댓글 내용</th>
									<th>작성 일자</th>
								</tr>
								<tr class="spacer"></tr>
								<c:if test="${empty groupReplyList }">
									<tr>
										<td colspan="5" style="text-align: center;">작성 댓글이 존재하지 않습니다.</td>
									</tr>
								</c:if>
								<c:forEach var="groupReplyList" items="${groupReplyList }">
									<tr>
										<td>1</td>
										<td>${groupReplyList.grName }</td>
										<td>${groupReplyList.gbTitle }</td>
										<td>${groupReplyList.greContent }</td>
										<td>${groupReplyList.greDate.substring(0,11) }</td>
									</tr>
								</c:forEach>
								<tr class="spacer"></tr>
							</table>
						</div>
						<!-- 그룹 댓글 탭 눌렀을 때 나타나는 영역 end --------------------------------------------------------->
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