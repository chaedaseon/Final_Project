<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
<title>GuestPenaltyList.jsp</title>
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
					<span><span>패널티</span> 내역</span>
				</div>
				
				<div>
					<div class="penalty_sorting">
					<!-- 
						<select class="sorting">
							<option selected="selected">--유효 상태--</option>
							<option>유효</option>
							<option>무효</option>
						</select>
						 -->
					</div>
					<ul class="nav nav-tabs" id="myTab" role="tablist" style="margin-top: 50px; font-size: 18px;">
						<li class="nav-item" role="presentation">
					   		<button class="nav-link active" id="boardred-tab" data-bs-toggle="tab" data-bs-target="#boardpenalty-tab-pane" type="button" role="tab"
					   		 aria-controls="boardpenalty-tab-pane" aria-selected="true">컨텐츠 패널티</button>
					  	</li>
					  	<li class="nav-item" role="presentation">
					    	<button class="nav-link" id="replyred-tab" data-bs-toggle="tab" data-bs-target="#groupboardpenalty-tab-pane" type="button" role="tab"
					    	 aria-controls="groupboardpenalty-tab-pane" aria-selected="false">그룹 컨텐츠 패널티</button>
					  	</li>
					  	<li class="nav-item" role="presentation">
					    	<button class="nav-link" id="groupboardred-tab" data-bs-toggle="tab" data-bs-target="#grouppenalty-tab-pane" type="button" role="tab"
					    	 aria-controls="grouppenalty-tab-pane" aria-selected="false">그룹 활동 패널티</button>
					  	</li>
					</ul>
					
					<div class="tab-content" id="myTabContent">
						<div class="tab-pane fade show active" id="boardpenalty-tab-pane" role="tabpanel" aria-labelledby="boardpenalty-tab" tabindex="0">
							<table class="penalty_list">
								<tr>
									<!-- <th>No</th>	 -->
									<th>컨텐츠</th>
									<th>사유</th>
									<th>부여일자</th>
									<th>종료일자</th>
									<th>유효여부</th>
								</tr>
								<tr class="spacer"></tr>
								
								<c:if test="${empty penaltyList }">
									<tr>
										<td colspan="6" style="text-align: center;">패널티 내역이 존재하지 않습니다.</td>
									</tr>
								</c:if>
								
								<c:forEach var="penaltyList" items="${penaltyList }">
									<tr>
										<!-- <td>1</td> -->
										<td>${penaltyList.boTitle }</td>
										<td>${penaltyList.reason }</td>
										<td>${penaltyList.startDate.substring(0,10) }</td>
										<td>${penaltyList.endDate.substring(0,10) }</td>
										<td>유효</td>
									</tr>
								</c:forEach>
								<tr class="spacer"></tr>
							</table>
						</div>
						
						<div class="tab-pane fade" id="groupboardpenalty-tab-pane" role="tabpanel" aria-labelledby="groupboardpenalty-tab" tabindex="0">
							<table class="penalty_list">
								<tr>
									<!-- <th>No</th>	 -->
									<th>그룹</th>
									<th>컨텐츠</th>
									<th>사유</th>
									<th>부여일자</th>
									<th>종료일자</th>
									<th>유효여부</th>
								</tr>
								<tr class="spacer"></tr>
								
								<c:if test="${empty groupBoardPenaltyList }">
									<tr>
										<td colspan="6" style="text-align: center;">패널티 내역이 존재하지 않습니다.</td>
									</tr>
								</c:if>
								
								<c:forEach var="groupBoardPenaltyList" items="${groupBoardPenaltyList }">
									<tr>
										<!-- <td>1</td> -->
										<td>${groupBoardPenaltyList.grName }</td>
										<td>${groupBoardPenaltyList.gbTitle }</td>
										<td>${groupBoardPenaltyList.reason }</td>
										<td>${groupBoardPenaltyList.startDate.substring(0,10) }</td>
										<td>${groupBoardPenaltyList.endDate.substring(0,10) }</td>
										<td>유효
										</td>
									</tr>
								</c:forEach>
								<tr class="spacer"></tr>
							</table>
						</div>
						
						
						<div class="tab-pane fade" id="grouppenalty-tab-pane" role="tabpanel" aria-labelledby="grouppenalty-tab" tabindex="0">
							<table class="penalty_list">
								<tr>
									<!-- <th>No</th>	 -->
									<th>그룹</th>
									<th>사유</th>
									<th>부여일자</th>
									<th>종료일자</th>
									<th>유효여부</th>
								</tr>
								<tr class="spacer"></tr>
								
								<c:if test="${empty groupBreakPenaltyList }">
									<tr>
										<td colspan="6" style="text-align: center;">패널티 내역이 존재하지 않습니다.</td>
									</tr>
								</c:if>
								
								<c:forEach var="groupBreakPenaltyList" items="${groupBreakPenaltyList }">
									<tr>
										<!-- <td>1</td> -->
										<td>${groupBreakPenaltyList.grName }</td>
										<td>${groupBreakPenaltyList.reason }</td>
										<td>${groupBreakPenaltyList.startDate.substring(0,10) }</td>
										<td>${groupBreakPenaltyList.endDate.substring(0,10) }</td>
										<td>유효</td>
									</tr>
								</c:forEach>
								<tr class="spacer"></tr>
							</table>
						</div>
						
						
					</div>
				<%-- 	
				<nav aria-label="Page navigation example paging" class="paging">
					<ul class="pagination">
						<c:if test="${dataCount != 0 }">
							<li class="page-item">${pageIndexList }</li>
						</c:if>						
					</ul>
				</nav>		
				 --%>
			</div>
		</div>
		</div>
	</section>
	
	<footer>
	 	<c:import url="/WEB-INF/view/main/Footer.jsp"></c:import>
	</footer>

</body>
</html>