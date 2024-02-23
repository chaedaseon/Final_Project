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
<title>StudyCafeModifyForm.jsp</title>
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
			<!-- col-2 적용되어 있음 -->

			<div class="rightContent_div">

				<div class="input-form-backgroud row">
					<div class="input-form-cafe col-md-12 mx-auto">
						<h4 class="mb-3">스터디카페 수정</h4>
						<form class="validation-form" novalidate>
							<div class="row">
								<div class="col-md-6 mb-3">
									<label for="CafeName">스터디카페명</label> 
									<input type="text"class="form-control" id="CafeName" placeholder="" value="" readonly="readonly">
									<div class="invalid-feedback">스터디카페명을 입력해주세요.</div>
								</div>
								<div class="col-md-6 mb-3">
									<label for="CafeNum">사업자등록번호</label> 
									<input type="text" class="form-control" id="CafeNum" placeholder="-를 제외하고 입력" value="" readonly="readonly">
									<div class="invalid-feedback">사업자등록번호를 입력해주세요.</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-4 mb-3">
									<label for="tel">전화번호</label> 
									<input type="tel" class="form-control" id="tel" placeholder="-를 제외하고 입력"	required="required">
									<div class="invalid-feedback">전화번호를 입력해주세요.</div>
								</div>

								<div class="col-md-8 mb-3">
									<label for="address">주소</label> 
									<input type="text" class="form-control" id="address" placeholder="서울특별시 강남구" readonly="readonly">
									<div class="invalid-feedback">주소를 입력해주세요.</div>
								</div>
							</div>

							<div class="row">
								<div class="col-md-6 mb-3">
									<label for="startHour">운영 시작시간</label> 
									<select	class="custom-select d-block w-100" id="startHour">
										<option>08:00</option>
										<option>09:00</option>
										<option>10:00</option>
										<option>11:00</option>
										<option>12:00</option>
									</select>
									<div class="invalid-feedback">운영시간을 입력해주세요.</div>
								</div>
								<div class="col-md-6 mb-3">
									<label for="closeHour">운영 종료시간</label> 
									<select	class="custom-select d-block w-100" id="closeHour">
										<option>17:00</option>
										<option>18:00</option>
										<option>19:00</option>
										<option>20:00</option>
										<option>21:00</option>
									</select>
									<div class="invalid-feedback">운영시간을 입력해주세요.</div>
								</div>
							</div>


							<div class="row">
								<div class="col-md-6 mb-3">
									<label for="root">편의 시설</label> 
									<select	class="custom-select d-block w-100" id="root">
										<option value="">==선택해주세요==</option>
										<option>프린터</option>
										<option>담요</option>
										<option>화장실</option>
									</select>
								</div>
								<div class="col-md-6 mb-3">
									<label for="root">주변 시설</label> 
									<select	class="custom-select d-block w-100" id="root">
										<option value="">==선택해주세요==</option>
										<option>지하철역</option>
										<option>버스정류장</option>
										<option>편의점</option>
										<option>문구점</option>
									</select>
								</div>
							</div>

							<div class="mb-3">
								<label for="address2">상세설명</label>
								<textarea class="form-control"></textarea>
								<span class="span-limit">0/1000</span>
							</div>

							<div class="mb-3">
								<label for="address2">유의사항</label>
								<textarea class="form-control"></textarea>
								<span class="span-limit">0/1000</span>
							</div>

							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input"	id="aggrement" required> 
								<label class="custom-control-label" for="aggrement">
									개인정보 수집 및 이용에 동의합니다.
								</label>
							</div>
							<div class="mb-4"></div>
							<button class="btn btn-lg btn-block" type="submit" style="background: #ddedb7;">등록</button>
						</form>
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