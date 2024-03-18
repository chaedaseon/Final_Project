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
<title>GuestGroupJoinList.jsp</title>
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
					<span>그룹<span> 가입 신청</span> 내역</span>
				</div>
				
				<div>
					<div class="groupJoin_list">
					<!-- 
						<select class="sorting">
							<option selected="selected">--활동 상태--</option>
							<option>개설</option>
							<option>대기</option>
							<option>미개설</option>
							<option>탈퇴</option>
						</select>
						 -->
						<table class="groupJoin_list">
							<tr>
								<!-- <th>No</th> -->
								<th>그룹명</th>
								<th>카테고리</th>
								<th>상태</th>
								<th>사유</th>
								<th>가입 신청일자</th>
								<th>탈퇴 일자</th>
							</tr>
							<tr class="spacer"></tr>
							
							<c:if test="${empty groupJoinList }">
								<tr>
									<td colspan="5">가입 신청 내역이 존재하지 않습니다.</td>
								</tr>
							</c:if>
							
							<c:forEach var="groupJoinList" items="${groupJoinList }">
							<tr>
								<!-- <td>1</td> -->
								<td>${groupJoinList.grName }</td>
								<td>${groupJoinList.categoryList }</td>
								<td>${groupJoinList.rsState }</td>
								<td>그냥~</td>
								<td>${groupJoinList.gjDate.substring(0,10) }</td>
								<td>${groupJoinList.gunDate.substring(0,10) }</td>
							</tr>
							</c:forEach>
							<tr class="spacer"></tr>
						</table>
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