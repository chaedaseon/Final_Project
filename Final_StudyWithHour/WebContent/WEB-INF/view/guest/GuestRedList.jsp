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
		<c:import url="/WEB-INF/view/main/Menu.jsp"></c:import>
	</header>
	
	<section>
	
		<div id="content">
			<c:import url="/WEB-INF/view/main/SideMenu.jsp"></c:import>
		
			<div class="rightContent_div">
				<div class="page_title">
					<span><span>신고</span> 내역</span>
				</div>
				
				<div>
					<div class="red_list">
						<!-- <select class="sorting">
							<option selected="selected">--처리 상태--</option>
							<option>승인</option>
							<option>반려</option>
							<option>처리 중</option>
						</select> -->
					</div>
					<ul class="nav nav-tabs" id="myTab" role="tablist" style="margin-top: 50px; font-size: 18px;">
						<li class="nav-item" role="presentation">
					   		<button class="nav-link active" id="boardred-tab" data-bs-toggle="tab" data-bs-target="#boardred-tab-pane" type="button" role="tab"
					   		 aria-controls="home-tab-pane" aria-selected="true">게시판 신고</button>
					  	</li>
					  	<li class="nav-item" role="presentation">
					    	<button class="nav-link" id="replyred-tab" data-bs-toggle="tab" data-bs-target="#replyred-tab-pane" type="button" role="tab"
					    	 aria-controls="profile-tab-pane" aria-selected="false">댓글 신고</button>
					  	</li>
					  	<li class="nav-item" role="presentation">
					    	<button class="nav-link" id="groupboardred-tab" data-bs-toggle="tab" data-bs-target="#groupboardred-tab-pane" type="button" role="tab"
					    	 aria-controls="contact-tab-pane" aria-selected="false">그룹 게시글 신고</button>
					  	</li>
					  	<li class="nav-item" role="presentation">
					    	<button class="nav-link" id="groupreplyred-tab" data-bs-toggle="tab" data-bs-target="#groupreplyred-tab-pane" type="button" role="tab"
					    	 aria-controls="contact-tab-pane" aria-selected="false">그룹 댓글 신고</button>
					  	</li>
					</ul>
					<div class="tab-content" id="myTabContent">
					  	<div class="tab-pane fade show active" id="boardred-tab-pane" role="tabpanel" aria-labelledby="boardred-tab" tabindex="0">
							<table class="red_list">
								<tr>
									<!-- <th>No</th> -->
									<th>게시판</th>
									<th>게시글 내용</th>
									<th>신고 사유</th>
									<th>신고 일자</th>
									<th>처리 상태</th>
									<th>처리 일자</th>
								</tr>
								<tr class="spacer"></tr>
								<c:if test="${empty redBoardList }">
									<tr>
										<td colspan="7" style="text-align: center;">게시글 신고 내역이 존재하지 않습니다.</td>
									</tr>
								</c:if>
								
								<c:forEach var="redBoardList" items="${redBoardList }">
									<tr>
										<!-- <td>1</td> -->
										<td>${redBoardList.bfList }</td>
										<td style=" text-align: left;">
											[${redBoardList.bsList }]
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
						
						
					  	<div class="tab-pane fade" id="replyred-tab-pane" role="tabpanel" aria-labelledby="replyred-tab" tabindex="0">
					  		<table class="red_list">
								<tr>
									<!-- <th>No</th> -->
									<th>게시판</th>
									<th>댓글 내용</th>
									<th>신고 사유</th>
									<th>신고 일자</th>
									<th>처리 상태</th>
									<th>처리 일자</th>
								</tr>
								<tr class="spacer"></tr>
								<c:if test="${empty redReplyList }">
									<tr>
										<td colspan="7" style="text-align: center;">댓글 신고 내역이 존재하지 않습니다.</td>
									</tr>
								</c:if>
								
								<c:forEach var="redReplyList" items="${redReplyList }">
									<tr>
										<!-- <td>1</td> -->
										<td>${redReplyList.bfList }</td>
										<td style="text-align: left;">[${redReplyList.bsList }] 
											<c:choose>
												<c:when test="${fn:length(redReplyList.rpContent) > 15 }">
													${redReplyList.rpContent.substring(0,14) }...
												</c:when>	
												<c:otherwise>
													${redReplyList.rpContent }
												</c:otherwise>									
											</c:choose>
										</td>
										<td>${redReplyList.reason }</td>
										<td>${redReplyList.rrDate.substring(0,11) }</td>
										<td>
											<c:choose>
												<c:when test="${empty redReplyList.redstate }">
													처리 중
												</c:when>
												<c:otherwise>
													${redReplyList.redstate }
												</c:otherwise>
											</c:choose>
										</td>
										<td>
											<c:choose>
												<c:when test="${empty redReplyList.rrdDate }">
													-
												</c:when>
												<c:otherwise>
													${redReplyList.rrdDate.substring(0,11) }
												</c:otherwise>
											</c:choose>
										</td>
									</tr>
								</c:forEach>
								<tr class="spacer"></tr>
							</table>
					  	</div>
					  	<div class="tab-pane fade" id="groupboardred-tab-pane" role="tabpanel" aria-labelledby="groupboardred-tab" tabindex="0">
							<table class="red_list">
								<tr>
									<!-- <th>No</th> -->
									<th>그룹명</th>
									<th>게시글 내용</th>
									<th>신고 사유</th>
									<th>신고 일자</th>
									<th>처리 상태</th>
									<th>처리 일자</th>
								</tr>
								<tr class="spacer"></tr>
								<c:if test="${empty redGroupBoardList }">
									<tr>
										<td colspan="7" style="text-align: center;">그룹 게시글 신고 내역이 존재하지 않습니다.</td>
									</tr>
								</c:if>
								
								<c:forEach var="redGroupBoardList" items="${redGroupBoardList }">
									<tr>
										<!-- <td>1</td> -->
										<td>${redGroupBoardList.grName }</td>
										<td>
											<c:choose>
												<c:when test="${fn:length(redGroupBoardList.gbContent) > 15 }">
													${redGroupBoardList.gbContent.substring(0,14) }...
												</c:when>	
												<c:otherwise>
													${redGroupBoardList.gbContent }
												</c:otherwise>									
											</c:choose>
										</td> 
										<td>${redGroupBoardList.reason }</td>
										<td>${redGroupBoardList.gbrDate.substring(0,11) }</td>
										<td>
											<c:choose>
												<c:when test="${empty redGroupBoardList.redstate }">
													처리 중
												</c:when>
												<c:otherwise>
													${redGroupBoardList.redstate }
												</c:otherwise>
											</c:choose>
										</td>
										<td>
											<c:choose>
												<c:when test="${empty redGroupBoardList.gbrdDate }">
													-
												</c:when>
												<c:otherwise>
													${redGroupBoardList.gbrdDate.substring(0,11) }
												</c:otherwise>
											</c:choose>
										</td>
									</tr>
								</c:forEach>
								<tr class="spacer"></tr>
							</table>
						</div>
						
						
					  	<div class="tab-pane fade" id="groupreplyred-tab-pane" role="tabpanel" aria-labelledby="groupreplyred-tab" tabindex="0">
					  		<table class="red_list">
								<tr>
									<!-- <th>No</th> -->
									<th>그룹명</th>
									<th>댓글 내용</th>
									<th>신고 사유</th>
									<th>신고 일자</th>
									<th>처리 상태</th>
									<th>처리 일자</th>
								</tr>
								<tr class="spacer"></tr>
								<c:if test="${empty redGroupReplyList }">
									<tr>
										<td colspan="7">그룹 댓글 신고 내역이 존재하지 않습니다.</td>
									</tr>
								</c:if>
								
								<c:forEach var="redGroupReplyList" items="${redGroupReplyList }">
									<tr>
										<!-- <td>1</td> -->
										<td>${redGroupReplyList.grName }</td>
										<td> 
											<c:choose>
												<c:when test="${fn:length(redGroupReplyList.greContent) > 15 }">
													${redGroupReplyList.greContent.substring(0,14) }...
												</c:when>	
												<c:otherwise>
													${redGroupReplyList.greContent }
												</c:otherwise>									
											</c:choose>
										</td>
										<td>${redGroupReplyList.reason }</td>
										<td>${redGroupReplyList.grrDate.substring(0,11) }</td>
										<td>
											<c:choose>
												<c:when test="${empty redGroupReplyList.redstate }">
													처리 중
												</c:when>
												<c:otherwise>
													${redGroupReplyList.redstate }
												</c:otherwise>
											</c:choose>
										</td>
										<td>
											<c:choose>
												<c:when test="${empty redGroupReplyList.grrdDate }">
													-
												</c:when>
												<c:otherwise>
													${redGroupReplyList.grrdDate.substring(0,11) }
												</c:otherwise>
											</c:choose>
										</td>
									</tr>
								</c:forEach>
								<tr class="spacer"></tr>
							</table>
					  	
					  	
					  	</div>
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