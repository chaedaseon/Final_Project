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
<title>관리자 페이지 - 호스트 상세 페이지</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="css/sideMenuStyle.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/adminPageStyle.css">

<script type="text/javascript">
function list(currPageNo, range, searchType, keyword) 
{

	var url = "adminhostlist.do";
	url = url + "?currPageNo=" + currPageNo;
	url = url + "&range=" + range;
	url = url + "&searchType=" + searchType;
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
					<span><span>회원 번호</span> ${host.hoCode }</span>
				</div>


					<div class="info_div">
						<table class="table ">
							<tbody>
								<tr>
									<th>아이디</th>
									<td>${host.hoId}</td>
									<th>이름</th>
									<td>${host.hoName }</td>
									<th>등록한 스터디카페</th>
									<td>${host.ck }개</td>
								</tr>
								<tr>
									<th>전화번호</th>
									<td>${host.hoTel }</td>
									<th>주민등록번호</th>
									<td>${host.hoSsn }</td>
								</tr>
								<tr>
									<th>가입일자</th>
									<td>${host.hoDate }</td>
									<th>이메일</th>
									<td colspan="2">${host.hoEmail }</td>
								</tr>
								<tr>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="info_div">
						<table class="table ">
							<tbody>
								<tr>
									<th colspan="3">등록한 스터디 카페</th>
								</tr>
								<c:forEach var="cafe" items="${cafeList }">
								<tr>
									<td class="text-center"><a href="adminstudycafeinfo.do?scCode=${cafe.scCode }">${cafe.scName }</a></td>
									<td>${cafe.scAddr1 }</td>
									<td>${cafe.scTel }</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="info_div">
						<table class="table ">
							<tbody>
								<tr>
									<th>탈퇴 일자</th>
									<td>${host.hoUnDate }</td>
									<th>탈퇴 사유</th>
									<td>${reason }</td>
								</tr>
							</tbody>
						</table>
					</div>


					<br>
					<div class="list-foot">
						<div class="row justify-content-center">
							<div class="col-2 list-page">
								<button type="button" class="btn notice_btn" 
								onclick="list('${currPageNo}', '${range}', '${searchType}', '${keyword}')">목록</button>
							</div>
						</div>

					</div>
					<!-- list-foot -->
				
				
				
			</div>
		</div>
	</section>
	
	<footer>
		<c:import url="Footer.jsp"></c:import>
	</footer>

</body>
</html>