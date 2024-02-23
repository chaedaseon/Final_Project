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
<title>HostReservationList.jsp</title>
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
					<div
						class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3">
						<h1 class="h3">예약 내역</h1>
						<div class="btn-toolbar mb-2 mb-md-0">
							<select>
								<option
									class="btn btn-sm dropdown-toggle d-flex align-items-center gap-1">
									목록 선택</option>
								<option
									class="btn btn-sm dropdown-toggle d-flex align-items-center gap-1">
									예약 취소</option>
								<option
									class="btn btn-sm dropdown-toggle d-flex align-items-center gap-1">
									이용 예정</option>
								<option
									class="btn btn-sm dropdown-toggle d-flex align-items-center gap-1">
									이용 완료</option>
							</select>
						</div>
					</div>
					<div>
						<table class="table">
							<tr>
								<th>No</th>
								<th>스터디그룹</th>
								<th>스터디카페/스터디룸</th>
								<th>날짜 및 시간</th>
								<th>이용 인원</th>
								<th>예약 상태</th>
								<th>이용 상태</th>
								<th>예약 상세</th>
							</tr>
							<tr>
								<td>1</td>
								<td>광개토익왕</td>
								<td>서울스터디카페/A001</td>
								<td>2024-02-10 13:00 ~ 15:00</td>
								<td>3명</td>
								<td>확정</td>
								<td>예정</td>
								<td><input type="button" class="btn search_btn" value="더보기">
								</td>
							</tr>
							<tr>
								<td>2</td>
								<td>뜨개질모임</td>
								<td>서울스터디카페/A001</td>
								<td>2024-02-10 13:00 ~ 15:00</td>
								<td>3명</td>
								<td>확정</td>
								<td>완료</td>
								<td><input type="button" class="btn search_btn" value="더보기">
								</td>
							</tr>
							<tr>
								<td>3</td>
								<td>영어회화</td>
								<td>서울스터디카페/A001</td>
								<td>2024-02-10 13:00 ~ 15:00</td>
								<td>3명</td>
								<td>확정</td>
								<td>예정</td>
								<td><input type="button" class="btn search_btn" value="더보기">
								</td>
							</tr>
							<tr>
								<td>4</td>
								<td>스터디윗미</td>
								<td>서울스터디카페/A001</td>
								<td>2024-02-10 13:00 ~ 15:00</td>
								<td>3명</td>
								<td>확정</td>
								<td>예정</td>
								<td><input type="button" class="btn search_btn" value="더보기">
								</td>
							</tr>
							<tr>
								<td>5</td>
								<td>정처기</td>
								<td>서울스터디카페/A001</td>
								<td>2024-02-10 13:00 ~ 15:00</td>
								<td>3명</td>
								<td>확정</td>
								<td>예정</td>
								<td><input type="button" class="btn search_btn" value="더보기">
								</td>
							</tr>
							<tr>
								<td>6</td>
								<td>광개토익왕</td>
								<td>서울스터디카페/A001</td>
								<td>2024-02-10 13:00 ~ 15:00</td>
								<td>3명</td>
								<td>확정</td>
								<td>예정</td>
								<td><input type="button" class="btn search_btn" value="더보기">
								</td>
							</tr>
							<tr>
								<td>7</td>
								<td>자격증뿌수기</td>
								<td>서울스터디카페/A001</td>
								<td>2024-02-10 13:00 ~ 15:00</td>
								<td>3명</td>
								<td>확정</td>
								<td>예정</td>
								<td><input type="button" class="btn search_btn" value="더보기">
								</td>
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