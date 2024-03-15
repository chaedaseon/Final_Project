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
<title>Template.jsp</title>
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

	var url = "adminguestlist.do";
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
		<c:import url="/WEB-INF/view/main/Menu.jsp"></c:import>
	</header>
	
	<section>
		<div id="content">
			<c:import url="/WEB-INF/view/main/SideMenu.jsp"></c:import>
			
			<div class="rightContent_div" >
				
				<div class="page_title">
					<span><span>회원 번호</span> ${guest.guCode}</span>
				</div>
					
					
					<div class="info_div">
					<table class="table "  >
						<tbody>
							<tr>
								<th >아이디</th>
								<td >${guest.guId}</td>
								<th >닉네임</th>
								<td>${guest.guNick }</td>
								<th >유효패널티</th>
								<td>${penaltyCount}</td>
							</tr>
							<tr>
								<th >이름</th>
								<td>${guest.guName}</td>
								<th >전화번호</th>
								<td colspan="3">${guest.guTel }</td>
							</tr>
							<tr>
								<th>주민등록번호</th>
								<td>${guest.guSsn }</td>
								<th>이메일</th>
								<td colspan="3">${guest.guEmail }</td>
							</tr>
							<tr>
								<th>가입 사유</th>
								<td>${category }</td>
								<th>가입일자</th>
								<td>${guest.guDate }</td>
							</tr>
						</tbody>
					</table>
				 </div>
				 
				 <div class="info_div">
					<table class="table ">
						<tbody>
							<tr>
								<th >가입한 스터디그룹 목록</th>
							</tr>
							<c:forEach var="group" items="${groupList }">
								<tr>
									<td class="text-center" ><a href="adminstudygroupinfo.do?grCode=${group.grCode }">${group.grName }</a></td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
					</div>			
					<div class="info_div">
						<table class="table ">
							<tbody>
								<tr>
									<th >탈퇴 일자</th>
									<td >${unregDate }</td>
									<th >탈퇴 사유</th>
									<td >${reason }</td>
								</tr>
							</tbody>
						</table>
					</div>


					<br>
					<div class="list-foot">
						<div class="row justify-content-center">
							<div class="col-1 list-page">
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
		<c:import url="/WEB-INF/view/main/Footer.jsp"></c:import>
	</footer>

</body>
</html>