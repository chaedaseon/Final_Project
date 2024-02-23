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
<title>HostRedList.jsp</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="css/sideMenuStyle.css">
<link rel="stylesheet" type="text/css" href="css/guestMainStyle.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
	<header>
		<jsp:include page="/Menu.jsp" />
	</header>

	<section>

		<div id="content">
			<jsp:include page="/SideMenu.jsp" />

			<div class="rightContent_div">
				<div class="content_div">
					<div
						class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3">
						<h1 class="h3">신고 내역</h1>
						<div class="btn-toolbar mb-2 mb-md-0">
							<select>
								<option
									class="btn btn-sm dropdown-toggle d-flex align-items-center gap-1">
									목록 선택▼</option>
								<option
									class="btn btn-sm dropdown-toggle d-flex align-items-center gap-1">
									처리중</option>
								<option
									class="btn btn-sm dropdown-toggle d-flex align-items-center gap-1">
									처리완료</option>
							</select>
						</div>
					</div>
					<div>
						<table class="table">
							<tr>
								<th>No</th>
								<th>신고내역</th>
								<th>사유</th>
								<th>제출일</th>
								<th>처리상태</th>
							</tr>
							<tr>
								<td>1</td>
								<td>게시글 1</td>
								<td>부적절한 ....</td>
								<td>2024-02-10</td>
								<td>처리중</td>
							</tr>
							<tr>
								<td>2</td>
								<td>게시글 3</td>
								<td>부적절한 ....</td>
								<td>2024-02-10</td>
								<td>처리완료</td>
							</tr>
							<tr>
								<td>3</td>
								<td>댓글 1</td>
								<td>부적절한 ....</td>
								<td>2024-02-10</td>
								<td>처리중</td>
							</tr>
							<tr>
								<td>4</td>
								<td>게시글 1</td>
								<td>부적절한 ....</td>
								<td>2024-02-10</td>
								<td>처리중</td>
							</tr>
							<tr>
								<td>5</td>
								<td>게시글 1</td>
								<td>부적절한 ....</td>
								<td>2024-02-10</td>
								<td>처리중</td>
							</tr>
							<tr>
								<td>6</td>
								<td>게시글 1</td>
								<td>부적절한 ....</td>
								<td>2024-02-10</td>
								<td>처리중</td>
							</tr>
							<tr>
								<td>7</td>
								<td>게시글 1</td>
								<td>부적절한 ....</td>
								<td>2024-02-10</td>
								<td>처리중</td>
							</tr>
							<tr>
								<td>8</td>
								<td>게시글 1</td>
								<td>부적절한 ....</td>
								<td>2024-02-10</td>
								<td>처리중</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>

	</section>

	<footer>
		<jsp:include page="/Footer.jsp" />
	</footer>
</body>
</html>