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
<title>GroupPenaltyList.jsp</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="css/sideMenuStyle.css">
<link rel="stylesheet" type="text/css" href="css/penaltyListStyle.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>

	<header>
		<c:import url="/WEB-INF/view/main/Menu.jsp"></c:import>
	</header>
	
	<section>
	
		<div id="content">
			<c:import url="/WEB-INF/view/main/SideMenu.jsp"></c:import>
		
			<div class="rightContent_div">
				<div class="penalty_title">
					<span><span>그룹</span> 패널티 내역</span>
				</div>
				
				<div style="float: right; margin: 20px 0;">
					<select class="penlay_sorting">
						<option selected="selected">유효 여부 선택</option>
						<option value="1">유효</option>
						<option value="2">무효</option>
					</select>		
				</div>
				
				<div class="penalty_list">
					<table>
						<tr class="spacer"></tr>
						<tr>
							<th>No</th>
							<th>그룹명</th>
							<th>사유</th>
							<th>생성 일자</th>
							<th>종료 일자</th>
							<th>유효 여부</th>
						</tr>
						<tr class="spacer"></tr>
						<tr>
							<td>1</td>
							<td>광개토익왕</td>
							<td>스터디그룹 강제 해체</td>
							<td>2023.01.02</td>
							<td>2023.04.01</td>
							<td>무효</td>
						</tr>
						<tr>
							<td>2</td>
							<td>정처기</td>
							<td>스터디그룹 강제 해체</td>
							<td>2023.01.02</td>
							<td>2023.04.01</td>
							<td>무효</td>
						</tr>
						<tr>
							<td>3</td>
							<td>정처기</td>
							<td>스터디그룹 강제 해체</td>
							<td>2023.01.02</td>
							<td>2023.04.01</td>
							<td>무효</td>
						</tr>
						<tr>
							<td>4</td>
							<td>정처기</td>
							<td>스터디그룹 강제 해체</td>
							<td>2023.01.02</td>
							<td>2023.04.01</td>
							<td>무효</td>
						</tr>
						<tr>
							<td>5</td>
							<td>정처기</td>
							<td>스터디그룹 강제 해체</td>
							<td>2023.01.02</td>
							<td>2023.04.01</td>
							<td>무효</td>
						</tr>
						<tr>
							<td>6</td>
							<td>정처기</td>
							<td>스터디그룹 강제 해체</td>
							<td>2023.01.02</td>
							<td>2023.04.01</td>
							<td>무효</td>
						</tr>
						<tr>
							<td>7</td>
							<td>정처기</td>
							<td>스터디그룹 강제 해체</td>
							<td>2023.01.02</td>
							<td>2023.04.01</td>
							<td>무효</td>
						</tr>
						<tr>
							<td>8</td>
							<td>정처기</td>
							<td>스터디그룹 강제 해체</td>
							<td>2023.01.02</td>
							<td>2023.04.01</td>
							<td>무효</td>
						</tr>
						<tr>
							<td>9</td>
							<td>정처기</td>
							<td>스터디그룹 강제 해체</td>
							<td>2023.01.02</td>
							<td>2023.04.01</td>
							<td>무효</td>
						</tr>
						<tr>
							<td>10</td>
							<td>정처기</td>
							<td>게시글 신고</td>
							<td>2024.02.07</td>
							<td>2024.05.06</td>
							<td>유효</td>
						</tr>
						<tr class="spacer"></tr>
					</table>
				</div>
				
				<nav aria-label="Page navigation example paging" class="paging">
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
	 	<c:import url="/WEB-INF/view/main/Footer.jsp"></c:import>
	</footer>


</body>
</html>