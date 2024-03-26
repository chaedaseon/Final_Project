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
<title>그룹 - 휴공티켓 사용이력</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="css/sideMenuStyle.css">
<link rel="stylesheet" type="text/css" href="css/groupPageStyle.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript">
//이전 버튼
function fn_prev(currPageNo, range, pageSize) 
{

	var currPageNo = (range - 1) * pageSize;
	var range = range - 1;

	var url = "groupticketlist.do";
	url = url + "?currPageNo=" + currPageNo;
	url = url + "&range=" + range;
	location.href = url;

}

//페이지 번호 클릭

function fn_pagination(currPageNo, range) 
{

	var url = "groupticketlist.do";
	url = url + "?currPageNo=" + currPageNo;
	url = url + "&range=" + range;
	location.href = url;	

}
//다음 버튼 이벤트
function fn_next(currPageNo, range, pageSize) 
{

	var currPageNo = (range * pageSize) + 1;
	var range = parseInt(range) + 1;	

	var url = "groupticketlist.do";
	url = url + "?currPageNo=" + currPageNo;
	url = url + "&range=" + range;
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
				<div class="content_div">
				
					<div class="page_title">
					<span><span>휴공 티켓 사용</span> 내역 관리</span>
					</div>
				
					<div class="sorting_div">

					</div>
				
				
					<div class="list">
						<table class="list_table">
							<tr class="spacer"></tr>
							<tr>
								<th>닉네임</th>
								<th>사용일자</th>
							</tr>
							<tr class="spacer"></tr>
							<c:forEach var="ticket" items="${list }">
							<tr>
								<td>${ticket.guNick }</td>
								<td>${ticket.rtDate }</td>
							</tr>
							
							</c:forEach>
	
							<tr class="spacer"></tr>
						</table>
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
					
				</div>
			</div>
		</div>
		
		 
	</section>
	
	<footer>
	 	<c:import url="/WEB-INF/view/main/Footer.jsp"></c:import>
	</footer>

</body>
</html>