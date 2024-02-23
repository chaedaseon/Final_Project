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


				<div class="admin-box shadow-sm">
					<div class="list_head">
						<div class="row  justify-content-start text-center">
							<div class="col-2 list_name">공지사항 수정</div>
						</div>
					</div>
					<!-- list_head -->


					<form>

						<div class="content">
							<table class="table ">
								<tbody>
									<tr>
										<th colspan="1">제목</th>
										<td colspan="7"><input
											class="form-control form-control-sm form-text" type="text"
											id="subject" value="수정전제목"></td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- content -->
						<div class="content">
							<table class="table ">
								<tbody>
									<tr>
										<th colspan="1">내용</th>
									</tr>
									<tr>
										<td><textarea class="form-control form-text " id="bbs"
												rows="6">
수정전내용
수정전내용
수정전내용
수정전내용
수정전내용
수정전내용
수정전내용
수정전내용
수정전내용
</textarea></td>

									</tr>
								</tbody>
							</table>
						</div>
						<!-- content -->

						<br>
						<div class="list-foot">
							<div class="row justify-content-center">
								<div class="col-3 list-page">
									<button type="button" class="btn btn-custom">수정</button>
									<button type="reset" class="btn btn-custom">취소</button>
								</div>
							</div>

						</div>
					</form>
					<!-- list-foot -->
				</div>
				<!-- admin-box  -->



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