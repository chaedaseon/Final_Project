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
<title>PersonalPenaltyList.jsp</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="css/sideMenuStyle.css">
<link rel="stylesheet" type="text/css" href="css/guestPageStyle.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

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
					<span><span>개인</span> 패널티 내역</span>
				</div>
				
				<ul class="nav nav-tabs" id="myTab" role="tablist">
					<li class="nav-item" role="presentation">
				   		<button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home-tab-pane" type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true">게시판 신고</button>
				  	</li>
				  	<li class="nav-item" role="presentation">
				    	<button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile-tab-pane" type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="false">댓글 신고</button>
				  	</li>
				  	<li class="nav-item" role="presentation">
				    	<button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact-tab-pane" type="button" role="tab" aria-controls="contact-tab-pane" aria-selected="false">대댓글 신고</button>
				  	</li>
				</ul>
				<div class="tab-content" id="myTabContent">
				  	<div class="tab-pane fade show active" id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab" tabindex="0">...</div>
				  	<div class="tab-pane fade" id="profile-tab-pane" role="tabpanel" aria-labelledby="profile-tab" tabindex="0">...</div>
				  	<div class="tab-pane fade" id="contact-tab-pane" role="tabpanel" aria-labelledby="contact-tab" tabindex="0">...</div>
				  	<div class="tab-pane fade" id="disabled-tab-pane" role="tabpanel" aria-labelledby="disabled-tab" tabindex="0">...</div>
				</div>
				
				<div>
					<table class="penalty_list">
						<tr>
							<td colspan="4"></td>
							<td>
								<select class="penalty_sorting">
									<option selected="selected">유효 여부 선택</option>
									<option>유효</option>
									<option>소멸</option>
								</select>
							</td>
						</tr>
						<tr class="spacer"></tr>
						<tr>
							<th>No</th>
							<th>사유</th>
							<th>생성 일자</th>
							<th>종료 일자</th>
							<th>유효 여부</th>
						</tr>
						<tr class="spacer"></tr>
						<tr>
							<td>1</td>
							<td>스터디그룹 강제 해체</td>
							<td>2023.01.02</td>
							<td>2023.04.01</td>
							<td>소멸</td>
						</tr>
						<tr>
							<td>2</td>
							<td>스터디그룹 강제 해체</td>
							<td>2023.01.02</td>
							<td>2023.04.01</td>
							<td>소멸</td>
						</tr>
						<tr>
							<td>3</td>
							<td>스터디그룹 강제 해체</td>
							<td>2023.01.02</td>
							<td>2023.04.01</td>
							<td>소멸</td>
						</tr>
						<tr>
							<td>4</td>
							<td>스터디그룹 강제 해체</td>
							<td>2023.01.02</td>
							<td>2023.04.01</td>
							<td>소멸</td>
						</tr>
						<tr>
							<td>5</td>
							<td>스터디그룹 강제 해체</td>
							<td>2023.01.02</td>
							<td>2023.04.01</td>
							<td>소멸</td>
						</tr>
						<tr>
							<td>6</td>
							<td>스터디그룹 강제 해체</td>
							<td>2023.01.02</td>
							<td>2023.04.01</td>
							<td>소멸</td>
						</tr>
						<tr>
							<td>7</td>
							<td>스터디그룹 강제 해체</td>
							<td>2023.01.02</td>
							<td>2023.04.01</td>
							<td>소멸</td>
						</tr>
						<tr>
							<td>8</td>
							<td>스터디그룹 강제 해체</td>
							<td>2023.01.02</td>
							<td>2023.04.01</td>
							<td>소멸</td>
						</tr>
						<tr>
							<td>9</td>
							<td>스터디그룹 강제 해체</td>
							<td>2023.01.02</td>
							<td>2023.04.01</td>
							<td>소멸</td>
						</tr>
						<tr>
							<td>10</td>
							<td>게시글 신고</td>
							<td>2024.02.07</td>
							<td>2024.05.06</td>
							<td>유효</td>
						</tr>
						<tr class="spacer"></tr>
					</table>
				</div>
				
				<nav aria-label="Page navigation example" class="paging">
				  	<ul class="pagination">
					    <li class="page-item disabled">
					    	<a class="page-link">◁</a>
					    </li>
					    <li class="page-item"><a class="page-link" href="#">1</a></li>
					    <li class="page-item"><a class="page-link" href="#">2</a></li>
					    <li class="page-item"><a class="page-link" href="#">3</a></li>
					    <li class="page-item"><a class="page-link" href="#">4</a></li>
					    <li class="page-item"><a class="page-link" href="#">5</a></li>
					    <li class="page-item">
					    	<a class="page-link" href="#">▷</a>
					    </li>
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