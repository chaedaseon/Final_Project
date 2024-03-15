<%@page import="com.study.mvc.model.HostDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	// 호스트 세션 받아오기
	HostDTO host = (HostDTO) session.getAttribute("host");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>StudyCafeReview.jsp</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="css/sideMenuStyle.css">
<link rel="stylesheet" type="text/css" href="css/hostPageStyle.css">
<link rel="stylesheet" type="text/css" href="css/RegFormStyle.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">

	$(document).ready(function()
	{
		$(".redBtn").click(function()
		{
			var fbCode = document.getElementById("fbCode");
			
			fbCode.value = document.getElementById("red").value;
			
		});
		
	});
	
	// select 검색 시 호출
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
					<div class="page_title">
						<span><span>리뷰 내역</span> 관리</span>
					</div>
					
					<!-- 검색창 영역 ------------------------------------------------------------>
					<div class="select_div">
					<form action="cafereviewlist.do?hoCode=<%=host.getHoCode() %>" method="post" name="searchForm">
					<%-- 
					<select class="select_bar" name="scState">
						<option value="scAll" selected="selected">전체</option>
						<c:forEach var="cafe" items="${cafe }">
						<option value="${cafe.scCode }">${cafe.scName }</option>
						</c:forEach>
					</select>
					  --%>
					<select name="searchKey" class="select_bar">
						<c:choose>
							<c:when test="${searchKey eq 'writer' }">
								<option value="scafe">스터디카페</option>
								<option value="writer" selected="selected">작성자</option>
								<option value="content">내용</option>
							</c:when>
							<c:when test="${searchKey eq 'content' }">
								<option value="scafe">스터디카페</option>
								<option value="writer">작성자</option>
								<option value="content" selected="selected">내용</option>
							</c:when>
							<c:otherwise>
								<option value="scafe" selected="selected">스터디카페</option>
								<option value="writer">작성자</option>
								<option value="content">내용</option>
							</c:otherwise>
						</c:choose>
					</select> 
					<input type="text" class="selectInput" name="searchValue" placeholder="${searchValue }">
					<button type="button" class="selectBtn" onclick="sendIt()">Search</button>
					</form>
					</div>
					
					<!-- 리뷰 내역 ------------------------------------------------------------>
					<div style="margin-top: 30px;">
						<h4>리뷰내역 <span style="color: #94bc32">${dataCount }</span>개</h4>
					</div>									
						<table class="register_table">
							<tr class="spacer"></tr>
							<c:choose>
							<c:when test="${dataCount <= 0}">
							<tr>
								<td colspan="2" style="text-align: center;">
									리뷰내역이 존재하지 않습니다.
								</td>
							</tr>
							</c:when>
							<c:otherwise>
							<c:forEach var="review" items="${review }" varStatus="vs">
							<tr>
								<td>[${review.scName }</td>
								<td>${fn:substring(review.reStartDate,0,11) } 이용]</td>
								<td style="text-align: right;">${review.rvDate }</td>
							</tr>
							<tr>
								<td colspan="2">└ ${review.rvContent }</td>
								<td style="text-align: right;">👤${review.guNick } [${review.grName}]
									<c:choose>
									<c:when test="${review.hrCode > 0 }">
										신고완료
									</c:when>
									<c:otherwise>
									<button type="button" class="redBtn" id="red" value="${review.fbCode }" 
									data-bs-toggle="modal" data-bs-target="#redStatic${vs.index }">🚨</button>
									</c:otherwise>
									</c:choose>
								</td>
							</tr>
							
	<!-- 신고 모달 영역 ------------------------------------------------------------>
    <div class="modal fade" id="redStatic${vs.index }" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="redStaticLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="redStaticLabel">신고</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <form action="hostredinsert.do?scCode=${review.scCode}" method="post" id="redForm">
          <div class="modal-body" style="text-align: center; line-height: normal;">
            <span>신고사유 : </span>
            <input type="hidden" id="fbCode">
            <select id="reason" name="reason">
            <c:forEach var="reason" items="${reason }">
            	<option value="${reason.reasonCode }">${reason.reason }</option>
            </c:forEach>
            </select>
            <div style="margin-top: 10px"></div>
            <input type="file" name="file" id="file" style="margin-left: 110px;"> 
          </div>
          </form>
          <div class="modal-footer">
            <button type="submit" class="btn btn-feedback" style="background-color: #94be2c; color: #ffffff;" value="${review.fbCode }">제출</button>
            <button type="button" class="btn btn-feedback" aria-label="Close" data-bs-dismiss="modal" style="background-color: #94be2c; color: #ffffff;">취소</button>
          </div>
        </div>
      </div>
    </div>												
							</c:forEach>
							</c:otherwise>
							</c:choose>
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
	 	<c:import url="/WEB-INF/view/main/Footer.jsp"></c:import>
	</footer>
</body>
</html>