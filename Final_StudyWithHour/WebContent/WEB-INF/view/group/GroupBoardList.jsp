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
<title>그룹 게시판 - 그룹 게시판 목록</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="css/sideMenuStyle.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/adminPageStyle.css">

<script>    
//이전 버튼
function fn_prev(currPageNo, range, pageSize, searchType, keyword, grCode, guCode) 
{

	var currPageNo = (range - 1) * pageSize;
	var range = range - 1;

	var url = "groupboardlist.do";
	url = url + "?currPageNo=" + currPageNo;
	url = url + "&range=" + range;
	url = url + "&searchType=" + searchType;
	url = url + "&keyword=" + keyword;
	url = url + "&gr_code=" + grCode;
	url = url + "&gu_code=" + guCode;
	location.href = url;

}

//페이지 번호 클릭

function fn_pagination(currPageNo, range, searchType, keyword, grCode, guCode) 
{

	var url = "groupboardlist.do";
	url = url + "?currPageNo=" + currPageNo;
	url = url + "&range=" + range;
	url = url + "&searchType=" + searchType;
	url = url + "&keyword=" + keyword;
	url = url + "&gr_code=" + grCode;
	url = url + "&gu_code=" + guCode;
	location.href = url;	

}
//다음 버튼 이벤트
function fn_next(currPageNo, range, pageSize, searchType, keyword, grCode, guCode) 
{

	var currPageNo = (range * pageSize) + 1;
	var range = parseInt(range) + 1;	

	var url = "groupboardlist.do";
	url = url + "?currPageNo=" + currPageNo;
	url = url + "&range=" + range;
	url = url + "&searchType=" + searchType;
	url = url + "&keyword=" + keyword;
	url = url + "&gr_code=" + grCode;
	url = url + "&gu_code=" + guCode;
	location.href = url;
}

//검색 버튼 클릭
function search(currPageNo, range, pageSize, searchType,  keyword, grCode, guCode)
{
	// 현재 선택된 검색타입
	var newSearchType = document.getElementById("searchType").value;
	var keyword = document.getElementById("keyword").value;

	if(searchType != newSearchType)
	{
		currPageNo = 1;
	}
	var url = "groupboardlist.do";
	url = url + "?currPageNo=" + currPageNo;
	url = url + "&range=" + range;
	url = url + "&searchType=" + newSearchType;
	url = url + "&keyword=" + keyword;
	url = url + "&gr_code=" + grCode;
	url = url + "&gu_code=" + guCode;
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
					<span><span>그룹 </span>게시판</span>
				</div>
				
				<div class="sorting_div">
				</div>
				
				<div class="list">
					<table class="list_table">
						<tr class="spacer"></tr>
						<tr>
							<th style="width: 80px;">번호</th>
							<th style="width: 400px;">게시물 제목</th>
							<th style="width: 250px;">등록 일자</th>
							<th style="width: 100px;">닉네임</th>
							<th style="width: 150px;">조회수</th>
						</tr>
						
						<tr class="spacer"></tr>
						<c:forEach var="board" items="${list }">
						<tr>
							<td>${board.no }</td>
							<td><span class="d-inline-block text-truncate" style="max-width: 400px;">
							<a href="groupboardcontent.do?gbCode=${board.gbCode }&gu_code=${param.gu_code}&gr_code=${param.gr_code}">${board.gbTitle }</a>
							<!-- 그룹 게시물 주소로 수정 -->
							</span></td>
							<td>${board.gbDate}</td>
							<td>${board.guNick }
							</td>
							<td>${board.gbView }</td>
						</tr>
						</c:forEach>
						
						
						
						<tr class="spacer"></tr>
					</table>
				</div>
				
				<div class="search_div">
					<div class="category_search">
			           <select id="searchType" name="searchType">
		                <c:choose>
		                    <c:when test="${pagination.searchType == 'title'}">
		                        <option value="title" selected>제목</option>
		                        <option value="content">내용</option>
		                    </c:when>
		                    <c:when test="${pagination.searchType == 'content'}">
		                        <option value="title" >제목</option>
		                        <option value="content" selected>내용</option>
		                    </c:when>
		                    <c:otherwise>
		                        <option value="title" >제목</option>
		                        <option value="content">내용</option>
		                    </c:otherwise>
		                </c:choose>
		            </select> 
						<input type="text" class="search_input" id="keyword" name="keyword">
						
						<button type="button" class="search_btn" onclick="search('${pagination.currPageNo}', '${pagination.range}', '${pagination.pageSize}', '${pagination.searchType}', '${pagination.keyword}', '${gr_code}', '${gu_code}')">Search</button>
					</div>
				</div>
				
				<!-- 페이징 -->
				<div>
					<nav aria-label="Page navigation example paging" class="paging" >
						<ul class="pagination ">
							<c:if test="${pagination.prev}">
								<li class="page-item"><a class="page-link" href="#" onClick="fn_prev('${pagination.currPageNo}', '${pagination.range}', '${pagination.pageSize}', '${pagination.searchType}', '${pagination.keyword}', '${gr_code}', '${gu_code} ')">Previous</a></li>
							</c:if>
							<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
								<li class="page-item " <c:if test="${pagination.currPageNo == idx }"> style="font-weight:bold;" </c:if> ><a class="page-link" href="#" onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.searchType}', '${pagination.keyword}', '${gr_code}', '${gu_code }')"> ${idx} </a></li>
							</c:forEach>
							<c:if test="${pagination.next}">
								<li class="page-item"><a class="page-link" href="#" onClick="fn_next('${pagination.currPageNo}', '${pagination.range}', '${pagination.pageSize}', '${pagination.searchType}', '${pagination.keyword}', '${gr_code}', '${gu_code}')" >Next</a></li>
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