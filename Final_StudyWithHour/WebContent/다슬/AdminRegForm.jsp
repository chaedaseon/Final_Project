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

		<div class="list_head">

					<div class="row  justify-content-between">

						<div class="col-2 list_name">관리자 계정 생성</div>


					</div>


				</div>
				<!-- list_head -->
				<div class="admin-box shadow-sm ">


					<form>


						<div class="mb-3 ">
							<label for="adminId" class="form-label" >관리자 아이디</label> <input
								type="text" class="form-control" id="adminId" value="AD005" readonly="readonly">
						</div>
						<div class="mb-3 ">
							<label for="adminPwd" class="form-label">관리자 비밀번호</label> <input
								type="password" class="form-control" id="adminPwd">
						</div>

						<button type="submit" class="btn btn-custom">계정 생성</button>

						<button type="button" class="btn btn-custom">목록으로</button>
					</form>

				</div>
				<!-- end admin_account  -->

			</div>

		</div>
	</section>

	<footer>
		<c:import url="Footer.jsp"></c:import>
	</footer>

</body>
</html>