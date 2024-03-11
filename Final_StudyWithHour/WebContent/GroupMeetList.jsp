<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MeetingList.jsp</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="css/sideMenuStyle.css">
<link rel="stylesheet" type="text/css" href="css/groupPageStyle.css">
<link rel="stylesheet" type="text/css" href="css/RegFormStyle.css">
<!-- <script type="text/javascript" src="http://code.jquery.com/jquery-ui.min.js"></script> -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<script>
	
	function sendIt()
	{
		var f = document.searchForm;
		f.submit();
	}

	
</script>
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
				<span><span>모임 내역</span> 관리</span>
			</div>
				
			<!-- 검색창 영역 ------------------------------------------------------------>
			<div class="select_div">
			<form action="groupmeetlist.do?grCode=1" method="post" name="searchForm">
			<select name="searchDate" class="select_bar">
				<c:choose>
					<c:when test="${searchDate eq 'nearDate' }">
						<option value="regDate">등록순</option>
						<option value="nearDate" selected="selected">최신순</option>
					</c:when>
					<c:otherwise>
						<option value="regDate" selected="selected">등록순</option>
						<option value="nearDate">최신순</option>
					</c:otherwise>
				</c:choose>
			</select> 
			<select name="searchKey" class="select_bar">
				<c:choose>
					<c:when test="${searchKey eq 'writer' }">
						<option value="attDate">모임일자</option>
						<option value="writer" selected="selected">작성자</option>
						<option value="name">일정명</option>
					</c:when>
					<c:when test="${searchKey eq 'name' }">
						<option value="attDate">모임일자</option>
						<option value="writer">작성자</option>
						<option value="name" selected="selected">일정명</option>
					</c:when>
					<c:otherwise><!-- 예약 날짜 캘린더에서 값 받기 -->
						<option value="attDate" selected="selected">모임일자</option>
						<option value="writer">작성자</option>
						<option value="name">일정명</option>
					</c:otherwise>
				</c:choose>
			</select> 
			<input type="text" class="selectInput" name="searchValue" placeholder="${searchValue }">
			<button type="button" class="selectBtn" onclick="sendIt()">Search</button>
			</form>
		</div>
				
			<div class="list">
				<table class="list_table" style="margin-top: 42px;">
					<tr class="spacer"></tr>
					<tr>
						<th>No</th>
						<th>일정명</th>
						<th>모임일자</th>
						<th>시간</th>
						<th>작성자</th>
						<th>참석예정자</th>
						<th></th>
					</tr>
					<tr class="spacer"></tr>
					<c:forEach var="m" items="${meet }">
					<tr>
						<td>${m.rNum }</td>
						<td>${m.gschName }</td> <!-- 일정명 클릭시 해당 캘린더로 이동 -->
						<td>${fn:substring(m.gschDate,0,11) }</td>
						<td>${m.gschStartHour } ~ ${m.gschEndHour }</td>
						<td>${m.guName }</td>
						<td>ooo, ooo, ooo</td>
						<td>
							<button class="btn">수정</button>
						</td>
					</tr>
					</c:forEach>
					<c:if test="${dataCount <= 0 }">
					<tr>
						<td colspan="6" style="text-align: center;">모임내역이 존재하지 않습니다.</td>
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
	</section>
	<footer>
		<jsp:include page="/Footer.jsp" />
	</footer>
</body>
</html>