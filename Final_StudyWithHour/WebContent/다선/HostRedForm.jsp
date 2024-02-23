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
<title>HostRedForm.jsp</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="css/sideMenuStyle.css">
<link rel="stylesheet" type="text/css" href="css/guestMainStyle.css">
<link rel="stylesheet" type="text/css" href="css/form.css">
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
				<div class="container">
					<div class="input-form-backgroud row">
						<div class="input-form col-md-12 mx-auto">
							<h4 class="mb-3">신고 요청을 위한 정보 입력</h4>
							<form class="validation-form" novalidate>
								<div class="row">
									<div class="col-md-12 mb-3">
										신고 분류
										<div style="display: flex; justify-content: space-around;">
											<label>
												<input type="radio" name="radio"> 스터디카페 리뷰
											</label>
											<label>
												<input type="radio" name="radio"> 스터디카페 이용
											</label>
										</div>
										<div class="invalid-feedback">신고사유를 선택해주세요.</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12 mb-3">
										<label for="name">이용내역</label> 
										<input type="text" class="form-control" id="name" placeholder="" value="" required="required">
										<div class="invalid-feedback">이용내역을 입력해주세요.</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12 mb-3">
										<label for="email">이용스터디그룹</label> 
										<input type="tel" class="form-control" id="tel" placeholder="" required="required">
										<div class="invalid-feedback">이용스터디그룹을 입력해주세요.</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12 mb-3">
										<label for="email">신고 사유</label> 
										<select	class="custom-select d-block w-100">
											<option>기물파손</option>
											<option>상습적인 분위기 훼손</option>
											<option>퇴실시간 미엄수</option>
											<option>스터디룸 내 음주/흡연</option>
											<option>노쇼</option>
											<option>악의적인 후기</option>
										</select>
										<div class="invalid-feedback">신고사유를 입력해주세요.</div>
									</div>
								</div>


								<div class="mb-4"></div>
								<button class="btn btn-lg btn-block" type="submit" style="background: #ddedb7;">등록</button>
							</form>
						</div>
					</div>

					<footer class="my-3 text-center text-small">
						<p class="mb-1">&copy; 2024 STUDY WITH HOUR</p>
					</footer>
				</div>
			</div>
		</div>
	</section>
</body>
</html>