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
<title>관리자 페이지 - 공지사항 목록</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="css/sideMenuStyle.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/adminPageStyle.css">
<script>    
//이전 버튼
function fn_prev(currPageNo, range, pageSize, searchType, keyword) 
{

	var currPageNo = (range - 1) * pageSize;
	var range = range - 1;

	var url = "adminnoticelist.do";
	url = url + "?currPageNo=" + currPageNo;
	url = url + "&range=" + range;
	url = url + "&searchType=" + searchType;
	url = url + "&keyword=" + keyword;
	location.href = url;

}

//페이지 번호 클릭

function fn_pagination(currPageNo, range, searchType, keyword) 
{

	var url = "adminnoticelist.do";
	url = url + "?currPageNo=" + currPageNo;
	url = url + "&range=" + range;
	url = url + "&searchType=" + searchType;
	url = url + "&keyword=" + keyword;
	location.href = url;	

}
//다음 버튼 이벤트
function fn_next(currPageNo, range, pageSize, searchType, keyword) 
{

	var currPageNo = (range * pageSize) + 1;
	var range = parseInt(range) + 1;	

	var url = "adminnoticelist.do";
	url = url + "?currPageNo=" + currPageNo;
	url = url + "&range=" + range;
	url = url + "&searchType=" + searchType;
	url = url + "&keyword=" + keyword;
	location.href = url;
}

function search(currPageNo, range, pageSize, searchType)
{
	// 현재 선택된 검색타입
	var newSearchType = document.getElementById("searchType").value;
	var keyword = document.getElementById("keyword").value;


	if(searchType != newSearchType)
	{
		currPageNo = 1;
	}
	
	var url = "adminnoticelist.do";
	url = url + "?currPageNo=" + currPageNo;
	url = url + "&range=" + range;
	url = url + "&searchType=" + newSearchType;
	url = url + "&keyword=" + keyword;
	location.href = url;	
	
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
	
				<div class="page_title">
					<span><span>공지사항</span> 관리</span>
				</div>
				
				<div class="sorting_div">
					<button class="btn" onclick="location.href='adminnoticeinsertform.do'">공지사항 작성</button>
				</div>
				
				<div class="list">
					<table class="list_table">
						<tr class="spacer"></tr>
						<tr>
							<th style="width: 100px;">번호</th>
							<th style="width: 600px;">제목</th>
							<th style="width: 150px;">관리자</th>
							<th style="width: 150px;">작성 일자</th>
							<th style="width: 100px;" >조회수</th>
						</tr>
						<tr class="spacer"></tr>
						<c:forEach var="notice" items="${list }">						
							<tr>
								<td>${notice.ntCode}</td>
								<td><a href="noticeview.do?ntCode=${notice.ntCode}">${notice.ntTitle} 				
								</a></td>
								<td>${notice.adCode }</td>
								<td>${notice.ntDate }</td>
								<td>${notice.ntView }</td>
							</tr>
						</c:forEach>

						<tr class="spacer"></tr>
					</table>
				</div>
				
				<form action="adminnoticelist.do" method="get">
				<div class="search_div">
					<div class="category_search">
			           <select id="searchType" name="searchType">
		                <c:choose>
		                    <c:when test="${pagination.searchType == 'num'}">
		                        <option value="num" selected>번호</option>
		                        <option value="title">제목</option>
		                        <option value="adCode">관리자</option>
		                    </c:when>
		                    <c:when test="${pagination.searchType == 'title'}">
		                        <option value="num">번호</option>
		                        <option value="title" selected>제목</option>
		                        <option value="adCode">관리자</option>
		                    </c:when>
		                    <c:when test="${pagination.searchType == 'adCode'}">
		                        <option value="num">번호</option>
		                        <option value="title">제목</option>
		                        <option value="adCode" selected>관리자</option>
		                    </c:when>
		                    <c:otherwise>
		                        <option value="num">번호</option>
		                        <option value="title">제목</option>
		                        <option value="adCode">관리자</option>
		                    </c:otherwise>
		                </c:choose>
		            </select> 
						<input type="text" class="search_input" id="keyword" name="keyword">
						
						<button type="button" class="search_btn" onclick="search('${pagination.currPageNo}', '${pagination.range}', '${pagination.pageSize}', '${pagination.searchType}', '${pagination.keyword}')">Search</button>
					</div>
				</div>
				</form>
				
				<!-- 게시물이 10개 이하일 경우 페이징 부분 출력되지 않음 -->
				
				
				<div>
					<nav aria-label="Page navigation example paging" class="paging" >
						<ul class="pagination ">
							<c:if test="${pagination.prev}">
								<li class="page-item"><a class="page-link" href="#" onClick="fn_prev('${pagination.currPageNo}', '${pagination.range}', '${pagination.pageSize}', '${pagination.searchType}', '${pagination.keyword}')">Previous</a></li>
							</c:if>
							<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
								<li class="page-item " <c:if test="${pagination.currPageNo == idx }"> style="font-weight:bold;" </c:if> ><a class="page-link" href="#" onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.searchType}', '${pagination.keyword}')"> ${idx} </a></li>
							</c:forEach>
							<c:if test="${pagination.next}">
								<li class="page-item"><a class="page-link" href="#" onClick="fn_next('${pagination.currPageNo}', '${pagination.range}', '${pagination.pageSize}', '${pagination.searchType}', '${pagination.keyword}')" >Next</a></li>
							</c:if>
						</ul>
					</nav>
				</div>
				
				<!-- 
				<c:choose>
					<c:when test="${count > 10 }">
					
						<nav aria-label="Page navigation example paging" class="paging">
						<ul class="pagination">
						<c:if test="${vNum!=1 }">
							<li class="page-item"><a class="page-link" href="adminnoticelist.do?vNum=${vNum-1 }">Previous</a></li>
							<li class="page-item"><a class="page-link" href="adminnoticelist.do?vNum=${vNum-1 }">&lt;</a></li>
						</c:if>
							<c:forEach var="pageNum" items="${page }">
								<li class="page-item"><a class="page-link" <c:if test="${pageNum == vNum }"> style="font-weight:bold;" </c:if>
								href="adminnoticelist.do?vNum=${pageNum }">					
								${pageNum }
								</a></li>
								
								
							</c:forEach>
							<c:if test="${vNum!=lastNum }">
								<li class="page-item"><a class="page-link" href="adminnoticelist.do?vNum=${vNum+1 }">&gt;</a></li>
								<li class="page-item"><a class="page-link" href="adminnoticelist.do?vNum=${vNum+1 }">Next</a></li>

							</c:if>
						</ul>
						</nav>
						-->
						
						<!-- 
						<nav aria-label="Page navigation example paging" class="paging">
						<ul class="pagination">
							<li class="page-item"><a class="page-link" href="#">Previous</a></li>
							<li class="page-item"><a class="page-link" href="#">&lt;</a></li>
							<li class="page-item"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#">4</a></li>
							<li class="page-item"><a class="page-link" href="#">5</a></li>
							<li class="page-item"><a class="page-link" href="#">&gt;</a></li>
							<li class="page-item"><a class="page-link" href="#">Next</a></li>
							</ul>
						</nav>
						 -->
					<!-- </c:when>
					<c:otherwise>
					
					
					</c:otherwise>
				
				</c:choose> -->

			
	
			</div><!-- rightContent_div -->
		</div><!-- content -->
	</section>
	
	<footer>
		<c:import url="/WEB-INF/view/main/Footer.jsp"></c:import>
	</footer>

</body>
</html>