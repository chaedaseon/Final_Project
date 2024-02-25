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
<title>관리자 회원 목록</title>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="css/sideMenuStyle.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/adminPage.css">
</head>
<body>
	<header>
		<c:import url="Menu.jsp"></c:import>
	</header>

	<section>
		<div id="content">
			<c:import url="SideMenu.jsp"></c:import>

			<div class="rightContent_div">



				<div class="list_head">

					<div class="row  justify-content-between">

						<div class="col-2 list_name">관리자 회원 목록</div>
						<div class="col-2 ">
							<button type="button" class="btn btn-custom">추가</button>
						</div>

					</div>


				</div>
				<!-- list_head -->
				<table class="table">
					<tr>
						<th>관리자 코드</th>
						<th>닉네임</th>
						<th>등록 일자</th>
						<th>비활성화 일자</th>
						<th>상세</th>
					</tr>
					<tr>
						<td>AD_001</td>
						<td><a href="#" >관리자001</a></td>
						<td>2020-02-02</td>
						<td>-</td>
						<td><button type="submit" class="btn btn-custom">활성화</button></td>
					</tr>
					<tr>
						<td>AD_001</td>
						<td><a href="#" >관리자001</a></td>
						<td>2020-02-02</td>
						<td>-</td>
						<td><button type="submit" class="btn btn-custom">활성화</button></td>
					</tr>
					<tr>
						<td>AD_001</td>
						<td><a href="#" >관리자001</a></td>
						<td>2020-02-02</td>
						<td>-</td>
						<td><button type="submit" class="btn btn-custom">활성화</button></td>
					</tr>
					<tr>
						<td>AD_001</td>
						<td><a href="#" >관리자001</a></td>
						<td>2020-02-02</td>
						<td>-</td>
						<td><button type="submit" class="btn btn-custom" disabled>비활성화</button></td>
					</tr>


				</table>


				<div class="list-foot">
					<!-- 검색 영역 -->
					<div class="row justify-content-end">
						<div class="col-6 page-search">
							<select>
								<option>번호</option>
								<option>아이디</option>
								<option>닉네임</option>
								<option>이름</option>
								<option>이메일</option>
								<option>가입날짜</option>
							</select> <input type="text">
							<button type="button" class="btn btn-custom">활성화</button>
						</div>
					</div>
					<br>
					<!-- 페이지 영역 -->
					<div class="row justify-content-center">
						<div class="col-2 list-page">
							<nav aria-label="Page navigation example">
								<ul class="pagination">
									<li class="page-item"><a class="page-link disabled"
										href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
									</a></li>
									<li class="page-item"><a class="page-link" href="#">1</a></li>
									<li class="page-item"><a class="page-link" href="#">2</a></li>
									<li class="page-item"><a class="page-link" href="#">3</a></li>
									<li class="page-item"><a class="page-link" href="#"
										aria-label="Next"> <span aria-hidden="true">&raquo;</span>
									</a></li>
								</ul>
							</nav>
						</div>
						<!-- col -->
					</div>
					<!-- row -->
				</div>
				<!-- list-foot -->




			</div>
			<!-- rightContent_div -->

		</div>
		<!-- content -->
	</section>

	<footer>
		<c:import url="Footer.jsp"></c:import>
	</footer>

</body>
</html>