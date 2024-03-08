<%@page import="com.test.mvc.HostDTO"%>
<%@page import="com.test.mvc.HostDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	// 호스트 세션 받아오기
	String hoCode = (String)session.getAttribute("hoCode");
	HostDAO hostDao = new HostDAO();
	HostDTO host = hostDao.sessionHost(hoCode);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HostRedList.jsp</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="css/sideMenuStyle.css">
<link rel="stylesheet" type="text/css" href="css/hostPageStyle.css">
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
		<c:import url="Menu.jsp"></c:import>
	</header>

	<section>

		<div id="content">
			<c:import url="SideMenu.jsp"></c:import>

			<div class="rightContent_div">
			
				<div class="page_title">
					<span><span>신고 내역</span> 관리</span>
				</div>
				
				<div class="select_div">
					<form action="hostredlist.do?hoCode=<%=host.getHoCode() %>" method="post" name="searchForm">
					<select class="select_bar" name="hrState">
						<c:choose>
						<c:when test="${hrState eq 'yet' }">
							<option value="hrAll">전체</option>
							<option value="yet" selected="selected">처리중</option>
							<option value="done">처리완료</option>
						</c:when>
						<c:when test="${hrState eq 'done' }">
							<option value="hrAll">전체</option>
							<option value="yet">처리중</option>
							<option value="done" selected="selected">처리완료</option>
						</c:when>
						<c:otherwise>
							<option value="hrAll" selected="selected">전체</option>
							<option value="yet">처리중</option>
							<option value="done">처리완료</option>
						</c:otherwise>
						</c:choose>
					</select>
					<select class="select_bar" name="adState">
					<c:choose>
					<c:when test="${adState eq 'access' }">
						<option value="adAll">전체</option>
						<option value="access" selected="selected">승인</option>
						<option value="reject">반려</option>
						<option value="stay">대기</option>
					</c:when>
					<c:when test="${adState eq 'reject' }">
						<option value="adAll">전체</option>
						<option value="access">승인</option>
						<option value="reject" selected="selected">반려</option>
						<option value="stay">대기</option>
					</c:when>
					<c:when test="${adState eq 'stay' }">
						<option value="adAll">전체</option>
						<option value="access">승인</option>
						<option value="reject">반려</option>
						<option value="stay" selected="selected">대기</option>
					</c:when>
					<c:otherwise>
						<option value="adAll" selected="selected">전체</option>
						<option value="access">승인</option>
						<option value="reject">반려</option>
						<option value="stay">대기</option>
					</c:otherwise>
					</c:choose>
					</select>
					<select name="searchKey" class="select_bar">
						<c:choose>
							<c:when test="${searchKey eq 'reason' }">
								<option value="group">신고그룹</option>
								<option value="reason" selected="selected">신고사유</option>
							</c:when>
							<c:otherwise>
								<option value="group" selected="selected">신고그룹</option>
								<option value="reason">신고사유</option>
							</c:otherwise>
						</c:choose>
					</select> 
					<input type="text" class="selectInput" name="searchValue" placeholder="${searchValue }">
					<button type="button" class="selectBtn" onclick="sendIt()">Search</button>
					</form>
				</div>
				
				<div class="list">
					<table class="list_table">
						<tr class="spacer"></tr>
						<tr>
							<th>No</th>
							<th>신고스터디그룹</th>
							<th>신고사유</th>
							<th>제출일</th>
							<th>처리상태</th>
							<th>처리결과</th>
						</tr>
						<tr class="spacer"></tr>
						<c:forEach var="red" items="${red }" varStatus="rd">
						<tr>
							<td>${red.rNum}</td>
							<td>${red.grName }</td>
							<td>${red.reason }</td>
							<td>${fn:substring(red.hrDate,0,10) }</td>
							<td>
							<c:choose>
								<c:when test="${red.hrState eq '처리중'}">
									처리중
								</c:when>
								<c:otherwise>
									처리완료
								</c:otherwise>
								</c:choose>
							</td>
							<td>
							<c:choose>
								<c:when test="${red.redState != null}">
									${red.redState}
								</c:when>
								<c:otherwise>
									-
								</c:otherwise>
							</c:choose>
							</td>							
						</tr>
						</c:forEach>
						<c:if test="${dataCount <= 0 }">
    						<tr>
							<td colspan="7" style="text-align: center;">신고내역이 존재하지 않습니다.</td>
							</tr>
						</c:if>
						<tr class="spacer"></tr>
					</table>
				</div>
				
				<%-- <div class="search_div">
					<div class="category_search">
					<form action="hostredlist.do?hoCode=<%=host.getHoCode() %>" method="post" name="searchForm">
					<c:choose>
						<c:when test="${searchKey eq 'group' }">
						<select name="searchKey">
							<option value="number">번호</option>
							<option value="group" selected="selected">신고그룹</option>
							<option value="reason">사유</option>
						</select> 
						</c:when>
						<c:when test="${searchKey eq 'reason' }">
						<select name="searchKey">
							<option value="number">번호</option>
							<option value="group">신고그룹</option>
							<option value="reason" selected="selected">사유</option>
						</select> 
						</c:when>
						<c:otherwise>
						<select name="searchKey">
							<option value="number">번호</option>
							<option value="group">신고그룹</option>
							<option value="reason">사유</option>
						</select>
						</c:otherwise>
					</c:choose>
						<input type="text" class="search_input" name="searchValue" value="${searchValue }">
						<button type="button" class="search_btn" onclick="sendIt()">Search</button>
					</form>
					</div>
				</div> --%>

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