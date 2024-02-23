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
							<div class="col-2 list_name">스터디그룹 조회</div>
							<div class="col-5">
								<form>
									 <input
										type="checkbox" class="form-check-input" id="1"> <label
										class="form-check-label" for="host">활동중</label> <input
										type="checkbox" class="form-check-input" id="2"> <label
										class="form-check-label" for="guest">활동종료</label>
										 <input
										type="checkbox" class="form-check-input" id="1"> <label
										class="form-check-label" for="host">미개설</label>  <select>
										<option>번호</option>
										<option>이름</option>
										<option>개설일자</option>
									</select>
									<button class="btn btn-custom">확인</button>
								</form>
							</div>

						</div>


					</div>
					<!-- list_head -->

				<table class="table">
					<tr>
						<th>번호</th>
						<th>상태</th>
						<th>스터디그룹 이름</th>
						<th>그룹장</th>
						<th>카테고리</th>
						<th>개설 일자</th>
					</tr>
					<tr>
						<td>1</td>
						<td>활동중</td>
						<td><a href="#">0000000000스터디그룹</a></td>
						<td>abdf6565</td>
						<td>자격증</td>
						<td>2020-02-02</td>
					</tr>
					<tr>
						<td>1</td>
						<td>활동중</td>
						<td><a href="#">0000000000스터디그룹</a></td>
						<td>abdf6565</td>
						<td>자격증</td>
						<td>2020-02-02</td>
					</tr>
					<tr>
						<td>1</td>
						<td>활동중</td>
						<td><a href="#">0000000000스터디그룹</a></td>
						<td>abdf6565</td>
						<td>자격증</td>
						<td>2020-02-02</td>
					</tr>
					<tr>
						<td>1</td>
						<td>활동중</td>
						<td><a href="#">0000000000스터디그룹</a></td>
						<td>abdf6565</td>
						<td>자격증</td>
						<td>2020-02-02</td>
					</tr>
					<tr>
						<td>1</td>
						<td>활동중</td>
						<td><a href="#">0000000000스터디그룹</a></td>
						<td>abdf6565</td>
						<td>자격증</td>
						<td>2020-02-02</td>
					</tr>

				</table>



					<div class="list-foot">
						<!-- 검색 영역 -->
						<div class="row justify-content-end">
							<div class="col-6 page-search">
								<select>
									<option>번호</option>
									<option>스터디그룹 이름</option>
									<option>그룹장(ID)</option>
									<option>카테고리</option>
									<option>개설일자</option>
								</select> <input type="text">
								<button type="button" class="btn btn-custom">검색</button>
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
				
				
				
			</div><!-- rightContent_div -->
		
		</div><!-- content -->
	</section>
	
	<footer>
		<c:import url="Footer.jsp"></c:import>
	</footer>

</body>
</html>