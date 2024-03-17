<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NoticeBoardList.jsp</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="css/sliderStyle.css">
<link rel="stylesheet" type="text/css" href="css/boardPageStyle.css">
<script type="text/javascript">

	$(function(){
		 
	    $(".search_btn").click(function ()
	    {
	    	//alert($(location).attr("href","testest.do?searchType=" + $(searchType).val() + "&keyword=" + $(keyword).val()));
	    	if ($(searchType).val() == "searchNum")
	    	{
	    		$(location).attr("href","boardnoticesearchnum.do?searchNum=" + $(keyword).val());
	    	}
	    	else if ($(searchType).val() == "searchTitle")
	    	{
	    		$(location).attr("href","boardnoticesearchtitle.do?searchTitle=" + $(keyword).val() + "&vNum=1");
	    	}
	    	else if ($(searchType).val() == "searchNick")
	    	{
	    		$(location).attr("href","boardnoticesearchnick.do?searchNick=" + $(keyword).val()  + "&vNum=1");
	    	}
	    	else
	    	{
	    		$(location).attr("boardnoticelist.do");
	    	}
	    })
	});
	

	$(function()
	{
	    $("#write_button").click(function()
	    {
			var ssessionadCode = $("#ssessionadCode").val();
			
		    if (ssessionadCode == 'null') 
		    {
				alert("관리자만 작성 권한이 있습니다.");
		    }
		    else
		    {
		    	window.location.href="noticeinsertform.do";
		    }
	    });
	});
