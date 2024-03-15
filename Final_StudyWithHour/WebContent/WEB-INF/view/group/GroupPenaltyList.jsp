<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GroupPenaltyList.jsp</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="css/sideMenuStyle.css">
<link rel="stylesheet" type="text/css" href="css/groupPageStyle.css">
<link rel="stylesheet" type="text/css" href="css/RegFormStyle.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">

	function sendIt()
	{
		var f = document.searchForm;
		
		f.submit();
	}

</script>
</head>
<body>
	<header>
		<c:import url="/WEB-INF/view/main/Menu.jsp"></c:import>
	</header>
	
	<section>
	
		<div id="content">
			<c:import url="/WEB-INF/view/main/SideMenu.jsp"></c:import>
			<div class="rightContent_div">
				<div class="content_div">
				
					<!-- 검색창 영역 ------------------------------------------------------------>
					<div class="page_title">
					<span><span>그룹 패널티</span> 내역 관리</span>
					</div>
				
					<div class="select_div">
					<form action="grouppenaltylist.do?grCode=1" method="post" name="searchForm">
					<select class="select_bar" name="pgState">
					<c:choose>
					<c:when test="${pgState eq 'yet' }">
						<option value="pgAll">전체</option>
						<option value="yet" selected="selected">유효</option>
						<option value="done">무효</option>
					</c:when>
					<c:when test="${pgState eq 'done' }">
						<option value="pgAll">전체</option>
						<option value="yet">유효</option>
						<option value="done" selected="selected">무효</option>
					</c:when>
					<c:otherwise>
						<option value="pgAll" selected="selected">전체</option>
						<option value="yet">유효</option>
						<option value="done">무효</option>
					</c:otherwise>
					</c:choose>
					</select>
					<select name="searchKey" class="select_bar">
						<c:choose>
							<c:when test="${searchKey eq 'reason' }">
								<option value="pgDate">부여일자</option>
								<option value="reason" selected="selected">사유</option>
							</c:when>
							<c:otherwise><!-- 예약 날짜 캘린더에서 값 받기 -->
								<option value="pgDate" selected="selected">부여일자</option>
								<option value="reason">사유</option>
							</c:otherwise>
						</c:choose>
					</select> 
					<input type="text" class="selectInput" name="searchValue" placeholder="${searchValue }">
					<button type="button" class="selectBtn" onclick="sendIt()">Search</button>
					</form>
				</div>
				
				<!-- 패널티 내역 ------------------------------------------------------------>
				<div class="list">
					<table class="list_table">
						<tr class="spacer"></tr>
						<tr>
							<th>No</th>
							<th>사유</th>
							<th>부여일자</th>
							<th>종료일자</th>
							<th>유효여부</th>
						</tr>
						<tr class="spacer"></tr>
						<c:forEach var="gr" items="${group }">
						<tr>
							<td>${gr.rNum }</td>
							<td>${gr.reason }</td>
							<td>${fn:substring(gr.pgStartDate,0,11) }</td>
							<td>${fn:substring(gr.pgEndDate,0,11) }</td>
							<td>${gr.pgState }</td>
						</tr>
						</c:forEach>
						<c:if test="${dataCount <=0 }">
						<tr>
							<td colspan="5" style="text-align: center;">패널티내역이 존재하지 않습니다.</td>
						</tr>
						</c:if>
						<tr class="spacer"></tr>
					</table>
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
		</div>
		
		 
	</section>
	
	<footer>
	 	<c:import url="/WEB-INF/view/main/Footer.jsp"></c:import>
	</footer>

</body>
</html>