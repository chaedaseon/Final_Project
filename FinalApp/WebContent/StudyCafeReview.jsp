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
<title>StudyCafeReview.jsp</title>
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
					<div>
						<div
							class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3">
							<h3 class="mb-0">[ A 스터디카페 ]</h3>
							<div class="btn-toolbar mb-2 mb-md-0">
								<select>
									<option
										class="btn btn-sm dropdown-toggle d-flex align-items-center gap-1">
										목록 선택</option>
									<option
										class="btn btn-sm dropdown-toggle d-flex align-items-center gap-1">
										A 스터디카페</option>
									<option
										class="btn btn-sm dropdown-toggle d-flex align-items-center gap-1">
										B 스터디카페</option>
									<option
										class="btn btn-sm dropdown-toggle d-flex align-items-center gap-1">
										C 스터디카페</option>
								</select>
							</div>
						</div>
					</div>
					<h4 class="border-bottom">이용후기 N개</h4>
					<div class="col-md-12">
						<div
							class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250">
							<div class="col p-4 d-flex flex-column position-static">
								<div style="display: flex; justify-content: space-between;">
									<h6>광개토익왕(작성자)</h6>
									<h6>2024-02-24</h6>
								</div>
								<p class="card-text mb-auto">
									<span>[서울스터디카페]</span> 쾌적하고 조용해서 스터디하기 좋았어요!
								</p>
							</div>
						</div>
					</div>
					<div class="col-md-12">
						<div
							class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250">
							<div class="col p-4 d-flex flex-column position-static">
								<div style="display: flex; justify-content: space-between;">
									<h6>광개토익왕(작성자)</h6>
									<h6>2024-02-24</h6>
								</div>
								<p class="card-text mb-auto">
									<span>[서울스터디카페]</span> 쾌적하고 조용해서 스터디하기 좋았어요!
								</p>
							</div>
						</div>
					</div>
					<div class="col-md-12">
						<div
							class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250">
							<div class="col p-4 d-flex flex-column position-static">
								<div style="display: flex; justify-content: space-between;">
									<h6>광개토익왕(작성자)</h6>
									<h6>2024-02-24</h6>
								</div>
								<p class="card-text mb-auto">
									<span>[서울스터디카페]</span> 쾌적하고 조용해서 스터디하기 좋았어요!
								</p>
							</div>
						</div>
					</div>
					<div class="col-md-12">
						<div
							class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250">
							<div class="col p-4 d-flex flex-column position-static">
								<div style="display: flex; justify-content: space-between;">
									<h6>광개토익왕(작성자)</h6>
									<h6>2024-02-24</h6>
								</div>
								<p class="card-text mb-auto">
									<span>[서울스터디카페]</span> 쾌적하고 조용해서 스터디하기 좋았어요!
								</p>
							</div>
						</div>
					</div>
					<div class="col-md-12">
						<div
							class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250">
							<div class="col p-4 d-flex flex-column position-static">
								<div style="display: flex; justify-content: space-between;">
									<h6>광개토익왕(작성자)</h6>
									<h6>2024-02-24</h6>
								</div>
								<p class="card-text mb-auto">
									<span>[서울스터디카페]</span> 쾌적하고 조용해서 스터디하기 좋았어요!
								</p>
							</div>
						</div>
					</div>
					<div class="col-md-12">
						<div
							class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250">
							<div class="col p-4 d-flex flex-column position-static">
								<div style="display: flex; justify-content: space-between;">
									<h6>광개토익왕(작성자)</h6>
									<h6>2024-02-24</h6>
								</div>
								<p class="card-text mb-auto">
									<span>[서울스터디카페]</span> 쾌적하고 조용해서 스터디하기 좋았어요!
								</p>
							</div>
						</div>
					</div>
					<div class="col-md-12">
						<div
							class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250">
							<div class="col p-4 d-flex flex-column position-static">
								<div style="display: flex; justify-content: space-between;">
									<h6>광개토익왕(작성자)</h6>
									<h6>2024-02-24</h6>
								</div>
								<p class="card-text mb-auto">
									<span>[서울스터디카페]</span> 쾌적하고 조용해서 스터디하기 좋았어요!
								</p>
							</div>
						</div>
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