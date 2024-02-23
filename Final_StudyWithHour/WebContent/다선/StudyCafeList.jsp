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
<title>StudyCafeList.jsp</title>
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
			<!-- col-2 적용되어 있음 -->

			<div class="rightContent_div">
				<div class="content_div">
					<h4 class="pb-2 mb-4 border-bottom">카페닉네임, 보유 스터디카페 목록</h4>

					<div class="col-md-12">
						<div
							class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250">
							<div class="col p-4 d-flex flex-column position-static">
								<h5 class="mb-0">1. 서울스터디카페 홍대지점</h5>
								<p class="card-text mb-auto">
									서울특별시 마포구 동교동 OO빌딩 4층<br> 매일 09:00 ~ 18:00<br> 연락처
									02.1111.2222<br>
								</p>
								<div style="display: flex; justify-content: space-between;">
									<a href="#"
										class="icon-link gap-1 icon-link-hover stretched-link"> 상세
										정보 </a>
									<div>
										<button type="button" class="btn search_btn">수정</button>
										<button type="button" class="btn search_btn">삭제</button>
									</div>
								</div>
							</div>
							<div class="col-auto d-none d-lg-block">
								<img src="image/study.jpg" style="width: 200px; height: 200px;">
							</div>
						</div>
					</div>

					<div class="col-md-12">
						<div
							class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250">
							<div class="col p-4 d-flex flex-column position-static">
								<h5 class="mb-0">2. 서울스터디카페 강남지점</h5>
								<p class="card-text mb-auto">
									서울특별시 강남구 동교동 OO빌딩 4층<br> 
									매일 09:00 ~ 18:00<br> 
									연락처	02.1111.2222<br>
								<div style="display: flex; justify-content: space-between;">
									<a href="#"
										class="icon-link gap-1 icon-link-hover stretched-link"> 상세
										정보 </a>
									<div>
										<button type="button" class="btn search_btn">수정</button>
										<button type="button" class="btn search_btn">삭제</button>
									</div>
								</div>
							</div>
							<div class="col-auto d-none d-lg-block">
								<img src="image/study.jpg" style="width: 200px; height: 200px;">
							</div>
						</div>
					</div>

					<div class="col-md-12">
						<div
							class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250">
							<div class="col p-4 d-flex flex-column position-static">
								<h5 class="mb-0">3. 홍대스터디카페 강남지점</h5>
								<p class="card-text mb-auto">
									서울특별시 강남구 동교동 OO빌딩 4층<br> 
									매일 09:00 ~ 18:00<br> 
									연락처	02.1111.2222<br>
								<div style="display: flex; justify-content: space-between;">
									<a href="#"
										class="icon-link gap-1 icon-link-hover stretched-link"> 상세
										정보 </a>
									<div>
										<button type="button" class="btn search_btn">수정</button>
										<button type="button" class="btn search_btn">삭제</button>
									</div>
								</div>
							</div>
							<div class="col-auto d-none d-lg-block">
								<img src="image/study.jpg" style="width: 200px; height: 200px;">
							</div>
						</div>
					</div>
					<div class="col-md-12"
						style="display: flex; justify-content: flex-end;">
						<button type="button" class="btn search_btn">스터디카페 등록</button>
						<br>
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