</script>
</head>
<body>
	<header>
		<c:import url="/WEB-INF/view/main/Menu.jsp"></c:import>
	</header>
	
	<section>
		<div id="content">
			<div class="category_bar">
				<c:import url="/WEB-INF/view/board/imageSlide.jsp"></c:import>
			<div class="content_div">
				<div class="board_title">
					<span>공지사항</span>
				</div>
					<button type="button" class="btn" id="write_button">
					<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
					  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
					  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z"/>
					</svg>
					글쓰기
					</button>
				<div class="list">
					<table class="list_table">
						<tr class="spacer"></tr>
						<tr>
							<th>No</th>
							<th>제목</th>
							<th>관리자</th>
							<th>작성 일자</th>
							<th>조회수</th>
						</tr>
						<tr class="spacer"></tr>
						<c:choose>
							<c:when test="${list == null}">
								<td colspan="5">조회 결과 없음</td>						
							</c:when>
							<c:otherwise>
								<c:forEach var="notice" items="${list}">
							        <tr>
							            <td>${notice.no }</td>
										<td style="text-align: left;"><a href="noticeview.do?ntCode=${notice.ntCode }">${notice.ntTitle}</a></td>
							            <td>${notice.ntWriter}</td>
							            <td>${notice.ntDate.substring(0,10)}</td>
							            <td>${notice.ntView}</td>
							        </tr>
						        </c:forEach>
						    </c:otherwise>
					    </c:choose>
						<tr class="spacer"></tr>
					</table>
				</div>
				
				<div class="search_div">
					<div class="category_search">
						<form id="searchForm" autocomplete="off">
							<select id="searchType" name="searchType">
								<option value="searchNum">번호</option>
								<option value="searchTitle">제목</option>
								<option value="searchNick">작성자</option>
							</select> 
						<input type="text" id="keyword" name="keyword" class="search_input">
						<button type="button" class="search_btn">Search</button>
						</form>
					</div>
				</div>
				
				<c:choose>
					<c:when test="${urlparam == 'noticeboardsearchNum'}">
						<nav aria-label="Page navigation example paging" class="paging">
							<ul class="pagination">
								<li class="page-item"><a class="page-link" href="#">Previous</a></li>
								<li class="page-item"><a class="page-link" href="#">&lt;</a></li>
								<li class="page-item"><a class="page-link" href="#">1</a></li>
								<li class="page-item"><a class="page-link" href="#">&gt;</a></li>
								<li class="page-item"><a class="page-link" href="#">Next</a></li>
							</ul>
						</nav>
					</c:when>
					<c:when test="${urlparam == 'noticeboardsearchTitle'}">
						<c:choose>
							<c:when test="${count > 10 }">
								<nav aria-label="Page navigation example paging" class="paging">
								<ul class="pagination">
								<c:if test="${vNum!=1 }">
									<li class="page-item"><a class="page-link" href="boardnoticesearchtitle.do?searchTitle=${param.searchTitle}&vNum=${vNum-1}">Previous</a></li>
									<li class="page-item"><a class="page-link" href="boardnoticesearchtitle.do?searchTitle=${param.searchTitle}&vNum=1">&lt;</a></li>
								</c:if>
									<c:forEach var="pageNum" items="${page }">
										<li class="page-item"><a class="page-link" <c:if test="${pageNum == vNum }"></c:if>
										href="boardnoticesearchtitle.do?searchTitle=${param.searchTitle}&vNum=${pageNum }">					
										${pageNum }
										</a></li>
									</c:forEach>
									<c:if test="${vNum!=lastNum }">
										<li class="page-item"><a class="page-link" href="boardnoticesearchtitle.do?searchTitle=${param.searchTitle}&vNum=${lastNum}">&gt;</a></li>
										<li class="page-item"><a class="page-link" href="boardnoticesearchtitle.do?searchTitle=${param.searchTitle}&vNum=${vNum+1 }">Next</a></li>
									</c:if>
								</ul>
								</nav>
							</c:when>
							<c:otherwise>
							
							</c:otherwise>
						</c:choose>
					</c:when>
					<c:when test="${urlparam == 'noticeboardsearchNick'}">
						<c:choose>
							<c:when test="${count > 10 }">
								<nav aria-label="Page navigation example paging" class="paging">
								<ul class="pagination">
								<c:if test="${vNum!=1 }">
									<li class="page-item"><a class="page-link" href="boardnoticesearchnick.do?searchNick=${param.searchNick}&vNum=${vNum-1}">Previous</a></li>
									<li class="page-item"><a class="page-link" href="boardnoticesearchnick.do?searchNick=${param.searchNick}&vNum=1">&lt;</a></li>
								</c:if>
									<c:forEach var="pageNum" items="${page }">
										<li class="page-item"><a class="page-link" <c:if test="${pageNum == vNum }"></c:if>
										href="boardnoticesearchnick.do?searchNick=${param.searchNick}&vNum=${pageNum }">					
										${pageNum }
										</a></li>
									</c:forEach>
									<c:if test="${vNum!=lastNum }">
										<li class="page-item"><a class="page-link" href="boardnoticesearchnick.do?searchNick=${param.searchNick}&vNum=${lastNum}">&gt;</a></li>
										<li class="page-item"><a class="page-link" href="boardnoticesearchnick.do?searchNick=${param.searchNick}&vNum=${vNum+1 }">Next</a></li>
									</c:if>
								</ul>
								</nav>
							</c:when>
							<c:otherwise>
							
							</c:otherwise>
						</c:choose>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${count > 10 }">
								<nav aria-label="Page navigation example paging" class="paging">
								<ul class="pagination">
								<c:if test="${vNum!=1 }">
									<li class="page-item"><a class="page-link" href="boardnoticelist.do?vNum=${vNum-1 }">Previous</a></li>
									<li class="page-item"><a class="page-link" href="boardnoticelist.do?vNum=1">&lt;</a></li>
								</c:if>
									<c:forEach var="pageNum" items="${page }">
										<li class="page-item"><a class="page-link" <c:if test="${pageNum == vNum }"></c:if>
										href="boardnoticelist.do?vNum=${pageNum }">					
										${pageNum }
										</a></li>
									</c:forEach>
									<c:if test="${vNum!=lastNum }">
										<li class="page-item"><a class="page-link" href="boardnoticelist.do?vNum=${lastNum}">&gt;</a></li>
										<li class="page-item"><a class="page-link" href="boardnoticelist.do?vNum=${vNum+1 }">Next</a></li>
									</c:if>
								</ul>
								</nav>
							</c:when>
							<c:otherwise>
							
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>
				
			</div>
		</div>
				
		</div>	
		
	</section>
	
	<footer>
		<c:import url="/WEB-INF/view/main/Footer.jsp"></c:import>
	</footer>

</body>
</html>