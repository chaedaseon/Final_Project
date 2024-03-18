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
<title>관리자 게시판 - 전체게시물 신고 목록</title>
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

	var url = "adminreportallbbslist.do";
	url = url + "?currPageNo=" + currPageNo;
	url = url + "&range=" + range;
	url = url + "&searchType=" + searchType;
	url = url + "&keyword=" + keyword;
	location.href = url;

}

//페이지 번호 클릭

function fn_pagination(currPageNo, range, searchType, keyword) 
{

	var url = "adminreportallbbslist.do";
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

	var url = "adminreportallbbslist.do";
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
	
	if(newSearchType=='rtype')
	{
		if(keyword=='게시물')
		{
			keyword='1';
		}
		else if(keyword=='댓글')
		{
			keyword='2';
		}
		else if(keyword=='대댓글')
		{
			keyword='3';
		}
		else
		{
			alert("분류를 정확히 입력해주세요.");
			return;
		}
	}
	
	
	var url = "adminreportallbbslist.do";
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
					<span><span>커뮤니티 신고</span> 관리</span>
				</div>
				
				<div class="sorting_div">
				</div>
				
				<div class="list">
					<table class="list_table">
						<tr class="spacer"></tr>
						<tr>
							<th style="width: 80px;">번호</th>
							<th style="width: 100px;">분류</th>
							<th style="width: 550px;">신고글 내용</th>
							<th style="width: 100px;">처리 상태</th>
							<th style="width: 150px;">신고 일자</th>
						</tr>
						
						<tr class="spacer"></tr>
						<c:forEach var="report" items="${list }">
						<tr>
							<td>${report.num }</td>
							<td>
							<c:choose>
								<c:when test="${report.rtype=='1' }">
								게시물
								</c:when>
								<c:when test="${report.rtype=='2'}">
								댓글
								</c:when>
								<c:when test="${report.rtype=='3' }">
								대댓글
								</c:when>
							</c:choose>
							</td>
							<td><span class="d-inline-block text-truncate" style="max-width: 300px;">
							<a href="adminreportallbbscontent.do?rtype=${report.rtype }&code=${report.code}&currPageNo=${pagination.currPageNo}&range=${pagination.range}&searchType=${pagination.searchType }&keyword=${pagination.keyword }">
							${report.content }</a>
							</span></td>
							<td>
							<c:choose>
								<c:when test="${report.redcode == null }">미처리</c:when>
								<c:otherwise>처리완료</c:otherwise>
							</c:choose>
							</td>
							<td>${report.rdate }</td>
						</tr>
						</c:forEach>
						
						
						<tr class="spacer"></tr>
					</table>
				</div>
				
				<div class="search_div">
					<div class="category_search">
			           <select id="searchType" name="searchType">
		                <c:choose>
		                    <c:when test="${pagination.searchType == 'rtype'}">
		                        <option value="rtype" selected>분류</option>
		                        <option value="content">내용</option>
		                    </c:when>
		                    <c:when test="${pagination.searchType == 'content'}">
		                        <option value="rtype" >분류</option>
		                        <option value="content" selected>내용</option>
		                    </c:when>
		                    <c:otherwise>
		                        <option value="rtype" >분류</option>
		                        <option value="content">내용</option>
		                    </c:otherwise>
		                </c:choose>
		            </select> 
						<input type="text" class="search_input" id="keyword" name="keyword">
						
						<button type="button" class="search_btn" onclick="search('${pagination.currPageNo}', '${pagination.range}', '${pagination.pageSize}', '${pagination.searchType}', '${pagination.keyword}')">Search</button>
					</div>
				</div>
				
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
		<c:import url="/WEB-INF/view/main/Footer.jsp"></c:import>
	</footer>

</body>
</html>