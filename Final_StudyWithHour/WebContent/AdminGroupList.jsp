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
<title>관리자 페이지 - 스터디그룹 리스트 조회 </title>
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

	var url = "adminstudygrouplist.do";
	url = url + "?currPageNo=" + currPageNo;
	url = url + "&range=" + range;
	url = url + "&searchType=" + searchType;
	url = url + "&keyword=" + keyword;
	location.href = url;

}

//페이지 번호 클릭

function fn_pagination(currPageNo, range, searchType, keyword) 
{

	var url = "adminstudygrouplist.do";
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

	var url = "adminstudygrouplist.do";
	url = url + "?currPageNo=" + currPageNo;
	url = url + "&range=" + range;
	url = url + "&searchType=" + searchType;
	url = url + "&keyword=" + keyword;
	location.href = url;
}

//검색 버튼 클릭
function search(currPageNo, range, pageSize, searchType)
{
	// 현재 선택된 검색타입
	var newSearchType = document.getElementById("searchType").value;
	var keyword = document.getElementById("keyword").value;


	if(searchType != newSearchType)
	{
		currPageNo = 1;
	}
	
	var url = "adminstudygrouplist.do";
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
		<c:import url="Menu.jsp"></c:import>
	</header>
	
	<section>
		<div id="content">
			<c:import url="SideMenu.jsp"></c:import>
			
			<div class="rightContent_div">
				
				<div class="page_title">
					<span><span>스터디그룹</span> 관리</span>
				</div>
					<div class="sorting_div">

				</div>
							
				<div class="list">
					<table class="list_table">
						<tr class="spacer"></tr>
						<tr>
							<th>번호</th>
							<th>카테고리</th>
							<th>스터디그룹 이름</th>
							<th>상태</th>
							<th>개설 일자</th>
							<th>종료 일자</th>
						</tr>
						<tr class="spacer"></tr>
						<c:forEach var="group" items="${list }">
						<tr>
							<td>${group.grCode }</td>
							<td>
								<c:choose>
									<c:when test="${group.categoryCode == '1' }">자격증</c:when>
									<c:when test="${group.categoryCode == '2' }">취업</c:when>
									<c:when test="${group.categoryCode == '3' }">외국어</c:when>
									<c:when test="${group.categoryCode == '4' }">면접</c:when>
									<c:when test="${group.categoryCode == '5' }">취미</c:when>
									<c:when test="${group.categoryCode == '6' }">학업</c:when>
									<c:when test="${group.categoryCode == '7' }">자기개발</c:when>
									<c:when test="${group.categoryCode == '8' }">기타</c:when>
								</c:choose>
								
							</td>
							<td><a href="adminstudygroupinfo.do?grCode=${group.grCode }&currPageNo=${pagination.currPageNo}&range=${pagination.range}&searchType=${pagination.searchType }&keyword=${pagination.keyword }">${group.grName }</a></td>
							<td>${group.run }</td>
							<td>${group.grDate }</td>
							<td>${group.brDate }</td>
						</tr>
						
						
						</c:forEach>

						<tr class="spacer"></tr>
					</table>
				</div>
		<form action="adminstudygrouplist.do" method="get">
				<div class="search_div">
					<div class="category_search">
			           <select id="searchType" name="searchType">
		                <c:choose>
		                    <c:when test="${pagination.searchType == 'num'}">
		                        <option value="num" selected>번호</option>
		                        <option value="grname">그룹 이름</option>
		                    </c:when>
		                    <c:when test="${pagination.searchType == 'grname'}">
		                        <option value="num" >번호</option>
		                        <option value="grname" selected>그룹 이름</option>
		                    </c:when>
		                    <c:otherwise>
		                        <option value="num" >번호</option>
		                        <option value="grname">그룹 이름</option>
		                    </c:otherwise>
		                </c:choose>
		            </select> 
						<input type="text" class="search_input" id="keyword" name="keyword">
						
						<button type="button" class="search_btn" onclick="search('${pagination.currPageNo}', '${pagination.range}', '${pagination.pageSize}', '${pagination.searchType}', '${pagination.keyword}')">Search</button>
					</div>
				</div>
				</form>
				
				
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
				
			</div><!-- rightContent_div -->
		
		</div><!-- content -->
	</section>
	
	<footer>
		<c:import url="Footer.jsp"></c:import>
	</footer>

</body>
</html>